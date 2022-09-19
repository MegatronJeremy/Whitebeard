library IEEE;
use IEEE.std_logic_1164.all;

entity tb_cpu is
end tb_cpu;

architecture test of tb_cpu is
	signal mr : std_logic := '1';
	signal clk : std_logic := '0';
	signal busy : std_logic := 'Z';
	signal dbus_in : std_logic_vector(7 downto 0) := (others => '0');
	signal rdwr : std_logic;
	signal abus : std_logic_vector(15 downto 0);
	signal dbus_out : std_logic_vector(7 downto 0);
	
	constant Tclk : time := 20 ns;
begin

	clk_gen: clk <= not clk after Tclk/2;
	
	dut: entity work.CPU port map (
		mr=>mr, 
		clk=>clk, 
		busy=>busy,
		dbus_in=>dbus_in,
		rdwr=>rdwr,
		abus=>abus,
		dbus_out=>dbus_out
	);
	
	stimulus: process 
	begin
		mr <= '0';
		wait for Tclk;
		mr <= '1';
		dbus_in <= "01110" & "001";
		wait for Tclk;
		dbus_in <= "001" & "00001"; -- addi r1, r1, 1
		wait for 2*Tclk;
		dbus_in <= "00111" & "001";
		wait for Tclk;
		dbus_in <= "00000000"; -- st r1, 0x00
		wait for 10*Tclk;
		wait;
	end process;
	
end test;