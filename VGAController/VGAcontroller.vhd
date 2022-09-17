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
-- CREATED		"Sat Sep 17 02:04:41 2022"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY VGAcontroller IS 
	PORT
	(
		VCLK :  IN  STD_LOGIC;
		MRST :  IN  STD_LOGIC;
		HSync :  OUT  STD_LOGIC;
		VSync :  OUT  STD_LOGIC;
		R :  OUT  STD_LOGIC;
		G :  OUT  STD_LOGIC;
		B :  OUT  STD_LOGIC
	);
END VGAcontroller;

ARCHITECTURE bdf_type OF VGAcontroller IS 

COMPONENT cnt_10b
	PORT(rst : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 o : OUT STD_LOGIC_VECTOR(0 TO 9)
	);
END COMPONENT;

SIGNAL	clrX :  STD_LOGIC;
SIGNAL	clrY :  STD_LOGIC;
SIGNAL	notVisibleX :  STD_LOGIC;
SIGNAL	notVisibleY :  STD_LOGIC;
SIGNAL	rstHSYNC :  STD_LOGIC;
SIGNAL	rstVSYNC :  STD_LOGIC;
SIGNAL	setHSYNC :  STD_LOGIC;
SIGNAL	setNotVisibleX :  STD_LOGIC;
SIGNAL	setNotVisibleY :  STD_LOGIC;
SIGNAL	setVSYNC :  STD_LOGIC;
SIGNAL	xOut :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	yOut :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_21 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_22 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_23 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_24 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_25 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_26 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_27 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_28 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_29 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_30 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_31 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_32 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_33 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_34 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_35 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_36 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_37 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_38 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_39 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_40 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_41 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_42 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_43 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_44 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_45 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_46 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_47 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_48 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_49 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_50 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_51 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_52 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_53 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_54 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_55 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_56 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_57 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_58 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_59 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_60 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_61 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_62 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_63 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_64 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_65 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_66 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_67 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_68 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_69 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_70 :  STD_LOGIC;
SIGNAL	JKFF_inst11 :  STD_LOGIC;
SIGNAL	JKFF_inst4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_73 :  STD_LOGIC;


BEGIN 
R <= SYNTHESIZED_WIRE_73;
G <= SYNTHESIZED_WIRE_73;
B <= SYNTHESIZED_WIRE_73;
SYNTHESIZED_WIRE_0 <= '1';
SYNTHESIZED_WIRE_1 <= '1';
SYNTHESIZED_WIRE_2 <= '1';
SYNTHESIZED_WIRE_8 <= '1';
SYNTHESIZED_WIRE_9 <= '1';
SYNTHESIZED_WIRE_10 <= '1';
SYNTHESIZED_WIRE_18 <= '1';
SYNTHESIZED_WIRE_19 <= '1';
SYNTHESIZED_WIRE_27 <= '1';
SYNTHESIZED_WIRE_28 <= '1';
SYNTHESIZED_WIRE_30 <= '1';
SYNTHESIZED_WIRE_36 <= '1';
SYNTHESIZED_WIRE_37 <= '1';
SYNTHESIZED_WIRE_45 <= '1';
SYNTHESIZED_WIRE_46 <= '1';
SYNTHESIZED_WIRE_52 <= '1';
SYNTHESIZED_WIRE_54 <= '1';
SYNTHESIZED_WIRE_61 <= '1';
SYNTHESIZED_WIRE_62 <= '1';
SYNTHESIZED_WIRE_63 <= '1';



b2v_inst10 : cnt_10b
PORT MAP(rst => clrY,
		 clk => VCLK,
		 o => yOut);


PROCESS(VCLK)
VARIABLE synthesized_var_for_JKFF_inst11 : STD_LOGIC;
BEGIN
IF (RISING_EDGE(VCLK)) THEN
	synthesized_var_for_JKFF_inst11 := (NOT(synthesized_var_for_JKFF_inst11) AND setHSYNC) OR (synthesized_var_for_JKFF_inst11 AND (NOT(rstHSYNC)));
END IF;
	JKFF_inst11 <= synthesized_var_for_JKFF_inst11;
END PROCESS;


PROCESS(VCLK)
VARIABLE synthesized_var_for_notVisibleX : STD_LOGIC;
BEGIN
IF (RISING_EDGE(VCLK)) THEN
	synthesized_var_for_notVisibleX := (NOT(synthesized_var_for_notVisibleX) AND setNotVisibleX) OR (synthesized_var_for_notVisibleX AND (NOT(clrX)));
END IF;
	notVisibleX <= synthesized_var_for_notVisibleX;
END PROCESS;


SYNTHESIZED_WIRE_26 <= NOT(xOut(6));



SYNTHESIZED_WIRE_24 <= NOT(xOut(5));



SYNTHESIZED_WIRE_25 <= NOT(xOut(4));



SYNTHESIZED_WIRE_23 <= NOT(xOut(3));



SYNTHESIZED_WIRE_6 <= NOT(SYNTHESIZED_WIRE_0 AND yOut(8) AND SYNTHESIZED_WIRE_1 AND yOut(7) AND SYNTHESIZED_WIRE_2 AND SYNTHESIZED_WIRE_3 AND yOut(1) AND SYNTHESIZED_WIRE_4 AND yOut(3) AND yOut(5) AND SYNTHESIZED_WIRE_5 AND yOut(6));


SYNTHESIZED_WIRE_22 <= NOT(xOut(0));



SYNTHESIZED_WIRE_17 <= NOT(xOut(8));



b2v_inst2 : cnt_10b
PORT MAP(rst => clrX,
		 clk => VCLK,
		 o => xOut);


SYNTHESIZED_WIRE_21 <= NOT(xOut(1));



SYNTHESIZED_WIRE_20 <= NOT(xOut(2));



SYNTHESIZED_WIRE_35 <= NOT(xOut(8));



SYNTHESIZED_WIRE_44 <= NOT(xOut(8));



SYNTHESIZED_WIRE_43 <= NOT(xOut(6));



SYNTHESIZED_WIRE_42 <= NOT(xOut(5));



SYNTHESIZED_WIRE_41 <= NOT(xOut(3));



SYNTHESIZED_WIRE_38 <= NOT(xOut(2));



SYNTHESIZED_WIRE_39 <= NOT(xOut(1));



SYNTHESIZED_WIRE_40 <= NOT(xOut(0));



SYNTHESIZED_WIRE_50 <= NOT(xOut(3));



setVSYNC <= NOT(SYNTHESIZED_WIRE_6);



rstVSYNC <= NOT(SYNTHESIZED_WIRE_7);



SYNTHESIZED_WIRE_60 <= NOT(xOut(6));



SYNTHESIZED_WIRE_7 <= NOT(SYNTHESIZED_WIRE_8 AND yOut(8) AND SYNTHESIZED_WIRE_9 AND yOut(7) AND SYNTHESIZED_WIRE_10 AND yOut(2) AND SYNTHESIZED_WIRE_11 AND SYNTHESIZED_WIRE_12 AND yOut(3) AND yOut(5) AND SYNTHESIZED_WIRE_13 AND yOut(6));


SYNTHESIZED_WIRE_47 <= NOT(xOut(2));



SYNTHESIZED_WIRE_48 <= NOT(xOut(1));



SYNTHESIZED_WIRE_49 <= NOT(xOut(0));



SYNTHESIZED_WIRE_58 <= NOT(xOut(3));



SYNTHESIZED_WIRE_55 <= NOT(xOut(2));



PROCESS(VCLK)
VARIABLE synthesized_var_for_JKFF_inst4 : STD_LOGIC;
BEGIN
IF (RISING_EDGE(VCLK)) THEN
	synthesized_var_for_JKFF_inst4 := (NOT(synthesized_var_for_JKFF_inst4) AND setVSYNC) OR (synthesized_var_for_JKFF_inst4 AND (NOT(rstVSYNC)));
END IF;
	JKFF_inst4 <= synthesized_var_for_JKFF_inst4;
END PROCESS;


SYNTHESIZED_WIRE_56 <= NOT(xOut(1));



SYNTHESIZED_WIRE_57 <= NOT(xOut(0));



setNotVisibleX <= NOT(SYNTHESIZED_WIRE_14);



setHSYNC <= NOT(SYNTHESIZED_WIRE_15);



clrX <= NOT(SYNTHESIZED_WIRE_16);



SYNTHESIZED_WIRE_59 <= NOT(xOut(4));



SYNTHESIZED_WIRE_53 <= NOT(yOut(7));




SYNTHESIZED_WIRE_14 <= NOT(xOut(9) AND SYNTHESIZED_WIRE_17 AND SYNTHESIZED_WIRE_18 AND xOut(7) AND SYNTHESIZED_WIRE_19 AND SYNTHESIZED_WIRE_20 AND SYNTHESIZED_WIRE_21 AND SYNTHESIZED_WIRE_22 AND SYNTHESIZED_WIRE_23 AND SYNTHESIZED_WIRE_24 AND SYNTHESIZED_WIRE_25 AND SYNTHESIZED_WIRE_26);









SYNTHESIZED_WIRE_70 <= NOT(SYNTHESIZED_WIRE_27 AND yOut(8) AND SYNTHESIZED_WIRE_28 AND SYNTHESIZED_WIRE_29 AND SYNTHESIZED_WIRE_30 AND yOut(2) AND SYNTHESIZED_WIRE_31 AND yOut(0) AND yOut(3) AND SYNTHESIZED_WIRE_32 AND SYNTHESIZED_WIRE_33 AND SYNTHESIZED_WIRE_34);




SYNTHESIZED_WIRE_15 <= NOT(xOut(9) AND SYNTHESIZED_WIRE_35 AND SYNTHESIZED_WIRE_36 AND xOut(7) AND SYNTHESIZED_WIRE_37 AND SYNTHESIZED_WIRE_38 AND SYNTHESIZED_WIRE_39 AND SYNTHESIZED_WIRE_40 AND SYNTHESIZED_WIRE_41 AND SYNTHESIZED_WIRE_42 AND xOut(4) AND SYNTHESIZED_WIRE_43);












SYNTHESIZED_WIRE_69 <= NOT(xOut(9) AND SYNTHESIZED_WIRE_44 AND SYNTHESIZED_WIRE_45 AND xOut(7) AND SYNTHESIZED_WIRE_46 AND SYNTHESIZED_WIRE_47 AND SYNTHESIZED_WIRE_48 AND SYNTHESIZED_WIRE_49 AND SYNTHESIZED_WIRE_50 AND xOut(5) AND xOut(4) AND xOut(6));


SYNTHESIZED_WIRE_68 <= NOT(yOut(4));



SYNTHESIZED_WIRE_67 <= NOT(yOut(3));



SYNTHESIZED_WIRE_64 <= NOT(yOut(2));



SYNTHESIZED_WIRE_65 <= NOT(yOut(1));



SYNTHESIZED_WIRE_66 <= NOT(yOut(0));



SYNTHESIZED_WIRE_5 <= NOT(yOut(4));



setNotVisibleY <= NOT(SYNTHESIZED_WIRE_51);



SYNTHESIZED_WIRE_3 <= NOT(yOut(2));



PROCESS(VCLK)
VARIABLE synthesized_var_for_notVisibleY : STD_LOGIC;
BEGIN
IF (RISING_EDGE(VCLK)) THEN
	synthesized_var_for_notVisibleY := (NOT(synthesized_var_for_notVisibleY) AND setNotVisibleY) OR (synthesized_var_for_notVisibleY AND (NOT(clrY)));
END IF;
	notVisibleY <= synthesized_var_for_notVisibleY;
END PROCESS;


SYNTHESIZED_WIRE_4 <= NOT(yOut(0));



SYNTHESIZED_WIRE_16 <= NOT(xOut(9) AND xOut(8) AND SYNTHESIZED_WIRE_52 AND SYNTHESIZED_WIRE_53 AND SYNTHESIZED_WIRE_54 AND SYNTHESIZED_WIRE_55 AND SYNTHESIZED_WIRE_56 AND SYNTHESIZED_WIRE_57 AND SYNTHESIZED_WIRE_58 AND xOut(5) AND SYNTHESIZED_WIRE_59 AND SYNTHESIZED_WIRE_60);


SYNTHESIZED_WIRE_11 <= NOT(yOut(1));



SYNTHESIZED_WIRE_12 <= NOT(yOut(0));



SYNTHESIZED_WIRE_29 <= NOT(yOut(7));



SYNTHESIZED_WIRE_33 <= NOT(yOut(4));



SYNTHESIZED_WIRE_34 <= NOT(yOut(6));



SYNTHESIZED_WIRE_32 <= NOT(yOut(5));



SYNTHESIZED_WIRE_31 <= NOT(yOut(1));



SYNTHESIZED_WIRE_13 <= NOT(yOut(4));



SYNTHESIZED_WIRE_51 <= NOT(SYNTHESIZED_WIRE_61 AND yOut(8) AND SYNTHESIZED_WIRE_62 AND yOut(7) AND SYNTHESIZED_WIRE_63 AND SYNTHESIZED_WIRE_64 AND SYNTHESIZED_WIRE_65 AND SYNTHESIZED_WIRE_66 AND SYNTHESIZED_WIRE_67 AND yOut(5) AND SYNTHESIZED_WIRE_68 AND yOut(6));


rstHSYNC <= NOT(SYNTHESIZED_WIRE_69);



clrY <= NOT(SYNTHESIZED_WIRE_70);



HSync <= NOT(JKFF_inst11);



VSync <= NOT(JKFF_inst4);



SYNTHESIZED_WIRE_73 <= NOT(notVisibleY AND notVisibleX);


END bdf_type;