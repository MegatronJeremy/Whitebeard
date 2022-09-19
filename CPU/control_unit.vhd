library IEEE;
use IEEE.std_logic_1164.all;

entity control_unit is
  port (
		-- Input logic
		instr : in std_logic_vector(15 downto 0);
		state : in std_logic_vector(1 downto 0);
		busy : in std_logic;
				
		-- ABUS
		abus_sel : out std_logic := '0';
		abus_out : out std_logic := '0';
		
		-- DBUS
		dbus_out : out std_logic := '0';
		
		-- BUS
		bus_busy_out : out std_logic := '0';
		bus_rd_out : out std_logic := '0';
		bus_wr_out : out std_logic := '0';

		-- PC
		inc_pc : out std_logic := '0';
		ld_pc : out std_logic := '0';
		
		-- State counter
		inc_state : out std_logic := '0';
		clr_state : out std_logic := '0';
		
		-- Pointer address
		ld_poi : out std_logic := '0';
		
		-- Instruction registers
		ld_ir1 : out std_logic := '0';
		ld_ir2 : out std_logic := '0';
		
		-- General purpose registers
		out_reg_a : out std_logic_vector(2 downto 0) := (others => '0');
		out_reg_b : out std_logic_vector(2 downto 0) := (others => '0');
		reg_dst : out std_logic_vector(2 downto 0) := (others => '0');
		reg_a_sel : out std_logic := '0';
		reg_dst_sel : out std_logic_vector(1 downto 0) := (others => '0');
		ld_rdst : out std_logic := '0';
		
		-- Immediate values
		imm : out std_logic_vector(7 downto 0) := (others => '0');
		se_offset : out std_logic_vector(6 downto 0) := (others => '0');
		se_imm : out std_logic_vector(4 downto 0) := (others => '0');
		imm_shf : out std_logic_vector(2 downto 0) := (others => '0');
		
		-- ALU
		alu_b_sel : out std_logic_vector(1 downto 0) := (others => '0');
		alu_func : out std_logic_vector(2 downto 0) := (others => '0');
		
		-- BRANCH TEST
		br_cond : out std_logic_vector(3 downto 0) := (others => '0');
		br_enable : out std_logic := '0';
		
		-- PSW
		ld_psw : out std_logic := '0';
		psw_sel : out std_logic_vector(1 downto 0) := (others => '0');
		
		-- BARREL SHIFTER
		shf_func : out std_logic_vector(1 downto 0) := (others => '0');
		shf_b_sel : out std_logic := '0';
		
		-- ADDER
		adder_a_sel : out std_logic := '0';
		adder_b_sel : out std_logic := '0'
		
  );
end entity;

architecture beh of control_unit is
  -- Decoding the instruction
  signal opcode : std_logic_vector(4 downto 0);
  
  -- Intermediate signals
  signal reg_src : std_logic_vector(2 downto 0);
  
  -- States
  constant FETCH_1 : std_logic_vector(1 downto 0) := "00";
  constant FETCH_2 : std_logic_vector(1 downto 0) := "01";
  constant EXEC_1 : std_logic_vector(1 downto 0) := "10";
  constant EXEC_2 : std_logic_vector(1 downto 0) := "11";
  
  -- Opcodes
  constant NOP : std_logic_vector(4 downto 0) := "00000";
  constant HALT : std_logic_vector(4 downto 0) := "00001";
  constant JMP : std_logic_vector(4 downto 0) := "00010";
  constant BR : std_logic_vector(4 downto 0) := "00101";
  constant POI : std_logic_vector(4 downto 0) := "00110";
  constant ST : std_logic_vector(4 downto 0) := "00111";
  constant LD : std_logic_vector(4 downto 0) := "01000";
  constant LDI : std_logic_vector(4 downto 0) := "01001";
  constant ANDI : std_logic_vector(4 downto 0) := "01010";
  constant CMP : std_logic_vector(4 downto 0) := "01011";
  constant CMPA : std_logic_vector(4 downto 0) := "01100";
  constant ADD : std_logic_vector(4 downto 0) := "01101";
  constant SUB : std_logic_vector(4 downto 0) := "01101";
  constant ADDI : std_logic_vector(4 downto 0) := "01110";
  constant BITW : std_logic_vector(4 downto 0) := "01111";
  constant SHF : std_logic_vector(4 downto 0) := "10000";
  constant SHFI : std_logic_vector(4 downto 0) := "10001";
  
  -- MX selection codes
  constant ABUS_PC : std_logic := '0';
  constant ABUS_ADDER : std_logic := '1';
  
  constant REG_A_RS1 : std_logic := '0';
  constant REG_A_POI : std_logic := '1';
  
  constant REG_DST_ALU : std_logic_vector(1 downto 0) := "00";
  constant REG_DST_IMM : std_logic_vector(1 downto 0) := "01";
  constant REG_DST_SHF : std_logic_vector(1 downto 0) := "10";
  constant REG_DST_DBUS : std_logic_vector(1 downto 0) := "11";
    
  constant ALU_B_RS2 : std_logic_vector(1 downto 0) := "00";
  constant ALU_B_IMM : std_logic_vector(1 downto 0) := "01";
  constant ALU_B_SE_IMM : std_logic_vector(1 downto 0) := "10";
  
  constant PSW_ALU_OUT : std_logic_vector(1 downto 0) := "00";
  constant PSW_DBUS_IN : std_logic_vector(1 downto 0) := "01";
  constant PSW_IMM : std_logic_vector(1 downto 0) := "10";
  constant PSW_SHF : std_logic_vector(1 downto 0) := "11";
  
  constant SHF_RS2 : std_logic := '0';
  constant SHF_IMM : std_logic := '1';
  
  constant ADDER_A_REG : std_logic := '0';
  constant ADDER_A_PC : std_logic := '1';
  
  constant ADDER_B_IMM : std_logic := '0';
  constant ADDER_B_SE_OFFS : std_logic := '1';
  
  -- ALU FUNCTION CODES
  constant ALU_ADD : std_logic_vector(2 downto 0) := "000";
  constant ALU_SUB : std_logic_vector(2 downto 0) := "010";
  constant ALU_AND : std_logic_vector(2 downto 0) := "110";
  
  -- BRANCH CONDITION CODES
  constant BR_TRUE : std_logic_vector(3 downto 0) := "0000";

begin

instr_decode : process(instr, state, busy, opcode, reg_src)
  begin
   
	-- INSTRUCTION DECODE
	opcode <= instr(15 downto 11);
	
	reg_src <= instr(10 downto 8);
	
	out_reg_a <= instr(7 downto 5);
	out_reg_b <= instr(2 downto 0);
	reg_dst <= instr(10 downto 8);
	
	imm <= instr(7 downto 0);
	se_offset <= instr(6 downto 0);
	se_imm <= instr(4 downto 0);
	imm_shf <= instr(2 downto 0);
	
	alu_func <= instr(12) & instr(4 downto 3);
	
	br_cond <= instr(10 downto 7);
	
	shf_func <= instr(4 downto 3);

	-- DEFAULT OUTPUT
	abus_sel <= ABUS_PC;
	abus_out <= '0';
	
	dbus_out <= '0';
	
	bus_busy_out <= '0';
	bus_rd_out <= '0';
	bus_wr_out <= '0';
	
	inc_pc <= '0';
	ld_pc <= '0';
	
	inc_state <= '0';
	clr_state <= '0';
	
	ld_poi <= '0';
	
	ld_ir1 <= '0';
	ld_ir2 <= '0';
	
	reg_a_sel <= REG_A_RS1;
	reg_dst_sel <= REG_DST_ALU;
	ld_rdst <= '0';
		
	alu_b_sel <= ALU_B_RS2;
	
	br_enable <= '0';

	ld_psw <= '0';
	psw_sel <= PSW_ALU_OUT;
	
	shf_b_sel <= SHF_RS2;
	
	adder_a_sel <= ADDER_A_REG;
	adder_b_sel <= ADDER_B_IMM;
  
	case state is
		
		when FETCH_1 | FETCH_2 =>
			if NOT(busy = '1') then
				bus_rd_out <= '1';
				abus_out <= '1';
				ld_ir1 <= NOT state(0);
				ld_ir2 <= state(0);
				inc_state <= '1';
				inc_pc <= '1';
			end if;
			
		when EXEC_1 | EXEC_2 => 
			case opcode is
				when NOP =>
					clr_state <= '1';
				
				when HALT =>
					-- Do nothing
					
				when JMP =>
					out_reg_a <= reg_src;
					br_enable <= '1';
					br_cond <= BR_TRUE;
					ld_pc <= '1';
					clr_state <= '1';
					
				when BR =>
					br_enable <= '1';
					adder_a_sel <= ADDER_A_PC;
					adder_b_sel <= ADDER_B_SE_OFFS;
					ld_pc <= '1';
					clr_state <= '1';
				
				when POI =>
					ld_poi <= '1';
					clr_state <= '1';

				when ST =>
					if NOT(busy = '1') then
						out_reg_b <= reg_src;
						bus_wr_out <= '1';
						abus_sel <= ABUS_ADDER;
						abus_out <= '1';
						reg_a_sel <= REG_A_POI;
						dbus_out <= '1';
						clr_state <= '1';
					end if;
					
				when LD =>
					if NOT(busy = '1') then
						bus_wr_out <= '1';
						abus_sel <= ABUS_ADDER;
						abus_out <= '1';
						reg_a_sel <= REG_A_POI;
						ld_rdst <= '1';
						reg_dst_sel <= REG_DST_DBUS;
						ld_psw <= '1';
						psw_sel <= PSW_DBUS_IN;
						clr_state <= '1';
					end if;
					
				when LDI =>
					reg_dst_sel <= REG_DST_IMM;
					ld_rdst <= '1';
					psw_sel <= PSW_IMM;
					ld_psw <= '1';
					clr_state <= '1';
					
				when ANDI =>
					out_reg_a <= reg_src;
					alu_b_sel <= ALU_B_IMM;
					alu_func <= ALU_AND;
					ld_rdst <= '1';
					ld_psw <= '1';
					clr_state <= '1';
					
				when CMP =>
					out_reg_a <= reg_src;
					alu_b_sel <= ALU_B_IMM;
					alu_func <= ALU_SUB;
					ld_psw <= '1';
					clr_state <= '1';
				
				when CMPA =>
					out_reg_a <= reg_src;
					alu_b_sel <= ALU_B_IMM;
					alu_func <= ALU_AND;
					ld_psw <= '1';
					clr_state <= '1';
					
				when ADD | BITW =>
					ld_rdst <= '1';
					ld_psw <= '1';
					clr_state <= '1';
				
				when ADDI =>
					ld_rdst <= '1';
					alu_func <= ALU_ADD;
					alu_b_sel <= ALU_B_SE_IMM;
					ld_psw <= '1';
					clr_state <= '1';
					
				when SHF =>
					ld_rdst <= '1';
					reg_dst_sel <= REG_DST_SHF;
					ld_psw <= '1';
					psw_sel <= PSW_SHF;
					clr_state <= '1';
					
				when SHFI =>
					shf_b_sel <= SHF_IMM;
					ld_rdst <= '1';
					reg_dst_sel <= REG_DST_SHF;
					ld_psw <= '1';
					psw_sel <= PSW_SHF;
					clr_state <= '1';
					
				when others =>
					-- Unknown instruction: NOP
					clr_state <= '1';
			end case;
		
		when others =>
		
	 end case;
	 
  end process;
end beh;