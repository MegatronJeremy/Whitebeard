library IEEE;
use IEEE.std_logic_1164.all;

entity tb_reg_32b_inc is
end tb_reg_32b_inc;

architecture test of tb_reg_32b_inc is
  signal mr : std_logic := '1';
  signal clk : std_logic := '0';
  signal ld : std_logic := '0';
  signal d_in : std_logic_vector(31 downto 0) := (others => '0');
  signal q_out : std_logic_vector(31 downto 0);
  signal inc : std_logic := '0';
  
  constant Tclk : time := 20 ns;
begin

  clk_gen : clk <= not clk after Tclk/2;

  dut : entity work.reg_32b_inc port map (mr => mr, clk => clk, ld => ld, d_in => d_in, q_out => q_out, inc => inc);

  stimulus : process
  begin
    wait for 4 * Tclk;
    mr <= '0';
    wait for 4 * Tclk;
    mr <= '1';
    d_in <= x"000000fe";
    ld <= '1';
    wait for 4 * Tclk;
    inc <= '1';
    wait for 1 * Tclk;
    inc <= '0';
    ld <= '0';
    d_in <= x"88008888";
    wait for 4 * Tclk;
    d_in <= x"ffffffff";
    ld <= '1';
	 inc <= '1';
	 wait for 1 * Tclk;
	 d_in <= x"eeeeeeee";
	 inc <= '0';
    wait for 4 * Tclk;
    mr <= '1';
    inc <= '1';
    wait for 10 * Tclk;
    mr <= '0';
	 inc <= '0';
    wait for 10 * Tclk;
	 mr <= '1';
	 inc <= '1';
    wait;
  end process;

end test;