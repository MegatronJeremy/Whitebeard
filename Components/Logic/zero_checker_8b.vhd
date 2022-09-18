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
-- CREATED		"Sun Sep 18 09:02:17 2022"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY zero_checker_8b IS 
	PORT
	(
		data_in :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		zero :  OUT  STD_LOGIC
	);
END zero_checker_8b;

ARCHITECTURE bdf_type OF zero_checker_8b IS 

SIGNAL	AB :  STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 



zero <= NOT(AB(5) OR AB(6) OR AB(4) OR AB(2) OR AB(3) OR AB(1) OR AB(7) OR AB(0));

AB <= data_in;

END bdf_type;