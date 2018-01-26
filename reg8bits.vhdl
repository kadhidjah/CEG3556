library IEEE;
use IEEE.std_Logic_1164.all;

entity reg8bits is
port ( CLK	: in std_logic;
		 RST	: in std_logic;
		 EN	: in std_logic;
		 D		: in std_logic_vector(7 downto 0);
		 Q		: out std_logic_vector(7 downto 0));
end reg8bits;

architecture behv of reg8bits is
begin
	process(CLK, D)
	begin
	if RST = '0' then
		Q <= "00000000"; --reset
	elsif(CLK'event and CLK = '1' and EN = '0') then
		Q <= D;
	end if;
	end process;
end behv;