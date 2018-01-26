library IEEE;
use IEEE.std_Logic_1164.all;

entity mux2x1 is
port ( a,b 		: in std_logic_vector(7 downto 0);
		 s			: in std_logic_vector(1 downto 0);
		 m			: out std_logic_vector(7 downto 0));
end mux4x1;

architecture circuit of mux2x1 is
begin
	m <= a when s = '0' else
		  b;
end circuit;