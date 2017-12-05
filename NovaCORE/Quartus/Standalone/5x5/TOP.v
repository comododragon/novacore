module TOP(
		clk,

		mode,
		c_bus,
		c_uid,
		c_clk,
		c_dimension,
		c_dimswitch,

		io_up_n,
		io_up_s,
		io_dn_n,
		io_dn_s,
		io_lt_n,
		io_lt_s,
		io_rt_n,
		io_rt_s
	);

	input clk;

	input mode;
	input [41:0] c_bus;
	input [6:0] c_uid;
	input c_clk;
	input [1:0] c_dimension;
	input c_dimswitch;

	output [24:0] io_up_n;
	input [24:0] io_up_s;
	input [24:0] io_dn_n;
	output [24:0] io_dn_s;
	output [24:0] io_lt_n;
	input [24:0] io_lt_s;
	input [24:0] io_rt_n;
	output [24:0] io_rt_s;

	NovaCORE#(4, 5, 10, 2, 2, 4, 1, 7) fpga(
		.clk(clk),

		.mode(mode),
		.c_bus(c_bus),
		.c_uid(c_uid),
		.c_clk(c_clk),
		.c_dimension(c_dimension),
		.c_dimswitch(c_dimswitch),

		.io_up_n(io_up_n),
		.io_up_s(io_up_s),
		.io_dn_n(io_dn_n),
		.io_dn_s(io_dn_s),
		.io_lt_n(io_lt_n),
		.io_lt_s(io_lt_s),
		.io_rt_n(io_rt_n),
		.io_rt_s(io_rt_s)
	);

endmodule
