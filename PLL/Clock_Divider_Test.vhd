library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
  
-- Count Value      Output Frequency
-- 1                  25MHz
-- 25                 1MHz
-- 50                 500KHz
-- 1000               25KHz
-- 25000000           1Hz  
 
 
entity Clock_Divider_Test is
port ( clk,reset: in std_logic;
clock_out: out std_logic);
end Clock_Divider_Test;
  
architecture bhv of Clock_Divider_Test is
  
signal count: integer:=1;
signal tmp : std_logic := '0';
  
begin
  
process(clk,reset)
begin
if(reset='0') then
count<=1;
tmp<='0';
elsif(clk'event and clk='1') then
count <=count+1;
if (count = 1) then
tmp <= NOT tmp;
count <= 1;
end if;
end if;
clock_out <= tmp;
end process;
  
end bhv;