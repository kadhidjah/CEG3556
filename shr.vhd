-- Quartus II VHDL Template
-- Basic Shift Register

library ieee;
use ieee.std_logic_1164.all;

entity basic_shift_register is

	generic
	(
		N : natural := 8);
	

	port 
	(
		clk		: in std_logic;
		reset		: in std_logic;
		sr_in	    : in std_logic_vector((N-1) downto 0);
		sr_out	: out std_logic_vector((N-1) downto 0)
	);

end entity;

architecture rtl of basic_shift_register is
	signal sr: std_logic_vector((N-1) downto 0);

begin

	process (clk,reset)
	begin
		if(reset = '0') then
			sr <= (others => '0');
		elsif (rising_edge(clk)) then

			

				-- Shift right 1 bit each clock-pulse
				sr((N-2) downto 0) <= sr_in((N-1) downto 1);

				
				sr(N-1) <= '0'

			
		end if;
	end process;

	-- Capture the data from the last stage, before it is lost
	sr_out <= sr;

end rtl;
