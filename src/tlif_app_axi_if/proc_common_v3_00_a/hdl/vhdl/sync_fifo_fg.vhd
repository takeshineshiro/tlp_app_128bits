-------------------------------------------------------------------------------
-- $Id:$
-------------------------------------------------------------------------------
-- sync_fifo_fg.vhd
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
-- ** Copyright (c) 2008-2010 Xilinx, Inc. All rights reserved.           **
-- **                                                                     **
-- ** This copyright and support notice must be retained as part          **
-- ** of this text at all times.                                          **
-- **                                                                     **
-- *************************************************************************
--
-------------------------------------------------------------------------------
-- Filename:        sync_fifo_fg.vhd
--
-- Description:     
-- This HDL file adapts the legacy CoreGen Sync FIFO interface to the new                
-- FIFO Generator Sync FIFO interface. This wrapper facilitates the "on
-- the fly" call of FIFO Generator during design implementation.                
--                  
--                  
--                  
-- VHDL-Standard:   VHDL'93
-------------------------------------------------------------------------------
-- Structure:   
--              sync_fifo_fg.vhd
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
-- Date:            $1/16/2008$
--
-- History:
--   DET   1/16/2008       Initial Version
-- 
--     DET     7/30/2008     for EDK 11.1
-- ~~~~~~
--     - Replaced fifo_generator_v4_2 component with fifo_generator_v4_3
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
--     DET     4/9/2009     EDK 11.2
-- ~~~~~~
--     - Replaced FIFO Generator version 5.1 with 5.2.
-- ^^^^^^
--
--
--     DET     2/9/2010     for EDK 12.1
-- ~~~~~~
--     - Updated the S6/V6 FIFO Generator version from V5.2 to V5.3.
-- ^^^^^^
--
--     DET     3/10/2010     For EDK 12.x
-- ~~~~~~
--   -- Per CR553307
--     - Updated the S6/V6 FIFO Generator version from V5.3 to V6.1.
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
use proc_common_v3_00_a.coregen_comp_defs.all;
use proc_common_v3_00_a.proc_common_pkg.all;
use proc_common_v3_00_a.proc_common_pkg.log2;
use proc_common_v3_00_a.family_support.all;


-------------------------------------------------------------------------------

entity sync_fifo_fg is
  generic (
    C_FAMILY             :    String  := "virtex5"; -- new for FIFO Gen
    C_DCOUNT_WIDTH       :    integer := 4 ;
    C_ENABLE_RLOCS       :    integer := 0 ; -- not supported in sync fifo
    C_HAS_DCOUNT         :    integer := 1 ;
    C_HAS_RD_ACK         :    integer := 0 ;
    C_HAS_RD_ERR         :    integer := 0 ;
    C_HAS_WR_ACK         :    integer := 0 ;
    C_HAS_WR_ERR         :    integer := 0 ;
    C_HAS_ALMOST_FULL    :    integer := 0 ;
    C_MEMORY_TYPE        :    integer := 0 ;  -- 0 = distributed RAM, 1 = BRAM
    C_PORTS_DIFFER       :    integer := 0 ;  
    C_RD_ACK_LOW         :    integer := 0 ;
    C_READ_DATA_WIDTH    :    integer := 16;
    C_READ_DEPTH         :    integer := 16;
    C_RD_ERR_LOW         :    integer := 0 ;
    C_WR_ACK_LOW         :    integer := 0 ;
    C_WR_ERR_LOW         :    integer := 0 ;
    C_PRELOAD_REGS       :    integer := 0 ;  -- 1 = first word fall through
    C_PRELOAD_LATENCY    :    integer := 1 ;  -- 0 = first word fall through
    C_WRITE_DATA_WIDTH   :    integer := 16;
    C_WRITE_DEPTH        :    integer := 16
    );
  port (
    Clk          : in  std_logic;
    Sinit        : in  std_logic;
    Din          : in  std_logic_vector(C_WRITE_DATA_WIDTH-1 downto 0);
    Wr_en        : in  std_logic;
    Rd_en        : in  std_logic;
    Dout         : out std_logic_vector(C_READ_DATA_WIDTH-1 downto 0);
    Almost_full  : out std_logic;
    Full         : out std_logic;
    Empty        : out std_logic;
    Rd_ack       : out std_logic;
    Wr_ack       : out std_logic;
    Rd_err       : out std_logic;
    Wr_err       : out std_logic;
    Data_count   : out std_logic_vector(C_DCOUNT_WIDTH-1 downto 0)
    );

end entity sync_fifo_fg;


architecture implementation of sync_fifo_fg is


-- Function delarations 


-------------------------------------------------------------------
-- Function
--
-- Function Name: GetMaxDepth
--
-- Function Description:
-- Returns the largest value of either Write depth or Read depth
-- requested by input parameters.
--
-------------------------------------------------------------------
function GetMaxDepth (rd_depth : integer; 
                      wr_depth : integer) 
                      return integer is

  Variable max_value : integer := 0;

begin
   
   If (rd_depth < wr_depth) Then
     max_value := wr_depth;
   else
     max_value := rd_depth;
   End if;
  
  return(max_value);
  
end function GetMaxDepth;


-- Constant Declarations  ----------------------------------------------
  

-- Calculate associated FIFO characteristics
Constant MAX_DEPTH           : integer := GetMaxDepth(C_READ_DEPTH,C_WRITE_DEPTH);
Constant FGEN_CNT_WIDTH      : integer := log2(MAX_DEPTH)+1;
Constant ADJ_FGEN_CNT_WIDTH  : integer := FGEN_CNT_WIDTH-1;
--------------------------------------------------------------------
-- C_PRELOAD_REGS = 0, C_PRELOAD_LATENCY = 1:   Normal Mode
-- C_PRELOAD_REGS = 1, C_PRELOAD_LATENCY = 0:   Showahead Mode
--------------------------------------------------------------------
constant C_SHOWAHEAD         : integer := C_PRELOAD_REGS;

component sync_fifo_gen
  	generic (
		C_FAMILY		:    string  := "Stratix IV";	
    		C_WRITE_DATA_WIDTH   	:    integer := 16;
    		C_READ_DATA_WIDTH    	:    integer := 16;
    		C_FIFO_DEPTH      	:    integer := 16;
		C_FIFO_DEPTH_LOG2	:    integer := 4;
    		C_SHOWAHEAD    	 	:    integer := 1
    	);
	PORT
	(
		clock		: IN STD_LOGIC ;
		data		: IN STD_LOGIC_VECTOR (C_WRITE_DATA_WIDTH-1 DOWNTO 0);
		rdreq		: IN STD_LOGIC ;
		sclr		: IN STD_LOGIC ;
		wrreq		: IN STD_LOGIC ;
		almost_full	: OUT STD_LOGIC ;
		empty		: OUT STD_LOGIC ;
		full		: OUT STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (C_READ_DATA_WIDTH-1 DOWNTO 0);
		usedw		: OUT STD_LOGIC_VECTOR (ADJ_FGEN_CNT_WIDTH-1 DOWNTO 0)
	);
end component;

-- Signals
    
signal sig_full            	: std_logic;
signal sig_full_fg_datacnt 	: std_logic_vector(FGEN_CNT_WIDTH-1 downto 0);
signal sig_prim_fg_datacnt 	: std_logic_vector(ADJ_FGEN_CNT_WIDTH-1 downto 0);
signal sig_Rd_en		: std_logic;
signal sig_Empty		: std_logic;

begin --(architecture implementation)
 
   
-- Create legacy data count by concatenating the Full flag to the 
-- MS Bit position of the FIFO data count
sig_full_fg_datacnt <= sig_full & sig_prim_fg_datacnt;  
     
Data_count <=  sig_full_fg_datacnt(FGEN_CNT_WIDTH-1 downto FGEN_CNT_WIDTH-C_DCOUNT_WIDTH);   

Rd_ack     <=  sig_Rd_en when (C_PRELOAD_LATENCY = 1) else (Rd_en and (not sig_Empty));
    
process (Clk)
begin
	if (Clk'event and Clk='1') then
		Wr_ack <= Wr_en;
	end if;     
end process;

process (Clk)
begin
	if (Clk'event and Clk='1') then
		sig_Rd_en <= Rd_en and (not sig_Empty);
	end if;     
end process;

Full	<=	sig_full;
Empty	<=	sig_Empty;
Rd_err  <=	'0';	-- Not used
Wr_err	<=	'0';	-- Not used

--------------------------------------------------------------------
-- C_WRITE_DATA_WIDTH must be equal to C_READ_DATA_WIDTH!!!
--------------------------------------------------------------------
Inst_sync_fifo : sync_fifo_gen 
  	generic map (
		C_FAMILY		=>	"Stratix IV",
    		C_WRITE_DATA_WIDTH   	=> 	C_WRITE_DATA_WIDTH,
    		C_READ_DATA_WIDTH    	=> 	C_READ_DATA_WIDTH,
    		C_FIFO_DEPTH      	=> 	MAX_DEPTH,
		C_FIFO_DEPTH_LOG2       => 	ADJ_FGEN_CNT_WIDTH,
    		C_SHOWAHEAD    	 	=> 	C_SHOWAHEAD
    	)
	PORT MAP (
		clock	 	=> 	Clk,
		data	 	=> 	Din,
		rdreq	 	=> 	Rd_en,
		sclr	 	=> 	Sinit,
		wrreq	 	=> 	Wr_en,
		almost_full	=>	Almost_full,
		empty	 	=> 	sig_Empty,
		full	 	=> 	sig_full,
		q	 	=> 	Dout,
		usedw	 	=> 	sig_prim_fg_datacnt
	);  


end implementation;
