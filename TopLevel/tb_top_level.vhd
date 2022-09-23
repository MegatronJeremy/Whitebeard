library IEEE;
use IEEE.std_logic_1164.all;

entity tb_top_level is
end tb_top_level;

architecture test of tb_top_level is
	signal kclk : std_logic := '1';
	signal kdata : std_logic := '0';
	signal clk : std_logic := '1';
	signal mr : std_logic := '1';
	signal busy : std_logic;
	signal debug : std_logic_vector(7 downto 0);
	
	constant Tclk : time := 20 ns;
	constant TKclk : time := 100 us; -- real clock is 100 us
begin

	clk_gen: clk <= not clk after Tclk/2;
	kclk_gen: kclk <= not kclk after TKclk/2;
	
	dut: entity work.TopLevel port map (
		kclk => kclk,
		kdata => kdata,
		mr=>mr, 
		clk=>clk, 
		busy=>busy, 
		debug=>debug
	);
	
	stimulus: process 
	begin
		mr <= '0';
		busy <= 'Z';
		wait for Tkclk;
		
		mr <= '1';		
		
		--- PS/2 test
		kdata <= '0';
		wait for Tkclk;
		kdata <= '1';
		wait for Tkclk;
		kdata <= '1';
		wait for Tkclk;
		kdata <= '1';
		wait for Tkclk;
		kdata <= '1';
		wait for Tkclk;
		kdata <= '0';
		wait for Tkclk;
		kdata <= '0';
		wait for Tkclk;
		kdata <= '0';
		wait for Tkclk;
		kdata <= '0';
		wait for Tkclk;
		kdata <= '1';
		wait for Tkclk;
		kdata <= '1';
		wait for Tkclk;
		
		
		kdata <= '0';
		wait for Tkclk;
		kdata <= '0';
		wait for Tkclk;
		kdata <= '1';
		wait for Tkclk;
		kdata <= '0';
		wait for Tkclk;
		kdata <= '1';
		wait for Tkclk;
		kdata <= '1';
		wait for Tkclk;
		kdata <= '1';
		wait for Tkclk;
		kdata <= '1';
		wait for Tkclk;
		kdata <= '1';
		wait for Tkclk;
		kdata <= '1';
		wait for Tkclk;
		kdata <= '1';
		wait for Tkclk;
		
		kdata <= '0';
		wait for Tkclk;
		kdata <= '0';
		wait for Tkclk;
		kdata <= '0';
		wait for Tkclk;
		kdata <= '0';
		wait for Tkclk;
		kdata <= '0';
		wait for Tkclk;
		kdata <= '1';
		wait for Tkclk;
		kdata <= '1';
		wait for Tkclk;
		kdata <= '1';
		wait for Tkclk;
		kdata <= '1';
		wait for Tkclk;
		kdata <= '1';
		wait for Tkclk;
		kdata <= '1';
		wait for Tkclk;
		
		wait;
	end process;
	
end test;
