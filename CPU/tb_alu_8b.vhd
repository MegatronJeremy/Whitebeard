library IEEE;
use IEEE.std_logic_1164.all;

entity tb_alu_8b is
end tb_alu_8b;

architecture test of tb_alu_8b is
		signal func : std_logic_vector(2 downto 0) := "000";
		signal a : std_logic_vector(7 downto 0) := (others => '0');
		signal b : std_logic_vector(7 downto 0) := (others => '0');
		signal carry_in : std_logic := '0';
		signal carry_out : std_logic;
		signal c : std_logic_vector(7 downto 0);
		
		constant Tclk : time := 20 ns;
begin
	
	dut: entity work.alu_8b port map (
		func=>func, 
		a=>a,
		b=>b,
		carry_in=>carry_in,
		c=>c,
		carry_out=>carry_out
	);
	
	stimulus: process 
	begin
		wait for 4*Tclk;
		func <= "000";
		a <= "10001111";
		b <= "10111001";
		wait for 2*Tclk;
		b <= "00000011";
		wait for 2*Tclk;
		a <= "00110010";
		b <= "10100000";
		wait for 2*Tclk;
		b <= "10101010";
		
		wait for 4*Tclk;
		func <= "001";
		a <= "10001111";
		b <= "10111001";
		carry_in <= '1';
		wait for 2*Tclk;
		b <= "00000011";
		wait for 2*Tclk;
		a <= "00110010";
		b <= "10100000";
		wait for 2*Tclk;
		b <= "10101010";
		
		wait for 4*Tclk;
		func <= "010";
		a <= "10001111";
		b <= "10111001";
		wait for 2*Tclk;
		b <= "00000011";
		wait for 2*Tclk;
		a <= "00110010";
		b <= "10100000";
		wait for 2*Tclk;
		b <= "10101010";
		
		wait for 4*Tclk;
		func <= "011";
		a <= "10001111";
		b <= "10111001";
		wait for 2*Tclk;
		b <= "00000011";
		wait for 2*Tclk;
		a <= "00110010";
		b <= "10100000";
		wait for 2*Tclk;
		b <= "10101010";
		
		wait for 4*Tclk;
		func <= "100";
		a <= "10001111";
		b <= "10111001";
		wait for 2*Tclk;
		b <= "00000011";
		wait for 2*Tclk;
		a <= "00110010";
		b <= "10100000";
		wait for 2*Tclk;
		b <= "10101010";
		
		wait for 4*Tclk;
		func <= "101";
		a <= "10001111";
		b <= "10111001";
		wait for 2*Tclk;
		b <= "00000011";
		wait for 2*Tclk;
		a <= "00110010";
		b <= "10100000";
		wait for 2*Tclk;
		b <= "10101010";
		
		wait for 4*Tclk;
		func <= "110";
		a <= "10001111";
		b <= "10111001";
		wait for 2*Tclk;
		b <= "00000011";
		wait for 2*Tclk;
		a <= "00110010";
		b <= "10100000";
		wait for 2*Tclk;
		b <= "10101010";
		
		wait for 4*Tclk;
		func <= "111";
		a <= "10001111";
		b <= "10111001";
		wait for 2*Tclk;
		b <= "00000011";
		wait for 2*Tclk;
		a <= "00110010";
		b <= "10100000";
		wait for 2*Tclk;
		b <= "10101010";
		
		wait;
		
	end process;
	
end test;