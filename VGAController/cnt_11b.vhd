library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity cnt_11b_inc is
    Port (
		 rst,clk : in std_logic;
		 inc: in std_logic;
		 en: in std_logic;
		 o: out std_logic_vector(0 to 10)
	 );
end cnt_11b_inc;

architecture count_arch of cnt_11b_inc is
   signal count : std_logic_vector(0 to 10) := "00000000000";
    begin
      process(rst,clk)
        begin
			 if (rst = '1') then count <= "00000000000";
			 elsif (clk'event and clk = '1' and en = '1' and inc = '1') then	 
				 count <=  count + 1;
		    end if;
		  end process;
    o <= count;
end count_arch;