## Generated SDC file "TopLevel.sdc"

## Copyright (C) 1991-2013 Altera Corporation
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, Altera MegaCore Function License 
## Agreement, or other applicable license agreement, including, 
## without limitation, that your use is for the sole purpose of 
## programming logic devices manufactured by Altera and sold by 
## Altera or its authorized distributors.  Please refer to the 
## applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

## DATE    "Wed Sep 28 20:38:46 2022"

##
## DEVICE  "EP3C16F484C6"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {system_clock} -period 20.000 -waveform { 0.000 10.000 } [get_ports {clk}]
create_clock -name {ps2_clock} -period 100000.000 -waveform { 0.000 50000.000 } [get_ports {kclk}]
create_clock -name {debounced_ps2_clock} -period 100000.000 -waveform { 0.000 50000.000 } [get_registers {ps2controller:b2v_inst2|debounce:b2v_inst40|result}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************



#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay  -clock_fall -clock [get_clocks {ps2_clock}]  1.000 [get_ports {kdata}]
set_input_delay -add_delay  -clock [get_clocks {system_clock}]  1.000 [get_ports {mr}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {system_clock}]  1.000 [get_ports {debug[0]}]
set_output_delay -add_delay  -clock [get_clocks {system_clock}]  1.000 [get_ports {debug[1]}]
set_output_delay -add_delay  -clock [get_clocks {system_clock}]  1.000 [get_ports {debug[2]}]
set_output_delay -add_delay  -clock [get_clocks {system_clock}]  1.000 [get_ports {debug[3]}]
set_output_delay -add_delay  -clock [get_clocks {system_clock}]  1.000 [get_ports {debug[4]}]
set_output_delay -add_delay  -clock [get_clocks {system_clock}]  1.000 [get_ports {debug[5]}]
set_output_delay -add_delay  -clock [get_clocks {system_clock}]  1.000 [get_ports {debug[6]}]
set_output_delay -add_delay  -clock [get_clocks {system_clock}]  1.000 [get_ports {debug[7]}]


#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

