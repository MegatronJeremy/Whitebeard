library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity reg_ram_4B is
	
	generic(
		addr_width: integer :=2;
		data_width : integer :=8
	);
	port(
		--control signals
		clk : in std_logic;
		clr : in std_logic;
		cs: in std_logic;
		rdwr: in std_logic;
		--data signals
		addr: in std_logic_vector (addr_width-1 downto 0);
		data_in: in std_logic_vector (data_width-1 downto 0);
		data_out: out std_logic_vector(data_width-1 downto 0)
	);


end reg_ram_4B;

architecture rtl of reg_ram_4B is
	
begin
	


end rtl;