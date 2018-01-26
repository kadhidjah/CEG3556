library IEEE;
use IEEE.std_Logic_1164.all;

entity comparator8bits is
port (	a : in std_logic_vector(7 downto 0);
			b : in std_logic_vector(7 downto 0);
			a_less_than_b 		: out std_logic;
			a_equal_to_b  		: out std_logic;
			a_greater_than_b	: out_std_logic;
			);
end comparator8bits;

architecture stru of comparator8bits is
begin
	
	a_less_than_b <= not(a) and b;
	a_equal_to_b <= a and b;
	a_greater_than_b <= a and not(b);
	
end stru;