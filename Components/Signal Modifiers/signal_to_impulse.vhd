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
-- CREATED		"Fri Sep 23 10:39:06 2022"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY signal_to_impulse IS 
	PORT
	(
		in_signal :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		mr :  IN  STD_LOGIC;
		out_impulse :  OUT  STD_LOGIC
	);
END signal_to_impulse;

ARCHITECTURE bdf_type OF signal_to_impulse IS 

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	DFF_inst :  STD_LOGIC;


BEGIN 



PROCESS(clk,mr)
BEGIN
IF (mr = '0') THEN
	DFF_inst <= '0';
ELSIF (RISING_EDGE(clk)) THEN
	DFF_inst <= in_signal;
END IF;
END PROCESS;


out_impulse <= in_signal AND SYNTHESIZED_WIRE_0;


SYNTHESIZED_WIRE_0 <= NOT(DFF_inst);



END bdf_type;