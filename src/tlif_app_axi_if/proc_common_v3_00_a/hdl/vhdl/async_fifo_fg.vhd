-------------------------------------------------------------------------------
-- $Id:$
-------------------------------------------------------------------------------
-- async_fifo_fg.vhd
-------------------------------------------------------------------------------
--
-- *************************************************************************
-- **                                                                     **
-- ** DISCLAIMER OF LIABILITY                                             **
-- **                                                                     **
-- ** This text/file contains proprietary, confidential                   **
-- ** information of Xilinx, Inc., is distributed under                   **
-- ** license from Xilinx, Inc., and may be used, copied                  **
-- ** and/or disclosed only pursuant to the terms of a valid              **
-- ** license agreement with Xilinx, Inc. Xilinx hereby                   **
-- ** grants you a license to use this text/file solely for               **
-- ** design, simulation, implementation and creation of                  **
-- ** design files limited to Xilinx devices or technologies.             **
-- ** Use with non-Xilinx devices or technologies is expressly            **
-- ** prohibited and immediately terminates your license unless           **
-- ** covered by a separate agreement.                                    **
-- **                                                                     **
-- ** Xilinx is providing this design, code, or information               **
-- ** "as-is" solely for use in developing programs and                   **
-- ** solutions for Xilinx devices, with no obligation on the             **
-- ** part of Xilinx to provide support. By providing this design,        **
-- ** code, or information as one possible implementation of              **
-- ** this feature, application or standard, Xilinx is making no          **
-- ** representation that this implementation is free from any            **
-- ** claims of infringement. You are responsible for obtaining           **
-- ** any rights you may require for your implementation.                 **
-- ** Xilinx expressly disclaims any warranty whatsoever with             **
-- ** respect to the adequacy of the implementation, including            **
-- ** but not limited to any warranties or representations that this      **
-- ** implementation is free from claims of infringement, implied         **
-- ** warranties of merchantability or fitness for a particular           **
-- ** purpose.                                                            **
-- **                                                                     **
-- ** Xilinx products are not intended for use in life support            **
-- ** appliances, devices, or systems. Use in such applications is        **
-- ** expressly prohibited.                                               **
-- **                                                                     **
-- ** Any modifications that are made to the Source Code are              **
-- ** done at the user’s sole risk and will be unsupported.               **
-- ** The Xilinx Support Hotline does not have access to source           **
-- ** code and therefore cannot answer specific questions related         **
-- ** to source HDL. The Xilinx Hotline support of original source        **
-- ** code IP shall only address issues and questions related             **
-- ** to the standard Netlist version of the core (and thus               **
-- ** indirectly, the original core source).                              **
-- **                                                                     **
-- ** Copyright (c) 2008, 2009, 2010 Xilinx, Inc. All rights reserved.    **
-- **                                                                     **
-- ** This copyright and support notice must be retained as part          **
-- ** of this text at all times.                                          **
-- **                                                                     **
-- *************************************************************************
--
-------------------------------------------------------------------------------
-- Filename:        async_fifo_fg.vhd
--
-- Description:     
-- This HDL file adapts the legacy CoreGen Async FIFO interface to the new                
-- FIFO Generator async FIFO interface. This wrapper facilitates the "on
-- the fly" call of FIFO Generator during design implementation.                
--                  
--                  
-- VHDL-Standard:   VHDL'93
-------------------------------------------------------------------------------
-- Structure:   
--              async_fifo_fg.vhd
--                 |
--                 |-- fifo_generator_v4_3
--                 |
--                 |-- fifo_generator_v8_3
--
-------------------------------------------------------------------------------
-- Revision History:
--
--
-- Author:          DET
-- Revision:        $Revision: 1.5.2.68 $
-- Date:            $1/15/2008$
--
-- History:
--   DET   1/15/2008       Initial Version
-- 
--     DET     7/30/2008     for EDK 11.1
-- ~~~~~~
--     - Added parameter C_ALLOW_2N_DEPTH to enable use of FIFO Generator
--       feature of specifing 2**N depth of FIFO, Legacy CoreGen Async FIFOs
--       only allowed (2**N)-1 depth specification. Parameter is defalted to 
--       the legacy CoreGen method so current users are not impacted.
--     - Incorporated calculation and assignment corrections for the Read and 
--       Write Pointer Widths.
--     - Upgraded to FIFO Generator Version 4.3.
--     - Corrected a swap of the Rd_Err and the Wr_Err connections on the FIFO
--       Generator instance.
-- ^^^^^^
--
--      MSH and DET     3/2/2009     For Lava SP2
-- ~~~~~~
--     - Added FIFO Generator version 5.1 for use with Virtex6 and Spartan6 
--       devices.
--     - IfGen used so that legacy FPGA families still use Fifo Generator 
--       version 4.3.
-- ^^^^^^
--
--     DET     2/9/2010     for EDK 12.1
-- ~~~~~~
--     - Updated the S6/V6 FIFO Generator version from V5.2 to V5.3.
-- ^^^^^^
--
--     DET     3/10/2010     For EDK 12.x
-- ~~~~~~
--   -- Per CR553307
--     - Updated the S6/V6 FIFO Generator version from V5.3 to 6_1.
-- ^^^^^^
--
--     DET     6/18/2010     EDK_MS2
-- ~~~~~~
--    -- Per IR565916
--     - Added derivative part type checks for S6 or V6.
-- ^^^^^^
--
--     DET     8/30/2010     EDK_MS4
-- ~~~~~~
--    -- Per CR573867
--     - Updated the S6/V6 FIFO Generator version from V6.1 to 7.2.
--     - Added all of the AXI parameters and ports. They are not used
--       in this application.
--     - Updated method for derivative part support using new family
--       aliasing function in family_support.vhd.
--     - Incorporated an implementation to deal with unsupported FPGA
--       parts passed in on the C_FAMILY parameter.
-- ^^^^^^
--
--     DET     10/4/2010     EDK 13.1
-- ~~~~~~
--     - Updated the FIFO Generator version from V7.2 to 7.3.
-- ^^^^^^
--
--     DET     12/8/2010     EDK 13.1
-- ~~~~~~
--    -- Per CR586109
--     - Updated the FIFO Generator version from V7.3 to 8.1.
-- ^^^^^^
--
--     DET     3/2/2011     EDK 13.2
-- ~~~~~~
--    -- Per CR595473
--     - Update to use fifo_generator_v8_2
-- ^^^^^^
--
--
--     RBODDU  08/18/2011     EDK 13.3
-- ~~~~~~
--     - Update to use fifo_generator_v8_3
-- ^^^^^^
--
-------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


library proc_common_v3_00_a;
use proc_common_v3_00_a.proc_common_pkg.all;
use proc_common_v3_00_a.coregen_comp_defs.all;
use proc_common_v3_00_a.family_support.all;

-------------------------------------------------------------------------------

entity async_fifo_fg is
  generic (
        C_ALLOW_2N_DEPTH   : Integer := 1;  -- New paramter to leverage FIFO Gen 2**N depth
        C_FAMILY           : String  := "virtex5";  -- new for FIFO Gen
        C_DATA_WIDTH       : integer := 16;
        C_ENABLE_RLOCS     : integer := 0 ;  -- not supported in FG
        C_FIFO_DEPTH       : integer := 16;  -- Must use 2N DEPTH!
        C_HAS_ALMOST_EMPTY : integer := 1 ;
        C_HAS_ALMOST_FULL  : integer := 1 ;
        C_HAS_RD_ACK       : integer := 0 ;
        C_HAS_RD_COUNT     : integer := 1 ;
        C_HAS_RD_ERR       : integer := 0 ;
        C_HAS_WR_ACK       : integer := 0 ;
        C_HAS_WR_COUNT     : integer := 1 ;
        C_HAS_WR_ERR       : integer := 0 ;
        C_RD_ACK_LOW       : integer := 0 ;
        C_RD_COUNT_WIDTH   : integer := 3 ;
        C_RD_ERR_LOW       : integer := 0 ;
        C_USE_BLOCKMEM     : integer := 1 ;  -- 0 = distributed RAM, 1 = BRAM
        C_WR_ACK_LOW       : integer := 0 ;
        C_WR_COUNT_WIDTH   : integer := 3 ;
        C_WR_ERR_LOW       : integer := 0   
    );
  port (
        Din            : in std_logic_vector(C_DATA_WIDTH-1 downto 0) := (others => '0');
        Wr_en          : in std_logic := '1';
        Wr_clk         : in std_logic := '1';
        Rd_en          : in std_logic := '0';
        Rd_clk         : in std_logic := '1';
        Ainit          : in std_logic := '1';   
        Dout           : out std_logic_vector(C_DATA_WIDTH-1 downto 0);
        Full           : out std_logic; 
        Empty          : out std_logic; 
        Almost_full    : out std_logic;  
        Almost_empty   : out std_logic;  
        Wr_count       : out std_logic_vector(C_WR_COUNT_WIDTH-1 downto 0);
        Rd_count       : out std_logic_vector(C_RD_COUNT_WIDTH-1 downto 0);
        Rd_ack         : out std_logic;
        Rd_err         : out std_logic;
        Wr_ack         : out std_logic;
        Wr_err         : out std_logic
    );

end entity async_fifo_fg;

architecture implementation of async_fifo_fg is

Constant C_FIFO_DEPTH_LOG2 : integer range 4 to 22 := log2(C_FIFO_DEPTH);

component async_fifo_gen
  	generic (
		C_FAMILY           	: String  := "Stratix IV";
		C_DATA_WIDTH       	: integer := 16;
		C_FIFO_DEPTH		: integer := 16;
		C_FIFO_DEPTH_LOG2       : integer := 4
    	);
	PORT
	(
		aclr		: IN STD_LOGIC  := '0';
		data		: IN STD_LOGIC_VECTOR (C_DATA_WIDTH-1 DOWNTO 0);
		rdclk		: IN STD_LOGIC ;
		rdreq		: IN STD_LOGIC ;
		wrclk		: IN STD_LOGIC ;
		wrreq		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (C_DATA_WIDTH-1 DOWNTO 0);
		rdempty		: OUT STD_LOGIC ;
		rdusedw		: OUT STD_LOGIC_VECTOR (C_FIFO_DEPTH_LOG2-1 DOWNTO 0);
		wrfull		: OUT STD_LOGIC ;
		wrusedw		: OUT STD_LOGIC_VECTOR (C_FIFO_DEPTH_LOG2-1 DOWNTO 0)
	);
end component;
    
-- Signals Declarations
Signal sig_full_fifo_rdcnt : std_logic_vector(C_FIFO_DEPTH_LOG2-1 DOWNTO 0);
Signal sig_full_fifo_wrcnt : std_logic_vector(C_FIFO_DEPTH_LOG2-1 DOWNTO 0);

Signal ALL_ONES		   : std_logic_vector(C_FIFO_DEPTH_LOG2-1 DOWNTO 0);
Signal ALL_ZEROS	   : std_logic_vector(C_FIFO_DEPTH_LOG2-1 DOWNTO 0);	


begin

ALL_ONES  <= (others => '1');
ALL_ZEROS <= (others => '0');
    
-- Rip the LS bits of the write data count and assign to Write Count output port  
Wr_count  <= sig_full_fifo_wrcnt(C_FIFO_DEPTH_LOG2-1 downto C_FIFO_DEPTH_LOG2-C_WR_COUNT_WIDTH);
   
-- Rip the LS bits of the read data count and assign to Read Count output port  
Rd_count  <= sig_full_fifo_rdcnt(C_FIFO_DEPTH_LOG2-1 downto C_FIFO_DEPTH_LOG2-C_RD_COUNT_WIDTH);

process (Wr_clk)
begin
	if (Wr_clk'event and Wr_clk='1') then
		if (sig_full_fifo_wrcnt(C_FIFO_DEPTH_LOG2-1 downto 2) = ALL_ONES(C_FIFO_DEPTH_LOG2-1 downto 2)) then
			Almost_full   <=   '1';
		else
			Almost_full   <=   '0'; 
		end if;
	end if;
end process;

process (Rd_clk)
begin
	if (Rd_clk'event and Rd_clk='1') then
		if (sig_full_fifo_rdcnt(C_FIFO_DEPTH_LOG2-1 downto 2) = ALL_ZEROS(C_FIFO_DEPTH_LOG2-1 downto 2)) then
			Almost_empty   <=   '1';
		else
			Almost_empty   <=   '0'; 
		end if;
	end if;
end process;

-- Showahead mode, use read request signal as read acknowledge signal
Rd_ack	<=   Rd_en;

Rd_err	<=   '0';	-- Not used
Wr_err  <=   '0';	-- Not used
Wr_ack  <=   '0';	-- Connect to ground since write acknowledge signal is not used
 
async_fifo_gen_inst : async_fifo_gen 
  	generic map (
		C_FAMILY           	=> 	"Stratix IV",
		C_DATA_WIDTH       	=>	C_DATA_WIDTH,
		C_FIFO_DEPTH		=>	C_FIFO_DEPTH,
		C_FIFO_DEPTH_LOG2       => 	C_FIFO_DEPTH_LOG2
    	)
	PORT MAP (
		aclr		=> 	Ainit,
		data	 	=> 	Din,
		rdclk	 	=> 	Rd_clk,
		rdreq	 	=> 	Rd_en,
		wrclk	 	=> 	Wr_clk,
		wrreq	 	=> 	Wr_en,
		q	 	=> 	Dout,
		rdempty	 	=> 	Empty,
		rdusedw	 	=> 	sig_full_fifo_rdcnt,
		wrfull	 	=> 	Full,
		wrusedw	 	=> 	sig_full_fifo_wrcnt
	);

end implementation;
