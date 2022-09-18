library IEEE;
use IEEE.std_logic_1164.all;

entity tb_reg_file_8x8b is
end tb_reg_file_8x8b;

architecture test of tb_reg_file_8x8b is
		signal mr : std_logic := '1';
		signal clk : std_logic := '0';
		signal read_addr_1 : std_logic_vector(2 downto 0) := (others => '0');
		signal read_addr_2 : std_logic_vector(2 downto 0) := (others => '0');
		signal write_addr : std_logic_vector(2 downto 0) := (others => '0');
		signal read_data_1 : std_logic_vector(7 downto 0);
		signal read_data_2 : std_logic_vector(7 downto 0);
		signal load : std_logic := '0';
		signal write_data : std_logic_vector(7 downto 0) := (others => '0');
		
		constant Tclk : time := 20 ns;
begin	
	clk_gen: clk <= not clk after Tclk/2;

	dut: entity work.reg_file_8x8b port map (
		mr => mr,
		clk => clk,
		read_addr_1 => read_addr_1,
		read_addr_2 => read_addr_2,
		write_addr => write_addr,
		read_data_1 => read_data_1,
		read_data_2 => read_data_2,
		write_data => write_data,
		load => load
	);
	
	stimulus: process 
	begin
		wait for 4*Tclk;
		write_addr <= "000";
		write_data <= x"fe";
		load <= '1';
		wait for 2*Tclk;
		write_addr <= "111";
		write_data <= x"ff";
		read_addr_2 <= "111";
		load <= '0';
		wait for 2*Tclk;
		write_addr <= "111";
		write_data <= x"f0";
		load <= '1';
		wait for 1*Tclk;
		write_addr <= "011";
		write_data <= x"0f";
		load <= '1';
		wait for 1*Tclk;
		read_addr_1 <= "000";
		read_addr_2 <= "011";
		write_addr <= "101";
		write_data <= x"bb";
		load <= '1';
		wait for 1*Tclk;
		load <= '0';
		read_addr_1 <= "101";
		wait for 4*Tclk;
		
		wait;
	end process;
	
end test;