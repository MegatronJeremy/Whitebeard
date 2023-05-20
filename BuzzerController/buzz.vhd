library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity buzz is
port ( clock : in std_logic;
       a     : out std_logic
		 );
end buzz;

architecture Behavioral of buzz is

begin
process(clock)
variable i : integer := 0;
begin
if clock'event and clock = '1' then
if i <= 50000000 then
i := i + 1;
a <= '1';

elsif i > 50000000 and i < 100000000 then
i := i + 1;
a <= '0';

elsif i = 100000000 then
i := 0;  
end if;
end if;
end process;
end Behavioral; 