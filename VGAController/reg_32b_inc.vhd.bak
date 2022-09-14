library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity reg_32b_inc is
	port (
		mr : in std_logic;
		clk : in std_logic;
		ld : in std_logic;
		inc : in std_logic;
		d_in : in std_logic_vector(31 downto 0);
		q_out : out std_logic_vector(31 downto 0)
	);
end reg_32b_inc;

architecture beh of reg_32b_inc is
	signal q_reg : std_logic_vector(31 downto 0); 
begin
	process (mr, clk) is
	begin
		if (mr = '0') then
			q_reg <= (others => '0');
		elsif (rising_edge(clk)) then
			if (ld = '1') then
				q_reg <= d_in;
			end if;
			if (inc = '1') then
				q_reg <= std_logic_vector(unsigned(q_reg) + 1) ;
			end if;
		end if;
	end process;
	
	q_out <= q_reg;
	
end beh;
			