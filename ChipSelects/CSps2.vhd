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
-- CREATED		"Thu Sep 15 12:39:54 2022"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY CSps2 IS 
	PORT
	(
		A :  IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		ENps2 :  OUT  STD_LOGIC
	);
END CSps2;

ARCHITECTURE bdf_type OF CSps2 IS 

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;


BEGIN 



SYNTHESIZED_WIRE_2 <= SYNTHESIZED_WIRE_0 AND SYNTHESIZED_WIRE_1 AND A(13) AND A(12);


SYNTHESIZED_WIRE_3 <= NOT(A(10) OR A(11) OR A(9) OR A(8));


SYNTHESIZED_WIRE_0 <= NOT(A(15));



SYNTHESIZED_WIRE_1 <= NOT(A(14));



ENps2 <= SYNTHESIZED_WIRE_2 AND SYNTHESIZED_WIRE_3 AND SYNTHESIZED_WIRE_4 AND SYNTHESIZED_WIRE_5;


SYNTHESIZED_WIRE_5 <= NOT(A(2) OR A(3) OR A(1) OR A(0));


SYNTHESIZED_WIRE_4 <= NOT(A(6) OR A(7) OR A(5) OR A(4));


END bdf_type;