library IEEE;
use IEEE.std_Logic_1164.all;

entity D-FF is
port ( CLK	: in std_logic;
		 RST	: in std_logic;
		 EN	: in std_logic;
		 D		: in std_logic;
		 Q		: out std_logic);
end D-FF;

architecture stru of D-FF is
begin
	process(CLK, D)
	begin
	if RST = '0' then
		Q <= '0'; --reset
	elsif(CLK'event and CLK = '1' and EN = '0') then
		Q <= D;
	end if;
	end process;
end stru;