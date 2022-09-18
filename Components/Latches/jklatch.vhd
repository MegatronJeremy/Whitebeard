library ieee;
use ieee. std_logic_1164.all;
use ieee. std_logic_arith.all;
use ieee. std_logic_unsigned.all;
 
entity jklatch is
PORT( J,K, rst: in std_logic;
Q, QB: out std_logic);
end jklatch;
 
Architecture behavioral of jklatch is
begin
PROCESS (J, K)
variable state: std_logic := '0';
begin
	if(J='0' and K='0')then
	state:=state;
	elsif(J='1' and K='1')then
	state:= not state;
	elsif(J='0' and K='1')then
	state:='0';
	else
	state:='1';
	end if;
Q<=state;
QB <=not state;
end PROCESS;
end behavioral;
