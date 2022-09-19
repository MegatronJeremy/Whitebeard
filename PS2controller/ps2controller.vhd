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
-- CREATED		"Mon Sep 19 19:16:32 2022"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY ps2controller IS 
	PORT
	(
		mr :  IN  STD_LOGIC;
		RD :  IN  STD_LOGIC;
		sclk :  IN  STD_LOGIC;
		EN :  IN  STD_LOGIC;
		kclk :  IN  STD_LOGIC;
		serial_data_in :  IN  STD_LOGIC;
		d_out_tri :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END ps2controller;

ARCHITECTURE bdf_type OF ps2controller IS 

COMPONENT shiftregister
	PORT(data_in : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 shift_reset : IN STD_LOGIC;
		 data_out : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
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

COMPONENT reg_4b_inc
	PORT(mr : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 ld : IN STD_LOGIC;
		 inc : IN STD_LOGIC;
		 d_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 q_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mx2x8
	PORT(EN : IN STD_LOGIC;
		 S0 : IN STD_LOGIC;
		 I0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 I1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 Y : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT debounce
GENERIC (counter_size : INTEGER
			);
	PORT(clk : IN STD_LOGIC;
		 button : IN STD_LOGIC;
		 moj_reset : IN STD_LOGIC;
		 result : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	cnt10 :  STD_LOGIC;
SIGNAL	d_inah :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	d_out :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	d_out_tri_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	data_out :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	inv_kclk :  STD_LOGIC;
SIGNAL	isEven :  STD_LOGIC;
SIGNAL	ldReg :  STD_LOGIC;
SIGNAL	overwrite :  STD_LOGIC;
SIGNAL	q_out :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	s_d_in :  STD_LOGIC;
SIGNAL	DFF_inst26 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	DFF_inst1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC;
SIGNAL	DFF_inst38 :  STD_LOGIC;
SIGNAL	DFF_inst39 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC;


BEGIN 
SYNTHESIZED_WIRE_16 <= '1';



b2v_inst : shiftregister
PORT MAP(data_in => s_d_in,
		 clk => inv_kclk,
		 shift_reset => mr,
		 data_out => data_out);


PROCESS(inv_kclk,mr)
BEGIN
IF (mr = '0') THEN
	DFF_inst1 <= '0';
ELSIF (RISING_EDGE(inv_kclk)) THEN
	DFF_inst1 <= DFF_inst26;
END IF;
END PROCESS;








PROCESS(d_out(7),overwrite)
BEGIN
if (overwrite = '1') THEN
	d_out_tri_ALTERA_SYNTHESIZED(7) <= d_out(7);
ELSE
	d_out_tri_ALTERA_SYNTHESIZED(7) <= 'Z';
END IF;
END PROCESS;


PROCESS(d_out(6),overwrite)
BEGIN
if (overwrite = '1') THEN
	d_out_tri_ALTERA_SYNTHESIZED(6) <= d_out(6);
ELSE
	d_out_tri_ALTERA_SYNTHESIZED(6) <= 'Z';
END IF;
END PROCESS;


PROCESS(d_out(5),overwrite)
BEGIN
if (overwrite = '1') THEN
	d_out_tri_ALTERA_SYNTHESIZED(5) <= d_out(5);
ELSE
	d_out_tri_ALTERA_SYNTHESIZED(5) <= 'Z';
END IF;
END PROCESS;


PROCESS(d_out(4),overwrite)
BEGIN
if (overwrite = '1') THEN
	d_out_tri_ALTERA_SYNTHESIZED(4) <= d_out(4);
ELSE
	d_out_tri_ALTERA_SYNTHESIZED(4) <= 'Z';
END IF;
END PROCESS;


b2v_inst2 : reg_8b
PORT MAP(mr => mr,
		 clk => sclk,
		 ld => SYNTHESIZED_WIRE_2,
		 d_in => SYNTHESIZED_WIRE_3,
		 q_out => d_out);


PROCESS(d_out(3),overwrite)
BEGIN
if (overwrite = '1') THEN
	d_out_tri_ALTERA_SYNTHESIZED(3) <= d_out(3);
ELSE
	d_out_tri_ALTERA_SYNTHESIZED(3) <= 'Z';
END IF;
END PROCESS;


PROCESS(d_out(2),overwrite)
BEGIN
if (overwrite = '1') THEN
	d_out_tri_ALTERA_SYNTHESIZED(2) <= d_out(2);
ELSE
	d_out_tri_ALTERA_SYNTHESIZED(2) <= 'Z';
END IF;
END PROCESS;


PROCESS(d_out(1),overwrite)
BEGIN
if (overwrite = '1') THEN
	d_out_tri_ALTERA_SYNTHESIZED(1) <= d_out(1);
ELSE
	d_out_tri_ALTERA_SYNTHESIZED(1) <= 'Z';
END IF;
END PROCESS;


PROCESS(d_out(0),overwrite)
BEGIN
if (overwrite = '1') THEN
	d_out_tri_ALTERA_SYNTHESIZED(0) <= d_out(0);
ELSE
	d_out_tri_ALTERA_SYNTHESIZED(0) <= 'Z';
END IF;
END PROCESS;


overwrite <= RD AND EN;



PROCESS(inv_kclk,mr)
BEGIN
IF (mr = '0') THEN
	DFF_inst26 <= '0';
ELSIF (RISING_EDGE(inv_kclk)) THEN
	DFF_inst26 <= SYNTHESIZED_WIRE_4;
END IF;
END PROCESS;





b2v_inst3 : reg_4b_inc
PORT MAP(mr => mr,
		 clk => inv_kclk,
		 ld => cnt10,
		 inc => DFF_inst1,
		 d_in => d_inah(3 DOWNTO 0),
		 q_out => q_out);








SYNTHESIZED_WIRE_0 <= SYNTHESIZED_WIRE_14 AND SYNTHESIZED_WIRE_15;


b2v_inst37 : mx2x8
PORT MAP(EN => SYNTHESIZED_WIRE_16,
		 S0 => overwrite,
		 I0 => data_out(8 DOWNTO 1),
		 I1 => d_inah,
		 Y => SYNTHESIZED_WIRE_3);


PROCESS(sclk,mr)
BEGIN
IF (mr = '0') THEN
	DFF_inst38 <= '0';
ELSIF (RISING_EDGE(sclk)) THEN
	DFF_inst38 <= kclk;
END IF;
END PROCESS;


PROCESS(sclk,mr)
BEGIN
IF (mr = '0') THEN
	DFF_inst39 <= '0';
ELSIF (RISING_EDGE(sclk)) THEN
	DFF_inst39 <= serial_data_in;
END IF;
END PROCESS;


cnt10 <= q_out(3) AND SYNTHESIZED_WIRE_17 AND q_out(1) AND SYNTHESIZED_WIRE_18;


b2v_inst40 : debounce
GENERIC MAP(counter_size => 8
			)
PORT MAP(clk => sclk,
		 button => DFF_inst38,
		 moj_reset => mr,
		 result => inv_kclk);



b2v_inst42 : debounce
GENERIC MAP(counter_size => 8
			)
PORT MAP(clk => sclk,
		 button => DFF_inst39,
		 moj_reset => mr,
		 result => s_d_in);







SYNTHESIZED_WIRE_2 <= cnt10 OR overwrite;


SYNTHESIZED_WIRE_17 <= NOT(q_out(2));




SYNTHESIZED_WIRE_18 <= NOT(q_out(0));



SYNTHESIZED_WIRE_1 <= SYNTHESIZED_WIRE_19;


SYNTHESIZED_WIRE_4 <= NOT(cnt10);



d_out_tri <= d_out_tri_ALTERA_SYNTHESIZED;

d_inah(0) <= '0';
d_inah(1) <= '0';
d_inah(2) <= '0';
d_inah(3) <= '0';
d_inah(7) <= '0';
d_inah(6) <= '0';
d_inah(5) <= '0';
d_inah(4) <= '0';
END bdf_type;