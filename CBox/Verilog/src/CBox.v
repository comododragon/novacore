/* ********************************************************************************************* */
/* * NovaCORE Connection Box                                                                   * */
/* ********************************************************************************************* */
/* * Mapping example:                                                                          * */
/* * CH_UP_WIDTH: 3                                                                            * */
/* * CH_DN_WIDTH: 3                                                                            * */
/* * CLB_IN_WIDTH: 2                                                                           * */
/* * CLB_OUT_WIDTH: 3                                                                          * */
/* *                                                                                           * */
/* *        ch_dn_n  ch_up_n                                                                   * */
/* *        2  1  0  2  1  0                                                                   * */
/* *        V  V  V  ^  ^  ^                                                                   * */
/* * i 0 <--|--|--|--|--|--| blk 0                                                             * */
/* * n 1 <--|--|--|--|--|--| blk 1                                                             * */
/* * o 0 >--|--|--|--|--|--| blk 2                                                             * */
/* * u 1 >--|--|--|--|--|--| blk 3                                                             * */
/* * t 2 >--|--|--|--|--|--| blk 4                                                             * */
/* *        V  V  V  ^  ^  ^                                                                   * */
/* *        2  1  0  2  1  0                                                                   * */
/* *        ch_dn_s  ch_up_s                                                                   * */
/* *                                                                                           * */
/* ********************************************************************************************* */
/* * Copyright (c) 2017 André Bannwart Perina                                                  * */
/* *                                                                                           * */
/* * Permission is hereby granted, free of charge, to any person obtaining a copy of this      * */
/* * software and associated documentation files (the "Software"), to deal in the Software     * */
/* * without restriction, including without limitation the rights to use, copy, modify,        * */
/* * merge, publish, distribute, sublicense, and/or sell copies of the Software, and to        * */
/* * permit persons to whom the Software is furnished to do so, subject to the following       * */
/* * conditions:                                                                               * */
/* *                                                                                           * */
/* * The above copyright notice and this permission notice shall be included in all copies     * */
/* * or substantial portions of the Software.                                                  * */
/* *                                                                                           * */
/* * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,       * */
/* * INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR  * */
/* * PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE * */
/* * FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR      * */
/* * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER    * */
/* * DEALINGS IN THE SOFTWARE.                                                                 * */
/* ********************************************************************************************* */

/* Configuration bus offsets */
/* See inner modules (FromCLBToChannelBusJunction and FromChannelBusToCLBJunction for more specific info about these values) */
`define C_BUS_CLB_UP_JUNCTION c_bus[(DIMENSION*CH_UP_WIDTH)-1:0]
`define C_BUS_CLB_DN_JUNCTION c_bus[(DIMENSION*(CH_UP_WIDTH+CH_DN_WIDTH))-1:(DIMENSION*CH_UP_WIDTH)]
/* Block Address: Defines which inner module will be configured */
`define C_BUS_JN_ADDR c_bus[(DIMENSION*(CH_UP_WIDTH+CH_DN_WIDTH))+CLB_WIDTH_WIDTH-1:(DIMENSION*(CH_UP_WIDTH+CH_DN_WIDTH))]

module CBox#(
		/* Unique identifier */
		parameter UID = 0,
		/* Number of dimensions */
		parameter DIMENSION = 4,
		/* UP channel width */
		parameter CH_UP_WIDTH = 2,
		/* DOWN channel width */
		parameter CH_DN_WIDTH = 2,
		/* Number of outputs to CLB (CB > CLB) */
		parameter CLB_IN_WIDTH = 2,
		/* Number of inputs from CLB (CB < CLB) */
		parameter CLB_OUT_WIDTH = 2,
		/* ceil(log2(CLB_IN_WIDTH + CLB_OUT_WIDTH - 1)) */
		parameter CLB_WIDTH_WIDTH = 2,
		/* ceil(log2(UID - 1)) */
		parameter UID_WIDTH = 16,
		/* ceil(log2(DIMENSION - 1)) */
		parameter DIMENSION_WIDTH = 2
	) (
		/* Configuration IO */
		mode,
		c_clk,
		c_bus,
		c_uid,
		c_dimension,

		/* Regular IO */
		ch_up_n,
		ch_up_s,
		ch_dn_n,
		ch_dn_s,

		/* CLB IO */
		clb_in,
		clb_out
	);

	/* Size of configuration word */
	parameter CONFIG_WORD_WIDTH = (DIMENSION*(CH_UP_WIDTH+CH_DN_WIDTH))+CLB_WIDTH_WIDTH;

	/* Configuration IO */
	input mode;
	input c_clk;
	input [CONFIG_WORD_WIDTH-1:0] c_bus;
	input [UID_WIDTH-1:0] c_uid;
	input [DIMENSION_WIDTH-1:0] c_dimension;

	/* Regular IO */
	output [CH_UP_WIDTH-1:0] ch_up_n;
	input [CH_UP_WIDTH-1:0] ch_up_s;
	input [CH_DN_WIDTH-1:0] ch_dn_n;
	output [CH_DN_WIDTH-1:0] ch_dn_s;

	/* CLB IO */
	output [CLB_IN_WIDTH-1:0] clb_in;
	input [CLB_OUT_WIDTH-1:0] clb_out;

	wire [CH_UP_WIDTH-1:0] w_ch_up [0:CLB_OUT_WIDTH];
	wire [CH_DN_WIDTH-1:0] w_ch_dn [0:CLB_OUT_WIDTH];

	/* Generation block */
	genvar i;
	generate
		/* Modules responsible for managing junctions from channel to CLB. Block addresses from 0 to CLB_IN_WIDTH-1 */
		for(i = 0; i < CLB_IN_WIDTH; i = i+1) begin : FromChannelBusToCLBJunctionGen
			wire filteredClk = c_clk && (i == `C_BUS_JN_ADDR) && (UID == c_uid);
			FromChannelBusToCLBJunction#(DIMENSION, CH_UP_WIDTH + CH_DN_WIDTH, DIMENSION_WIDTH) inst(
				.mode(mode),
				.c_clk(filteredClk),
				.c_bus({`C_BUS_CLB_DN_JUNCTION, `C_BUS_CLB_UP_JUNCTION}),
				.c_dimension(c_dimension),

				.ch({ch_dn_n, w_ch_up[0]}),
				.clb_in(clb_in[i])
			);
		end
		/* Modules responsible for managing junctions from CLB to channel. Block addresses from CLB_IN_WIDTH to CLB_OUT_WIDTH+CLB_IN_WIDTH-1 */
		for(i = 0; i < CLB_OUT_WIDTH; i = i+1) begin : FromCLBToChannelBusJunctionGen
			wire filteredClk = c_clk && ((i + CLB_IN_WIDTH) == `C_BUS_JN_ADDR) && (UID == c_uid);
			FromCLBToChannelBusJunction#(DIMENSION, CH_UP_WIDTH, CH_DN_WIDTH, DIMENSION_WIDTH) inst(
				.mode(mode),
				.c_clk(filteredClk),
				.c_bus({`C_BUS_CLB_DN_JUNCTION, `C_BUS_CLB_UP_JUNCTION}),
				.c_dimension(c_dimension),

				.ch_up_n(w_ch_up[i]),
				.ch_up_s(w_ch_up[i+1]),
				.ch_dn_n(w_ch_dn[i]),
				.ch_dn_s(w_ch_dn[i+1]),
				.clb_out(clb_out[i])
			);
		end
	endgenerate

	/* Assign inner channels to regular IO pins */
	assign ch_up_n = w_ch_up[0];
	assign w_ch_up[CLB_OUT_WIDTH] = ch_up_s;
	assign w_ch_dn[0] = ch_dn_n;
	assign ch_dn_s = w_ch_dn[CLB_OUT_WIDTH];

endmodule
