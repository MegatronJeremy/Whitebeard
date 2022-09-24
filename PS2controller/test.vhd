library IEEE;
use IEEE.std_logic_1164.all;

entity test is
	port (
		d_in : in std_logic;
		d_out : out std_logic
	);
end entity;

architecture beh of test is
begin

process(d_in)
	begin
		d_out <= d_in;
	end process;
end beh;