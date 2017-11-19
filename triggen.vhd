library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity triggen is
generic (
		CLKCOUNTER	: natural := 5000000
);
port (
		clock 	: in std_logic;
		reset_n	: in std_logic;
		enable	: out std_logic
);
end entity triggen;

architecture rtl of triggen is

signal counter : integer range 0 to CLKCOUNTER-1;

begin

	process (clock, reset_n)
	begin
		
		if (reset_n='0') then
			counter <= 0;
		elsif (clock='1' and clock'event) then
			if (counter=CLKCOUNTER-1) then
				counter <= 0;
				enable <= '1';
			else
				enable <= '0';
				counter <= counter + 1;
			end if;
		end if;
	end process;

end rtl;