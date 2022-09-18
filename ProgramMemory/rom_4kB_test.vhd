library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_Std.all;

entity rom_4kB_test is
	port (
		clk : in std_logic;
		cs : in std_logic;
		-- Instruction interface
		addr : in std_logic_vector(11 downto 0);
		instr_out : out std_logic_vector(7 downto 0)
		
	);
end entity;

architecture beh of rom_4kB_test is
	type a_prog_memory is array (0 to 2**12-1) of std_logic_vector(7 downto 0);
	signal prog_memory : a_prog_memory :=(
		-- Test XOR, ADDI and ADD
		0 => "10000" & "001",
		1 => "001" & "01" & "001", -- xor r1, r1, r1
		2 => "10000" & "010", 
		3 => "010" & "01" & "010", -- xor r2, r2, r2
		4 => "01110" & "001",
		5 => "001" & "00001", -- addi r1, r1, 1
		6 => "01101" & "010",
		7 => "001" & "00" & "001", -- add r2, r1, r1
		8 => "01101" & "010",
	   9 => "010" & "00" & "001", -- add r2, r2, r1
		10 => "01101" & "010",
	   11 =>	"001" & "00" & "010", -- add r2, r1, r2
		12 => "00111" & "001",
		13 => "00000000", -- st r1, 0x00
		14 => "00111" & "010",
		15 => "00000000", -- st r2, 0x00
		-- r1 should be 1, r2 should be 2
	
	
		others => x"00"
			-- kod ide ovde !!!
			
	
	
	);
	signal rom_out : std_logic_vector(7 downto 0) :=(others=>'0');
	
	--nemam blage veze sta su ovi atributi
	attribute keep : string;
	attribute ram_style : string;

begin
		--koristi d flipflopove vrv jer je sinhrona
		process(clk)
		begin
			if rising_edge(clk) then
				if cs = '1' then
					rom_out <= prog_memory(to_integer(unsigned(addr(11 downto 0))));
				else
					rom_out <= (others => 'Z');
				end if;
			end if;
		end process;
		instr_out<=rom_out;

end beh;