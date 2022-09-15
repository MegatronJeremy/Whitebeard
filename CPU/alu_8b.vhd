library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu_8b is
  port (
    func : in std_logic_vector(2 downto 0);
    a : in std_logic_vector(7 downto 0);
    b : in std_logic_vector(7 downto 0);
	 carry_in : in std_logic;
	 carry_out : out std_logic;
    c : out std_logic_vector(7 downto 0) := (others => '0')
  );
end alu_8b;

architecture beh of alu_8b is
  constant ALU_ADD : std_logic_vector(2 downto 0) := "000";
  constant ALU_ADDC : std_logic_vector(2 downto 0) := "001";
  constant ALU_SUB : std_logic_vector(2 downto 0) := "010";
  constant ALU_SUBC : std_logic_vector(2 downto 0) := "011";
  constant ALU_IMPLIES : std_logic_vector(2 downto 0) := "100";
  constant ALU_XOR : std_logic_vector(2 downto 0) := "101";
  constant ALU_AND : std_logic_vector(2 downto 0) := "110";
  constant ALU_OR : std_logic_vector(2 downto 0) := "111";
  
begin

  process (func, a, b, carry_in)
    variable t : std_logic_vector(8 downto 0);
	 variable p : std_logic_vector(8 downto 0);
	 variable a_tmp : std_logic_vector(8 downto 0);
	 variable b_tmp : std_logic_vector(8 downto 0);
  begin
	 a_tmp := '0' & a;
	 b_tmp := '0' & b;
	 p := x"00" & carry_in;
    
    case func is
      when ALU_ADD =>
			t := std_logic_vector(unsigned(a_tmp) + unsigned(b_tmp));
			
		when ALU_ADDC =>
			t := std_logic_vector(unsigned(a_tmp) + unsigned(b_tmp) + unsigned(p));
			 
		when ALU_SUB =>
			t := std_logic_vector(unsigned(a_tmp) - unsigned(b_tmp));
			
		when ALU_SUBC =>
			t := std_logic_vector(unsigned(a_tmp) - unsigned(b_tmp) - unsigned(p));
			
		when ALU_IMPLIES =>
			t := (NOT a_tmp) or b_tmp;
			  
      when ALU_XOR =>
         t := a_tmp xor b_tmp;
		  
      when ALU_OR =>
         t := a_tmp or b_tmp;
		  
      when ALU_AND =>
         t := a_tmp and b_tmp;  
			
		when others =>
			t := "000000000";
    end case;
	 
	 c <= t(7 downto 0);
	 carry_out <= t(8);
	 
  end process;
end beh;