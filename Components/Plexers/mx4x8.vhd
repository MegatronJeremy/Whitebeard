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
-- CREATED		"Sun Sep 18 09:03:00 2022"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY mx4x8 IS 
	PORT
	(
		EN :  IN  STD_LOGIC;
		S0 :  IN  STD_LOGIC;
		S1 :  IN  STD_LOGIC;
		I0 :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		I1 :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		I2 :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		I3 :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		Y :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END mx4x8;

ARCHITECTURE bdf_type OF mx4x8 IS 

COMPONENT mx2x8
	PORT(EN : IN STD_LOGIC;
		 S0 : IN STD_LOGIC;
		 I0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 I1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 Y : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 



b2v_inst : mx2x8
PORT MAP(EN => EN,
		 S0 => S0,
		 I0 => I0,
		 I1 => I1,
		 Y => SYNTHESIZED_WIRE_0);


b2v_inst2 : mx2x8
PORT MAP(EN => EN,
		 S0 => S0,
		 I0 => I2,
		 I1 => I3,
		 Y => SYNTHESIZED_WIRE_1);


b2v_inst3 : mx2x8
PORT MAP(EN => EN,
		 S0 => S1,
		 I0 => SYNTHESIZED_WIRE_0,
		 I1 => SYNTHESIZED_WIRE_1,
		 Y => Y);


END bdf_type;