library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mux2_3b is
	port (
		sel : in std_logic;
		zero : in std_logic;
		d_in_1 : in std_logic_vector(2 downto 0);
		d_in_2 : in std_logic_vector(2 downto 0);
		d_out : out std_logic_vector(2 downto 0)
	);
end entity;

architecture beh of mux2_3b is
	constant PORT_1 : std_logic := '0';
	constant PORT_2 : std_logic := '1';
begin

process(sel, d_in_1, d_in_2, zero)
	begin
		if zero = '1' then
			d_out <= (others => '0');
		else
			case sel is
				when PORT_1 =>
					d_out <= d_in_1;
				when PORT_2 =>
					d_out <= d_in_2;
				when others =>
			end case;
		end if;
	end process;
end beh;