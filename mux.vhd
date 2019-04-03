library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux is 
	port(
	S: in std_logic;
	A: in std_logic; --1hz
	B: in std_logic; --2hz
	Y: out std_logic);
end mux;

architecture multi of mux is
begin
	process(S)
	begin
		if S = '1' then
			Y <= A;
		else
			Y <= B;
		end if;
	end process;
end multi;