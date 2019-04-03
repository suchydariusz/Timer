library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;

entity timer is
	port(
	clk: in std_logic;
	US: in std_logic;
	UM: in std_logic;
	S: in std_logic;
	sec_j: buffer std_logic_vector( 3 downto 0 );
	sec_d: buffer std_logic_vector( 3 downto 0 );
	min_j: buffer std_logic_vector( 3 downto 0 );
	min_d: buffer std_logic_vector( 3 downto 0 ) );
end timer;

architecture count of timer is
begin
	counting: process(clk)
	begin
		--up
		if clk'event and clk = '1' and US = '0' and S = '0' then
			if sec_j < 9 then
				sec_j <= sec_j + 1;
			else sec_j <= "0000";
			end if;
			
			if sec_d < 5 and sec_j = 9 then
				sec_d <= sec_d + 1;
			elsif sec_d = 5 and sec_j = 9 then
				sec_d <= "0000";
			end if;
		end if;
		
		if clk'event and clk = '1' and UM = '0' and S = '0' then
			if min_j < 9 then
				min_j <= min_j + 1;
			else min_j <= "0000";
			end if;
			
			if min_d < 5 and min_j = 9 then
				min_d <= min_d + 1;
			elsif min_d = 5 and min_j = 9 then
				min_d <= "0000";
			end if;
		end if;
	
		--down
		if clk'event and clk = '1' and S = '1' and sec_j = 0 and sec_d = 0 and min_j = 0 and min_d = 0 then
			sec_j <= "0000";
			sec_d <= "0000";
			min_j <= "0000";
			min_d <= "0000";
		else
			if clk'event and clk = '1' and S = '1' then
				if sec_j > 0 then
					sec_j <= sec_j - 1;
				else sec_j <= "1001";
				end if;
			end if;
			
			if clk'event and clk = '1' and S = '1' and sec_j = 0 then
				if sec_d > 5 then
					sec_d <= "0101";
				else sec_d <= sec_d - 1;
				end if;
			end if;
			
			if clk'event and clk = '1' and S = '1' and sec_j = 0 and sec_d = 0 then
				sec_d <= "0101";
				if min_j > 0 then
					min_j <= min_j - 1;
				else min_j <= "1001";
				end if;
			end if;
			
			if clk'event and clk = '1' and S = '1' and sec_j = 0 and sec_d = 0 and min_j = 0 then
				if min_d > 5 then
					min_d <= "0101";
				else min_d <= min_d - 1;
				end if;
			end if;
		end if;	
	end process counting;
end count;