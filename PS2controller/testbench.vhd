LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity testbench is
end testbench;

architecture test of testbench is
	signal I0 : std_logic_vector(7 downto 0);
	signal I1 : std_logic_vector(7 downto 0);
	signal EN : std_logic := '0';
	signal S0 : std_logic := '0';
	signal Y : std_logic_vector(7 downto 0);
	
	constant myTime : time := 20 ns;
begin
	dut: entity work.mx2x8 port map (EN, S0, I0, I1, Y);
	
	stimulus: process
	begin
		I0 <= "11110000";
		I1 <= "01010101";
		wait for 4*myTime;
		EN <= '1';
		wait for 16*myTime;
		S0 <= '1';
	end process;
end test;