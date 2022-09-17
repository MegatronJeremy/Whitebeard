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
-- CREATED		"Sat Sep 17 11:19:56 2022"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY reg_2b_clr IS 
	PORT
	(
		ld :  IN  STD_LOGIC;
		mr :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		clr :  IN  STD_LOGIC;
		d_in :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		d_out :  OUT  STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END reg_2b_clr;

ARCHITECTURE bdf_type OF reg_2b_clr IS 

SIGNAL	d_out_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	uslov :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;


BEGIN 



PROCESS(clk,mr)
BEGIN
IF (mr = '0') THEN
	d_out_ALTERA_SYNTHESIZED(1) <= '0';
ELSIF (RISING_EDGE(clk)) THEN
	IF (SYNTHESIZED_WIRE_5 = '1') THEN
	d_out_ALTERA_SYNTHESIZED(1) <= SYNTHESIZED_WIRE_0;
	END IF;
END IF;
END PROCESS;


SYNTHESIZED_WIRE_0 <= d_in(1) AND uslov;


SYNTHESIZED_WIRE_2 <= d_in(0) AND uslov;


PROCESS(clk,mr)
BEGIN
IF (mr = '0') THEN
	d_out_ALTERA_SYNTHESIZED(0) <= '0';
ELSIF (RISING_EDGE(clk)) THEN
	IF (SYNTHESIZED_WIRE_5 = '1') THEN
	d_out_ALTERA_SYNTHESIZED(0) <= SYNTHESIZED_WIRE_2;
	END IF;
END IF;
END PROCESS;


SYNTHESIZED_WIRE_5 <= clr OR ld;


uslov <= ld AND SYNTHESIZED_WIRE_4;


SYNTHESIZED_WIRE_4 <= NOT(clr);


d_out <= d_out_ALTERA_SYNTHESIZED;

END bdf_type;