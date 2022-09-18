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
-- CREATED		"Sun Sep 18 10:16:53 2022"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY nzcv_gen IS 
	PORT
	(
		C :  IN  STD_LOGIC;
		ALU7 :  IN  STD_LOGIC;
		ADD :  IN  STD_LOGIC;
		SUB :  IN  STD_LOGIC;
		AB :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		BB :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		nzcv :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END nzcv_gen;

ARCHITECTURE bdf_type OF nzcv_gen IS 

COMPONENT cascade
	PORT(A_IN : IN STD_LOGIC;
		 A_OUT : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	nzcv_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC;


BEGIN 



b2v_inst : cascade
PORT MAP(A_IN => AB(7),
		 A_OUT => nzcv_ALTERA_SYNTHESIZED(3));


SYNTHESIZED_WIRE_10 <= SYNTHESIZED_WIRE_0 OR SYNTHESIZED_WIRE_1;


SYNTHESIZED_WIRE_11 <= SYNTHESIZED_WIRE_2 OR SYNTHESIZED_WIRE_3;


SYNTHESIZED_WIRE_1 <= SYNTHESIZED_WIRE_4 AND SYNTHESIZED_WIRE_5 AND ALU7;


SYNTHESIZED_WIRE_0 <= BB(7) AND AB(7) AND SYNTHESIZED_WIRE_6;


SYNTHESIZED_WIRE_3 <= SYNTHESIZED_WIRE_7 AND BB(7) AND ALU7;


SYNTHESIZED_WIRE_2 <= AB(7) AND SYNTHESIZED_WIRE_8 AND SYNTHESIZED_WIRE_9;


SYNTHESIZED_WIRE_4 <= NOT(AB(7));



SYNTHESIZED_WIRE_5 <= NOT(BB(7));



SYNTHESIZED_WIRE_6 <= NOT(ALU7);



SYNTHESIZED_WIRE_7 <= NOT(AB(7));



SYNTHESIZED_WIRE_9 <= NOT(ALU7);



SYNTHESIZED_WIRE_8 <= NOT(BB(7));



nzcv_ALTERA_SYNTHESIZED(2) <= NOT(AB(5) OR AB(6) OR AB(4) OR AB(2) OR AB(3) OR AB(1) OR AB(7) OR AB(0));


SYNTHESIZED_WIRE_13 <= ADD AND SYNTHESIZED_WIRE_10;


SYNTHESIZED_WIRE_12 <= SUB AND SYNTHESIZED_WIRE_11;


nzcv_ALTERA_SYNTHESIZED(0) <= SYNTHESIZED_WIRE_12 OR SYNTHESIZED_WIRE_13;

nzcv <= nzcv_ALTERA_SYNTHESIZED;

nzcv_ALTERA_SYNTHESIZED(1) <= C;
END bdf_type;