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
-- CREATED		"Thu Sep 15 13:03:24 2022"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY PLL IS 
	PORT
	(
		clk :  IN  STD_LOGIC;
		mr :  IN  STD_LOGIC;
		sclk :  OUT  STD_LOGIC;
		vclk :  OUT  STD_LOGIC
	);
END PLL;

ARCHITECTURE bdf_type OF PLL IS 

COMPONENT reg_2b_inc
	PORT(mr : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 ld : IN STD_LOGIC;
		 inc : IN STD_LOGIC;
		 d_in : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 q_out : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	d_in :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	q_out :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;


BEGIN 
sclk <= clk;



b2v_inst : reg_2b_inc
PORT MAP(mr => mr,
		 clk => clk,
		 ld => d_in(1),
		 inc => d_in(0),
		 d_in => d_in,
		 q_out => q_out);




SYNTHESIZED_WIRE_2 <= SYNTHESIZED_WIRE_0 AND q_out(0);


SYNTHESIZED_WIRE_1 <= q_out(1) AND q_out(0);


vclk <= SYNTHESIZED_WIRE_1 OR SYNTHESIZED_WIRE_2;


SYNTHESIZED_WIRE_0 <= NOT(q_out(1));



d_in(1) <= '0';
d_in(0) <= '1';
END bdf_type;