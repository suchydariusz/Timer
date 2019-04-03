library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;

entity clock_divider is
	port(
	clk: in std_logic;
	clk2hz: buffer std_logic;
	clk1hz: buffer std_logic );
end clock_divider;

architecture divide of clock_divider is
begin
	process(clk)
	variable i : integer;
	begin
		if clk'event and clk = '1' then

			if ( i = 25000000 ) or ( i = 50000000 ) then
				clk2hz <= '1';
			else
				clk2hz <= '0';
			end if;
				
			if i = 50000000 then
				clk1hz <= '1';
			else
				clk1hz <= '0';
			end if;

			if i = 50000000 then
				i := 1;
			else
				i := i + 1;
			end if;
			
		end if;
	end process;
end divide;