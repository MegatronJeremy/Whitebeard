library IEEE;
use IEEE.std_logic_1164.all;

entity tb_barrel_shifter_8b is
end tb_barrel_shifter_8b;

architecture test of tb_barrel_shifter_8b is
		signal func : std_logic_vector(1 downto 0) := "00";
		signal a : std_logic_vector(7 downto 0) := (others => '0');
		signal b : std_logic_vector(2 downto 0) := (others => '0');
		signal c : std_logic_vector(7 downto 0);
		signal carry_out : std_logic;
		
		constant Tclk : time := 20 ns;
begin	
	dut: entity work.barrel_shifter_8b port map (
		func=>func, 
		a=>a,
		b=>b,
		c=>c,
		carry_out=>carry_out
	);
	
	stimulus: process 
	begin
		wait for 4*Tclk;
		func <= "00";
		a <= "10001111";
		b <= "001";
		wait for 2*Tclk;
		b <= "011";
		wait for 2*Tclk;
		a <= "00110010";
		b <= "101";
		wait for 2*Tclk;
		b <= "111";
		
		wait for 4*Tclk;
		func <= "01";
		a <= "10001111";
		b <= "001";
		wait for 2*Tclk;
		b <= "011";
		wait for 2*Tclk;
		a <= "00110010";
		b <= "101";
		wait for 2*Tclk;
		b <= "111";
		
		wait for 4*Tclk;
		func <= "10";
		a <= "10001111";
		b <= "001";
		wait for 2*Tclk;
		b <= "011";
		wait for 2*Tclk;
		a <= "00110010";
		b <= "101";
		wait for 2*Tclk;
		b <= "111";
		
		wait for 4*Tclk;
		func <= "11";
		a <= "10001111";
		b <= "001";
		wait for 2*Tclk;
		b <= "011";
		wait for 2*Tclk;
		a <= "00110010";
		b <= "101";
		wait for 2*Tclk;
		b <= "111";
		
		wait;
		
	end process;
	
end test;