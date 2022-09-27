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
2=>"01111110",
3=>"11001110",
4=>"01001111",
5=>"00101111",
6=>"00110000",
7=>"00000111",
8=>"00111000",
9=>"11111111",
10=>"00010000",
11=>"00001010",
3840=>"00110000",
3841=>"00000111",
3842=>"00111001",
3843=>"11111110",
3844=>"00111110",
3845=>"11111101",
3846=>"01000001",
3847=>"11111111",
3848=>"01110001",
3849=>"00100001",
3850=>"00110000",
3851=>"00000110",
3852=>"01001110",
3853=>"11111111",
3854=>"00011001",
3855=>"11111111",
3856=>"00110000",
3857=>"00000111",
3858=>"00111001",
3859=>"11111111",
3860=>"01000110",
3861=>"11111101",
3862=>"01000001",
3863=>"11111110",
3864=>"10010000",
3865=>"00000000",
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