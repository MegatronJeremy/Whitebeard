library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Operacije ALU jedinice:
-- 	op		|		Rezultat		|
--		000	|		A and B		|
--		001	|		A or B		|
--		010	|		A xor B		|
--		011	|		not A			|
--		100	|		A + B + Cin	|
--		101	|		A - B	- Cin	|
--		110	|		A + 1			|
--		111	|		A - 1			|


entity ALUX is

	generic
	(
		size : natural := 16
	);

	port 
	(
		A		: in  std_logic_vector(size-1 downto 0);
		B		: in std_logic_vector(size-1 downto 0);
		Cin	: in std_logic;
		op		: in std_logic_vector(2 downto 0);
		F		: out std_logic_vector(size-1 downto 0);
		Cout	: out std_logic
	);

end entity;

architecture rtl of ALUX is
begin

	process(A,B,cin,op) is 
		variable ta,tb,tf:std_logic_vector(size downto 0);
	begin 
		ta(size)					:=A(size-1);
		ta(size-1 downto 0)	:=A(size-1 downto 0);
		tb(size)					:=B(size-1);
		tb(size-1 downto 0)	:=B(size-1 downto 0);
		
		case op is
			when "000" => F <= A and B; Cout<='0';
			when "001" => F <= A or B; Cout<='0';
			when "010" => F <= A xor B; Cout<='0';
			when "011" => F <= not a; cout<='0';
			when "100" => 
					if Cin='0' then
							tf:= std_logic_vector(to_unsigned(to_integer(unsigned(ta))+to_integer(unsigned(tb)),size+1));
							F(size-1 downto 0)	<=tf(size-1 downto 0);
							Cout						<=tf(size);
					else
							tf:= std_logic_vector(to_unsigned(to_integer(unsigned(ta))+to_integer(unsigned(tb))+1,size+1));
							F(size-1 downto 0)	<=tf(size-1 downto 0);
							Cout						<=tf(size);
					end if;
			
			when "101" => 
					if Cin='0' then
							tf:= std_logic_vector(to_unsigned(to_integer(unsigned(ta))-to_integer(unsigned(tb)),size+1));
							F(size-1 downto 0)	<=tf(size-1 downto 0);
							Cout						<=tf(size);
					else
							tf:= std_logic_vector(to_unsigned(to_integer(unsigned(ta))-to_integer(unsigned(tb))-1,size+1));
							F(size-1 downto 0)	<=tf(size-1 downto 0);
							Cout						<=tf(size);
					end if;
			
			when "110" => 
							tf:= std_logic_vector(to_unsigned(to_integer(unsigned(ta))+1,size+1));
							F(size-1 downto 0)	<=tf(size-1 downto 0);
							Cout						<=tf(size);
			when "111" => 
							tf:= std_logic_vector(to_unsigned(to_integer(unsigned(ta))-1,size+1));
							F(size-1 downto 0)	<=tf(size-1 downto 0);
							Cout						<=tf(size);
			end case;
		
	end process; 


	

end rtl;
