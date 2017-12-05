## Generated SDC file "NovaCORE.out.sdc"

## Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, the Altera Quartus II License Agreement,
## the Altera MegaCore Function License Agreement, or other 
## applicable license agreement, including, without limitation, 
## that your use is for the sole purpose of programming logic 
## devices manufactured by Altera and sold by Altera or its 
## authorized distributors.  Please refer to the applicable 
## agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 14.1.0 Build 186 12/03/2014 SJ Full Version"

## DATE    "Thu May 12 18:27:50 2016"

##
## DEVICE  "5SGXEA7K2F40C2"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {clkin_50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {clkin_50}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {clkin_50}] -rise_to [get_clocks {clkin_50}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {clkin_50}] -rise_to [get_clocks {clkin_50}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {clkin_50}] -fall_to [get_clocks {clkin_50}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {clkin_50}] -fall_to [get_clocks {clkin_50}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {clkin_50}] -rise_to [get_clocks {clkin_50}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {clkin_50}] -rise_to [get_clocks {clkin_50}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {clkin_50}] -fall_to [get_clocks {clkin_50}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {clkin_50}] -fall_to [get_clocks {clkin_50}] -hold 0.060  


#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



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

