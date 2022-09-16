LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity ps2test is
end ps2test;

architecture test1 of ps2test is
	signal mr : std_logic := '1';
	signal serial_data_in : std_logic;
	signal RD : std_logic := '0';
	signal EN : std_logic := '0';
	signal sclk : std_logic := '0';
	signal kclk : std_logic := '0';
	signal d_out_tri : std_logic_vector(7 downto 0);
	signal shift_reset : std_logic := '1';
	
	constant Tsclk : time := 20 ns;
	constant Tkclk : time := 100 ns;
begin
	
	clk_gen: sclk <= not sclk after Tsclk/2;
	clk_gen1: kclk <= not kclk after Tkclk/2;
	
	dut: entity work.ps2controller port map (mr, kclk, serial_data_in, RD, sclk, EN,shift_reset, d_out_tri);
	
	stimulus: process
	begin	
		mr <= '0';
		wait for 2*Tsclk;
		mr <= '1';
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
		EN <= '1';
		RD <= '1';
		wait for 2*Tsclk;
		EN <= '0';
		RD <= '0';
		serial_data_in <= '0';
		wait for Tkclk;
		serial_data_in <= '0';
		wait for Tkclk;
		serial_data_in <= '1';
		wait for Tkclk;
		serial_data_in <= '0';
		wait for Tkclk;
		serial_data_in <= '1';
		wait for Tkclk;
		serial_data_in <= '0';
		wait for Tkclk;
		serial_data_in <= '1';
		wait for Tkclk;
		serial_data_in <= '0';
		wait for Tkclk;
		serial_data_in <= '1';
		wait for Tkclk;
		serial_data_in <= '0';
		wait for Tkclk;
		serial_data_in <= '1';
		wait for Tkclk;
		EN <= '1';
		RD <= '1';
		wait for 2*Tsclk;
		EN <= '0';
		RD <= '0';
		wait for 10*Tsclk;
		
	end process;
end test1;