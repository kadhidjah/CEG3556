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

TYPE states IS (STATE1, STATE2, STATE3, ETC);

SIGNAL gnd, vcc : STD_LOGIC;
SIGNAL largerExp : STD_LOGIC;
SIGNAL adderCarryOut : STD_LOGIC;
SIGNAL expDif : STD_LOGIC_VECTOR(6 downto 0);
SIGNAL counter : STD_LOGIC_VECTOR(6 downto 0);
SIGNAL smallerMantissa, shiftedMantissa, nonShiftedMantissa, shifterOutput, adderSum : STD_LOGIC_VECTOR(7 downto 0);

COMPONENT eightBitSubstractor
port (

i_BorrowIn : IN STD_LOGIC;
i_Ai, i_Bi  : IN STD_LOGIC_VECTOR ( 7 DOWNTO 0);
o_Diff      : OUT STD_LOGIC_VECTOR ( 7 DOWNTO 0);
o_BorrowOut : OUT STD_LOGIC );

END COMPONENT;

COMPONENT mux2x1
port ( a,b 		: in std_logic_vector(7 downto 0);
		 s			: in std_logic_vector(1 downto 0);
		 m			: out std_logic_vector(7 downto 0));
END COMPONENT;

COMPONENT eightBitAdder
	PORT(
		i_Ai, i_Bi		: IN	STD_LOGIC_VECTOR(7 downto 0);
		o_CarryOut		: OUT	STD_LOGIC;
		o_Sum			: OUT	STD_LOGIC_VECTOR(7 downto 0));
END COMPONENT;

COMPONENT eightBitShiftRegister
	PORT(
		i_resetBar, i_load		: IN	STD_LOGIC;
		i_clock						: IN	STD_LOGIC;
		i_Value						: IN	STD_LOGIC_VECTOR(7 downto 0);
		o_Value 					: OUT	STD_LOGIC(7 downto 0));
END COMPONENT;






BEGIN

gnd <= '0'; --ground 0
vcc <= '1'; --signal 1


counter <= expDif;


if not(counter = "0000000") then

	while(not(counter = "0000000")) loop

		counter <= counter - '1';
	end loop;

	shiftedMantissa <= shifterOutput;

end if;





subtractor	 : eightBitSubtractor port map(gnd, ExponentA, ExponentB, expDif, largerExp);
shifter	 	 : eightbitshiftregister port map (GReset, vcc, GClock, smallerMantissa, shifterOutput);
mux_mantissa1 : mux2x1 port map(MantissaA, MantissaB, largerExp, shiftedMantissa);
mux_mantissa2 : mux2x1 port map(MantissaA, MantissaB, not(largerExp), nonShiftedMantissa);
adder		    : eightBitAdder port map(shiftedMantissa, nonShiftedMantissa, adderCarryOut, adderSum);
