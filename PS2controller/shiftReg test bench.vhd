LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity shiftRegtest is
end shiftRegtest;

architecture test1 of shiftRegtest is
	signal shift_reset : std_logic := '1';
	signal serial_data_in : std_logic;
	signal kclk : std_logic := '0';
	signal data_out : std_logic_vector(10 downto 0);
	
	constant Tsclk : time := 20 ns;
begin
	
	clk_gen1: kclk <= not kclk after Tkclk/2;
	
	dut: entity work.shiftRegister port map (serial_data_in, shift_reset, kclk, data_out);
	
	stimulus: process
	begin
		serial_data_in <= '0';
		wait for Tkclk;
		serial_data_in <= '1';
		wait for Tkclk;
		serial_data_in <= '1';
		wait for Tkclk;
		serial_data_in <= '1';
		wait for Tkclk;
		serial_data_in <= '1';
		wait for Tkclk;
		serial_data_in <= '0';
		wait for Tkclk;
		serial_data_in <= '0';
		wait for Tkclk;
		serial_data_in <= '0';
		wait for Tkclk;
		serial_data_in <= '0';
		wait for Tkclk;
		serial_data_in <= '0';
		wait for Tkclk;
		serial_data_in <= '1';
		wait for Tkclk;
		wait for 20*Tkclk;
		
	end process;
end test1;