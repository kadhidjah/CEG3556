library IEEE;
use IEEE.std_Logic_1164.all;

entity comparator1bit is
port (	a : in std_logic;
			b : in std_logic;
			a_less_than_b 		: out std_logic;
			a_equal_to_b  		: out std_logic;
			a_greater_than_b	: out_std_logic;
			);
end comparator1bit;

architecture stru of comparator1bit is
begin
	
	a_less_than_b <= not(a) and b;
	a_equal_to_b <= a and b;
	a_greater_than_b <= a and not(b);
	
end stru;