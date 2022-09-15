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
-- CREATED		"Thu Sep 15 12:40:06 2022"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY CSram IS 
	PORT
	(
		A :  IN  STD_LOGIC_VECTOR(15 DOWNTO 12);
		ENram :  OUT  STD_LOGIC
	);
END CSram;

ARCHITECTURE bdf_type OF CSram IS 

SIGNAL	A0 :  STD_LOGIC;
SIGNAL	A1 :  STD_LOGIC;
SIGNAL	A2 :  STD_LOGIC;
SIGNAL	A3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;


BEGIN 



SYNTHESIZED_WIRE_4 <= SYNTHESIZED_WIRE_0 AND SYNTHESIZED_WIRE_1 AND SYNTHESIZED_WIRE_2 AND A0;


ENram <= SYNTHESIZED_WIRE_3 OR SYNTHESIZED_WIRE_4;


SYNTHESIZED_WIRE_0 <= NOT(A3);



SYNTHESIZED_WIRE_1 <= NOT(A2);



SYNTHESIZED_WIRE_2 <= NOT(A1);



SYNTHESIZED_WIRE_5 <= NOT(A3);



SYNTHESIZED_WIRE_6 <= NOT(A2);



SYNTHESIZED_WIRE_7 <= NOT(A0);



SYNTHESIZED_WIRE_3 <= SYNTHESIZED_WIRE_5 AND SYNTHESIZED_WIRE_6 AND A1 AND SYNTHESIZED_WIRE_7;

A3 <= A(15);

A0 <= A(12);
A1 <= A(13);
A2 <= A(14);
A3 <= A(15);
END bdf_type;