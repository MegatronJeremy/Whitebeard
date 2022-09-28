## Generated SDC file "topir.sdc"

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

## DATE    "Wed Sep 28 20:24:05 2022"

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

create_clock -name {system_clock} -period 20.000 -waveform { 0.000 10.000 } [get_ports {sclk}]
create_clock -name {ps2_clock} -period 100000.000 -waveform { 0.000 50000.000 } [get_ports {kclk}]


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

set_input_delay -add_delay  -clock [get_clocks {system_clock}]  1.000 [get_ports {EN}]
set_input_delay -add_delay  -clock [get_clocks {system_clock}]  1.000 [get_ports {mr}]
set_input_delay -add_delay  -clock_fall -clock [get_clocks {ps2_clock}]  1.000 [get_ports {serial_data_in}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {system_clock}]  1.000 [get_ports {d_out_tri[0]}]
set_output_delay -add_delay  -clock [get_clocks {system_clock}]  1.000 [get_ports {d_out_tri[1]}]
set_output_delay -add_delay  -clock [get_clocks {system_clock}]  1.000 [get_ports {d_out_tri[2]}]
set_output_delay -add_delay  -clock [get_clocks {system_clock}]  1.000 [get_ports {d_out_tri[3]}]
set_output_delay -add_delay  -clock [get_clocks {system_clock}]  1.000 [get_ports {d_out_tri[4]}]
set_output_delay -add_delay  -clock [get_clocks {system_clock}]  1.000 [get_ports {d_out_tri[5]}]
set_output_delay -add_delay  -clock [get_clocks {system_clock}]  1.000 [get_ports {d_out_tri[6]}]
set_output_delay -add_delay  -clock [get_clocks {system_clock}]  1.000 [get_ports {d_out_tri[7]}]
set_output_delay -add_delay  -clock [get_clocks {system_clock}]  1.000 [get_ports {intr_k}]


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

