library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_Std.all;

entity rom_4kB_test_cpu is
	port (
		cs : in std_logic;
		clk : in std_logic;
		rd : in std_logic;
		-- Instruction interface
		addr : in std_logic_vector(11 downto 0);
		instr_out : out std_logic_vector(7 downto 0)
	);
end entity;

architecture beh of rom_4kB_test_cpu is
	type a_prog_memory is array (0 to 2**12-1) of std_logic_vector(7 downto 0);
	signal prog_memory : a_prog_memory :=
(
0=>"01111001",
1=>"00101001",
2=>"01111010",
3=>"01001010",
4=>"01110001",
5=>"00100001",
6=>"01101010",
7=>"00100001",
8=>"01101010",
9=>"01000001",
10=>"01101010",
11=>"00100010",
12=>"01001101",
13=>"00010000",
14=>"00110000",
15=>"00000101",
16=>"00111001",
17=>"00000000",
18=>"00111010",
19=>"00000001",
20=>"01000011",
21=>"00000000",
22=>"01000100",
23=>"00000001",
24=>"01101110",
25=>"10010011",
26=>"00111110",
27=>"00000010",
28=>"00010000",
29=>"00000000",
3840=>"00110000",
3841=>"00000111",
3842=>"01001111",
3843=>"00101111",
3844=>"00111001",
3845=>"11111111",
3846=>"01001111",
3847=>"00110000",
3848=>"00100001",
3849=>"00000000",
3850=>"01001111",
3851=>"11111111",
3852=>"00011001",
3853=>"11111111",
3854=>"01001111",
3855=>"00101111",
3856=>"01000001",
3857=>"11111111",
3858=>"10010000",
3859=>"00000000",
others => (others=>'0')
);
	signal rom_out : std_logic_vector(7 downto 0) :=(others=>'0');
	
	--nemam blage veze sta su ovi atributi
	attribute keep : string;
	attribute ram_style : string;

begin
		process(clk, addr)
		begin
			if (rising_edge(clk)) then
				if cs = '1' and rd = '1' then
					rom_out <= prog_memory(to_integer(unsigned(addr(11 downto 0))));
				else
					rom_out <= (others => 'Z');
				end if;
			end if;
		end process;
		instr_out<=rom_out;

end beh;