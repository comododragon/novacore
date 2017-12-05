module TOP(
		clkin_50,

		user_pb,

		user_led
	);

	input clkin_50;

	input [2:0] user_pb;
	output [15:0] user_led;

	wire w_mode;
	wire [27:0] w_c_bus;
	wire [3:0] w_c_uid;
	wire w_c_clk;
	wire [3:0] w_c_dimension;
	wire w_c_dimswitch;
	wire [7:0] w_user_led_n;
	wire [1:0] w_user_pb_n;

	reg [31:0] counter;

	assign user_led[7:0] = {4'hf, ~counter[27:26], ~counter[27:26]};
	assign user_led[15:8] = ~w_user_led_n;
	assign w_user_pb_n = ~user_pb[2:1];

	NovaCOREBlaster blaster(
		.clk_clk(clkin_50),
		.reset_reset_n(user_pb[0]),

		.mode_export(w_mode),
		.c_bus_export(w_c_bus),
		.c_uid_export(w_c_uid),
		.c_clk_export(w_c_clk),
		.c_dimension_export(w_c_dimension),
		.c_dimswitch_export(w_c_dimswitch)
	);

	NovaCORE#(4, 2, 4, 2, 2, 2, 1, 4) fpga(
		.clk(clkin_50),

		.mode(w_mode),
		.c_clk(w_c_clk),
		.c_bus(w_c_bus),
		.c_uid(w_c_uid),
		.c_dimension(w_c_dimension),
		.c_dimswitch(w_c_dimswitch),

		.io_up_n(),
		.io_up_s(),
		.io_dn_n({w_user_pb_n, 2'b11}),
		.io_dn_s(),
		.io_lt_n(w_user_led_n[7:4]),
		.io_lt_s(),
		.io_rt_n({counter[27:26], counter[27:26]}),
		.io_rt_s(w_user_led_n[3:0])
	);

	always @(posedge clkin_50 or negedge user_pb[0]) begin
		if(!user_pb[0]) begin
			counter <= 'h0;
		end
		else begin
			counter <= counter + 'h1;
		end
	end

endmodule
