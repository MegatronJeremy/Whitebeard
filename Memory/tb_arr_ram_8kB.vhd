library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity tb_arr_ram_8kB is
end tb_arr_ram_8kB;

architecture test of tb_arr_ram_8kB is
		signal data_in :  std_logic_vector(7 downto 0):= (others => '0');
		signal data_out : std_logic_vector(7 downto 0);
		signal CS : std_logic := '0' ;
		signal clr :  std_logic := '0' ;
		signal clk :  std_logic :='0' ;
		signal rdwr :  std_logic := '0' ;
		signal addr : std_logic_vector(12 downto 0):= (others => '0');
		signal addr_helper : std_logic_vector(15 downto 0):=(others =>'0');
		constant Tclk : time := 20 ns;

begin
		clk_gen : clk <= not clk after Tclk/2;
		dut : entity work.arr_ram_8kB port map ( clk => clk, CS => CS, data_in => data_in, data_out => data_out, addr=>addr, rdwr=>rdwr);
		stimulus : process
	  begin
		 wait for 4 * Tclk;
		 rdwr<='0';
		 clr <= '1';
		 wait for 4 * Tclk;
		 clr <= '0';
		 data_in <= x"ff";
		 addr_helper<=x"0001";
		 addr<=addr_helper(12 downto 0);
		 CS<='1';
		 wait for 4 * Tclk;
		 CS<='0';
		 data_in <= x"88";
		 wait for 4 * Tclk;
		 data_in <= x"1f";
		 addr_helper<=x"0003";
		 addr <= addr_helper(12 downto 0);
		 CS<='1';
		 wait for 4 * Tclk;
		 CS<='1';
		 rdwr<='1';
		 wait for 1* Tclk;
		 CS<='0';
		 rdwr<='0';
		 wait for 4 * Tclk;
		 CS<='0';
		 clr <= '0';
		 rdwr<='0';
		 wait for 4 * Tclk;
		 rdwr<='1';
		 addr_helper<=x"0001";
		 addr<=addr_helper(12 downto 0);
		 data_in<=x"01";
		 CS<='1';
		 wait for 1 * Tclk;
		 CS<='0';
		 wait for 10 * Tclk;		 
		 wait;
	end process;
		
end test;