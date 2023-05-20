-- Copyright (C) 2023  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 22.1std.1 Build 917 02/14/2023 SC Lite Edition"

-- DATE "05/20/2023 23:16:53"

-- 
-- Device: Altera 5CEBA4F23C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Main IS
    PORT (
	LED : OUT std_logic_vector(7 DOWNTO 0);
	CLK : IN std_logic;
	PS2_CLK : IN std_logic;
	PS2_DATA : IN std_logic
	);
END Main;

-- Design Ports Information
-- LED[7]	=>  Location: PIN_U1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[6]	=>  Location: PIN_U2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[5]	=>  Location: PIN_N1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[4]	=>  Location: PIN_N2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[3]	=>  Location: PIN_Y3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[2]	=>  Location: PIN_W2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[1]	=>  Location: PIN_AA1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[0]	=>  Location: PIN_AA2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLK	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PS2_DATA	=>  Location: PIN_G2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PS2_CLK	=>  Location: PIN_D3,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Main IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_LED : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_CLK : std_logic;
SIGNAL ww_PS2_CLK : std_logic;
SIGNAL ww_PS2_DATA : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \CLK~input_o\ : std_logic;
SIGNAL \CLK~inputCLKENA0_outclk\ : std_logic;
SIGNAL \PS2_CLK~input_o\ : std_logic;
SIGNAL \inst|inst37|inst~0_combout\ : std_logic;
SIGNAL \inst|inst37|inst~q\ : std_logic;
SIGNAL \inst|inst37|inst2|inst~0_combout\ : std_logic;
SIGNAL \inst|inst37|inst2|inst~q\ : std_logic;
SIGNAL \inst|inst37|inst3|inst~0_combout\ : std_logic;
SIGNAL \inst|inst37|inst3|inst~q\ : std_logic;
SIGNAL \inst|inst37|inst4|inst~0_combout\ : std_logic;
SIGNAL \inst|inst37|inst4|inst~q\ : std_logic;
SIGNAL \inst|inst37|inst5~combout\ : std_logic;
SIGNAL \inst|inst37|inst1~q\ : std_logic;
SIGNAL \PS2_DATA~input_o\ : std_logic;
SIGNAL \inst|inst~q\ : std_logic;
SIGNAL \inst|inst2~feeder_combout\ : std_logic;
SIGNAL \inst|inst2~q\ : std_logic;
SIGNAL \inst|inst3~feeder_combout\ : std_logic;
SIGNAL \inst|inst3~q\ : std_logic;
SIGNAL \inst|inst4~q\ : std_logic;
SIGNAL \inst|inst5~feeder_combout\ : std_logic;
SIGNAL \inst|inst5~q\ : std_logic;
SIGNAL \inst|inst6~feeder_combout\ : std_logic;
SIGNAL \inst|inst6~q\ : std_logic;
SIGNAL \inst|inst16~q\ : std_logic;
SIGNAL \inst|inst19~q\ : std_logic;
SIGNAL \inst|inst17~q\ : std_logic;
SIGNAL \inst|inst20~q\ : std_logic;
SIGNAL \inst|inst18~q\ : std_logic;
SIGNAL \inst|inst39~0_combout\ : std_logic;
SIGNAL \inst|inst14~q\ : std_logic;
SIGNAL \inst|inst12~q\ : std_logic;
SIGNAL \inst|inst15~q\ : std_logic;
SIGNAL \inst|inst13~q\ : std_logic;
SIGNAL \inst|inst39~1_combout\ : std_logic;
SIGNAL \inst|inst39~combout\ : std_logic;
SIGNAL \inst|inst11~q\ : std_logic;
SIGNAL \inst|inst12~feeder_combout\ : std_logic;
SIGNAL \inst|inst12~DUPLICATE_q\ : std_logic;
SIGNAL \inst|inst13~feeder_combout\ : std_logic;
SIGNAL \inst|inst13~DUPLICATE_q\ : std_logic;
SIGNAL \inst|inst14~feeder_combout\ : std_logic;
SIGNAL \inst|inst14~DUPLICATE_q\ : std_logic;
SIGNAL \inst|inst15~feeder_combout\ : std_logic;
SIGNAL \inst|inst15~DUPLICATE_q\ : std_logic;
SIGNAL \inst|inst16~feeder_combout\ : std_logic;
SIGNAL \inst|inst16~DUPLICATE_q\ : std_logic;
SIGNAL \inst|inst17~feeder_combout\ : std_logic;
SIGNAL \inst|inst17~DUPLICATE_q\ : std_logic;
SIGNAL \inst|inst18~DUPLICATE_q\ : std_logic;
SIGNAL \inst|inst19~DUPLICATE_q\ : std_logic;
SIGNAL \inst|inst20~feeder_combout\ : std_logic;
SIGNAL \inst|inst20~DUPLICATE_q\ : std_logic;
SIGNAL \inst|inst27|inst~q\ : std_logic;
SIGNAL \inst|inst27|inst1~q\ : std_logic;
SIGNAL \inst|inst27|inst2~combout\ : std_logic;
SIGNAL \inst|inst31~q\ : std_logic;
SIGNAL \inst|inst29~feeder_combout\ : std_logic;
SIGNAL \inst|inst29~q\ : std_logic;
SIGNAL \inst|inst28~q\ : std_logic;
SIGNAL \inst|inst35~0_combout\ : std_logic;
SIGNAL \inst|inst35~q\ : std_logic;
SIGNAL \inst|inst2~DUPLICATE_q\ : std_logic;
SIGNAL \inst|inst26~feeder_combout\ : std_logic;
SIGNAL \inst|inst26~q\ : std_logic;
SIGNAL \inst17|data[7]~feeder_combout\ : std_logic;
SIGNAL \inst|inst30~q\ : std_logic;
SIGNAL \inst|inst7~feeder_combout\ : std_logic;
SIGNAL \inst|inst7~q\ : std_logic;
SIGNAL \inst|inst32~feeder_combout\ : std_logic;
SIGNAL \inst|inst32~q\ : std_logic;
SIGNAL \inst17|data[2]~feeder_combout\ : std_logic;
SIGNAL \inst|inst8~q\ : std_logic;
SIGNAL \inst|inst33~q\ : std_logic;
SIGNAL \inst|inst9~q\ : std_logic;
SIGNAL \inst|inst34~feeder_combout\ : std_logic;
SIGNAL \inst|inst34~q\ : std_logic;
SIGNAL \inst17|data[0]~feeder_combout\ : std_logic;
SIGNAL \inst16~0_combout\ : std_logic;
SIGNAL \inst16~1_combout\ : std_logic;
SIGNAL \inst16~q\ : std_logic;
SIGNAL \inst9~0_combout\ : std_logic;
SIGNAL \inst5~combout\ : std_logic;
SIGNAL \inst12~0_combout\ : std_logic;
SIGNAL \inst6~combout\ : std_logic;
SIGNAL \inst7~combout\ : std_logic;
SIGNAL \inst8~combout\ : std_logic;
SIGNAL \inst9~combout\ : std_logic;
SIGNAL \inst10~combout\ : std_logic;
SIGNAL \inst11~combout\ : std_logic;
SIGNAL \inst12~combout\ : std_logic;
SIGNAL \inst17|data\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst|ALT_INV_inst12~DUPLICATE_q\ : std_logic;
SIGNAL \inst|ALT_INV_inst13~DUPLICATE_q\ : std_logic;
SIGNAL \inst|ALT_INV_inst14~DUPLICATE_q\ : std_logic;
SIGNAL \inst|ALT_INV_inst15~DUPLICATE_q\ : std_logic;
SIGNAL \inst|ALT_INV_inst16~DUPLICATE_q\ : std_logic;
SIGNAL \inst|ALT_INV_inst19~DUPLICATE_q\ : std_logic;
SIGNAL \inst|ALT_INV_inst2~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_PS2_CLK~input_o\ : std_logic;
SIGNAL \ALT_INV_PS2_DATA~input_o\ : std_logic;
SIGNAL \inst|ALT_INV_inst39~1_combout\ : std_logic;
SIGNAL \inst|ALT_INV_inst39~0_combout\ : std_logic;
SIGNAL \inst|ALT_INV_inst11~q\ : std_logic;
SIGNAL \inst|ALT_INV_inst12~q\ : std_logic;
SIGNAL \inst|ALT_INV_inst13~q\ : std_logic;
SIGNAL \inst|ALT_INV_inst14~q\ : std_logic;
SIGNAL \inst|ALT_INV_inst15~q\ : std_logic;
SIGNAL \inst|ALT_INV_inst16~q\ : std_logic;
SIGNAL \inst|ALT_INV_inst17~q\ : std_logic;
SIGNAL \inst|ALT_INV_inst18~q\ : std_logic;
SIGNAL \inst|ALT_INV_inst19~q\ : std_logic;
SIGNAL \inst|inst37|inst3|ALT_INV_inst~q\ : std_logic;
SIGNAL \inst|inst37|inst2|ALT_INV_inst~q\ : std_logic;
SIGNAL \inst|inst37|inst4|ALT_INV_inst~q\ : std_logic;
SIGNAL \inst|inst37|ALT_INV_inst~q\ : std_logic;
SIGNAL \inst|ALT_INV_inst20~q\ : std_logic;
SIGNAL \inst|ALT_INV_inst~q\ : std_logic;
SIGNAL \inst|ALT_INV_inst9~q\ : std_logic;
SIGNAL \inst|ALT_INV_inst7~q\ : std_logic;
SIGNAL \inst|ALT_INV_inst5~q\ : std_logic;
SIGNAL \inst|ALT_INV_inst6~q\ : std_logic;
SIGNAL \inst|ALT_INV_inst4~q\ : std_logic;
SIGNAL \inst|inst27|ALT_INV_inst1~q\ : std_logic;
SIGNAL \inst|inst27|ALT_INV_inst~q\ : std_logic;
SIGNAL \inst|ALT_INV_inst2~q\ : std_logic;
SIGNAL \ALT_INV_inst16~0_combout\ : std_logic;
SIGNAL \inst17|ALT_INV_data\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst|ALT_INV_inst35~q\ : std_logic;
SIGNAL \ALT_INV_inst12~0_combout\ : std_logic;
SIGNAL \ALT_INV_inst9~0_combout\ : std_logic;
SIGNAL \inst|ALT_INV_inst34~q\ : std_logic;
SIGNAL \inst|ALT_INV_inst33~q\ : std_logic;
SIGNAL \inst|ALT_INV_inst32~q\ : std_logic;
SIGNAL \inst|ALT_INV_inst30~q\ : std_logic;
SIGNAL \inst|ALT_INV_inst28~q\ : std_logic;
SIGNAL \inst|ALT_INV_inst31~q\ : std_logic;
SIGNAL \inst|ALT_INV_inst29~q\ : std_logic;
SIGNAL \inst|ALT_INV_inst26~q\ : std_logic;
SIGNAL \ALT_INV_inst16~q\ : std_logic;

BEGIN

LED <= ww_LED;
ww_CLK <= CLK;
ww_PS2_CLK <= PS2_CLK;
ww_PS2_DATA <= PS2_DATA;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\inst|ALT_INV_inst12~DUPLICATE_q\ <= NOT \inst|inst12~DUPLICATE_q\;
\inst|ALT_INV_inst13~DUPLICATE_q\ <= NOT \inst|inst13~DUPLICATE_q\;
\inst|ALT_INV_inst14~DUPLICATE_q\ <= NOT \inst|inst14~DUPLICATE_q\;
\inst|ALT_INV_inst15~DUPLICATE_q\ <= NOT \inst|inst15~DUPLICATE_q\;
\inst|ALT_INV_inst16~DUPLICATE_q\ <= NOT \inst|inst16~DUPLICATE_q\;
\inst|ALT_INV_inst19~DUPLICATE_q\ <= NOT \inst|inst19~DUPLICATE_q\;
\inst|ALT_INV_inst2~DUPLICATE_q\ <= NOT \inst|inst2~DUPLICATE_q\;
\ALT_INV_PS2_CLK~input_o\ <= NOT \PS2_CLK~input_o\;
\ALT_INV_PS2_DATA~input_o\ <= NOT \PS2_DATA~input_o\;
\inst|ALT_INV_inst39~1_combout\ <= NOT \inst|inst39~1_combout\;
\inst|ALT_INV_inst39~0_combout\ <= NOT \inst|inst39~0_combout\;
\inst|ALT_INV_inst11~q\ <= NOT \inst|inst11~q\;
\inst|ALT_INV_inst12~q\ <= NOT \inst|inst12~q\;
\inst|ALT_INV_inst13~q\ <= NOT \inst|inst13~q\;
\inst|ALT_INV_inst14~q\ <= NOT \inst|inst14~q\;
\inst|ALT_INV_inst15~q\ <= NOT \inst|inst15~q\;
\inst|ALT_INV_inst16~q\ <= NOT \inst|inst16~q\;
\inst|ALT_INV_inst17~q\ <= NOT \inst|inst17~q\;
\inst|ALT_INV_inst18~q\ <= NOT \inst|inst18~q\;
\inst|ALT_INV_inst19~q\ <= NOT \inst|inst19~q\;
\inst|inst37|inst3|ALT_INV_inst~q\ <= NOT \inst|inst37|inst3|inst~q\;
\inst|inst37|inst2|ALT_INV_inst~q\ <= NOT \inst|inst37|inst2|inst~q\;
\inst|inst37|inst4|ALT_INV_inst~q\ <= NOT \inst|inst37|inst4|inst~q\;
\inst|inst37|ALT_INV_inst~q\ <= NOT \inst|inst37|inst~q\;
\inst|ALT_INV_inst20~q\ <= NOT \inst|inst20~q\;
\inst|ALT_INV_inst~q\ <= NOT \inst|inst~q\;
\inst|ALT_INV_inst9~q\ <= NOT \inst|inst9~q\;
\inst|ALT_INV_inst7~q\ <= NOT \inst|inst7~q\;
\inst|ALT_INV_inst5~q\ <= NOT \inst|inst5~q\;
\inst|ALT_INV_inst6~q\ <= NOT \inst|inst6~q\;
\inst|ALT_INV_inst4~q\ <= NOT \inst|inst4~q\;
\inst|inst27|ALT_INV_inst1~q\ <= NOT \inst|inst27|inst1~q\;
\inst|inst27|ALT_INV_inst~q\ <= NOT \inst|inst27|inst~q\;
\inst|ALT_INV_inst2~q\ <= NOT \inst|inst2~q\;
\ALT_INV_inst16~0_combout\ <= NOT \inst16~0_combout\;
\inst17|ALT_INV_data\(4) <= NOT \inst17|data\(4);
\inst17|ALT_INV_data\(3) <= NOT \inst17|data\(3);
\inst17|ALT_INV_data\(2) <= NOT \inst17|data\(2);
\inst17|ALT_INV_data\(0) <= NOT \inst17|data\(0);
\inst17|ALT_INV_data\(1) <= NOT \inst17|data\(1);
\inst|ALT_INV_inst35~q\ <= NOT \inst|inst35~q\;
\inst17|ALT_INV_data\(7) <= NOT \inst17|data\(7);
\inst17|ALT_INV_data\(6) <= NOT \inst17|data\(6);
\inst17|ALT_INV_data\(5) <= NOT \inst17|data\(5);
\ALT_INV_inst12~0_combout\ <= NOT \inst12~0_combout\;
\ALT_INV_inst9~0_combout\ <= NOT \inst9~0_combout\;
\inst|ALT_INV_inst34~q\ <= NOT \inst|inst34~q\;
\inst|ALT_INV_inst33~q\ <= NOT \inst|inst33~q\;
\inst|ALT_INV_inst32~q\ <= NOT \inst|inst32~q\;
\inst|ALT_INV_inst30~q\ <= NOT \inst|inst30~q\;
\inst|ALT_INV_inst28~q\ <= NOT \inst|inst28~q\;
\inst|ALT_INV_inst31~q\ <= NOT \inst|inst31~q\;
\inst|ALT_INV_inst29~q\ <= NOT \inst|inst29~q\;
\inst|ALT_INV_inst26~q\ <= NOT \inst|inst26~q\;
\ALT_INV_inst16~q\ <= NOT \inst16~q\;

-- Location: IOOBUF_X0_Y19_N22
\LED[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5~combout\,
	devoe => ww_devoe,
	o => ww_LED(7));

-- Location: IOOBUF_X0_Y19_N5
\LED[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6~combout\,
	devoe => ww_devoe,
	o => ww_LED(6));

-- Location: IOOBUF_X0_Y19_N56
\LED[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7~combout\,
	devoe => ww_devoe,
	o => ww_LED(5));

-- Location: IOOBUF_X0_Y19_N39
\LED[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst8~combout\,
	devoe => ww_devoe,
	o => ww_LED(4));

-- Location: IOOBUF_X0_Y18_N45
\LED[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst9~combout\,
	devoe => ww_devoe,
	o => ww_LED(3));

-- Location: IOOBUF_X0_Y18_N62
\LED[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst10~combout\,
	devoe => ww_devoe,
	o => ww_LED(2));

-- Location: IOOBUF_X0_Y18_N96
\LED[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst11~combout\,
	devoe => ww_devoe,
	o => ww_LED(1));

-- Location: IOOBUF_X0_Y18_N79
\LED[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst12~combout\,
	devoe => ww_devoe,
	o => ww_LED(0));

-- Location: IOIBUF_X22_Y0_N1
\CLK~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLK,
	o => \CLK~input_o\);

-- Location: CLKCTRL_G6
\CLK~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \CLK~input_o\,
	outclk => \CLK~inputCLKENA0_outclk\);

-- Location: IOIBUF_X0_Y20_N4
\PS2_CLK~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PS2_CLK,
	o => \PS2_CLK~input_o\);

-- Location: MLABCELL_X9_Y13_N57
\inst|inst37|inst~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|inst37|inst~0_combout\ = ( !\PS2_CLK~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_PS2_CLK~input_o\,
	combout => \inst|inst37|inst~0_combout\);

-- Location: FF_X9_Y13_N59
\inst|inst37|inst\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \inst|inst37|inst~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst37|inst~q\);

-- Location: MLABCELL_X9_Y13_N27
\inst|inst37|inst2|inst~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|inst37|inst2|inst~0_combout\ = ( !\inst|inst37|inst2|inst~q\ & ( \inst|inst37|inst~q\ & ( !\PS2_CLK~input_o\ ) ) ) # ( !\inst|inst37|inst2|inst~q\ & ( !\inst|inst37|inst~q\ & ( \PS2_CLK~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000000000000000011110000111100000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_PS2_CLK~input_o\,
	datae => \inst|inst37|inst2|ALT_INV_inst~q\,
	dataf => \inst|inst37|ALT_INV_inst~q\,
	combout => \inst|inst37|inst2|inst~0_combout\);

-- Location: FF_X9_Y13_N29
\inst|inst37|inst2|inst\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \inst|inst37|inst2|inst~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst37|inst2|inst~q\);

-- Location: MLABCELL_X9_Y13_N18
\inst|inst37|inst3|inst~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|inst37|inst3|inst~0_combout\ = ( \inst|inst37|inst3|inst~q\ & ( \inst|inst37|inst~q\ & ( (!\inst|inst37|inst2|inst~q\ & !\PS2_CLK~input_o\) ) ) ) # ( !\inst|inst37|inst3|inst~q\ & ( \inst|inst37|inst~q\ & ( (\inst|inst37|inst2|inst~q\ & 
-- !\PS2_CLK~input_o\) ) ) ) # ( \inst|inst37|inst3|inst~q\ & ( !\inst|inst37|inst~q\ & ( (!\inst|inst37|inst2|inst~q\ & \PS2_CLK~input_o\) ) ) ) # ( !\inst|inst37|inst3|inst~q\ & ( !\inst|inst37|inst~q\ & ( (\inst|inst37|inst2|inst~q\ & \PS2_CLK~input_o\) ) 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001001000100010001001000100010001001000100010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst37|inst2|ALT_INV_inst~q\,
	datab => \ALT_INV_PS2_CLK~input_o\,
	datae => \inst|inst37|inst3|ALT_INV_inst~q\,
	dataf => \inst|inst37|ALT_INV_inst~q\,
	combout => \inst|inst37|inst3|inst~0_combout\);

-- Location: FF_X9_Y13_N20
\inst|inst37|inst3|inst\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \inst|inst37|inst3|inst~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst37|inst3|inst~q\);

-- Location: MLABCELL_X9_Y13_N3
\inst|inst37|inst4|inst~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|inst37|inst4|inst~0_combout\ = ( \inst|inst37|inst4|inst~q\ & ( \inst|inst37|inst~q\ & ( (!\PS2_CLK~input_o\ & ((!\inst|inst37|inst3|inst~q\) # (!\inst|inst37|inst2|inst~q\))) ) ) ) # ( !\inst|inst37|inst4|inst~q\ & ( \inst|inst37|inst~q\ & ( 
-- (\inst|inst37|inst3|inst~q\ & (!\PS2_CLK~input_o\ & \inst|inst37|inst2|inst~q\)) ) ) ) # ( \inst|inst37|inst4|inst~q\ & ( !\inst|inst37|inst~q\ & ( (\PS2_CLK~input_o\ & ((!\inst|inst37|inst3|inst~q\) # (!\inst|inst37|inst2|inst~q\))) ) ) ) # ( 
-- !\inst|inst37|inst4|inst~q\ & ( !\inst|inst37|inst~q\ & ( (\inst|inst37|inst3|inst~q\ & (\PS2_CLK~input_o\ & \inst|inst37|inst2|inst~q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000101000011110000101000000000010100001111000010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst37|inst3|ALT_INV_inst~q\,
	datac => \ALT_INV_PS2_CLK~input_o\,
	datad => \inst|inst37|inst2|ALT_INV_inst~q\,
	datae => \inst|inst37|inst4|ALT_INV_inst~q\,
	dataf => \inst|inst37|ALT_INV_inst~q\,
	combout => \inst|inst37|inst4|inst~0_combout\);

-- Location: FF_X9_Y13_N4
\inst|inst37|inst4|inst\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \inst|inst37|inst4|inst~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst37|inst4|inst~q\);

-- Location: LABCELL_X10_Y13_N24
\inst|inst37|inst5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|inst37|inst5~combout\ = (\inst|inst37|inst2|inst~q\ & (\inst|inst37|inst4|inst~q\ & \inst|inst37|inst3|inst~q\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000000010000000100000001000000010000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst37|inst2|ALT_INV_inst~q\,
	datab => \inst|inst37|inst4|ALT_INV_inst~q\,
	datac => \inst|inst37|inst3|ALT_INV_inst~q\,
	combout => \inst|inst37|inst5~combout\);

-- Location: FF_X10_Y13_N26
\inst|inst37|inst1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	asdata => \inst|inst37|inst~q\,
	sload => VCC,
	ena => \inst|inst37|inst5~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst37|inst1~q\);

-- Location: IOIBUF_X0_Y21_N4
\PS2_DATA~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PS2_DATA,
	o => \PS2_DATA~input_o\);

-- Location: FF_X10_Y13_N32
\inst|inst\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst37|inst1~q\,
	asdata => \PS2_DATA~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst~q\);

-- Location: LABCELL_X10_Y13_N9
\inst|inst2~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|inst2~feeder_combout\ = \inst|inst~q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_inst~q\,
	combout => \inst|inst2~feeder_combout\);

-- Location: FF_X10_Y13_N11
\inst|inst2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst37|inst1~q\,
	d => \inst|inst2~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst2~q\);

-- Location: LABCELL_X10_Y13_N54
\inst|inst3~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|inst3~feeder_combout\ = \inst|inst2~q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_inst2~q\,
	combout => \inst|inst3~feeder_combout\);

-- Location: FF_X10_Y13_N55
\inst|inst3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst37|inst1~q\,
	d => \inst|inst3~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst3~q\);

-- Location: FF_X10_Y13_N5
\inst|inst4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst37|inst1~q\,
	asdata => \inst|inst3~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst4~q\);

-- Location: LABCELL_X10_Y13_N18
\inst|inst5~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|inst5~feeder_combout\ = \inst|inst4~q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_inst4~q\,
	combout => \inst|inst5~feeder_combout\);

-- Location: FF_X10_Y13_N19
\inst|inst5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst37|inst1~q\,
	d => \inst|inst5~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst5~q\);

-- Location: LABCELL_X10_Y13_N51
\inst|inst6~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|inst6~feeder_combout\ = \inst|inst5~q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_inst5~q\,
	combout => \inst|inst6~feeder_combout\);

-- Location: FF_X10_Y13_N52
\inst|inst6\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst37|inst1~q\,
	d => \inst|inst6~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst6~q\);

-- Location: FF_X10_Y13_N44
\inst|inst16\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst37|inst1~q\,
	d => \inst|inst16~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst16~q\);

-- Location: FF_X10_Y13_N14
\inst|inst19\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst37|inst1~q\,
	asdata => \inst|inst18~DUPLICATE_q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst19~q\);

-- Location: FF_X10_Y13_N50
\inst|inst17\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst37|inst1~q\,
	d => \inst|inst17~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst17~q\);

-- Location: FF_X10_Y13_N59
\inst|inst20\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst37|inst1~q\,
	d => \inst|inst20~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst20~q\);

-- Location: FF_X10_Y13_N35
\inst|inst18\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst37|inst1~q\,
	asdata => \inst|inst17~DUPLICATE_q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst18~q\);

-- Location: LABCELL_X10_Y13_N15
\inst|inst39~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|inst39~0_combout\ = ( !\inst|inst20~q\ & ( !\inst|inst18~q\ & ( (!\PS2_DATA~input_o\ & (!\inst|inst19~q\ & !\inst|inst17~q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_PS2_DATA~input_o\,
	datac => \inst|ALT_INV_inst19~q\,
	datad => \inst|ALT_INV_inst17~q\,
	datae => \inst|ALT_INV_inst20~q\,
	dataf => \inst|ALT_INV_inst18~q\,
	combout => \inst|inst39~0_combout\);

-- Location: FF_X10_Y13_N41
\inst|inst14\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst37|inst1~q\,
	d => \inst|inst14~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst14~q\);

-- Location: FF_X10_Y13_N23
\inst|inst12\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst37|inst1~q\,
	d => \inst|inst12~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst12~q\);

-- Location: FF_X10_Y13_N47
\inst|inst15\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst37|inst1~q\,
	d => \inst|inst15~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst15~q\);

-- Location: FF_X10_Y13_N8
\inst|inst13\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst37|inst1~q\,
	d => \inst|inst13~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst13~q\);

-- Location: LABCELL_X10_Y13_N3
\inst|inst39~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|inst39~1_combout\ = ( !\inst|inst15~q\ & ( !\inst|inst13~q\ & ( (!\inst|inst14~q\ & !\inst|inst12~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst|ALT_INV_inst14~q\,
	datad => \inst|ALT_INV_inst12~q\,
	datae => \inst|ALT_INV_inst15~q\,
	dataf => \inst|ALT_INV_inst13~q\,
	combout => \inst|inst39~1_combout\);

-- Location: LABCELL_X10_Y13_N30
\inst|inst39\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|inst39~combout\ = ( \inst|inst~q\ & ( \inst|inst39~1_combout\ & ( (!\inst|inst11~q\ & (!\inst|inst16~q\ & \inst|inst39~0_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_inst11~q\,
	datab => \inst|ALT_INV_inst16~q\,
	datad => \inst|ALT_INV_inst39~0_combout\,
	datae => \inst|ALT_INV_inst~q\,
	dataf => \inst|ALT_INV_inst39~1_combout\,
	combout => \inst|inst39~combout\);

-- Location: FF_X10_Y13_N2
\inst|inst11\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst37|inst1~q\,
	asdata => \inst|inst39~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst11~q\);

-- Location: LABCELL_X10_Y13_N21
\inst|inst12~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|inst12~feeder_combout\ = \inst|inst11~q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst|ALT_INV_inst11~q\,
	combout => \inst|inst12~feeder_combout\);

-- Location: FF_X10_Y13_N22
\inst|inst12~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst37|inst1~q\,
	d => \inst|inst12~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst12~DUPLICATE_q\);

-- Location: LABCELL_X10_Y13_N6
\inst|inst13~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|inst13~feeder_combout\ = ( \inst|inst12~DUPLICATE_q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \inst|ALT_INV_inst12~DUPLICATE_q\,
	combout => \inst|inst13~feeder_combout\);

-- Location: FF_X10_Y13_N7
\inst|inst13~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst37|inst1~q\,
	d => \inst|inst13~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst13~DUPLICATE_q\);

-- Location: LABCELL_X10_Y13_N39
\inst|inst14~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|inst14~feeder_combout\ = \inst|inst13~DUPLICATE_q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_inst13~DUPLICATE_q\,
	combout => \inst|inst14~feeder_combout\);

-- Location: FF_X10_Y13_N40
\inst|inst14~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst37|inst1~q\,
	d => \inst|inst14~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst14~DUPLICATE_q\);

-- Location: LABCELL_X10_Y13_N45
\inst|inst15~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|inst15~feeder_combout\ = \inst|inst14~DUPLICATE_q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_inst14~DUPLICATE_q\,
	combout => \inst|inst15~feeder_combout\);

-- Location: FF_X10_Y13_N46
\inst|inst15~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst37|inst1~q\,
	d => \inst|inst15~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst15~DUPLICATE_q\);

-- Location: LABCELL_X10_Y13_N42
\inst|inst16~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|inst16~feeder_combout\ = \inst|inst15~DUPLICATE_q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst|ALT_INV_inst15~DUPLICATE_q\,
	combout => \inst|inst16~feeder_combout\);

-- Location: FF_X10_Y13_N43
\inst|inst16~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst37|inst1~q\,
	d => \inst|inst16~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst16~DUPLICATE_q\);

-- Location: LABCELL_X10_Y13_N48
\inst|inst17~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|inst17~feeder_combout\ = \inst|inst16~DUPLICATE_q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst|ALT_INV_inst16~DUPLICATE_q\,
	combout => \inst|inst17~feeder_combout\);

-- Location: FF_X10_Y13_N49
\inst|inst17~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst37|inst1~q\,
	d => \inst|inst17~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst17~DUPLICATE_q\);

-- Location: FF_X10_Y13_N34
\inst|inst18~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst37|inst1~q\,
	asdata => \inst|inst17~DUPLICATE_q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst18~DUPLICATE_q\);

-- Location: FF_X10_Y13_N13
\inst|inst19~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst37|inst1~q\,
	asdata => \inst|inst18~DUPLICATE_q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst19~DUPLICATE_q\);

-- Location: LABCELL_X10_Y13_N57
\inst|inst20~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|inst20~feeder_combout\ = \inst|inst19~DUPLICATE_q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst|ALT_INV_inst19~DUPLICATE_q\,
	combout => \inst|inst20~feeder_combout\);

-- Location: FF_X10_Y13_N58
\inst|inst20~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst37|inst1~q\,
	d => \inst|inst20~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst20~DUPLICATE_q\);

-- Location: FF_X7_Y13_N5
\inst|inst27|inst\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst|inst20~DUPLICATE_q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst27|inst~q\);

-- Location: FF_X7_Y13_N44
\inst|inst27|inst1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst|inst27|inst~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst27|inst1~q\);

-- Location: LABCELL_X7_Y13_N21
\inst|inst27|inst2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|inst27|inst2~combout\ = ( \inst|inst27|inst~q\ & ( !\inst|inst27|inst1~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \inst|inst27|ALT_INV_inst~q\,
	dataf => \inst|inst27|ALT_INV_inst1~q\,
	combout => \inst|inst27|inst2~combout\);

-- Location: FF_X7_Y13_N38
\inst|inst31\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst|inst6~q\,
	sload => VCC,
	ena => \inst|inst27|inst2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst31~q\);

-- Location: LABCELL_X7_Y13_N51
\inst|inst29~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|inst29~feeder_combout\ = ( \inst|inst4~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \inst|ALT_INV_inst4~q\,
	combout => \inst|inst29~feeder_combout\);

-- Location: FF_X7_Y13_N53
\inst|inst29\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \inst|inst29~feeder_combout\,
	ena => \inst|inst27|inst2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst29~q\);

-- Location: FF_X9_Y13_N56
\inst17|data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst|inst29~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst17|data\(5));

-- Location: FF_X7_Y13_N56
\inst|inst28\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst|inst3~q\,
	sload => VCC,
	ena => \inst|inst27|inst2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst28~q\);

-- Location: FF_X9_Y13_N14
\inst17|data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst|inst28~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst17|data\(6));

-- Location: LABCELL_X7_Y13_N30
\inst|inst35~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|inst35~0_combout\ = ( !\inst|inst27|inst1~q\ & ( (\inst|inst27|inst~q\ & !\inst|inst35~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst|inst27|ALT_INV_inst~q\,
	datad => \inst|ALT_INV_inst35~q\,
	dataf => \inst|inst27|ALT_INV_inst1~q\,
	combout => \inst|inst35~0_combout\);

-- Location: FF_X7_Y13_N31
\inst|inst35\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \inst|inst35~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst35~q\);

-- Location: FF_X10_Y13_N10
\inst|inst2~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst37|inst1~q\,
	d => \inst|inst2~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst2~DUPLICATE_q\);

-- Location: LABCELL_X7_Y13_N48
\inst|inst26~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|inst26~feeder_combout\ = ( \inst|inst2~DUPLICATE_q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \inst|ALT_INV_inst2~DUPLICATE_q\,
	combout => \inst|inst26~feeder_combout\);

-- Location: FF_X7_Y13_N50
\inst|inst26\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \inst|inst26~feeder_combout\,
	ena => \inst|inst27|inst2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst26~q\);

-- Location: MLABCELL_X9_Y13_N51
\inst17|data[7]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst17|data[7]~feeder_combout\ = ( \inst|inst26~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \inst|ALT_INV_inst26~q\,
	combout => \inst17|data[7]~feeder_combout\);

-- Location: FF_X9_Y13_N52
\inst17|data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \inst17|data[7]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst17|data\(7));

-- Location: FF_X7_Y13_N20
\inst|inst30\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst|inst5~q\,
	sload => VCC,
	ena => \inst|inst27|inst2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst30~q\);

-- Location: FF_X9_Y13_N47
\inst17|data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst|inst30~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst17|data\(4));

-- Location: LABCELL_X10_Y13_N36
\inst|inst7~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|inst7~feeder_combout\ = \inst|inst6~q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst|ALT_INV_inst6~q\,
	combout => \inst|inst7~feeder_combout\);

-- Location: FF_X10_Y13_N37
\inst|inst7\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst37|inst1~q\,
	d => \inst|inst7~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst7~q\);

-- Location: LABCELL_X7_Y13_N24
\inst|inst32~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|inst32~feeder_combout\ = ( \inst|inst7~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \inst|ALT_INV_inst7~q\,
	combout => \inst|inst32~feeder_combout\);

-- Location: FF_X7_Y13_N26
\inst|inst32\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \inst|inst32~feeder_combout\,
	ena => \inst|inst27|inst2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst32~q\);

-- Location: MLABCELL_X9_Y13_N54
\inst17|data[2]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst17|data[2]~feeder_combout\ = ( \inst|inst32~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \inst|ALT_INV_inst32~q\,
	combout => \inst17|data[2]~feeder_combout\);

-- Location: FF_X9_Y13_N55
\inst17|data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \inst17|data[2]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst17|data\(2));

-- Location: FF_X10_Y13_N17
\inst|inst8\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst37|inst1~q\,
	asdata => \inst|inst7~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst8~q\);

-- Location: FF_X7_Y13_N14
\inst|inst33\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst|inst8~q\,
	sload => VCC,
	ena => \inst|inst27|inst2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst33~q\);

-- Location: FF_X9_Y13_N53
\inst17|data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst|inst33~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst17|data\(1));

-- Location: FF_X9_Y13_N35
\inst17|data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \inst|inst31~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst17|data\(3));

-- Location: FF_X9_Y13_N40
\inst|inst9\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst37|inst1~q\,
	asdata => \inst|inst8~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst9~q\);

-- Location: LABCELL_X7_Y13_N27
\inst|inst34~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|inst34~feeder_combout\ = ( \inst|inst9~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \inst|ALT_INV_inst9~q\,
	combout => \inst|inst34~feeder_combout\);

-- Location: FF_X7_Y13_N29
\inst|inst34\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \inst|inst34~feeder_combout\,
	ena => \inst|inst27|inst2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst34~q\);

-- Location: MLABCELL_X9_Y13_N6
\inst17|data[0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst17|data[0]~feeder_combout\ = ( \inst|inst34~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \inst|ALT_INV_inst34~q\,
	combout => \inst17|data[0]~feeder_combout\);

-- Location: FF_X9_Y13_N8
\inst17|data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \inst17|data[0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst17|data\(0));

-- Location: MLABCELL_X9_Y13_N33
\inst16~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst16~0_combout\ = ( !\inst17|data\(3) & ( !\inst17|data\(0) & ( (\inst17|data\(4) & (!\inst17|data\(2) & !\inst17|data\(1))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst17|ALT_INV_data\(4),
	datac => \inst17|ALT_INV_data\(2),
	datad => \inst17|ALT_INV_data\(1),
	datae => \inst17|ALT_INV_data\(3),
	dataf => \inst17|ALT_INV_data\(0),
	combout => \inst16~0_combout\);

-- Location: MLABCELL_X9_Y13_N42
\inst16~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst16~1_combout\ = ( \inst16~q\ & ( \inst16~0_combout\ & ( (!\inst17|data\(5)) # ((!\inst17|data\(6)) # (!\inst17|data\(7))) ) ) ) # ( !\inst16~q\ & ( \inst16~0_combout\ & ( (\inst|inst35~q\ & ((!\inst17|data\(5)) # ((!\inst17|data\(6)) # 
-- (!\inst17|data\(7))))) ) ) ) # ( \inst16~q\ & ( !\inst16~0_combout\ ) ) # ( !\inst16~q\ & ( !\inst16~0_combout\ & ( \inst|inst35~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111111111111111111100001111000011101111111111101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst17|ALT_INV_data\(5),
	datab => \inst17|ALT_INV_data\(6),
	datac => \inst|ALT_INV_inst35~q\,
	datad => \inst17|ALT_INV_data\(7),
	datae => \ALT_INV_inst16~q\,
	dataf => \ALT_INV_inst16~0_combout\,
	combout => \inst16~1_combout\);

-- Location: FF_X9_Y13_N43
inst16 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \inst16~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst16~q\);

-- Location: MLABCELL_X9_Y13_N48
\inst9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst9~0_combout\ = ( !\inst|inst33~q\ & ( (!\inst|inst34~q\ & (\inst|inst30~q\ & (\inst|inst32~q\ & !\inst|inst28~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000000000000000100000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_inst34~q\,
	datab => \inst|ALT_INV_inst30~q\,
	datac => \inst|ALT_INV_inst32~q\,
	datad => \inst|ALT_INV_inst28~q\,
	dataf => \inst|ALT_INV_inst33~q\,
	combout => \inst9~0_combout\);

-- Location: MLABCELL_X9_Y13_N15
inst5 : cyclonev_lcell_comb
-- Equation(s):
-- \inst5~combout\ = ( !\inst|inst29~q\ & ( !\inst|inst26~q\ & ( (\inst|inst31~q\ & (\inst16~q\ & \inst9~0_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000101000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_inst31~q\,
	datac => \ALT_INV_inst16~q\,
	datad => \ALT_INV_inst9~0_combout\,
	datae => \inst|ALT_INV_inst29~q\,
	dataf => \inst|ALT_INV_inst26~q\,
	combout => \inst5~combout\);

-- Location: LABCELL_X7_Y13_N0
\inst12~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst12~0_combout\ = ( !\inst|inst26~q\ & ( (!\inst|inst32~q\ & (\inst|inst33~q\ & \inst16~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000000010000000100000001000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_inst32~q\,
	datab => \inst|ALT_INV_inst33~q\,
	datac => \ALT_INV_inst16~q\,
	dataf => \inst|ALT_INV_inst26~q\,
	combout => \inst12~0_combout\);

-- Location: LABCELL_X7_Y13_N9
inst6 : cyclonev_lcell_comb
-- Equation(s):
-- \inst6~combout\ = ( !\inst|inst29~q\ & ( \inst|inst30~q\ & ( (\inst12~0_combout\ & (!\inst|inst28~q\ & (\inst|inst31~q\ & \inst|inst34~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000001000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_inst12~0_combout\,
	datab => \inst|ALT_INV_inst28~q\,
	datac => \inst|ALT_INV_inst31~q\,
	datad => \inst|ALT_INV_inst34~q\,
	datae => \inst|ALT_INV_inst29~q\,
	dataf => \inst|ALT_INV_inst30~q\,
	combout => \inst6~combout\);

-- Location: LABCELL_X7_Y13_N57
inst7 : cyclonev_lcell_comb
-- Equation(s):
-- \inst7~combout\ = ( \inst12~0_combout\ & ( !\inst|inst28~q\ & ( (\inst|inst29~q\ & (!\inst|inst30~q\ & (!\inst|inst31~q\ & \inst|inst34~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000100000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_inst29~q\,
	datab => \inst|ALT_INV_inst30~q\,
	datac => \inst|ALT_INV_inst31~q\,
	datad => \inst|ALT_INV_inst34~q\,
	datae => \ALT_INV_inst12~0_combout\,
	dataf => \inst|ALT_INV_inst28~q\,
	combout => \inst7~combout\);

-- Location: LABCELL_X7_Y13_N6
inst8 : cyclonev_lcell_comb
-- Equation(s):
-- \inst8~combout\ = ( !\inst|inst30~q\ & ( \inst|inst29~q\ & ( (\inst12~0_combout\ & (!\inst|inst28~q\ & (\inst|inst34~q\ & \inst|inst31~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000001000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_inst12~0_combout\,
	datab => \inst|ALT_INV_inst28~q\,
	datac => \inst|ALT_INV_inst34~q\,
	datad => \inst|ALT_INV_inst31~q\,
	datae => \inst|ALT_INV_inst30~q\,
	dataf => \inst|ALT_INV_inst29~q\,
	combout => \inst8~combout\);

-- Location: LABCELL_X7_Y13_N33
inst9 : cyclonev_lcell_comb
-- Equation(s):
-- \inst9~combout\ = ( !\inst|inst26~q\ & ( (\inst16~q\ & (!\inst|inst31~q\ & (\inst|inst29~q\ & \inst9~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000100000000000000010000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_inst16~q\,
	datab => \inst|ALT_INV_inst31~q\,
	datac => \inst|ALT_INV_inst29~q\,
	datad => \ALT_INV_inst9~0_combout\,
	dataf => \inst|ALT_INV_inst26~q\,
	combout => \inst9~combout\);

-- Location: LABCELL_X7_Y13_N39
inst10 : cyclonev_lcell_comb
-- Equation(s):
-- \inst10~combout\ = ( \inst|inst34~q\ & ( !\inst|inst28~q\ & ( (\inst12~0_combout\ & (\inst|inst30~q\ & (!\inst|inst31~q\ & \inst|inst29~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000001000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_inst12~0_combout\,
	datab => \inst|ALT_INV_inst30~q\,
	datac => \inst|ALT_INV_inst31~q\,
	datad => \inst|ALT_INV_inst29~q\,
	datae => \inst|ALT_INV_inst34~q\,
	dataf => \inst|ALT_INV_inst28~q\,
	combout => \inst10~combout\);

-- Location: LABCELL_X7_Y13_N15
inst11 : cyclonev_lcell_comb
-- Equation(s):
-- \inst11~combout\ = ( \inst12~0_combout\ & ( \inst|inst31~q\ & ( (\inst|inst34~q\ & (\inst|inst30~q\ & (!\inst|inst28~q\ & \inst|inst29~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_inst34~q\,
	datab => \inst|ALT_INV_inst30~q\,
	datac => \inst|ALT_INV_inst28~q\,
	datad => \inst|ALT_INV_inst29~q\,
	datae => \ALT_INV_inst12~0_combout\,
	dataf => \inst|ALT_INV_inst31~q\,
	combout => \inst11~combout\);

-- Location: LABCELL_X7_Y13_N42
inst12 : cyclonev_lcell_comb
-- Equation(s):
-- \inst12~combout\ = ( \inst12~0_combout\ & ( !\inst|inst29~q\ & ( (!\inst|inst34~q\ & (!\inst|inst30~q\ & (!\inst|inst31~q\ & \inst|inst28~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_inst34~q\,
	datab => \inst|ALT_INV_inst30~q\,
	datac => \inst|ALT_INV_inst31~q\,
	datad => \inst|ALT_INV_inst28~q\,
	datae => \ALT_INV_inst12~0_combout\,
	dataf => \inst|ALT_INV_inst29~q\,
	combout => \inst12~combout\);

-- Location: LABCELL_X6_Y23_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


