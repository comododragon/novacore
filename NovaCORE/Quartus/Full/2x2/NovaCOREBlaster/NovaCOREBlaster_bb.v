
module NovaCOREBlaster (
	c_bus_export,
	c_clk_export,
	c_dimension_export,
	c_dimswitch_export,
	c_uid_export,
	clk_clk,
	mode_export,
	reset_reset_n);	

	output	[27:0]	c_bus_export;
	output		c_clk_export;
	output	[3:0]	c_dimension_export;
	output		c_dimswitch_export;
	output	[3:0]	c_uid_export;
	input		clk_clk;
	output		mode_export;
	input		reset_reset_n;
endmodule
