library IEEE;
use IEEE.std_logic_1164.all;

entity CSram is
	port (
		A : in std_logic_vector(3 downto 0);
		ENram : out std_logic
	);
end entity;

architecture beh of CSram is
	constant RAM_ADDR_1 : std_logic_vector(3 downto 0) := "0001";
	constant RAM_ADDR_2 : std_logic_vector(3 downto 0) := "0010";
begin
	decode : process(A)
	begin
	case A is
		when RAM_ADDR_1 | RAM_ADDR_2 =>
			ENram <= '1';
		when others =>
			ENram <= '0';
	end case;
	end process;
end beh;