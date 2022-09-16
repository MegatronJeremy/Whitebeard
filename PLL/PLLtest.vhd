LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity pllTest is
end pllTest;

architecture test2 of pllTest is
	signal mr : std_logic := '1';
	signal clk : std_logic := '1';
	signal sclk : std_logic := '0';
	signal vclk : std_logic := '0';
	
	constant Tclk : time := 20 ns;
begin
	
	clk_gen: clk <= not clk after Tclk/2;
	
	dut: entity work.PLL port map (clk,mr,sclk,vclk);
	
	stimulus: process
	begin	
		mr <= '0';
		wait for 4*Tclk;
		mr <= '1';
		wait for 20*Tclk;
	end process;
end test2;