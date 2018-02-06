library ieee;
use ieee.std_logic_1164.all;

entity sevenBitIncrementorDecrementor is
port(   input   : in std_logic_vector(6 downto 0);
        control : in std_logic;
        output  : out std_logic_vector(6 downto 0);
        overflow: out std_logic);
end sevenBitIncrementorDecrementor;

----------------------------------------------------------------

architecture rtl of sevenBitIncrementorDecrementor is

signal inc_ovr, dec_ovr, global_ovr : std_logic;
signal inc_out, dec_out, global_out : std_logic_vector(6 downto 0);

component mux2x1
port ( a,b 		: in std_logic_vector(7 downto 0);
		 s			: in std_logic;
		 m			: out std_logic_vector(7 downto 0));
end component;

component sevenBitIncrementor
	port(
		i_Ai					: IN	STD_LOGIC_VECTOR(6 downto 0);
		o_CarryOut		: OUT	STD_LOGIC;
		o_Sum			: OUT	STD_LOGIC_VECTOR(6 downto 0));
end component;

component sevenBitDecrementor
	port(
		i_Ai					: IN	STD_LOGIC_VECTOR(6 downto 0);
		o_BorrowOut	: OUT	STD_LOGIC;
		o_Diff			: OUT	STD_LOGIC_VECTOR(6 downto 0));
end component;


begin

output-mux  : mux2x1              port map(inc_out, dec_out, control, global_out);
ovrflow-mux : mux2x1              port map(inc_ovr, dec_ovr, control, global_ovr);
incrementor : sevenBitIncrementor port map(input, inc_ovr, inc_out);
decrementor : sevenBitDecrementor port map(input, dec_ovr, dec_out);

--Output Driver
output <= global_out;
overflow <= global_ovr;
