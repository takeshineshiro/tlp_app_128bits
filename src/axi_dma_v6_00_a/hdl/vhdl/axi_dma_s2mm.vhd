library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

library unisim;
use unisim.vcomponents.all;

library axi_dma_v6_00_a;
use axi_dma_v6_00_a.axi_dma_pkg.all;
library proc_common_v3_00_a;
use proc_common_v3_00_a.async_fifo_fg;

entity axi_dma_s2mm is
     generic (
             C_FAMILY : string := "virtex6"
             );
     port (
           clk_in      : in std_logic;
           sg_clk      : in std_logic;
           resetn      : in std_logic;
           reset_sg     : in std_logic;
           s2mm_tvalid : in std_logic;
           s2mm_tlast  : in std_logic;
           s2mm_tdest  : in std_logic_vector (4 downto 0);
           s2mm_tuser  : in std_logic_vector (3 downto 0);
           s2mm_tid  : in std_logic_vector (4 downto 0);
           s2mm_tready : in std_logic;
           desc_available : in std_logic;
       --    s2mm_eof       : in std_logic;
           s2mm_eof_det       : in std_logic_vector (1 downto 0);
           ch2_update_active : in std_logic;

           tdest_out       : out std_logic_vector (5 downto 0);  -- to select desc
-- to DM
           s2mm_desc_info  : out std_logic_vector (13 downto 0);
--           updt_cmpt       : out std_logic;
           s2mm_tvalid_out : out std_logic;
           s2mm_tlast_out  : out std_logic;
           s2mm_tready_out : out std_logic;
           s2mm_tdest_out  : out std_logic_vector (4 downto 0)
          );
end entity axi_dma_s2mm;

architecture implement of axi_dma_s2mm is

signal first_data : std_logic;
signal first_stream : std_logic;
signal first_stream_del : std_logic;

signal last_received : std_logic;
signal first_received : std_logic;
signal first_received1 : std_logic;
signal open_window : std_logic;

signal tdest_out_int : std_logic_vector (5 downto 0);
signal fifo_wr : std_logic;

signal last_update_over_int : std_logic;
signal last_update_over_int1 : std_logic;
signal last_update_over : std_logic;

signal ch_updt_over_int : std_logic;

signal ch_updt_over_int_cdc_from : std_logic;
signal ch_updt_over_int_cdc_to : std_logic;
signal ch_updt_over_int_cdc_to1 : std_logic;
signal ch_updt_over_int_cdc_to2 : std_logic;

signal fifo_rd : std_logic;
signal first_read : std_logic;
signal first_rd_en : std_logic;
signal fifo_rd_int : std_logic;
signal first_read_int : std_logic;

signal fifo_empty : std_logic;
signal fifo_full : std_logic;
signal s2mm_desc_info_int : std_logic_vector (13 downto 0);

signal updt_cmpt : std_logic;
signal tdest_capture : std_logic_vector (4 downto 0);
signal noread : std_logic;

begin


     process (sg_clk)
       begin
            if (reset_sg = '0') then
               ch_updt_over_int_cdc_from <= '0';
            elsif (sg_clk'event and sg_clk = '1') then
               ch_updt_over_int_cdc_from <= ch2_update_active;
            end if;
     end process;

     process (clk_in)
       begin
            if (resetn = '0') then
               ch_updt_over_int_cdc_to <= '0';
               ch_updt_over_int_cdc_to1 <= '0';
               ch_updt_over_int_cdc_to2 <= '0';
            elsif (clk_in'event and clk_in = '1') then
               ch_updt_over_int_cdc_to <= ch_updt_over_int_cdc_from;
               ch_updt_over_int_cdc_to1 <= ch_updt_over_int_cdc_to;
               ch_updt_over_int_cdc_to2 <= ch_updt_over_int_cdc_to1;
            end if;
     end process;

         updt_cmpt <= (not ch_updt_over_int_cdc_to1) and ch_updt_over_int_cdc_to2;

  --   process (sg_clk)
  --     begin
  --          if (resetn = '0') then
  --             ch_updt_over_int <= '0';
  --          elsif (sg_clk'event and sg_clk = '1') then
  --             ch_updt_over_int <= ch2_update_active;
  --          end if;
  --   end process;
  
     --    updt_cmpt <= (not ch2_update_active) and ch_updt_over_int;

     process (sg_clk)
       begin
            if (reset_sg = '0') then
               last_update_over_int <= '0';
               last_update_over_int1 <= '0';
                   noread <= '0'; 
            elsif (sg_clk'event and sg_clk = '1') then
                   last_update_over_int1 <= last_update_over_int; 
               if (s2mm_eof_det(1) = '1' and noread = '0') then
                   last_update_over_int <= '1';
                   noread <= '1'; 
               elsif (s2mm_eof_det(0) = '1') then
                   noread <= '0';
                   last_update_over_int <= '0'; 
               elsif (fifo_empty = '0') then -- (updt_cmpt = '1') then
                   last_update_over_int <= '0'; 
               else
                   last_update_over_int <= last_update_over_int; 
               end if; 
            end if;
     end process;
 
        last_update_over <= (not last_update_over_int) and last_update_over_int1;

     process (sg_clk)
       begin
            if (reset_sg = '0') then
               fifo_rd_int <= '0';
               first_read <= '0';
            elsif (sg_clk'event and sg_clk = '1') then
               if (last_update_over_int = '1' and fifo_rd_int = '0') then
                   fifo_rd_int <= '1';
               else
                   fifo_rd_int <= '0';
               end if; 
            end if;
     end process;

     process (sg_clk)
       begin
            if (reset_sg = '0') then
               first_read_int <= '0';
            elsif (sg_clk'event and sg_clk = '1') then
                   first_read_int <= first_read;
            end if;
     end process;

         first_rd_en <= first_read and (not first_read_int);
         fifo_rd <= last_update_over_int; --(fifo_rd_int or first_rd_en);


--     process (clk_in)
--       begin
--            if (resetn = '0') then
--                first_data <= '0';
--                first_stream_del <= '0';
--           elsif (clk_in'event and clk_in = '1') then
--               if (s2mm_tvalid = '1' and first_data = '0' and s2mm_tready = '1') then   -- no tlast
--                  first_data <= '1';         -- just after the system comes out of reset
--               end if;
--               first_stream_del <= first_stream;
--           end if;
--    end process;

            first_stream <= (s2mm_tvalid and (not first_data));  -- pulse when first stream comes after reset

     process (clk_in)
       begin
            if (resetn = '0') then
                last_received <= '0';
                first_received <= '0';
                first_received1 <= '0';
                tdest_capture <= (others => '0'); 
                first_data <= '0';
                first_stream_del <= '0';
            elsif (clk_in'event and clk_in = '1') then
                first_received1 <= first_received; --'0';
                first_stream_del <= first_stream;
                if (s2mm_tvalid = '1' and first_data = '0' and s2mm_tready = '1') then   -- first stream afetr reset
                   s2mm_desc_info_int <= s2mm_tuser & s2mm_tid & s2mm_tdest;
                   first_data <= '1';         -- just after the system comes out of reset
                elsif (s2mm_tlast = '1' and s2mm_tvalid = '1' and s2mm_tready = '1') then  -- catch for last beat 
                   last_received <= '1';         
                   first_received <= '0';
                   s2mm_desc_info_int <= s2mm_desc_info_int;
                elsif (last_received = '1' and s2mm_tvalid = '1' and s2mm_tready = '1') then -- catch for following first beat
                   last_received <= '0';
                   first_received <= '1';
                   tdest_capture <= s2mm_tdest;  -- latching tdest on first beat
                   s2mm_desc_info_int <= s2mm_tuser & s2mm_tid & s2mm_tdest;
                else
                   s2mm_desc_info_int <= s2mm_desc_info_int;
                   last_received <= last_received;
                   if (updt_cmpt = '1') then
                      first_received <= '0';
                   else
                      first_received <= first_received;  -- hold the first received until update comes for previous tlast
                   end if; 
                end if;
            end if;
     end process;

           fifo_wr <= first_stream_del or (first_received and not (first_received1)); -- writing the tdest,tuser,tid into FIFO





     process (clk_in)
       begin
            if (resetn = '0') then
                   tdest_out_int <= "000000";
            elsif (clk_in'event and clk_in = '1') then
               if (first_received = '1' or first_stream = '1') then
                   if (first_stream = '1') then    -- when first stream is received, capture the tdest
                      tdest_out_int (5) <= not tdest_out_int (5);  -- signifies a new stream has come
                      tdest_out_int (4 downto 0) <=  s2mm_tdest;
                 --  elsif (updt_cmpt = '1' or (first_received = '1' and first_received1 = '0')) then    -- when subsequent streams are received, pass the latched value of tdest
                   elsif (first_received = '1' and first_received1 = '0') then    -- when subsequent streams are received, pass the latched value of tdest
                      tdest_out_int (5) <= not tdest_out_int (5);
                      tdest_out_int (4 downto 0) <=  tdest_capture; --s2mm_tdest;
                   end if;
               else
                   tdest_out_int (4 downto 0) <= tdest_out_int (4 downto 0);
                   tdest_out_int (5) <= tdest_out_int (5);
               end if;
            end if;
     end process;

           tdest_out <= tdest_out_int;

     process (clk_in)
       begin
            if (resetn = '0') then
                open_window <= '0';
            elsif (clk_in'event and clk_in = '1') then
               if (desc_available = '1') then
                   open_window <= '1';
               elsif (s2mm_tlast = '1') then
                   open_window <= '0';
               else
                   open_window <= open_window;
               end if;
            end if;
     end process;


     process (clk_in)
       begin
            if (resetn = '0') then
                s2mm_tvalid_out <= '0';
                s2mm_tready_out <= '0';
                s2mm_tlast_out  <= '0';
                s2mm_tdest_out      <= "00000";
            elsif (clk_in'event and clk_in = '1') then
               if (open_window = '1') then
                s2mm_tvalid_out <= s2mm_tvalid;
                s2mm_tready_out <= s2mm_tready;
                s2mm_tlast_out  <= s2mm_tlast;
                s2mm_tdest_out  <= s2mm_tdest;
               else
                s2mm_tready_out <= '0';
                s2mm_tvalid_out <= '0';
                s2mm_tlast_out  <= '0';
                s2mm_tdest_out      <= "00000";
               end if;
            end if;
     end process;

--    s2mm_desc_info_int <= s2mm_tuser & s2mm_tid & s2mm_tdest;
    -- Following FIFO is used to store the Tuser, Tid and xCache info
    I_ASYNC_FIFOGEN_FIFO : entity proc_common_v3_00_a.async_fifo_fg
       generic map (
--          C_ALLOW_2N_DEPTH      =>  1,
          C_ALLOW_2N_DEPTH      =>  0,
          C_FAMILY              =>  C_FAMILY,
          C_DATA_WIDTH          =>  14,
          C_ENABLE_RLOCS        =>  0,
          C_FIFO_DEPTH          =>  32,		-- Use 2N DEPTH
          C_HAS_ALMOST_EMPTY    =>  1,
          C_HAS_ALMOST_FULL     =>  1,
          C_HAS_RD_ACK          =>  1,
          C_HAS_RD_COUNT        =>  1,
          C_HAS_RD_ERR          =>  0,
          C_HAS_WR_ACK          =>  0,
          C_HAS_WR_COUNT        =>  1,
          C_HAS_WR_ERR          =>  0,
          C_RD_ACK_LOW          =>  0,
          C_RD_COUNT_WIDTH      =>  5,
          C_RD_ERR_LOW          =>  0,
          C_USE_BLOCKMEM        =>  0,
          C_WR_ACK_LOW          =>  0,
          C_WR_COUNT_WIDTH      =>  5,
          C_WR_ERR_LOW          =>  0
         )
      port Map (
         Din                 =>  s2mm_desc_info_int,
         Wr_en               =>  fifo_wr,
         Wr_clk              =>  clk_in,
         Rd_en               =>  fifo_rd,
         Rd_clk              =>  sg_clk,
         Ainit               =>  resetn,
         Dout                =>  s2mm_desc_info,
         Full                =>  fifo_Full,
         Empty               =>  fifo_empty,
         Almost_full         =>  open,
         Almost_empty        =>  open,
         Wr_count            =>  open,
         Rd_count            =>  open,
         Rd_ack              =>  open,
         Rd_err              =>  open,              -- Not used by axi_dma
         Wr_ack              =>  open,              -- Not used by axi_dma
         Wr_err              =>  open               -- Not used by axi_dma
        );



end implement;
