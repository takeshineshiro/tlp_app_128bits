-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/unisims/unisim/VITAL/SRLC16E.vhd,v 1.1 2008/06/19 16:59:26 vandanad Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  16-Bit Shift Register Look-Up-Table with Carry and Clock Enable
-- /___/   /\     Filename : SRLC16E.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:56:58 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.

----- CELL SRLC16E -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity SRLC16E is

  generic (
       INIT : bit_vector := X"0000"
  );

  port (
        Q   : out STD_ULOGIC;
        Q15 : out STD_ULOGIC;
        
        A0  : in STD_ULOGIC;
        A1  : in STD_ULOGIC;
        A2  : in STD_ULOGIC;
        A3  : in STD_ULOGIC;
        CE  : in STD_ULOGIC;
        CLK : in STD_ULOGIC;        
        D   : in STD_ULOGIC
       ); 
end SRLC16E;

architecture SRLC16E_V of SRLC16E is
  signal SHIFT_REG : std_logic_vector (15 downto 0) := To_StdLogicVector(INIT);
  signal A : std_logic_vector (3 downto 0);
begin

    A <= A3 & A2 & A1 & A0;
    Q <= SHIFT_REG(TO_INTEGER(UNSIGNED(A)));
    Q15 <= SHIFT_REG(15);


  VITALWriteBehavior : process (CLK, CE)

  begin

    if (CLK'event AND CLK = '1') then
        if (CE = '1') then
           SHIFT_REG(15 downto 0) <= (SHIFT_REG(14 downto 0) & D) after 100 ps;
        end if ;
    end if;

  end process VITALWriteBehavior;
end SRLC16E_V;


