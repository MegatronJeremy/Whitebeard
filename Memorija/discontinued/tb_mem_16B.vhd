library IEEE;
use IEEE.std_logic_1164.all;

entity tb_mem_16B is
end tb_mem_16B;

architecture test of tb_mem_16B is
		signal d_in :  std_logic_vector(7 downto 0):= (others => '0');
		signal d_out : std_logic_vector(7 downto 0);
		signal CS : std_logic := '0' ;
		signal clr :  std_logic := '0' ;
		signal clk :  std_logic :='0' ;
		signal rdwr :  std_logic := '0' ;
		signal addr : std_logic_vector(3 downto 0):= (others => '0');


		constant Tclk : time := 20 ns;
begin
		clk_gen : clk <= not clk after Tclk/2;

		dut : entity work.mem_16B port map (clr => clr, clk => clk, CS => CS, d_in => d_in, d_out => d_out, addr=>addr, rdwr=>rdwr);
		stimulus : process
	  begin
		 wait for 4 * Tclk;
		 rdwr<='0';
		 clr <= '1';
		 wait for 4 * Tclk;
		 clr <= '0';
		 d_in <= x"ff";
		 addr<=x"1";
		 CS<='1';
		 wait for 4 * Tclk;
		 CS<='0';
		 d_in <= x"88";
		 wait for 4 * Tclk;
		 d_in <= x"1f";
		 addr <= x"3";
		 CS<='1';
		 wait for 4 * Tclk;
		 CS<='1';
		 rdwr<='1';
		 wait for 4 * Tclk;
		 CS<='0';
		 clr <= '0';
		 rdwr<='0';
		 wait for 4 * Tclk;
		 rdwr<='1';
		 addr<=x"1";
		 d_in<=x"01";
		 CS<='1';
		 wait for 10 * Tclk;
		 CS<='1';
		 wait for 10 * Tclk;		 
		 wait;
		 
		 --dodati tb za clr 
  end process;
		
end test;