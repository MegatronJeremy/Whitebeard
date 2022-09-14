library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity branch_test_psw is
	port (
		func : in std_logic_vector(3 downto 0);
		n : in std_logic;
		z : in std_logic;
		c : in std_logic;
		v : in std_logic;
		enable : in std_logic;
		branch : out std_logic
	);
end entity;

architecture beh of branch_test_psw is

	constant TRUE : std_logic_vector(3 downto 0) := "0000";
	constant FALSE : std_logic_vector(3 downto 0) := "0001";
	constant BEQ : std_logic_vector(3 downto 0) := "0010";	
	constant BNE : std_logic_vector(3 downto 0) := "0011";
	constant BLU : std_logic_vector(3 downto 0) := "0100";
	constant BGEU : std_logic_vector(3 downto 0) := "0101";
	constant BLEU : std_logic_vector(3 downto 0) := "0110";
	constant BGU : std_logic_vector(3 downto 0) := "0111";
	constant BLT : std_logic_vector(3 downto 0) := "1000";
	constant BGE : std_logic_vector(3 downto 0) := "1001";
	constant BLE : std_logic_vector(3 downto 0) := "1010";
	constant BGT : std_logic_vector(3 downto 0) := "1011";
	
	signal is_true : std_logic;
	
begin
	branch <= is_true and enable;
	
process(func, n, z, c, v)
	begin
	
		case func(3 downto 1) is
			when "000" => -- TRUE and FALSE
				is_true <= NOT func(0);
		
			when "001" => -- EQ and NE
				if z = '1' then
					is_true <= NOT func(0);
				else
					is_true <= func(0);
				end if;
				
			when "010" => -- BGEU and BLU
				if c = '1' then
					is_true <= NOT func(0);
				else 
					is_true <= func(0);
				end if;
				
			when "011" => -- BGU and BLEU
				if c = '1' or z = '1' then
					is_true <= NOT func(0);
				else
					is_true <= func(0);
				end if;
				
			when "100" => -- SIGNED LT and GE
				if n = '1' xor v = '1' then
					is_true <= NOT func(0);
				else
					is_true <= func(0);
				end if;
				
			when "101" => -- SIGNED LE and GT
				if z = '1' or (n = '1' xor v = '1') then
					is_true <= NOT func(0);
				else
					is_true <= func(0);
				end if;
				
			when others =>
				is_true <= '0';
			
		end case;
	end process;
	
end beh;