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
-- CREATED		"Thu Sep 29 15:24:06 2022"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY TopLevel IS 
	PORT
	(
		mr :  IN  STD_LOGIC;
		kclk :  IN  STD_LOGIC;
		kdata :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		debug :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END TopLevel;

ARCHITECTURE bdf_type OF TopLevel IS 

COMPONENT cpu
	PORT(clk : IN STD_LOGIC;
		 mr : IN STD_LOGIC;
		 intr : IN STD_LOGIC;
		 busy : IN STD_LOGIC;
		 dram_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 instr_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 ps2_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 rdwr : OUT STD_LOGIC;
		 abus : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 dbus_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT arr_ram_8kb
GENERIC (addr_width : INTEGER;
			data_width : INTEGER
			);
	PORT(clk : IN STD_LOGIC;
		 cs : IN STD_LOGIC;
		 rdwr : IN STD_LOGIC;
		 addr : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
		 data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 data_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT csrom
	PORT(A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 ENrom : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT csram
	PORT(A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 ENram : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT ps2controller
	PORT(mr : IN STD_LOGIC;
		 sclk : IN STD_LOGIC;
		 EN : IN STD_LOGIC;
		 kclk : IN STD_LOGIC;
		 serial_data_in : IN STD_LOGIC;
		 intr_k : OUT STD_LOGIC;
		 d_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT csdebug
	PORT(WR : IN STD_LOGIC;
		 A : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 ENdebug : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT rom_4kb_test_cpu
	PORT(cs : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 rd : IN STD_LOGIC;
		 addr : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
		 instr_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT csps2
	PORT(RD : IN STD_LOGIC;
		 A : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 ENps2 : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT reg_8b
	PORT(mr : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 ld : IN STD_LOGIC;
		 d_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 q_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	abus :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	busy :  STD_LOGIC;
SIGNAL	dbus_out :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	dram_out :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	ps2_out :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	rdwr :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;


BEGIN 



b2v_inst : cpu
PORT MAP(clk => clk,
		 mr => mr,
		 intr => SYNTHESIZED_WIRE_0,
		 busy => busy,
		 dram_in => dram_out,
		 instr_in => SYNTHESIZED_WIRE_1,
		 ps2_in => ps2_out,
		 rdwr => rdwr,
		 abus => abus,
		 dbus_out => dbus_out);


b2v_inst1 : arr_ram_8kb
GENERIC MAP(addr_width => 13,
			data_width => 8
			)
PORT MAP(clk => clk,
		 cs => SYNTHESIZED_WIRE_2,
		 rdwr => rdwr,
		 addr => abus(12 DOWNTO 0),
		 data_in => dbus_out,
		 data_out => dram_out);


b2v_inst10 : csrom
PORT MAP(A => abus(15 DOWNTO 12),
		 ENrom => SYNTHESIZED_WIRE_4);


b2v_inst11 : csram
PORT MAP(A => abus(15 DOWNTO 12),
		 ENram => SYNTHESIZED_WIRE_2);


b2v_inst2 : ps2controller
PORT MAP(mr => mr,
		 sclk => clk,
		 EN => SYNTHESIZED_WIRE_3,
		 kclk => kclk,
		 serial_data_in => kdata,
		 intr_k => SYNTHESIZED_WIRE_0,
		 d_out => ps2_out);


b2v_inst3 : csdebug
PORT MAP(WR => rdwr,
		 A => abus,
		 ENdebug => SYNTHESIZED_WIRE_5);


b2v_inst5 : rom_4kb_test_cpu
PORT MAP(cs => SYNTHESIZED_WIRE_4,
		 clk => clk,
		 rd => rdwr,
		 addr => abus(11 DOWNTO 0),
		 instr_out => SYNTHESIZED_WIRE_1);


b2v_inst6 : csps2
PORT MAP(RD => rdwr,
		 A => abus,
		 ENps2 => SYNTHESIZED_WIRE_3);



b2v_inst9 : reg_8b
PORT MAP(mr => mr,
		 clk => clk,
		 ld => SYNTHESIZED_WIRE_5,
		 d_in => dbus_out,
		 q_out => debug);


busy <= '0';
END bdf_type;