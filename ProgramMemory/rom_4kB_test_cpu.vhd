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
	signal prog_memory : a_prog_memory :=(
		-- Test XOR, ADDI and ADD
		0 => "01111" & "001",
		1 => "001" & "01" & "001", -- xor r1, r1, r1
		2 => "01111" & "010", 
		3 => "010" & "01" & "010", -- xor r2, r2, r2
		4 => "01110" & "001",
		5 => "001" & "00001", -- addi r1, r1, 1
		6 => "01101" & "010",
		7 => "001" & "00" & "001", -- add r2, r1, r1
		8 => "01101" & "010",
	   9 => "010" & "00" & "001", -- add r2, r2, r1
		10 => "01101" & "010",
	   11 =>	"001" & "00" & "010", -- add r2, r1, r2
		-- r1 should be 1, r2 should be 4
		
		-- Test POI, LDI, LD, ST, SUB (and RAM memory)
		12 => "01001" & "101",
		13 => "00010000", -- ldi r5, 0x10
		14 => "00110" & "000",
		15 => "00000" & "101", -- poi r5
		16 => "00111" & "001",
		17 => "00000000", -- st r1, 0x1000
		18 => "00111" & "010",
		19 => "00000001", -- st r2, 0x1001
		20 => "01000" & "011",
		21 => "00000000", -- ld r3, 0x1000
		22 => "01000" & "100",
		23 => "00000001", -- ld r4, 0x1001
		24 => "01101" & "110",
	   25 =>	"100" & "10" & "011", -- sub r6, r4, r3
		26 => "00111" & "110",
		27 => "00000010", -- st r6, 0x1002
		-- r3 should be 1, r4 should be 4, r6 should 3
		
		-- IN, ST, BR, JMP (Keyboard test) 
		28 => "01001" & "111",
		29 => "00110000", -- ldi r7, 0x30
		30 => "00110" & "000",
		31 => "00000" & "111", -- poi r7
		32 => "00100" & "001",
		33 => "00000000", -- in r1, 0x3000
		34 => "00101" & "001",
		35 => "0" & "1111100", -- BZ 0x1111100 (-4d)
		36 => "00111" & "001",
		37 => "00010000", -- st r1, 0x3010
		38 => "00110" & "000",
		39 => "00000" & "000", -- poi r0
		40 => "00010" & "000",
		41 => "00011110", -- jmp 0x001E (30d)
	
		others => x"00"
			-- kod ide ovde !!!
			
	
	
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