library IEEE;
use IEEE.std_logic_1164.all;

entity CSrom is
	port (
		A : in std_logic_vector(3 downto 0);
		ENrom : out std_logic
	);
end entity;

architecture beh of CSrom is
	constant ROM_ADDR : std_logic_vector(3 downto 0) := x"0";
begin
	decode : process(A)
	begin
	case A is
		when ROM_ADDR =>
			ENrom <= '1';
		when others =>
			ENrom <= '0';
	end case;
	end process;
end beh;