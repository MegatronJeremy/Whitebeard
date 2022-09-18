library IEEE;
use IEEE.std_logic_1164.all;

entity tb_control_unit is
end tb_control_unit;

architecture test of tb_control_unit is
	-- Input logic
	signal instr : std_logic_vector(15 downto 0) := (others => '0');
	signal state : std_logic_vector(1 downto 0) := (others => '0');
	signal busy : std_logic := 'Z';
				
	-- ABUS
	signal abus_sel : std_logic;
	signal abus_out : std_logic;
		
		-- DBUS
	signal dbus_out : std_logic;
		
		-- BUS
	signal bus_busy_out : std_logic;
	signal bus_rd_out : std_logic;
	signal bus_wr_out : std_logic;

		-- PC
	signal inc_pc : std_logic;
	signal ld_pc : std_logic ;
		
		-- State counter
	signal inc_state : std_logic;
	signal clr_state : std_logic;
		
		-- Pointer address
	signal ld_poi : std_logic;
		
		-- Instruction registers
	signal ld_ir1 : std_logic;
	signal ld_ir2 : std_logic;
		
		-- General purpose registers
	signal out_reg_a : std_logic_vector(2 downto 0);
	signal out_reg_b : std_logic_vector(2 downto 0);
	signal reg_dst : std_logic_vector(2 downto 0);
	signal reg_a_sel : std_logic;
	signal reg_dst_sel : std_logic_vector(1 downto 0);
	signal ld_rdst : std_logic;
		
		-- Immediate values
	signal imm : std_logic_vector(7 downto 0);
	signal se_offset : std_logic_vector(6 downto 0);
	signal se_imm : std_logic_vector(4 downto 0);
	signal imm_shf : std_logic_vector(2 downto 0);
		
		-- ALU
	signal alu_b_sel : std_logic_vector(1 downto 0);
	signal alu_func : std_logic_vector(2 downto 0);
		
		-- BRANCH TEST
	signal br_cond : std_logic_vector(3 downto 0);
	signal br_enable : std_logic;
		
		-- PSW
	signal ld_psw : std_logic;
	signal psw_sel : std_logic_vector(1 downto 0);
		
		-- BARREL SHIFTER
	signal shf_func : std_logic_vector(1 downto 0);
	signal shf_b_sel : std_logic;
		
		-- ADDER
	signal adder_a_sel : std_logic;
	signal adder_b_sel : std_logic;
	
	constant Tclk : time := 20 ns;
begin
	
	dut: entity work.control_unit port map (
		instr => instr,
		state => state,
		busy => busy,
		abus_sel => abus_sel,
		abus_out => abus_out,
		dbus_out => dbus_out,
		bus_busy_out => bus_busy_out,
		bus_rd_out => bus_rd_out,
		bus_wr_out => bus_wr_out,
		inc_pc => inc_pc,
		ld_pc => ld_pc,
		inc_state => inc_state,
		clr_state => clr_state,
		ld_poi => ld_poi,
		ld_ir1 => ld_ir1,
		ld_ir2 => ld_ir2,
		out_reg_a => out_reg_a,
		out_reg_b => out_reg_b,
		reg_dst => reg_dst,
		reg_a_sel => reg_a_sel,
		reg_dst_sel => reg_dst_sel,
		ld_rdst => ld_rdst,
		imm => imm,
		imm_shf => imm_shf,
		se_imm => se_imm,
		se_offset => se_offset,
		alu_b_sel => alu_b_sel,
		alu_func => alu_func,
		br_cond => br_cond,
		br_enable => br_enable,
		ld_psw => ld_psw,
		psw_sel => psw_sel,
		shf_func => shf_func,
		shf_b_sel => shf_b_sel,
		adder_a_sel => adder_a_sel,
		adder_b_sel => adder_b_sel
	);
	
	stimulus: process 
	begin
		state <= "00";
		wait for Tclk;
		state <= "01";
		wait for Tclk;
		state <= "10";
		wait for Tclk;
		state <= "00";
		wait for Tclk;
		state <= "01";
		wait for Tclk;
		state <= "10";
		instr <= "01111" & "001" & "001" & "01" & "001"; -- xor r1, r1, r1
		wait for Tclk;
		wait;
	end process;
	
end test;