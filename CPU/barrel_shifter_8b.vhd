library IEEE;
use IEEE.std_logic_1164.all;

entity barrel_shifter_8b is
	port (
		func : in std_logic_vector(1 downto 0) := "00";
		a : in std_logic_vector(7 downto 0);
		b : in std_logic_vector(2 downto 0);
		c : out std_logic_vector(7 downto 0) := (others => '0');
		carry_out : out std_logic
	);
end entity;

architecture beh of barrel_shifter_8b is
	constant SHIFT_LEFT_LOG : std_logic_vector(1 downto 0) := "00";
	constant SHIFT_RIGHT_LOG : std_logic_vector(1 downto 0) := "01";
	constant SHIFT_ROT_RIGHT : std_Logic_vector(1 downto 0) := "10";
	constant SHIFT_RIGHT_ARI : std_Logic_vector(1 downto 0) := "11";
	
	signal pad : std_logic_vector(4 downto 0);
begin

process(func, a)
	begin
		-- Generate padding for arithmetic shift right
		if func = SHIFT_RIGHT_ARI AND a(a'high) = '1' then
			pad <= (others => '1');
		else
			pad <= (others => '0');
		end if;
	end process;

process(func, a, b, pad)
	variable t : std_logic_vector(8 downto 0);
	begin
		-- Swap bit order if not shiting to the right
		if func = SHIFT_RIGHT_LOG OR func = SHIFT_RIGHT_ARI OR func = SHIFT_ROT_RIGHT then
			t := '0' & a;
		else
			t := '0' & a( 0) & a( 1) & a( 2) & a( 3) & a( 4) & a( 5) & a( 6) & a( 7);
		end if;
		
		if b(2) = '1' then
			if func = SHIFT_ROT_RIGHT then
				t := '0' & t(3 downto 0) & t(7 downto 4);
			else 
				t := pad(4 downto 0) & t(7 downto 4);
			end if;
		end if;
		
		if b(1) = '1' then
			if func = SHIFT_ROT_RIGHT then
				t := '0' & t(1 downto 0) & t (7 downto 2);
			else
				t := pad(2 downto 0) & t(7 downto 2);
			end if;
		end if;
		
		if b(0) = '1' then
			if func = SHIFT_ROT_RIGHT then
				t := '0' & t(0 downto 0) & t(7 downto 1);
			else 
				t := pad(1 downto 0) & t(7 downto 1);
			end if;
		end if;
		
		if func = SHIFT_RIGHT_LOG OR func = SHIFT_RIGHT_ARI OR func = SHIFT_ROT_RIGHT then
			c <= t(7 downto 0);
		else 
			c <= t( 0) & t( 1) & t( 2) & t( 3) & t( 4) & t( 5) & t( 6) & t( 7);
		end if;
		
		carry_out <= t(8);
	end process;
end beh;