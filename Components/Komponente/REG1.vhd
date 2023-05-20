-- REG1

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity REG1 is

	port
	(
		clk	: in std_logic;
		cl		: in std_logic;
		i		: in std_logic;
		ld		: in std_logic;
		cin 	: in std_logic;
		inc	: in std_logic;
		ein	: in std_logic;
		dec	: in std_logic;
		ir		: in std_logic;
		shr	: in std_logic;
		il		: in std_logic;
		shl	: in std_logic;
		
		cout	: out std_logic;
		eout	: out std_logic;
		q		: out std_logic
	);

end entity;

architecture reg1 of REG1 is
	signal state:std_logic:='0';
begin
	q <= state;
	
	process (clk)
	begin
		if (rising_edge(clk)) then
			if (cl = '1') then 
				state <= '0';
			elsif( ld = '1') then
				state <= i;
			elsif (inc = '1') then
				state <= state xor cin;
			elsif (dec = '1') then 
				state <= state xor ein;
			elsif (shr = '1') then
				state <= ir;
			elsif (shl = '1') then
				state <= il;
			end if;
		end if;
	end process;
	
	process (state, cin, ein)
	begin
		cout <= state and cin;
		eout <= (not state) and ein;
	end process;

end reg1;
