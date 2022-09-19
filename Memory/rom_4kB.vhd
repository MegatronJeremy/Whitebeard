library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_Std.all;

entity rom_4kB is
	port (
		clk : in std_logic;
		cs : in std_logic;
		rd : in std_logic;
		-- Instruction interface
		addr : in std_logic_vector(11 downto 0);
		instr_out : out std_logic_vector(7 downto 0)
		
	);
end entity;

architecture beh of rom_4kB is
	type a_prog_memory is array (0 to 2**12-1) of std_logic_vector(7 downto 0);
	signal prog_memory : a_prog_memory :=(
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
				if cs = '1' and rd = '1' then
					rom_out <= prog_memory(to_integer(unsigned(addr(11 downto 0))));
				else
					rom_out <= (others => 'Z');
				end if;
			end if;
		end process;
		instr_out<=rom_out;

end beh;