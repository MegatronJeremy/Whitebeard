library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sign_ext_5_8 is
	port (
		d_in : in std_logic_vector(4 downto 0);
		d_out : out std_logic_vector(7 downto 0) := (others => '0')
	);
end entity;

architecture beh of sign_ext_5_8 is
begin

process (d_in)
	begin
		d_out <= std_logic_vector(resize(signed(d_in), d_out'length));
	end process;
	
end beh;
	

