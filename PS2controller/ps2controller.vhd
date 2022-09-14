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
-- CREATED		"Thu Sep 15 00:42:26 2022"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY ps2controller IS 
	PORT
	(
		mr :  IN  STD_LOGIC;
		kclk :  IN  STD_LOGIC;
		serial_data_in :  IN  STD_LOGIC;
		RD :  IN  STD_LOGIC;
		sclk :  IN  STD_LOGIC;
		EN :  IN  STD_LOGIC;
		d_out_tri :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END ps2controller;

ARCHITECTURE bdf_type OF ps2controller IS 

COMPONENT shiftregister
	PORT(data_in : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 shift_reset : IN STD_LOGIC;
		 data_out3 : OUT STD_LOGIC;
		 data_out1 : OUT STD_LOGIC;
		 data_out10 : OUT STD_LOGIC;
		 data_out9 : OUT STD_LOGIC;
		 data_out8 : OUT STD_LOGIC;
		 data_out7 : OUT STD_LOGIC;
		 data_out6 : OUT STD_LOGIC;
		 data_out5 : OUT STD_LOGIC;
		 data_out4 : OUT STD_LOGIC;
		 data_out2 : OUT STD_LOGIC;
		 data_out0 : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT reg_4b_inc
	PORT(mr : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 ld : IN STD_LOGIC;
		 inc : IN STD_LOGIC;
		 d_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 q_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT reg_8b
	PORT(clk : IN STD_LOGIC;
		 ld : IN STD_LOGIC;
		 mr : IN STD_LOGIC;
		 d_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 d_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	bit0 :  STD_LOGIC;
SIGNAL	bit10 :  STD_LOGIC;
SIGNAL	bitp :  STD_LOGIC;
SIGNAL	cnt10 :  STD_LOGIC;
SIGNAL	d_in :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	d_inah :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	d_out :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	d_out_tri_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	ldReg :  STD_LOGIC;
SIGNAL	q_out :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC;


BEGIN 
SYNTHESIZED_WIRE_1 <= '0';
SYNTHESIZED_WIRE_2 <= '1';



b2v_inst : shiftregister
PORT MAP(data_in => serial_data_in,
		 clk => kclk,
		 shift_reset => mr,
		 data_out3 => d_in(2),
		 data_out1 => d_in(0),
		 data_out10 => bit10,
		 data_out8 => d_in(7),
		 data_out7 => d_in(6),
		 data_out6 => d_in(5),
		 data_out5 => d_in(4),
		 data_out4 => d_in(3),
		 data_out2 => d_in(1),
		 data_out0 => bit0);



b2v_inst10 : reg_4b_inc
PORT MAP(mr => SYNTHESIZED_WIRE_0,
		 clk => kclk,
		 ld => SYNTHESIZED_WIRE_1,
		 inc => SYNTHESIZED_WIRE_2,
		 d_in => d_inah,
		 q_out => q_out);



ldReg <= cnt10 AND SYNTHESIZED_WIRE_3 AND bit10;


PROCESS(d_out(7),SYNTHESIZED_WIRE_14)
BEGIN
if (SYNTHESIZED_WIRE_14 = '1') THEN
	d_out_tri_ALTERA_SYNTHESIZED(7) <= d_out(7);
ELSE
	d_out_tri_ALTERA_SYNTHESIZED(7) <= 'Z';
END IF;
END PROCESS;


PROCESS(d_out(6),SYNTHESIZED_WIRE_14)
BEGIN
if (SYNTHESIZED_WIRE_14 = '1') THEN
	d_out_tri_ALTERA_SYNTHESIZED(6) <= d_out(6);
ELSE
	d_out_tri_ALTERA_SYNTHESIZED(6) <= 'Z';
END IF;
END PROCESS;


PROCESS(d_out(5),SYNTHESIZED_WIRE_14)
BEGIN
if (SYNTHESIZED_WIRE_14 = '1') THEN
	d_out_tri_ALTERA_SYNTHESIZED(5) <= d_out(5);
ELSE
	d_out_tri_ALTERA_SYNTHESIZED(5) <= 'Z';
END IF;
END PROCESS;


PROCESS(d_out(4),SYNTHESIZED_WIRE_14)
BEGIN
if (SYNTHESIZED_WIRE_14 = '1') THEN
	d_out_tri_ALTERA_SYNTHESIZED(4) <= d_out(4);
ELSE
	d_out_tri_ALTERA_SYNTHESIZED(4) <= 'Z';
END IF;
END PROCESS;


PROCESS(d_out(3),SYNTHESIZED_WIRE_14)
BEGIN
if (SYNTHESIZED_WIRE_14 = '1') THEN
	d_out_tri_ALTERA_SYNTHESIZED(3) <= d_out(3);
ELSE
	d_out_tri_ALTERA_SYNTHESIZED(3) <= 'Z';
END IF;
END PROCESS;


PROCESS(d_out(2),SYNTHESIZED_WIRE_14)
BEGIN
if (SYNTHESIZED_WIRE_14 = '1') THEN
	d_out_tri_ALTERA_SYNTHESIZED(2) <= d_out(2);
ELSE
	d_out_tri_ALTERA_SYNTHESIZED(2) <= 'Z';
END IF;
END PROCESS;


PROCESS(d_out(1),SYNTHESIZED_WIRE_14)
BEGIN
if (SYNTHESIZED_WIRE_14 = '1') THEN
	d_out_tri_ALTERA_SYNTHESIZED(1) <= d_out(1);
ELSE
	d_out_tri_ALTERA_SYNTHESIZED(1) <= 'Z';
END IF;
END PROCESS;


PROCESS(d_out(0),SYNTHESIZED_WIRE_14)
BEGIN
if (SYNTHESIZED_WIRE_14 = '1') THEN
	d_out_tri_ALTERA_SYNTHESIZED(0) <= d_out(0);
ELSE
	d_out_tri_ALTERA_SYNTHESIZED(0) <= 'Z';
END IF;
END PROCESS;


SYNTHESIZED_WIRE_14 <= RD AND EN;


cnt10 <= q_out(3) AND SYNTHESIZED_WIRE_12 AND q_out(1) AND SYNTHESIZED_WIRE_13;


SYNTHESIZED_WIRE_12 <= NOT(q_out(2));



SYNTHESIZED_WIRE_3 <= NOT(bit0);



SYNTHESIZED_WIRE_13 <= NOT(q_out(0));



SYNTHESIZED_WIRE_0 <= cnt10 OR mr;


b2v_inst8 : reg_8b
PORT MAP(clk => sclk,
		 ld => ldReg,
		 mr => mr,
		 d_in => d_in,
		 d_out => d_out);


d_out_tri <= d_out_tri_ALTERA_SYNTHESIZED;

d_inah(0) <= '0';
END bdf_type;