library IEEE;
use IEEE.std_logic_1164.all;

entity tb_branch_test_psw is
end tb_branch_test_psw;

architecture test of tb_branch_test_psw is
		signal func : std_logic_vector(3 downto 0) := "0000";
		signal n : std_logic := '0';
		signal z : std_logic := '0';
		signal c : std_logic := '0';
		signal v : std_logic := '0';
		signal enable : std_logic := '1';
		signal branch : std_logic;
		
		constant Tclk : time := 20 ns;
begin
	
	dut: entity work.branch_test_psw port map (
		func=>func, 
		n=>n,
		z=>z,
		c=>c,
		v=>v,
		enable=>enable,
		branch=>branch
	);
	
	stimulus: process 
	begin
		enable <= '0';
		
		wait for 4*Tclk;
		func <= "0000";
		n <= '1';
		z <= '0';
		c <= '0';
		v <= '1';
		wait for 2*Tclk;
		n <= '0';
		z <= '1';
		c <= '1';
		v <= '0';
		
		enable <= '1';
		
		wait for 4*Tclk;
		func <= "0000";
		n <= '1';
		z <= '0';
		c <= '0';
		v <= '1';
		wait for 2*Tclk;
		n <= '0';
		z <= '1';
		c <= '1';
		v <= '0';
		
		wait for 4*Tclk;
		func <= "0001";
		n <= '1';
		z <= '0';
		c <= '0';
		v <= '1';
		wait for 2*Tclk;
		n <= '0';
		z <= '1';
		c <= '1';
		v <= '0';
		
		wait for 4*Tclk;
		func <= "0010";
		n <= '1';
		z <= '0';
		c <= '0';
		v <= '1';
		wait for 2*Tclk;
		n <= '0';
		z <= '1';
		c <= '1';
		v <= '0';
		
		wait for 4*Tclk;
		func <= "0011";
		n <= '1';
		z <= '0';
		c <= '0';
		v <= '1';
		wait for 2*Tclk;
		n <= '0';
		z <= '1';
		c <= '1';
		v <= '0';
		
		wait for 4*Tclk;
		func <= "0100";
		n <= '1';
		z <= '0';
		c <= '0';
		v <= '1';
		wait for 2*Tclk;
		n <= '0';
		z <= '1';
		c <= '1';
		v <= '0';
		
		wait for 4*Tclk;
		func <= "0101";
		n <= '1';
		z <= '0';
		c <= '0';
		v <= '1';
		wait for 2*Tclk;
		n <= '0';
		z <= '1';
		c <= '1';
		v <= '0';
		
		wait for 4*Tclk;
		func <= "0110";
		n <= '1';
		z <= '0';
		c <= '0';
		v <= '1';
		wait for 2*Tclk;
		n <= '0';
		z <= '1';
		c <= '1';
		v <= '0';
		
		wait for 4*Tclk;
		func <= "0111";
		n <= '1';
		z <= '0';
		c <= '0';
		v <= '1';
		wait for 2*Tclk;
		n <= '0';
		z <= '1';
		c <= '1';
		v <= '0';
		
		wait for 4*Tclk;
		func <= "1000";
		n <= '1';
		z <= '0';
		c <= '0';
		v <= '1';
		wait for 2*Tclk;
		n <= '0';
		z <= '1';
		c <= '1';
		v <= '0';
		
		wait for 4*Tclk;
		func <= "1001";
		n <= '1';
		z <= '0';
		c <= '0';
		v <= '1';
		wait for 2*Tclk;
		n <= '0';
		z <= '1';
		c <= '1';
		v <= '0';
		
		wait for 4*Tclk;
		func <= "1010";
		n <= '1';
		z <= '0';
		c <= '0';
		v <= '1';
		wait for 2*Tclk;
		n <= '0';
		z <= '1';
		c <= '1';
		v <= '0';
		
		wait for 4*Tclk;
		func <= "1011";
		n <= '1';
		z <= '0';
		c <= '0';
		v <= '1';
		wait for 2*Tclk;
		n <= '0';
		z <= '1';
		c <= '1';
		v <= '0';
		
		wait;
		
	end process;
	
end test;