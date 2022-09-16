library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 

entity adder_16b is
	port (
		a : in std_logic_vector(15 downto 0);
		b : in std_logic_vector(15 downto 0);
		c : out std_logic_vector(15 downto 0)
	);
end adder_16b;

architecture beh of adder_16b is
	
begin
	process (a, b)
	begin
		c <= std_logic_vector(unsigned(a) + unsigned(b));
	end process;

end beh;