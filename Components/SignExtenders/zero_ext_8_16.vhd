library IEEE;
use IEEE.std_logic_1164.all;

entity zero_ext_8_16 is
	port (
		d_in : in std_logic_vector(7 downto 0);
		d_out : out std_logic_vector(15 downto 0) := (others => '0')
	);
end entity;

architecture beh of zero_ext_8_16 is
begin

process (d_in)
	begin
		d_out <= x"00" & d_in;
	end process;
	
end beh;
	

