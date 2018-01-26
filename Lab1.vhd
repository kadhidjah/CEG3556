library IEEE;
use IEEE.std_logic_1164.all;

entity arithmetic is
	port(		GClock in : std_logic;
				GReset in : std_logic;
				SignA in  : std_logic;
				MantissaA in : std_logic_vector(7 downto 0);
				ExponentA in : std_logic_vector(6 downto 0);
				SignB in : std_logic;
				MantissaB in : std_logic_vector(7 downto 0);
				ExponentB in : std_logic_vector(6 downto 0);
				SignOut out : std_logic;
				MantissaOut out : std_logic_vector(7 downto 0);
				ExponentOut out : std_logic_vector(6 downto 0);
				Overflow out : std_logic);
end arithmetic;


architecture arithmetic_stru of arithmetic is

SIGNAL gnd : STD_LOGIC;

COMPONENT eightBitSubstractor 
port ( 

i_BorrowIn : IN STD_LOGIC;
i_Ai, i_Bi  : IN STD_LOGIC_VECTOR ( 7 DOWNTO 0);
o_Diff      : OUT STD_LOGIC_VECTOR ( 7 DOWNTO 0); 
o_BorrowOut : OUT STD_LOGIC );

END COMPONENT;

BEGIN

gnd <= '0'; --ground signal

subtractor: eightBitSubtractor port map(gnd, ExponentA, ExponentB, );



