set_property -dict { PACKAGE_PIN V12   IOSTANDARD LVCMOS33 } [get_ports { display[6] }]; 
set_property -dict { PACKAGE_PIN W16   IOSTANDARD LVCMOS33 } [get_ports { display[5] }]; 

set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { display[4] }]; 
set_property -dict { PACKAGE_PIN H15   IOSTANDARD LVCMOS33 } [get_ports { display[3] }]; 

set_property -dict { PACKAGE_PIN V13   IOSTANDARD LVCMOS33 } [get_ports { display[2] }]; 
set_property -dict { PACKAGE_PIN U17   IOSTANDARD LVCMOS33 } [get_ports { display[1] }]; 

set_property -dict { PACKAGE_PIN T17   IOSTANDARD LVCMOS33 } [get_ports { display[0] }]; 


set_property -dict { PACKAGE_PIN M14   IOSTANDARD LVCMOS33 } [get_ports { clk1hz }];

set_property -dict { PACKAGE_PIN T14   IOSTANDARD LVCMOS33 } [get_ports { digit[3] }]; 
set_property -dict { PACKAGE_PIN T15   IOSTANDARD LVCMOS33 } [get_ports { digit[2] }];
set_property -dict { PACKAGE_PIN P14   IOSTANDARD LVCMOS33 } [get_ports { digit[1] }]; 
set_property -dict { PACKAGE_PIN R14   IOSTANDARD LVCMOS33 } [get_ports { digit[0] }];


set_property -dict { PACKAGE_PIN K18   IOSTANDARD LVCMOS33 } [get_ports { reset }];
###Clock signal
###IO_L11P_T1_SRCC_35	
set_property PACKAGE_PIN K17 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 8.00 [get_ports { clk }];