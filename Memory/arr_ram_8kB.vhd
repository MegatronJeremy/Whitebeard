library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity arr_ram_8kB is 
	generic(
		addr_width: integer :=13;
		data_width : integer :=8
	);
	port(
		--control signals
		clk : in std_logic;
		cs: in std_logic;
		rdwr: in std_logic;
		--data signals
		addr: in std_logic_vector (addr_width-1 downto 0);
		data_in: in std_logic_vector (data_width-1 downto 0);
		data_out: out std_logic_vector(data_width-1 downto 0)
	);

end arr_ram_8kB;

architecture rtl of arr_ram_8kB is
	constant RAM_DEPTH :integer := 2**addr_width;
	type a_memory is array(0 to RAM_DEPTH-1) of std_logic_vector(data_width-1 downto 0);

	signal memory : a_memory := (
		others => (others =>'0')
	);
	signal data_mem : std_logic_vector(data_width-1 downto 0):= (others=>'Z');
begin
	interface : process (clk)
	begin

	if (rising_edge(clk)) then

			if(cs='1') then
				if(rdwr='1') then
					data_mem<=memory(to_integer(unsigned(addr)));
				else 
					memory(to_integer(unsigned(addr)))<=data_in;
						
				end if;
			else
				data_mem<="ZZZZZZZZ";
			
			end if;
			
		
		end if;
	
	
	end process;
	data_out<=data_mem;

end rtl;