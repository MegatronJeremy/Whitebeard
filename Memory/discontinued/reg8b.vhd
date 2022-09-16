
library IEEE;

use IEEE.std_logic_1164.all;


entity reg8b is

	port (
		mr : in std_logic;
		clk : in std_logic;
		ld : in std_logic;
		d_in : in std_logic_vector(7 downto 0);
		q_out : out std_logic_vector(7 downto 0)
	);

end reg8b;



architecture beh of reg8b is

	signal q_reg : std_logic_vector(7 downto 0); 

begin
	process (mr, clk) is
	begin

		if (mr = '0') then
			q_reg <= (others => '0');
		elsif (rising_edge(clk)) then
			if (ld = '1') then
				q_reg <= d_in;

			end if;
		end if;
	end process;
	

	q_out <= q_reg;

	

end beh;