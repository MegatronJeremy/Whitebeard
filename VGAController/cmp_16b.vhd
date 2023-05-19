Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
 
entity cmp_16b is
  port (
      A, B   : in std_logic_vector(15 downto 0);
      EQ, GT, LT  : out std_logic
   );
end cmp_16b ;
 
architecture bhv of cmp_16b is
begin
GT <= '1' when A > B
else '0';
EQ <= '1' when A = B
else '0';
LT <= '1' when A < B
else '0';
end bhv;