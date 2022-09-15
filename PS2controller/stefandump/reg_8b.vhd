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
-- CREATED		"Thu Sep 15 11:17:24 2022"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY reg_8b IS 
	PORT
	(
		ld :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		mr :  IN  STD_LOGIC;
		d_in :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		d_out :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END reg_8b;

ARCHITECTURE bdf_type OF reg_8b IS 

SIGNAL	d_out_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 



PROCESS(clk,mr)
BEGIN
IF (mr = '0') THEN
	d_out_ALTERA_SYNTHESIZED(1) <= '0';
ELSIF (RISING_EDGE(clk)) THEN
	IF (ld = '1') THEN
	d_out_ALTERA_SYNTHESIZED(1) <= d_in(1);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,mr)
BEGIN
IF (mr = '0') THEN
	d_out_ALTERA_SYNTHESIZED(2) <= '0';
ELSIF (RISING_EDGE(clk)) THEN
	IF (ld = '1') THEN
	d_out_ALTERA_SYNTHESIZED(2) <= d_in(2);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,mr)
BEGIN
IF (mr = '0') THEN
	d_out_ALTERA_SYNTHESIZED(3) <= '0';
ELSIF (RISING_EDGE(clk)) THEN
	IF (ld = '1') THEN
	d_out_ALTERA_SYNTHESIZED(3) <= d_in(3);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,mr)
BEGIN
IF (mr = '0') THEN
	d_out_ALTERA_SYNTHESIZED(4) <= '0';
ELSIF (RISING_EDGE(clk)) THEN
	IF (ld = '1') THEN
	d_out_ALTERA_SYNTHESIZED(4) <= d_in(4);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,mr)
BEGIN
IF (mr = '0') THEN
	d_out_ALTERA_SYNTHESIZED(5) <= '0';
ELSIF (RISING_EDGE(clk)) THEN
	IF (ld = '1') THEN
	d_out_ALTERA_SYNTHESIZED(5) <= d_in(5);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,mr)
BEGIN
IF (mr = '0') THEN
	d_out_ALTERA_SYNTHESIZED(6) <= '0';
ELSIF (RISING_EDGE(clk)) THEN
	IF (ld = '1') THEN
	d_out_ALTERA_SYNTHESIZED(6) <= d_in(6);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,mr)
BEGIN
IF (mr = '0') THEN
	d_out_ALTERA_SYNTHESIZED(7) <= '0';
ELSIF (RISING_EDGE(clk)) THEN
	IF (ld = '1') THEN
	d_out_ALTERA_SYNTHESIZED(7) <= d_in(7);
	END IF;
END IF;
END PROCESS;


PROCESS(clk,mr)
BEGIN
IF (mr = '0') THEN
	d_out_ALTERA_SYNTHESIZED(0) <= '0';
ELSIF (RISING_EDGE(clk)) THEN
	IF (ld = '1') THEN
	d_out_ALTERA_SYNTHESIZED(0) <= d_in(0);
	END IF;
END IF;
END PROCESS;

d_out <= d_out_ALTERA_SYNTHESIZED;

END bdf_type;