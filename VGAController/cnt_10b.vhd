library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity cnt_10b is
    Port (
		 rst,clk : in std_logic;
		 o: out std_logic_vector(0 to 9)
	 );
end cnt_10b;

architecture count_arch of cnt_10b is
   signal count : std_logic_vector(0 to 9) := "0000000000";
    begin
      process(rst,clk)
        begin
          if (rst = '1') then count <= "0000000000";
			 elsif (rising_edge(clk)) then count <= count + 1;
          end if;
    end process;
    o <= count;
end count_arch;