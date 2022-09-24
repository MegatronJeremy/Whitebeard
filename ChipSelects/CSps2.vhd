library IEEE;
use IEEE.std_logic_1164.all;

entity CSps2 is
	port (
		A : in std_logic_vector(15 downto 0);
		RD : in std_logic;
		ENps2 : out std_logic
	);
end entity;

architecture beh of CSps2 is
	constant PS2_ADDR : std_logic_vector(15 downto 0) := x"3000";
begin
	decode : process(A, RD)
	begin
	case A is
		when PS2_ADDR =>
			if (RD = '1') then
				ENps2 <= '1';
			else
				ENps2 <= '0';
			end if;
		when others =>
			ENps2 <= '0';
	end case;
	end process;
end beh;