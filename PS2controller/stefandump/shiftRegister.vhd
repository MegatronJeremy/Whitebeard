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
-- CREATED		"Thu Sep 15 10:40:51 2022"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY shiftRegister IS 
	PORT
	(
		data_in :  IN  STD_LOGIC;
		shift_reset :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		data_out :  OUT  STD_LOGIC_VECTOR(10 DOWNTO 0)
	);
END shiftRegister;

ARCHITECTURE bdf_type OF shiftRegister IS 

SIGNAL	data_out_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(10 DOWNTO 0);


BEGIN 



PROCESS(clk,shift_reset)
BEGIN
IF (shift_reset = '0') THEN
	data_out_ALTERA_SYNTHESIZED(10) <= '0';
ELSIF (RISING_EDGE(clk)) THEN
	data_out_ALTERA_SYNTHESIZED(10) <= data_in;
END IF;
END PROCESS;


PROCESS(clk,shift_reset)
BEGIN
IF (shift_reset = '0') THEN
	data_out_ALTERA_SYNTHESIZED(9) <= '0';
ELSIF (RISING_EDGE(clk)) THEN
	data_out_ALTERA_SYNTHESIZED(9) <= data_out_ALTERA_SYNTHESIZED(10);
END IF;
END PROCESS;


PROCESS(clk,shift_reset)
BEGIN
IF (shift_reset = '0') THEN
	data_out_ALTERA_SYNTHESIZED(1) <= '0';
ELSIF (RISING_EDGE(clk)) THEN
	data_out_ALTERA_SYNTHESIZED(1) <= data_out_ALTERA_SYNTHESIZED(2);
END IF;
END PROCESS;


PROCESS(clk,shift_reset)
BEGIN
IF (shift_reset = '0') THEN
	data_out_ALTERA_SYNTHESIZED(0) <= '0';
ELSIF (RISING_EDGE(clk)) THEN
	data_out_ALTERA_SYNTHESIZED(0) <= data_out_ALTERA_SYNTHESIZED(1);
END IF;
END PROCESS;


PROCESS(clk,shift_reset)
BEGIN
IF (shift_reset = '0') THEN
	data_out_ALTERA_SYNTHESIZED(8) <= '0';
ELSIF (RISING_EDGE(clk)) THEN
	data_out_ALTERA_SYNTHESIZED(8) <= data_out_ALTERA_SYNTHESIZED(9);
END IF;
END PROCESS;


PROCESS(clk,shift_reset)
BEGIN
IF (shift_reset = '0') THEN
	data_out_ALTERA_SYNTHESIZED(7) <= '0';
ELSIF (RISING_EDGE(clk)) THEN
	data_out_ALTERA_SYNTHESIZED(7) <= data_out_ALTERA_SYNTHESIZED(8);
END IF;
END PROCESS;


PROCESS(clk,shift_reset)
BEGIN
IF (shift_reset = '0') THEN
	data_out_ALTERA_SYNTHESIZED(6) <= '0';
ELSIF (RISING_EDGE(clk)) THEN
	data_out_ALTERA_SYNTHESIZED(6) <= data_out_ALTERA_SYNTHESIZED(7);
END IF;
END PROCESS;


PROCESS(clk,shift_reset)
BEGIN
IF (shift_reset = '0') THEN
	data_out_ALTERA_SYNTHESIZED(5) <= '0';
ELSIF (RISING_EDGE(clk)) THEN
	data_out_ALTERA_SYNTHESIZED(5) <= data_out_ALTERA_SYNTHESIZED(6);
END IF;
END PROCESS;


PROCESS(clk,shift_reset)
BEGIN
IF (shift_reset = '0') THEN
	data_out_ALTERA_SYNTHESIZED(4) <= '0';
ELSIF (RISING_EDGE(clk)) THEN
	data_out_ALTERA_SYNTHESIZED(4) <= data_out_ALTERA_SYNTHESIZED(5);
END IF;
END PROCESS;


PROCESS(clk,shift_reset)
BEGIN
IF (shift_reset = '0') THEN
	data_out_ALTERA_SYNTHESIZED(3) <= '0';
ELSIF (RISING_EDGE(clk)) THEN
	data_out_ALTERA_SYNTHESIZED(3) <= data_out_ALTERA_SYNTHESIZED(4);
END IF;
END PROCESS;


PROCESS(clk,shift_reset)
BEGIN
IF (shift_reset = '0') THEN
	data_out_ALTERA_SYNTHESIZED(2) <= '0';
ELSIF (RISING_EDGE(clk)) THEN
	data_out_ALTERA_SYNTHESIZED(2) <= data_out_ALTERA_SYNTHESIZED(3);
END IF;
END PROCESS;

data_out <= data_out_ALTERA_SYNTHESIZED;

END bdf_type;