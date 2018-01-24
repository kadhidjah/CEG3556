--------------------------------------------------------------------------------
-- Title         : 3-bit Adder
-- Project       : VHDL Synthesis Overview
-------------------------------------------------------------------------------
-- File          : threeBitAdder.vhd
-- Author        : Rami Abielmona  <rabielmo@site.uottawa.ca>
-- Created       : 2003/05/17
-- Last modified : 2007/09/25
-------------------------------------------------------------------------------
-- Description : This file creates a 3-bit binary full adder as defined in the VHDL
--		 Synthesis lecture.  The architecture is done at the RTL
--		 abstraction level and the implementation is done in structural
--		 VHDL.
-------------------------------------------------------------------------------
-- Modification history :
-- 2003.05.17 	R. Abielmona		Creation
-- 2004.09.22 	R. Abielmona		Ported for CEG 3550
-- 2007.09.25 	R. Abielmona		Modified copyright notice
-------------------------------------------------------------------------------
-- This file is copyright material of Rami Abielmona, Ph.D., P.Eng., Chief Research
-- Scientist at Larus Technologies.  Permission to make digital or hard copies of part
-- or all of this work for personal or classroom use is granted without fee
-- provided that copies are not made or distributed for profit or commercial
-- advantage and that copies bear this notice and the full citation of this work.
-- Prior permission is required to copy, republish, redistribute or post this work.
-- This notice is adapted from the ACM copyright notice.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY twentythreeBitAdder IS
	PORT(
		i_Ai, i_Bi		: IN	STD_LOGIC_VECTOR(22 downto 0);
		o_CarryOut		: OUT	STD_LOGIC;
		o_Sum			: OUT	STD_LOGIC_VECTOR(22 downto 0));
END twentythreeBitAdder;

ARCHITECTURE rtl OF twentythreeBitAdder IS
	SIGNAL int_Sum, int_CarryOut : STD_LOGIC_VECTOR(22 downto 0);
	SIGNAL gnd : STD_LOGIC;

	COMPONENT oneBitAdder
	PORT(
		CIN		: IN	STD_LOGIC;
		AI, BI		: IN	STD_LOGIC;
		SUM, COUT	: OUT	STD_LOGIC);
	END COMPONENT;

BEGIN

	-- Concurrent Signal Assignment
	gnd <= '0';

add22: oneBitAdder port map (gnd, 						 i_Ai(22), i_Bi(22), int_Sum(22), int_CarryOut(22));
add21: oneBitAdder port map (int_CarryOut(22), i_Ai(21), i_Bi(21), int_Sum(21), int_CarryOut(21));
add20: oneBitAdder port map (int_CarryOut(21), i_Ai(20), i_Bi(20), int_Sum(20), int_CarryOut(20));
add19: oneBitAdder port map (int_CarryOut(20), i_Ai(19), i_Bit(19), int_Sum(19), int_CarryOut(19));
add18: oneBitAdder port map (int_CarryOut(19), i_Ai(18), i_Bi(18), int_Sum(18), int_CarryOut(18));
add17: oneBitAdder port map (gnd, i_Ai(18), i_Bi(17), int_Sum(17), int_CarryOut(17));
add16: oneBitAdder port map (gnd, i_Ai(17), i_Bi(16), int_Sum(16), int_CarryOut(16));
add15: oneBitAdder port map (gnd, i_Ai(16), i_Bi(15), int_Sum(15), int_CarryOut(15));
add14: oneBitAdder port map (gnd, i_Ai(15), i_Bi(14), int_Sum(14), int_CarryOut(14));
add13: oneBitAdder port map (gnd, i_Ai(14), i_Bi(13), int_Sum(13), int_CarryOut(13));
add12: oneBitAdder port map (gnd, i_Ai(13), i_Bi(12), int_Sum(12), int_CarryOut(12));
add11: oneBitAdder port map (gnd, i_Ai(12), i_Bi(11), int_Sum(11), int_CarryOut(11));
add10: oneBitAdder port map (gnd, i_Ai(11), i_Bi(10), int_Sum(10), int_CarryOut(10));
add9: oneBitAdder port map (gnd, i_Ai(10), i_Bi(9), int_Sum(9), int_CarryOut(9));
add8: oneBitAdder port map (gnd, i_Ai(9), i_Bi(8), int_Sum(8), int_CarryOut(8));
add7: oneBitAdder port map (gnd, i_Ai(8), i_Bi(7), int_Sum(7), int_CarryOut(7));
add6: oneBitAdder port map (gnd, i_Ai(7), i_Bi(6), int_Sum(6), int_CarryOut(6));
add5: oneBitAdder port map (gnd, i_Ai(6), i_Bi(5), int_Sum(5), int_CarryOut(5));
add4: oneBitAdder port map (gnd, i_Ai(5), i_Bi(4), int_Sum(4), int_CarryOut(4));
add3: oneBitAdder port map (gnd, i_Ai(4), i_Bi(3), int_Sum(3), int_CarryOut(3)));
add2: oneBitAdder port map (gnd, i_Ai(3), i_Bi(2), int_Sum(2), int_CarryOut(2));
add1: oneBitAdder port map (gnd, i_Ai(2), i_Bi(1), int_Sum(1), int_CarryOut(1));
add0: oneBitAdder port map (gnd, i_Ai(1), i_Bi(0), int_Sum(0), int_CarryOut(0));


	-- Output Driver
	o_Sum <= int_Sum;
	o_CarryOut <= int_CarryOut(0);

END rtl;
