library IEEE;
use IEEE.std_logic_1164.all;

entity control_unit is
  port (
		-- Input logic
		instr : in std_logic_vector(15 downto 0);
		state : in std_logic_vector(2 downto 0);
		busy : in std_logic;
		intr : in std_logic;
		pswi : in std_logic;
				
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
		
		-- MEMORY ADDR
		addr_sel : out std_logic := '0';
		
		-- SPC
		ld_spc : out std_logic := '0';
		spc_sel : out std_logic := '0';
		
		-- SPSW
		ld_spsw : out std_logic := '0';
		spsw_sel : out std_logic := '0';
		
		-- PSWI
		set_pswi : out std_logic := '0';
		clr_pswi : out std_logic := '0';
		
		-- INTR
		sel_intr : out std_logic := '0';
		clr_intr : out std_logic := '0';
		
		-- SPOI
		ld_spoi : out std_logic := '0';
		spoi_sel : out std_logic := '0'
		
  );
end entity;

architecture beh of control_unit is
  -- Decoding the instruction
  signal opcode : std_logic_vector(4 downto 0);
  
  -- Intermediate signals
  signal reg_src : std_logic_vector(2 downto 0);
  
  -- States
  constant FETCH_1 : std_logic_vector(2 downto 0) := "000";
  constant FETCH_2 : std_logic_vector(2 downto 0) := "001";
  constant FETCH_3 : std_logic_vector(2 downto 0) := "010";
  constant FETCH_4 : std_logic_vector(2 downto 0) := "011";
  constant EXEC_1 : std_logic_vector(2 downto 0) := "100";
  constant EXEC_2 : std_logic_vector(2 downto 0) := "101";
  constant INTR_1 : std_logic_vector(2 downto 0) := "110";
  
  -- Opcodes
  constant NOP : std_logic_vector(4 downto 0) := "00000";
  constant HALT : std_logic_vector(4 downto 0) := "00001";
  constant JMP : std_logic_vector(4 downto 0) := "00010";
  constant INST_OUT : std_logic_vector(4 downto 0) := "00011";
  constant INST_IN : std_logic_vector(4 downto 0) := "00100";
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
  constant RTI : std_logic_vector(4 downto 0) := "10010";
  
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
  
  constant ADDR_POI : std_logic := '0';
  constant ADDR_PC : std_logic := '1';
  
  constant PSW : std_logic := '0';
  constant SPSW : std_logic := '1';
  
  constant PC : std_logic := '0';
  constant SPC : std_logic := '1';
  
  constant NO_INTR : std_logic := '0';
  constant LD_INTR : std_logic := '1';
  
  constant POINTER : std_logic := '0';
  constant SPOINTER : std_logic := '1';
  
  -- ALU FUNCTION CODES
  constant ALU_ADD : std_logic_vector(2 downto 0) := "000";
  constant ALU_SUB : std_logic_vector(2 downto 0) := "010";
  constant ALU_AND : std_logic_vector(2 downto 0) := "110";
  
  -- BRANCH CONDITION CODES
  constant BR_TRUE : std_logic_vector(3 downto 0) := "0000";

begin

instr_decode : process(instr, state, busy, opcode, reg_src, intr, pswi)
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
	
	addr_sel <= ADDR_POI;
	
	ld_spc <= '0';
	spc_sel <= PC;
	
	ld_spsw <= '0';
	spsw_sel <= PSW;
	
	set_pswi <= '0';
	clr_pswi <= '0';
	
	sel_intr <= NO_INTR;
	clr_intr <= '0';
	
	ld_spoi <= '0';
	spoi_sel <= POINTER;
  
	case state is
		
		when FETCH_1 | FETCH_3 =>
			if NOT(busy = '1') then
				bus_rd_out <= '1';
				abus_out <= '1';
				inc_state <= '1';
				inc_pc <= '1';
			end if;
			
		when FETCH_2 =>
			ld_ir1 <= '1';
			inc_state <= '1';
			
		when FETCH_4 =>
			ld_ir2 <= '1';
			inc_state <= '1';
			
		when EXEC_1 | EXEC_2 => 
			case opcode is
				when NOP =>
				
				when HALT =>
					-- Do nothing
					
				when JMP =>
					out_reg_a <= reg_src;
					br_enable <= '1';
					br_cond <= BR_TRUE;
					ld_pc <= '1';
					
				when INST_OUT =>
					if NOT(busy = '1') then
						out_reg_b <= reg_src;
						bus_wr_out <= '1';
						abus_sel <= ABUS_ADDER;
						abus_out <= '1';
						reg_a_sel <= REG_A_POI;
						dbus_out <= '1';
					end if;
					
				when INST_IN =>
					if NOT(busy = '1') then
						bus_rd_out <= '1';
						abus_sel <= ABUS_ADDER;
						abus_out <= '1';
						reg_a_sel <= REG_A_POI;
						ld_rdst <= '1';
						reg_dst_sel <= REG_DST_DBUS;
						ld_psw <= '1';
						psw_sel <= PSW_DBUS_IN;
					end if;
					
				when BR =>
					br_enable <= '1';
					addr_sel <= ADDR_PC;
					ld_pc <= '1';
				
				when POI =>
					ld_poi <= '1';

				when ST =>
					if NOT(busy = '1') then
						out_reg_b <= reg_src;
						bus_wr_out <= '1';
						abus_sel <= ABUS_ADDER;
						abus_out <= '1';
						reg_a_sel <= REG_A_POI;
						dbus_out <= '1';
					end if;
					
				when LD =>
					case state is 
						when EXEC_1 =>
							if NOT(busy = '1') then
								bus_rd_out <= '1';
								abus_sel <= ABUS_ADDER;
								abus_out <= '1';
								reg_a_sel <= REG_A_POI;
								inc_state <= '1';
							end if;
							
						when EXEC_2 =>
							ld_rdst <= '1';
							reg_dst_sel <= REG_DST_DBUS;
							ld_psw <= '1';
							psw_sel <= PSW_DBUS_IN;
						
						when others =>
					end case;
					
				when LDI =>
					reg_dst_sel <= REG_DST_IMM;
					ld_rdst <= '1';
					psw_sel <= PSW_IMM;
					ld_psw <= '1';
					
				when ANDI =>
					out_reg_a <= reg_src;
					alu_b_sel <= ALU_B_IMM;
					alu_func <= ALU_AND;
					ld_rdst <= '1';
					ld_psw <= '1';
					
				when CMP =>
					out_reg_a <= reg_src;
					alu_b_sel <= ALU_B_IMM;
					alu_func <= ALU_SUB;
					ld_psw <= '1';
				
				when CMPA =>
					out_reg_a <= reg_src;
					alu_b_sel <= ALU_B_IMM;
					alu_func <= ALU_AND;
					ld_psw <= '1';
					
				when ADD | BITW =>
					ld_rdst <= '1';
					ld_psw <= '1';
				
				when ADDI =>
					ld_rdst <= '1';
					alu_func <= ALU_ADD;
					alu_b_sel <= ALU_B_SE_IMM;
					ld_psw <= '1';
					
				when SHF =>
					ld_rdst <= '1';
					reg_dst_sel <= REG_DST_SHF;
					ld_psw <= '1';
					psw_sel <= PSW_SHF;
					
				when SHFI =>
					shf_b_sel <= SHF_IMM;
					ld_rdst <= '1';
					reg_dst_sel <= REG_DST_SHF;
					ld_psw <= '1';
					psw_sel <= PSW_SHF;
					
				when RTI =>
					spsw_sel <= SPSW;
					spc_sel <= SPC;
					spoi_sel <= SPOINTER;
					set_pswi <= '1';
					br_enable <= '1';
					br_cond <= BR_TRUE;
					ld_pc <= '1';
					ld_psw <= '1';
					ld_poi <= '1';
					clr_state <= '1';
					
				when others =>
					-- Unknown instruction: clear state
					clr_state <= '1';
			end case;
			
			case opcode is
				-- Check for interrupts
				when NOP | JMP | BR | POI | LDI | ANDI | CMP | CMPA | ADD | BITW | ADDI | SHF | SHFI =>
					if (intr = '1' and pswi = '1') then
						ld_spc <= '1';
						ld_spsw <= '1';
						ld_spoi <= '1';
						sel_intr <= LD_INTR;
						clr_pswi <= '1';
						clr_intr <= '1';
					end if;
					clr_state <= '1';
				
				when INST_OUT | INST_IN | ST =>
					if NOT(busy = '1') then
						if (intr = '1' and pswi = '1') then
							ld_spc <= '1';
							ld_spsw <= '1';
							ld_spoi <= '1';
							sel_intr <= LD_INTR;
							clr_pswi <= '1';
							clr_intr <= '1';
						end if;
						clr_state <= '1';
					end if;
					
				when LD =>
					case state is						
						when EXEC_2 =>
							if (intr = '1' and pswi = '1') then
								ld_spc <= '1';
								ld_spsw <= '1';
								ld_spoi <= '1';
								sel_intr <= LD_INTR;
								clr_pswi <= '1';
								clr_intr <= '1';
							end if;
							clr_state <= '1';
						
						when others =>
					end case;
				
				when others =>
					-- HALT
			end case;
		
		when others =>
		
	 end case;
	 
  end process;
end beh;