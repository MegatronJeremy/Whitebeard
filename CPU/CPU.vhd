-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"
-- CREATED		"Sun Sep 18 10:27:30 2022"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY CPU IS 
	PORT
	(
		clk :  IN  STD_LOGIC;
		mr :  IN  STD_LOGIC;
		busy :  INOUT  STD_LOGIC;
		dbus_in :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		rdwr :  OUT  STD_LOGIC;
		abus :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
		dbus_out :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END CPU;

ARCHITECTURE bdf_type OF CPU IS 

COMPONENT adder_16b
	PORT(a : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 c : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT alu_8b
	PORT(carry_in : IN STD_LOGIC;
		 a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 b : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 func : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 carry_out : OUT STD_LOGIC;
		 c : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT barrel_shifter_8b
	PORT(a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 b : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 func : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 carry_out : OUT STD_LOGIC;
		 c : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT branch_test_psw
	PORT(n : IN STD_LOGIC;
		 z : IN STD_LOGIC;
		 c : IN STD_LOGIC;
		 v : IN STD_LOGIC;
		 enable : IN STD_LOGIC;
		 func : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 branch : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT control_unit
	PORT(busy : IN STD_LOGIC;
		 instr : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 state : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 abus_sel : OUT STD_LOGIC;
		 abus_out : OUT STD_LOGIC;
		 dbus_out : OUT STD_LOGIC;
		 bus_busy_out : OUT STD_LOGIC;
		 bus_rd_out : OUT STD_LOGIC;
		 bus_wr_out : OUT STD_LOGIC;
		 inc_pc : OUT STD_LOGIC;
		 ld_pc : OUT STD_LOGIC;
		 inc_state : OUT STD_LOGIC;
		 clr_state : OUT STD_LOGIC;
		 ld_poi : OUT STD_LOGIC;
		 ld_ir1 : OUT STD_LOGIC;
		 ld_ir2 : OUT STD_LOGIC;
		 reg_a_sel : OUT STD_LOGIC;
		 ld_rdst : OUT STD_LOGIC;
		 br_enable : OUT STD_LOGIC;
		 ld_psw : OUT STD_LOGIC;
		 shf_b_sel : OUT STD_LOGIC;
		 adder_a_sel : OUT STD_LOGIC;
		 adder_b_sel : OUT STD_LOGIC;
		 alu_b_sel : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 alu_func : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		 br_cond : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 imm : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 imm_shf : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		 out_reg_a : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		 out_reg_b : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		 psw_sel : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 reg_dst : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		 reg_dst_sel : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 se_imm : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		 se_offset : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		 shf_func : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mux4_4b
	PORT(d_in_1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 d_in_2 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 d_in_3 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 d_in_4 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 d_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mux2_16b
	PORT(sel : IN STD_LOGIC;
		 zero : IN STD_LOGIC;
		 d_in_1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 d_in_2 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 d_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mx4x8
	PORT(EN : IN STD_LOGIC;
		 S0 : IN STD_LOGIC;
		 S1 : IN STD_LOGIC;
		 I0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 I1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 I2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 I3 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 Y : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT lpm_constant0
	PORT(		 result : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

COMPONENT sign_ext_5_8
	PORT(d_in : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 d_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT lpm_constant1
	PORT(		 result : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mux2_3b
	PORT(sel : IN STD_LOGIC;
		 zero : IN STD_LOGIC;
		 d_in_1 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 d_in_2 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 d_out : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;

COMPONENT nzcv_gen
	PORT(C : IN STD_LOGIC;
		 ALU7 : IN STD_LOGIC;
		 ADD : IN STD_LOGIC;
		 SUB : IN STD_LOGIC;
		 AB : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 BB : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 nzcv : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT zero_checker_8b
	PORT(data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 zero : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT zero_ext_8_16
	PORT(d_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 d_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT tri_buffer_16b
	PORT(ENbuffer : IN STD_LOGIC;
		 d_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 d_out_tri : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT tri_buffer_8b
	PORT(ENbuffer : IN STD_LOGIC;
		 d_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 d_out_tri : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT sign_ext_7_16
	PORT(d_in : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 d_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT reg_8b
	PORT(mr : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 ld : IN STD_LOGIC;
		 d_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 q_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT reg_3b
	PORT(mr : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 ld : IN STD_LOGIC;
		 d_in : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 q_out : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;

COMPONENT reg_16b_inc
	PORT(mr : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 ld : IN STD_LOGIC;
		 inc : IN STD_LOGIC;
		 d_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 q_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT reg_4b
	PORT(mr : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 ld : IN STD_LOGIC;
		 d_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 q_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT reg_file_8x8b
	PORT(clk : IN STD_LOGIC;
		 load : IN STD_LOGIC;
		 read_addr_1 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 read_addr_2 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 write_addr : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 write_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 read_data_1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 read_data_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT reg_2b_inc
	PORT(mr : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 ld : IN STD_LOGIC;
		 inc : IN STD_LOGIC;
		 d_in : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 q_out : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	abus_out :  STD_LOGIC;
SIGNAL	abus_sel :  STD_LOGIC;
SIGNAL	adder :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	adder_a_sel :  STD_LOGIC;
SIGNAL	adder_b_sel :  STD_LOGIC;
SIGNAL	alu :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	alu_b_sel :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	alu_carry :  STD_LOGIC;
SIGNAL	alu_func :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	br_cond :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	br_enable :  STD_LOGIC;
SIGNAL	branch :  STD_LOGIC;
SIGNAL	bus_busy_out :  STD_LOGIC;
SIGNAL	bus_rd_out :  STD_LOGIC;
SIGNAL	bus_wr_out :  STD_LOGIC;
SIGNAL	clr_state :  STD_LOGIC;
SIGNAL	dbus_out_out :  STD_LOGIC;
SIGNAL	gnd :  STD_LOGIC;
SIGNAL	imm :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	imm_shf :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	inc_pc :  STD_LOGIC;
SIGNAL	inc_state :  STD_LOGIC;
SIGNAL	ir :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	ld_ir1 :  STD_LOGIC;
SIGNAL	ld_ir2 :  STD_LOGIC;
SIGNAL	ld_pc :  STD_LOGIC;
SIGNAL	ld_poi :  STD_LOGIC;
SIGNAL	ld_psw :  STD_LOGIC;
SIGNAL	ld_rdst :  STD_LOGIC;
SIGNAL	out_reg_a :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	out_reg_b :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	pc :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	poi :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	psw :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	psw_alu :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	psw_dbus :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	psw_imm :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	psw_sel :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	psw_shf :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	reg_a :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	reg_a_sel :  STD_LOGIC;
SIGNAL	reg_b :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	reg_dst :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	reg_dst_sel :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	se_imm :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	se_offset :  STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL	shf :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	shf_b_sel :  STD_LOGIC;
SIGNAL	shf_func :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	state :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	vcc :  STD_LOGIC;
SIGNAL	zero_2b :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	zero_8b :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 



b2v_ADDER_16b : adder_16b
PORT MAP(a => SYNTHESIZED_WIRE_0,
		 b => SYNTHESIZED_WIRE_1,
		 c => adder);


b2v_ALU_8b : alu_8b
PORT MAP(carry_in => psw(1),
		 a => SYNTHESIZED_WIRE_2,
		 b => reg_b,
		 func => alu_func,
		 carry_out => alu_carry,
		 c => alu);


b2v_BARREL_SHIFTER : barrel_shifter_8b
PORT MAP(a => reg_a,
		 b => SYNTHESIZED_WIRE_3,
		 func => shf_func,
		 carry_out => psw_shf(1),
		 c => shf);


b2v_BRANCH_TEST : branch_test_psw
PORT MAP(n => psw(3),
		 z => psw(2),
		 c => psw(1),
		 v => psw(0),
		 enable => br_enable,
		 func => br_cond,
		 branch => branch);


b2v_CONTROL_UNIT : control_unit
PORT MAP(busy => busy,
		 instr => ir,
		 state => state,
		 abus_sel => abus_sel,
		 abus_out => abus_out,
		 dbus_out => dbus_out_out,
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
		 reg_a_sel => reg_a_sel,
		 ld_rdst => ld_rdst,
		 br_enable => br_enable,
		 ld_psw => ld_psw,
		 shf_b_sel => shf_b_sel,
		 adder_a_sel => adder_a_sel,
		 adder_b_sel => adder_b_sel,
		 alu_b_sel => alu_b_sel,
		 alu_func => alu_func,
		 br_cond => br_cond,
		 imm => imm,
		 imm_shf => imm_shf,
		 out_reg_a => out_reg_a,
		 out_reg_b => out_reg_b,
		 psw_sel => psw_sel,
		 reg_dst => reg_dst,
		 reg_dst_sel => reg_dst_sel,
		 se_imm => se_imm,
		 se_offset => se_offset,
		 shf_func => shf_func);


b2v_inst : mux4_4b
PORT MAP(d_in_1 => psw_alu,
		 d_in_2 => psw_dbus,
		 d_in_3 => psw_imm,
		 d_in_4 => psw_shf,
		 sel => psw_sel,
		 d_out => SYNTHESIZED_WIRE_13);


b2v_inst1 : mux2_16b
PORT MAP(sel => adder_a_sel,
		 zero => gnd,
		 d_in_1 => SYNTHESIZED_WIRE_4,
		 d_in_2 => pc,
		 d_out => SYNTHESIZED_WIRE_0);


b2v_inst10 : mx4x8
PORT MAP(EN => vcc,
		 S0 => reg_dst_sel(0),
		 S1 => reg_dst_sel(1),
		 I0 => alu,
		 I1 => imm,
		 I2 => shf,
		 I3 => dbus_in,
		 Y => SYNTHESIZED_WIRE_15);


b2v_inst11 : lpm_constant0
PORT MAP(		 result => zero_2b);


b2v_inst12 : sign_ext_5_8
PORT MAP(d_in => se_imm,
		 d_out => SYNTHESIZED_WIRE_7);


b2v_inst14 : lpm_constant1
PORT MAP(		 result => zero_8b);


b2v_inst15 : mux2_3b
PORT MAP(sel => shf_b_sel,
		 zero => gnd,
		 d_in_1 => reg_b(2 DOWNTO 0),
		 d_in_2 => imm_shf,
		 d_out => SYNTHESIZED_WIRE_3);


b2v_inst16 : nzcv_gen
PORT MAP(C => alu_carry,
		 ALU7 => alu(7),
		 ADD => SYNTHESIZED_WIRE_5,
		 SUB => SYNTHESIZED_WIRE_6,
		 AB => reg_a,
		 BB => reg_b,
		 nzcv => psw_alu);


b2v_inst17 : zero_checker_8b
PORT MAP(data_in => dbus_in,
		 zero => psw_dbus(2));


b2v_inst18 : mx4x8
PORT MAP(EN => vcc,
		 S0 => alu_b_sel(0),
		 S1 => alu_b_sel(1),
		 I0 => reg_b,
		 I1 => imm,
		 I2 => SYNTHESIZED_WIRE_7,
		 I3 => zero_8b,
		 Y => SYNTHESIZED_WIRE_2);


b2v_inst19 : zero_ext_8_16
PORT MAP(d_in => reg_a,
		 d_out => SYNTHESIZED_WIRE_4);


b2v_inst2 : mux2_16b
PORT MAP(sel => adder_b_sel,
		 zero => gnd,
		 d_in_1 => SYNTHESIZED_WIRE_8,
		 d_in_2 => SYNTHESIZED_WIRE_9,
		 d_out => SYNTHESIZED_WIRE_1);


b2v_inst20 : mux2_16b
PORT MAP(sel => abus_sel,
		 zero => gnd,
		 d_in_1 => pc,
		 d_in_2 => adder,
		 d_out => SYNTHESIZED_WIRE_10);


b2v_inst21 : zero_ext_8_16
PORT MAP(d_in => imm,
		 d_out => SYNTHESIZED_WIRE_8);


b2v_inst22 : zero_checker_8b
PORT MAP(data_in => imm,
		 zero => psw_imm(2));


b2v_inst23 : zero_checker_8b
PORT MAP(data_in => shf,
		 zero => psw_shf(2));


b2v_inst24 : tri_buffer_16b
PORT MAP(ENbuffer => abus_out,
		 d_in => SYNTHESIZED_WIRE_10,
		 d_out_tri => abus);


SYNTHESIZED_WIRE_12 <= ld_pc AND branch;


b2v_inst26 : tri_buffer_8b
PORT MAP(ENbuffer => dbus_out_out,
		 d_in => reg_a,
		 d_out_tri => dbus_out);


SYNTHESIZED_WIRE_6 <= SYNTHESIZED_WIRE_11 AND alu_func(1);


SYNTHESIZED_WIRE_5 <= NOT(alu_func(2) OR alu_func(1));


SYNTHESIZED_WIRE_11 <= NOT(alu_func(2));



b2v_inst3 : sign_ext_7_16
PORT MAP(d_in => se_offset,
		 d_out => SYNTHESIZED_WIRE_9);

psw_dbus(1 DOWNTO 0) <= zero_2b;


psw_imm(1 DOWNTO 0) <= zero_2b;


psw_shf(0) <= gnd;


psw_shf(3) <= shf(7);


psw_imm(3) <= imm(7);


psw_dbus(3) <= dbus_in(7);



b2v_inst4 : mux2_3b
PORT MAP(sel => reg_a_sel,
		 zero => gnd,
		 d_in_1 => out_reg_a,
		 d_in_2 => poi,
		 d_out => SYNTHESIZED_WIRE_14);




PROCESS(gnd,bus_rd_out)
BEGIN
if (bus_rd_out = '1') THEN
	rdwr <= gnd;
ELSE
	rdwr <= 'Z';
END IF;
END PROCESS;


PROCESS(vcc,bus_wr_out)
BEGIN
if (bus_wr_out = '1') THEN
	rdwr <= vcc;
ELSE
	rdwr <= 'Z';
END IF;
END PROCESS;


PROCESS(vcc,bus_busy_out)
BEGIN
if (bus_busy_out = '1') THEN
	busy <= vcc;
ELSE
	busy <= 'Z';
END IF;
END PROCESS;


b2v_INSTRUCTION_REG_1 : reg_8b
PORT MAP(mr => mr,
		 clk => clk,
		 ld => ld_ir1,
		 d_in => dbus_in,
		 q_out => ir(15 DOWNTO 8));


b2v_INSTRUCTION_REG_2 : reg_8b
PORT MAP(mr => mr,
		 clk => clk,
		 ld => ld_ir2,
		 d_in => dbus_in,
		 q_out => ir(7 DOWNTO 0));


b2v_POINTER_ADDRESS : reg_3b
PORT MAP(mr => mr,
		 clk => clk,
		 ld => ld_poi,
		 d_in => out_reg_b,
		 q_out => poi);


b2v_PROGRAM_COUNTER : reg_16b_inc
PORT MAP(mr => mr,
		 clk => clk,
		 ld => SYNTHESIZED_WIRE_12,
		 inc => inc_pc,
		 d_in => adder,
		 q_out => pc);


b2v_PROGRAM_STATUS_WORD : reg_4b
PORT MAP(mr => mr,
		 clk => clk,
		 ld => ld_psw,
		 d_in => SYNTHESIZED_WIRE_13,
		 q_out => psw);


b2v_REG_FILE : reg_file_8x8b
PORT MAP(clk => clk,
		 load => ld_rdst,
		 read_addr_1 => SYNTHESIZED_WIRE_14,
		 read_addr_2 => out_reg_b,
		 write_addr => reg_dst,
		 write_data => SYNTHESIZED_WIRE_15,
		 read_data_1 => reg_a,
		 read_data_2 => reg_b);


b2v_STATE_COUNTER : reg_2b_inc
PORT MAP(mr => mr,
		 clk => clk,
		 ld => clr_state,
		 inc => inc_state,
		 d_in => zero_2b,
		 q_out => state);


gnd <= '0';
vcc <= '1';
END bdf_type;