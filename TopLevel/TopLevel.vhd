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
-- CREATED		"Sun Sep 18 08:53:22 2022"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY TopLevel IS 
	PORT
	(
		clk :  IN  STD_LOGIC;
		mr :  IN  STD_LOGIC;
		busy :  INOUT  STD_LOGIC;
		rdwr :  OUT  STD_LOGIC;
		dbus_out :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END TopLevel;

ARCHITECTURE bdf_type OF TopLevel IS 

COMPONENT cpu
	PORT(mr : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 busy : INOUT STD_LOGIC;
		 dbus_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 rdwr : OUT STD_LOGIC;
		 abus : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 dbus_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT csrom
	PORT(A : IN STD_LOGIC_VECTOR(15 DOWNTO 12);
		 ENrom : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT rom_4kb_test
	PORT(clk : IN STD_LOGIC;
		 cs : IN STD_LOGIC;
		 addr : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
		 instr_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	abus :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;


BEGIN 



b2v_inst : cpu
PORT MAP(mr => mr,
		 clk => clk,
		 busy => busy,
		 dbus_in => SYNTHESIZED_WIRE_0,
		 rdwr => rdwr,
		 abus => abus,
		 dbus_out => dbus_out);


b2v_inst4 : csrom
PORT MAP(A => abus(15 DOWNTO 12),
		 ENrom => SYNTHESIZED_WIRE_1);


b2v_inst7 : rom_4kb_test
PORT MAP(clk => clk,
		 cs => SYNTHESIZED_WIRE_1,
		 addr => abus(11 DOWNTO 0),
		 instr_out => SYNTHESIZED_WIRE_0);


END bdf_type;