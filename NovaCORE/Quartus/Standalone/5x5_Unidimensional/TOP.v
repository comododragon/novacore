module TOP(
		clk,

		mode,
		c_bus,
		c_uid,
		c_clk,

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

	output [24:0] io_up_n;
	input [24:0] io_up_s;
	input [24:0] io_dn_n;
	output [24:0] io_dn_s;
	output [24:0] io_lt_n;
	input [24:0] io_lt_s;
	input [24:0] io_rt_n;
	output [24:0] io_rt_s;

	NovaCORE#(1, 5, 10, 2, 1, 4, 1, 7) fpga(
		.clk(clk),

		.mode(mode),
		.c_bus(c_bus),
		.c_uid(c_uid),
		.c_clk(c_clk),

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
