library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Binary2BCD is
	port(
		binary_input : in std_logic_vector(6 downto 0);
		bcd_units : out std_logic_vector(3 downto 0);
		bcd_tens : out std_logic_vector(3 downto 0)
	);
end entity Binary2BCD;

architecture rtl of Binary2BCD is
begin
	process_output : process (binary_input) is
		-- (binary_input / 10) = 
		-- (binary_input * 32768) / (10 * 32768) = 
		-- (binary_input * (32768 / 10)) / 32768 = 
		-- (binary_input * 3276) / 32768 = 
		-- shift_right((binary_input * 3276), 15) 
		constant multiply_const : unsigned(14 downto 0) := to_unsigned(3277, 15);
		variable temp_var : unsigned(21 downto 0);
		variable bcd_tens_var : unsigned(3 downto 0);
	begin
		temp_var := unsigned(binary_input) * multiply_const;
		bcd_tens_var := temp_var(18 downto 15);
		bcd_tens <= std_logic_vector(bcd_tens_var);
		bcd_units <= std_logic_vector(unsigned("0" & binary_input) - bcd_tens_var * to_unsigned(10, 4))(3 downto 0);
	end process process_output;
end architecture rtl;