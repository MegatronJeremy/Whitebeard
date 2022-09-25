library IEEE;
use IEEE.std_logic_1164.all;

entity CSdebug is
	port (
		A : in std_logic_vector(15 downto 0);
		WR : in std_logic;
		ENdebug : out std_logic
	);
end entity;

architecture beh of CSdebug is
	constant DBG_ADDR : std_logic_vector(15 downto 0) := x"FFFF";
begin
	decode : process(A, WR)
	begin
	case A is
		when DBG_ADDR =>
			if WR = '0' then
				ENdebug <= '1';
			else
				ENdebug <= '0';
			end if;
		when others =>
			ENdebug <= '0';
	end case;
	end process;
end beh;