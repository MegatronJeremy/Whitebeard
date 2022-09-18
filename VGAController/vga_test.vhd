LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity vga_test_bench is
end entity vga_test_bench;

architecture test of vga_test_bench is
	signal mr : std_logic := '1';
	signal vclk : std_logic := '0';
	
	signal enbl : std_logic := '0';
	
	constant Tvclk : time := 20 ns;
begin
	
	clk_gen: vclk <= not vclk after Tvclk/2;
	
	dut: entity work.VGAcontroller port map (
		vclk, mr, enbl
	);
	
	stimulus: process
	begin
		wait for 2 * Tvclk;
		mr <= '0';
		wait for 4 * Tvclk;
		mr <= '1';
		wait for 2 * Tvclk;
		enbl <= '1';
		wait;
	end process;
end test;