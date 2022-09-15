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
-- CREATED		"Thu Sep 15 12:43:55 2022"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY CSrom IS 
	PORT
	(
		A :  IN  STD_LOGIC_VECTOR(15 DOWNTO 12);
		ENrom :  OUT  STD_LOGIC
	);
END CSrom;

ARCHITECTURE bdf_type OF CSrom IS 

SIGNAL	A0 :  STD_LOGIC;
SIGNAL	A1 :  STD_LOGIC;
SIGNAL	A2 :  STD_LOGIC;
SIGNAL	A3 :  STD_LOGIC;


BEGIN 



ENrom <= NOT(A2 OR A3 OR A1 OR A0);

A2 <= A(14);

A0 <= A(12);
A1 <= A(13);
A2 <= A(14);
A3 <= A(15);
END bdf_type;