-------------------------------------------------------------------------------
-- $Id: 
-------------------------------------------------------------------------------
-- axi_pcie_mm_s_pkg.vhd
-------------------------------------------------------------------------------
-- (c) Copyright 2010 - 2010 Xilinx, Inc. All rights reserved.
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
-------------------------------------------------------------------------------
-- Filename:        axi_pcie_mm_s_pkg.vhd
--
-- Description:     
--                  
-- This VHDL file is an HDL design file for the AXI slave read bridge. 
--                   
--                  
--                  
--                  
-- VHDL-Standard:   VHDL'93
-------------------------------------------------------------------------------
-- Structure:   
--              axi_pcie_mm_s_pkg.vhd
--
-------------------------------------------------------------------------------
-- Revision:        v1.03.a
-- Date:            12/23/11
--
-- History:

-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
--Notes
--------------------------------------------------------------------------------



package axi_pcie_mm_s_pkg is

   --type tag_len_array is array (0 to 7, 0 to 31) of std_logic_vector(18 downto 0);
   --type tag_len_index_array is array (0 to 7) of integer range 0 to 32;
   type cpl_addr_count_bit_array is array (0 to 7) of std_logic_vector(0 to 31);
   type first_word_offset_array is array (0 to 7) of integer range 0 to 3;
   type rresp_array is array (0 to 3) of std_logic_vector(2 downto 0);
   type slwrreqpending_array is array (0 to 3) of std_logic_vector(1 downto 0);
   type tlplength_array is array (0 to 3) of std_logic_vector(9 downto 0);
   type tlpaddrl_array is array (0 to 3) of std_logic_vector(31 downto 0);
   type barhit_array is array (0 to 3) of std_logic_vector(2 downto 0);
   type cplpendcpl_array is array (0 to 3) of std_logic;
   type wrpend_array is array (0 to 3) of std_logic_vector(3 downto 0);

end package;
