LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity ps2test is
end ps2test;

architecture test1 of ps2test is
	signal mr : std_logic := '0';
	signal serial_data_in : std_logic := '0';
	signal RD : std_logic := '1';
	signal EN : std_logic := '1';
	signal sclk : std_logic := '0';
	signal kclk : std_logic := '0';
	signal d_out_tri : std_logic_vector(7 downto 0);
	signal ken : std_logic := '0';
	signal shift_reset : std_logic := '0';
	
	constant Tsclk : time := 20 ns;
	constant Tkclk : time := 50 ns;
begin
	
	clk_gen: sclk <= not sclk after Tsclk/2;
	clk_gen1: kclk <= not kclk after Tkclk/2;
	
	dut: entity work.ps2controller port map (mr, kclk, serial_data_in, RD, sclk, EN,ken,shift_reset, d_out_tri);
	
	stimulus: process
	begin	
		shift_reset <= '1';
		mr <= '1';
		ken <= '0';
		wait for 5*Tkclk;
		ken <= '1';
	
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
		serial_data_in <= '1';
		wait for Tkclk;
		serial_data_in <= '1';
		wait for Tkclk;
		serial_data_in <= '1';
		wait for Tkclk;
		serial_data_in <= '1';
		wait for Tkclk;
		--wait for Tkclk;
		
	end process;
end test1;