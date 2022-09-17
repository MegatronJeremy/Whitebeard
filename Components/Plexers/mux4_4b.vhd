library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mux4_4b is
	port (
		sel : in std_logic_vector(1 downto 0);
		d_in_1 : in std_logic_vector(3 downto 0);
		d_in_2 : in std_logic_vector(3 downto 0);
		d_in_3 : in std_logic_vector(3 downto 0);
		d_in_4 : in std_logic_vector(3 downto 0);
		d_out : out std_logic_vector(3 downto 0)
	);
end entity;

architecture beh of mux4_4b is
	constant PORT_1 : std_logic_vector(1 downto 0) := "00";
	constant PORT_2 : std_logic_vector(1 downto 0) := "01";
	constant PORT_3 : std_logic_vector(1 downto 0) := "10";
	constant PORT_4 : std_logic_vector(1 downto 0) := "11";
begin

process(sel, d_in_1, d_in_2, d_in_3, d_in_4)
	begin
		case sel is
			when PORT_1 =>
				d_out <= d_in_1;
			when PORT_2 =>
				d_out <= d_in_2;
			when PORT_3 =>
				d_out <= d_in_3;
			when PORT_4 =>
				d_out <= d_in_4;
			when others =>
		end case;
	end process;
end beh;