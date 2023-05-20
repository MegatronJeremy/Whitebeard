library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MP4X is

	generic
	(
		size : natural := 16
	);

	port 
	(
		X0	: in std_logic_vector(size-1 downto 0);
		X1	: in std_logic_vector(size-1 downto 0);
		X2	: in std_logic_vector(size-1 downto 0);
		X3	: in std_logic_vector(size-1 downto 0);
		S0 : in std_logic;
		S1 : in std_logic;
		Y : out std_logic_vector(size-1 downto 0)
		
	);

end entity;

architecture rtl of MP4X is
begin

	process (S0,S1,X0,X1,X2,X3)
		variable selector : std_logic_vector(1 downto 0);
	begin
	selector(0):=S0;
	selector(1):=S1;
	case selector is
		when "00" =>   Y <= X0;
		when "01" =>   Y <= X1;
		when "10" =>   Y <= X2;
		when "11" =>   Y <= X3;
		when others => Y <= (others=>'X');
	end case;
	end process;
end rtl;
