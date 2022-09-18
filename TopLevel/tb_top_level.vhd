library IEEE;
use IEEE.std_logic_1164.all;

entity tb_top_level is
end tb_top_level;

architecture test of tb_top_level is
	signal clk : std_logic := '1';
	signal mr : std_logic := '1';
	signal busy : std_logic;
	signal rdwr : std_logic;
	signal dbus_out : std_logic_vector(7 downto 0);
	
	constant Tclk : time := 20 ns;
begin

	clk_gen: clk <= not clk after Tclk/2;
	
	dut: entity work.TopLevel port map (
		mr=>mr, 
		clk=>clk, 
		busy=>busy, 
		rdwr=>rdwr, 
		dbus_out=>dbus_out
	);
	
	stimulus: process 
	begin
		mr <= '0';
		busy <= 'Z';
		wait for 2*Tclk;
		mr <= '1';
		wait for 20*Tclk;
		wait;
	end process;
	
end test;