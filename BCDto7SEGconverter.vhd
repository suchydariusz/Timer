library IEEE;
use IEEE.std_logic_1164.all;

entity BCDto7SEGconverter is
	port(
	sec_j: in std_logic_vector( 3 downto 0 );
	sec_d: in std_logic_vector( 3 downto 0 );
	min_j: in std_logic_vector( 3 downto 0 );
	min_d: in std_logic_vector( 3 downto 0 );
	sec_j_7seg: out std_logic_vector( 6 downto 0 );
	sec_d_7seg: out std_logic_vector( 6 downto 0 );
	min_j_7seg: out std_logic_vector( 6 downto 0 );
	min_d_7seg: out std_logic_vector( 6 downto 0 ) );
end BCDto7SEGconverter;

architecture convert of bcdto7SEGconverter is

	procedure change(
		signal r_IN  : in  std_logic_vector( 3 downto 0 );
		signal r_OUT : out std_logic_vector( 6 downto 0 )
		) is
	begin
		case r_IN is
			when "0000" => r_OUT <= "1000000";
			when "0001" => r_OUT <= "1111001";
			when "0010" => r_OUT <= "0100100";
			when "0011" => r_OUT <= "0110000";
			when "0100" => r_OUT <= "0011001";
			when "0101" => r_OUT <= "0010010";
			when "0110" => r_OUT <= "0000010";
			when "0111" => r_OUT <= "1111000";
			when "1000" => r_OUT <= "0000000";
			when "1001" => r_OUT <= "0010000";
			when others => r_OUT <= "1111111";
		end case;
	end procedure;
	
begin

	process(sec_j, sec_d, min_j, min_d)
	begin
		change(sec_j,sec_j_7seg);
		change(sec_d,sec_d_7seg);
		change(min_j,min_j_7seg);
		change(min_d,min_d_7seg);
	end process;
end convert;