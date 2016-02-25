-------------------------------------------------------------------------------
-- axi_dma_mm2s_sm
-------------------------------------------------------------------------------
--
-- *************************************************************************
--
-- (c) Copyright 2010, 2011 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- *************************************************************************
--
-------------------------------------------------------------------------------
-- Filename:          axi_dma_mm2s_sm.vhd
-- Description: This entity contains the MM2S DMA Controller State Machine
--
-- VHDL-Standard:   VHDL'93
-------------------------------------------------------------------------------
-- Structure:
--                  axi_dma.vhd
--                   |- axi_dma_pkg.vhd
--                   |- axi_dma_rst_module.vhd
--                   |- axi_dma_reg_module.vhd
--                   |   |- axi_dma_lite_if.vhd
--                   |   |- axi_dma_register.vhd (mm2s)
--                   |   |- axi_dma_register.vhd (s2mm)
--                   |- axi_dma_mm2s_mngr.vhd
--                   |   |- axi_dma_mm2s_sg_if.vhd
--                   |   |- axi_dma_mm2s_sm.vhd
--                   |   |- axi_dma_mm2s_cmdsts_if.vhd
--                   |   |- axi_dma_mm2s_cntrl_strm.vhd
--                   |       |- axi_dma_skid_buf.vhd
--                   |       |- axi_dma_strm_rst.vhd
--                   |- axi_dma_s2mm_mngr.vhd
--                   |   |- axi_dma_s2mm_sg_if.vhd
--                   |   |- axi_dma_s2mm_sm.vhd
--                   |   |- axi_dma_s2mm_cmdsts_if.vhd
--                   |   |- axi_dma_s2mm_sts_strm.vhd
--                   |       |- axi_dma_skid_buf.vhd
--                   |- axi_datamover_v2_00_a.axi_data_mover.vhd (FULL)
--                   |- axi_dma_strm_rst.vhd
--                   |- axi_dma_skid_buf.vhd
--                   |- axi_sg_v3_00_a.axi_sg.vhd
--
-------------------------------------------------------------------------------
-- Author:      Gary Burch
-- History:
--  GAB     3/19/10    v1_00_a
-- ^^^^^^
--  - Initial Release
-- ~~~~~~
--  GAB     9/03/10    v2_00_a
-- ^^^^^^
--  - Updated libraries to v2_00_a
-- ~~~~~~
--  GAB     10/15/10    v3_00_a
-- ^^^^^^
--  - Updated libraries to v3_00_a
-- ~~~~~~
--  GAB     2/15/11     v4_00_a
-- ^^^^^^
--  Updated libraries to v4_00_a
-- ~~~~~~
--  GAB     6/21/11    v5_00_a
-- ^^^^^^
--  Updated to axi_dma_v6_00_a
-- ~~~~~~
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

library unisim;
use unisim.vcomponents.all;

library axi_dma_v6_00_a;
use axi_dma_v6_00_a.axi_dma_pkg.all;

library proc_common_v3_00_a;
use proc_common_v3_00_a.proc_common_pkg.clog2;


-------------------------------------------------------------------------------
entity  axi_dma_mm2s_sm is
    generic (
        C_M_AXI_MM2S_ADDR_WIDTH     : integer range 32 to 64    := 32;
            -- Master AXI Memory Map Address Width for MM2S Read Port

        C_SG_LENGTH_WIDTH           : integer range 8 to 23     := 14;
            -- Width of Buffer Length, Transferred Bytes, and BTT fields

        C_SG_INCLUDE_DESC_QUEUE     : integer range 0 to 1      := 0;
            -- Include or Exclude Scatter Gather Descriptor Queuing
            -- 0 = Exclude SG Descriptor Queuing
            -- 1 = Include SG Descriptor Queuing

        C_PRMY_CMDFIFO_DEPTH        : integer range 1 to 16     := 1;
            -- Depth of DataMover command FIFO

        C_ENABLE_MULTI_CHANNEL             : integer range 0 to 1      := 0
    );
    port (
        m_axi_sg_aclk               : in  std_logic                         ;                      --
        m_axi_sg_aresetn            : in  std_logic                         ;                      --
                                                                                                   --
        -- Channel 1 Control and Status                                                            --
        mm2s_run_stop               : in  std_logic                         ;                      --
        mm2s_keyhole                : in  std_logic                         ;
        mm2s_ftch_idle              : in  std_logic                         ;                      --
        mm2s_stop                   : in  std_logic                         ;                      --
        mm2s_cmnd_idle              : out std_logic                         ;                      --
        mm2s_sts_idle               : out std_logic                         ;                      --
        mm2s_desc_flush             : out std_logic                         ;                      --
                                                                                                   --
        -- MM2S Descriptor Fetch Request (from mm2s_sm)                                            --
        desc_available              : in  std_logic                         ;                      --
        desc_fetch_req              : out std_logic                         ;                      --
        desc_fetch_done             : in  std_logic                         ;                      --
        desc_update_done            : in  std_logic                         ;                      --
        packet_in_progress          : in  std_logic                         ;                      --
                                                                                                   --
        -- DataMover Command                                                                       --
        mm2s_cmnd_wr                : out std_logic                         ;                      --
        mm2s_cmnd_data              : out std_logic_vector                                         --
                                        ((2*C_M_AXI_MM2S_ADDR_WIDTH+CMD_BASE_WIDTH+46)-1 downto 0);     --
        mm2s_cmnd_pending           : in std_logic                          ;                      --
                                                                                                   --
        -- Descriptor Fields                                                                       --
        mm2s_cache_info             : in std_logic_vector
                                        (C_M_AXI_MM2S_ADDR_WIDTH-1 downto 0);                      --
        mm2s_desc_baddress          : in  std_logic_vector                                         --
                                        (C_M_AXI_MM2S_ADDR_WIDTH-1 downto 0);                      --
        mm2s_desc_blength           : in  std_logic_vector                                         --
                                        (BUFFER_LENGTH_WIDTH-1 downto 0)    ;                      --
        mm2s_desc_blength_v           : in  std_logic_vector                                         --
                                        (BUFFER_LENGTH_WIDTH-1 downto 0)    ;                      --
        mm2s_desc_blength_s           : in  std_logic_vector                                         --
                                        (BUFFER_LENGTH_WIDTH-1 downto 0)    ;                      --
        mm2s_desc_eof               : in  std_logic                         ;                      --
        mm2s_desc_sof               : in  std_logic                                                --

    );

end axi_dma_mm2s_sm;

-------------------------------------------------------------------------------
-- Architecture
-------------------------------------------------------------------------------
architecture implementation of axi_dma_mm2s_sm is

-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------

-- No Functions Declared

-------------------------------------------------------------------------------
-- Constants Declarations
-------------------------------------------------------------------------------
-- DataMover Commmand TAG
constant MM2S_CMD_TAG       : std_logic_vector(2 downto 0)  := (others => '0');
-- DataMover Command Destination Stream Offset
constant MM2S_CMD_DSA       : std_logic_vector(5 downto 0)  := (others => '0');
-- DataMover Cmnd Reserved Bits
constant MM2S_CMD_RSVD      : std_logic_vector(
                                DATAMOVER_CMD_RSVMSB_BOFST + C_M_AXI_MM2S_ADDR_WIDTH downto
                                DATAMOVER_CMD_RSVLSB_BOFST + C_M_AXI_MM2S_ADDR_WIDTH)
                                := (others => '0');

-- Queued commands counter width
constant COUNTER_WIDTH      : integer := clog2(C_PRMY_CMDFIFO_DEPTH+1);
-- Queued commands zero count
constant ZERO_COUNT         : std_logic_vector(COUNTER_WIDTH - 1 downto 0)
                                := (others => '0');



-------------------------------------------------------------------------------
-- Signal / Type Declarations
-------------------------------------------------------------------------------
type SG_MM2S_STATE_TYPE      is (
                                IDLE,
                                FETCH_DESCRIPTOR,
                                EXECUTE_XFER,
                                WAIT_STATUS
                                );

signal mm2s_cs                  : SG_MM2S_STATE_TYPE;
signal mm2s_ns                  : SG_MM2S_STATE_TYPE;



-- State Machine Signals
signal desc_fetch_req_cmb       : std_logic := '0';
signal write_cmnd_cmb           : std_logic := '0';
signal mm2s_cmnd_wr_i           : std_logic := '0';

signal cmnds_queued             : std_logic_vector(COUNTER_WIDTH - 1 downto 0) := (others => '0');
signal count_incr               : std_logic := '0';
signal count_decr               : std_logic := '0';
signal mm2s_desc_flush_i        : std_logic := '0';

signal queue_more               : std_logic := '0';

signal burst_type               : std_logic;

-------------------------------------------------------------------------------
-- Begin architecture logic
-------------------------------------------------------------------------------
begin

mm2s_cmnd_wr    <= mm2s_cmnd_wr_i;
mm2s_desc_flush <= mm2s_desc_flush_i;

-- Flush any fetch descriptors if stopped due to errors or soft reset
-- or if not in middle of packet and run/stop clears
mm2s_desc_flush_i <= '1' when (mm2s_stop = '1')

                          or  (packet_in_progress = '0'
                               and mm2s_run_stop  = '0')
              else '0';

burst_type <= '1' and (not mm2s_keyhole);
-- A 0 on mm2s_kyhole means increment type burst
-- 1 means fixed burst

-------------------------------------------------------------------------------
-- MM2S Transfer State Machine
-------------------------------------------------------------------------------
MM2S_MACHINE : process(mm2s_cs,
                       mm2s_run_stop,
                       packet_in_progress,
                       desc_available,
                       desc_fetch_done,
                       desc_update_done,
                       mm2s_cmnd_pending,
                       mm2s_stop,
                       mm2s_desc_flush_i,
                       queue_more
                       )
    begin

        -- Default signal assignment
        desc_fetch_req_cmb      <= '0';
        write_cmnd_cmb          <= '0';
        mm2s_cmnd_idle          <= '0';
        mm2s_ns                 <= mm2s_cs;

        case mm2s_cs is

            -------------------------------------------------------------------
            when IDLE =>
                -- Running or Stopped but in middle of xfer and Descriptor
                -- data available, No errors logged, and Room to queue more
                -- commands, then fetch descriptor
                if( (mm2s_run_stop = '1' or packet_in_progress = '1')
                and desc_available = '1' and mm2s_stop = '0' and queue_more = '1') then
                    mm2s_ns <= FETCH_DESCRIPTOR;
                else
                    mm2s_cmnd_idle <= '1';
                end if;

            -------------------------------------------------------------------
            when FETCH_DESCRIPTOR =>
                -- error detected or run/stop cleared
                if(mm2s_desc_flush_i = '1')then
                    mm2s_ns     <= IDLE;
                -- descriptor fetch complete
                elsif(desc_fetch_done = '1')then
                    desc_fetch_req_cmb  <= '0';
                    mm2s_ns             <= EXECUTE_XFER;
                else
                    desc_fetch_req_cmb  <= '1';
                end if;

            -------------------------------------------------------------------
            when EXECUTE_XFER =>
                -- error detected
                if(mm2s_stop = '1')then
                    mm2s_ns     <= IDLE;
                -- Write another command if there is not one already pending
                elsif(mm2s_cmnd_pending = '0')then
                    write_cmnd_cmb  <= '1';
                    if(C_SG_INCLUDE_DESC_QUEUE = 1)then
                        mm2s_ns         <= IDLE;
                    else
                        mm2s_ns         <= WAIT_STATUS;
                    end if;
                else
                    mm2s_ns             <= EXECUTE_XFER;
                end if;

            -------------------------------------------------------------------
            when WAIT_STATUS =>
                -- wait until desc update complete or error occurs
                if(desc_update_done = '1' or mm2s_stop = '1')then
                    mm2s_ns <= IDLE;
                else
                    mm2s_ns <= WAIT_STATUS;
                end if;

            -------------------------------------------------------------------
            when others =>
                mm2s_ns <= IDLE;

        end case;
    end process MM2S_MACHINE;

-------------------------------------------------------------------------------
-- register state machine states
-------------------------------------------------------------------------------
REGISTER_STATE : process(m_axi_sg_aclk)
    begin
        if(m_axi_sg_aclk'EVENT and m_axi_sg_aclk = '1')then
            if(m_axi_sg_aresetn = '0')then
                mm2s_cs     <= IDLE;
            else
                mm2s_cs     <= mm2s_ns;
            end if;
        end if;
    end process REGISTER_STATE;

-------------------------------------------------------------------------------
-- register state machine signals
-------------------------------------------------------------------------------
SM_SIG_REGISTER : process(m_axi_sg_aclk)
    begin
        if(m_axi_sg_aclk'EVENT and m_axi_sg_aclk = '1')then
            if(m_axi_sg_aresetn = '0')then
                desc_fetch_req      <= '0'      ;
            else
                desc_fetch_req      <= desc_fetch_req_cmb   ;
            end if;
        end if;
    end process SM_SIG_REGISTER;

-------------------------------------------------------------------------------
-- Build DataMover command
-------------------------------------------------------------------------------
-- If Bytes To Transfer (BTT) width less than 23, need to add pad
GEN_CMD_BTT_LESS_23 : if C_SG_LENGTH_WIDTH < 23 generate
constant PAD_VALUE : std_logic_vector(22 - C_SG_LENGTH_WIDTH downto 0)
                        := (others => '0');
begin
    -- When command by sm, drive command to mm2s_cmdsts_if
    GEN_DATAMOVER_CMND : process(m_axi_sg_aclk)
        begin
            if(m_axi_sg_aclk'EVENT and m_axi_sg_aclk = '1')then
                if(m_axi_sg_aresetn = '0')then
                    mm2s_cmnd_wr_i  <= '0';
                    mm2s_cmnd_data  <= (others => '0');

                -- Fetch SM issued a command write
                --
                -- Note: change to mode where EOF generates IOC interrupt as
                -- opposed to a IOC bit in the descriptor negated need for an
                -- EOF and IOC tag.  Given time, these two bits could be combined
                -- into 1.  Associated logic in SG engine would also need to be
                -- modified as well as in mm2s_sg_if.
                elsif(write_cmnd_cmb = '1')then
                    mm2s_cmnd_wr_i  <= '1';
                    mm2s_cmnd_data  <=  mm2s_cache_info 
                                        & mm2s_desc_blength_v
                                        & mm2s_desc_blength_s   
                                        & MM2S_CMD_RSVD
                                        -- Command Tag
                                        & '0'
                                        & '0'
                                        & mm2s_desc_eof  -- Cat. EOF to CMD Tag
                                        & mm2s_desc_eof  -- Cat. IOC to CMD Tag
                                        -- Command
                                        & mm2s_desc_baddress
                                        & mm2s_desc_sof
                                        & mm2s_desc_eof
                                        & MM2S_CMD_DSA
                                        & burst_type          -- key Hole operation'1'       -- mm2s_desc_type IR#545697
                                        & PAD_VALUE
                                        & mm2s_desc_blength(C_SG_LENGTH_WIDTH-1 downto 0);

                else
                    mm2s_cmnd_wr_i  <= '0';

                end if;
            end if;
        end process GEN_DATAMOVER_CMND;

end generate GEN_CMD_BTT_LESS_23;

-- If Bytes To Transfer (BTT) width equal 23, no required pad
GEN_CMD_BTT_EQL_23 : if C_SG_LENGTH_WIDTH = 23 generate
begin
    -- When command by sm, drive command to mm2s_cmdsts_if
    GEN_DATAMOVER_CMND : process(m_axi_sg_aclk)
        begin
            if(m_axi_sg_aclk'EVENT and m_axi_sg_aclk = '1')then
                if(m_axi_sg_aresetn = '0')then
                    mm2s_cmnd_wr_i  <= '0';
                    mm2s_cmnd_data  <= (others => '0');

                -- Fetch SM issued a command write
                --
                -- Note: change to mode where EOF generates IOC interrupt as
                -- opposed to a IOC bit in the descriptor negated need for an
                -- EOF and IOC tag.  Given time, these two bits could be combined
                -- into 1.  Associated logic in SG engine would also need to be
                -- modified as well as in mm2s_sg_if.
                elsif(write_cmnd_cmb = '1')then
                    mm2s_cmnd_wr_i  <= '1';
                    mm2s_cmnd_data  <=  mm2s_cache_info
                                        & mm2s_desc_blength_v
                                        & mm2s_desc_blength_s   
                                        & MM2S_CMD_RSVD
                                        -- Command Tag
                                        & '0'
                                        & '0'
                                        & mm2s_desc_eof  -- Cat. EOF to CMD Tag
                                        & mm2s_desc_eof  -- Cat. IOC to CMD Tag (ioc changed to EOF)
                                        -- Command
                                        & mm2s_desc_baddress
                                        & mm2s_desc_sof
                                        & mm2s_desc_eof
                                        & MM2S_CMD_DSA
                                        & burst_type    -- key Hole Operation'1'               -- mm2s_desc_type IR#545697
                                        & mm2s_desc_blength;

                else
                    mm2s_cmnd_wr_i  <= '0';

                end if;
            end if;
        end process GEN_DATAMOVER_CMND;

end generate GEN_CMD_BTT_EQL_23;


-------------------------------------------------------------------------------
-- Counter for keepting track of pending commands/status in primary datamover
-- Use this to determine if primary datamover for mm2s is Idle.
-------------------------------------------------------------------------------
-- increment with each command written
count_incr  <= '1' when mm2s_cmnd_wr_i = '1' and desc_update_done = '0'
          else '0';

-- decrement with each status received
count_decr  <= '1' when mm2s_cmnd_wr_i = '0' and desc_update_done = '1'
          else '0';

-- count number of queued commands to keep track of what datamover is still
-- working on
CMD2STS_COUNTER : process(m_axi_sg_aclk)
    begin
        if(m_axi_sg_aclk'EVENT and m_axi_sg_aclk = '1')then
            if(m_axi_sg_aresetn = '0' or mm2s_stop = '1')then
                cmnds_queued <= (others => '0');
            elsif(count_incr = '1')then
                cmnds_queued <= std_logic_vector(unsigned(cmnds_queued(COUNTER_WIDTH - 1 downto 0)) + 1);
            elsif(count_decr = '1')then
                cmnds_queued <= std_logic_vector(unsigned(cmnds_queued(COUNTER_WIDTH - 1 downto 0)) - 1);
            end if;
        end if;
    end process CMD2STS_COUNTER;

-- Indicate status is idle when no cmnd/sts queued
mm2s_sts_idle <= '1' when  cmnds_queued = ZERO_COUNT
            else '0';

-------------------------------------------------------------------------------
-- Queue only the amount of commands that can be queued on descriptor update
-- else lock up can occur. Note datamover command fifo depth is set to number
-- of descriptors to queue.
-------------------------------------------------------------------------------
QUEUE_MORE_PROCESS : process(m_axi_sg_aclk)
    begin
        if(m_axi_sg_aclk'EVENT and m_axi_sg_aclk = '1')then
            if(m_axi_sg_aresetn = '0')then
                queue_more <= '0';
            elsif(cmnds_queued < std_logic_vector(to_unsigned(C_PRMY_CMDFIFO_DEPTH,COUNTER_WIDTH)))then
                queue_more <= '1';
            else
                queue_more <= '0';
            end if;
        end if;
    end process QUEUE_MORE_PROCESS;

end implementation;
