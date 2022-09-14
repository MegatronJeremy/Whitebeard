library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity reg_file_8x8b is
	port (
		clk : in std_logic;
		read_addr_1 : in std_logic_vector(2 downto 0);
		read_data_1 : out std_logic_vector(7 downto 0);
		read_addr_2 : in std_logic_vector(2 downto 0);
		read_data_2 : out std_logic_vector(7 downto 0);
		write_addr : in std_logic_vector(2 downto 0);
		load : in std_logic;
		write_data : in std_logic_vector(7 downto 0)
	);
end entity;

architecture beh of reg_file_8x8b is
	type a_regs is array(0 to 7) of std_logic_vector(7 downto 0);
	signal reg_1 : a_regs := (others => (others => '0')); -- REG 0 HARDWIRED TO ZERO
	signal reg_2 : a_regs := (others => (others => '0'));
begin
	
	read_data_1 <= reg_1(to_integer(unsigned(read_addr_1)));
	read_data_2 <= reg_2(to_integer(unsigned(read_addr_2)));

write_proc : process(clk)
	begin
		if rising_edge(clk) then
			if write_addr /= "000" and load = '1' then
				reg_1(to_integer(unsigned(write_addr))) <= write_data;
				reg_2(to_integer(unsigned(write_addr))) <= write_data;
			end if;
		end if;
	end process;
end beh;