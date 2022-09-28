library IEEE;
use IEEE.std_logic_1164.all;

entity tb_top_level is
end tb_top_level;

architecture test of tb_top_level is
	signal kclk : std_logic := '1';
	signal kdata : std_logic := '0';
	signal clk : std_logic := '1';
	signal mr : std_logic := '1';
	signal debug : std_logic_vector(7 downto 0);
	
	constant Tclk : time := 20 ns;
	constant TKclk : time := 100 us; -- real clock is 100 us
begin

	clk_gen: clk <= not clk after Tclk/2;
	
	dut: entity work.TopLevel port map (
		kclk => kclk,
		kdata => kdata,
		mr=>mr, 
		clk=>clk, 
		debug=>debug
	);
	
	stimulus: process 
	begin
		mr <= '0';
		wait for Tclk;
		mr <= '1';
		
		wait for 3*Tkclk;
		
		--- PS/2 test	
		-- Press and release A
		-- 1C(F01C)
	
		kdata <= '0';
		kclk <= '0';
		wait for Tkclk/2;
		kclk <= '1';
		wait for Tkclk/2;
		
		kdata <= '0';
		kclk <= '0';
		wait for Tkclk/2;
		kclk <= '1';
		wait for Tkclk/2;
		
		kdata <= '0';
		kclk <= '0';
		wait for Tkclk/2;
		kclk <= '1';
		wait for Tkclk/2;
		
		kdata <= '1';
		kclk <= '0';
		wait for Tkclk/2;
		kclk <= '1';
		wait for Tkclk/2;
		
		kdata <= '1';
		kclk <= '0';
		wait for Tkclk/2;
		kclk <= '1';
		wait for Tkclk/2;
		
		kdata <= '1';
		kclk <= '0';
		wait for Tkclk/2;
		kclk <= '1';
		wait for Tkclk/2;
		
		kdata <= '0';
		kclk <= '0';
		wait for Tkclk/2;
		kclk <= '1';
		wait for Tkclk/2;
		
		kdata <= '0';
		kclk <= '0';
		wait for Tkclk/2;
		kclk <= '1';
		wait for Tkclk/2;
		
		kdata <= '0';
		kclk <= '0';
		wait for Tkclk/2;
		kclk <= '1';
		wait for Tkclk/2;
		
		kdata <= '0';
		kclk <= '0';
		wait for Tkclk/2;
		kclk <= '1';
		wait for Tkclk/2;
		
		kdata <= '1';
		kclk <= '0';
		wait for Tkclk/2;
		kclk <= '1';
		wait for Tkclk/2;
		
		wait for 5*Tkclk;
		
		kdata <= '0';
		kclk <= '0';
		wait for Tkclk/2;
		kclk <= '1';
		wait for Tkclk/2;
		
		kdata <= '0';
		kclk <= '0';
		wait for Tkclk/2;
		kclk <= '1';
		wait for Tkclk/2;
		
		kdata <= '0';
		kclk <= '0';
		wait for Tkclk/2;
		kclk <= '1';
		wait for Tkclk/2;
		
		kdata <= '0';
		kclk <= '0';
		wait for Tkclk/2;
		kclk <= '1';
		wait for Tkclk/2;
		
		kdata <= '0';
		kclk <= '0';
		wait for Tkclk/2;
		kclk <= '1';
		wait for Tkclk/2;
		
		kdata <= '1';
		kclk <= '0';
		wait for Tkclk/2;
		kclk <= '1';
		wait for Tkclk/2;
		
		kdata <= '1';
		kclk <= '0';
		wait for Tkclk/2;
		kclk <= '1';
		wait for Tkclk/2;
		
		kdata <= '1';
		kclk <= '0';
		wait for Tkclk/2;
		kclk <= '1';
		wait for Tkclk/2;
		
		kdata <= '1';
		kclk <= '0';
		wait for Tkclk/2;
		kclk <= '1';
		wait for Tkclk/2;
		
		kdata <= '1';
		kclk <= '0';
		wait for Tkclk/2;
		kclk <= '1';
		wait for Tkclk/2;
		
		kdata <= '1';
		kclk <= '0';
		wait for Tkclk/2;
		kclk <= '1';
		wait for Tkclk/2;	
	
		wait for 2*Tkclk;
		
		kdata <= '0';
		kclk <= '0';
		wait for Tkclk/2;
		kclk <= '1';
		wait for Tkclk/2;
		
		kdata <= '0';
		kclk <= '0';
		wait for Tkclk/2;
		kclk <= '1';
		wait for Tkclk/2;
		
		kdata <= '0';
		kclk <= '0';
		wait for Tkclk/2;
		kclk <= '1';
		wait for Tkclk/2;
		
		kdata <= '1';
		kclk <= '0';
		wait for Tkclk/2;
		kclk <= '1';
		wait for Tkclk/2;
		
		kdata <= '1';
		kclk <= '0';
		wait for Tkclk/2;
		kclk <= '1';
		wait for Tkclk/2;
		
		kdata <= '1';
		kclk <= '0';
		wait for Tkclk/2;
		kclk <= '1';
		wait for Tkclk/2;
		
		kdata <= '0';
		kclk <= '0';
		wait for Tkclk/2;
		kclk <= '1';
		wait for Tkclk/2;
		
		kdata <= '0';
		kclk <= '0';
		wait for Tkclk/2;
		kclk <= '1';
		wait for Tkclk/2;
		
		kdata <= '0';
		kclk <= '0';
		wait for Tkclk/2;
		kclk <= '1';
		wait for Tkclk/2;
		
		kdata <= '0';
		kclk <= '0';
		wait for Tkclk/2;
		kclk <= '1';
		wait for Tkclk/2;
		
		kdata <= '1';
		kclk <= '0';
		wait for Tkclk/2;
		kclk <= '1';
		wait for Tkclk/2;
		
		wait;
	end process;
	
end test;
