/* ********************************************************************************************* */
/* * NovaCORE Switch Box                                                                       * */
/* ********************************************************************************************* */
/* * Mapping Example:                                                                          * */
/* *                                                                                           * */
/* *         1    0                                                                            * */
/* *     ____V____V____^____^____                                                              * */
/* *    |    |    |   _|_  _|_   |                                                             * */
/* *    |  /|        /_1_\/_0_\  |                                                             * */
/* *   <--|2|                   --< 6                                                          * */  
/* *    |  \|                    |                                                             * */
/* *    |  /|                    |                                                             * */
/* *   <--|3|                   --< 7                                                          * */
/* *    |  \|                    |                                                             * */
/* *    |                    |\  |                                                             * */
/* * 2 >--                   |6|-->                                                            * */
/* *    |                    |/  |                                                             * */
/* *    |                    |\  |                                                             * */
/* * 3 >-- __________        |7|-->                                                            * */
/* *    |  \_5_/\_4_/        |/  |                                                             * */
/* *    |____|____|____|____|____|                                                             * */
/* *         V    V    ^    ^                                                                  * */
/* *                   5    4                                                                  * */
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
/* See inner module (MDimMux for more specific info about these values) */
`define C_BUS_MUX_SWITCH c_bus[(DIMENSION*(CH_WIDTH_WIDTH+1))-1:0]
/* Block Address: Defines which inner module will be configured */
`define C_BUS_MUX_ADDR c_bus[(DIMENSION*(CH_WIDTH_WIDTH+1))+(CH_WIDTH_WIDTH+1)-1:(DIMENSION*(CH_WIDTH_WIDTH+1))]

module SBox#(
		/* Unique identifier */
		parameter UID = 0,
		/* Number of dimensions */
		parameter DIMENSION = 4,
		/* UP channel width */
		parameter CH_UP_WIDTH = 2,
		/* DOWN channel width */
		parameter CH_DN_WIDTH = 2,
		/* ceil(log2(UID - 1)) */
		parameter UID_WIDTH = 16,
		/* ceil(log2(DIMENSION - 1)) */
		parameter DIMENSION_WIDTH = 2,
		/* ceil(log2(CH_UP_WIDTH + CH_DN_WIDTH - 1)) */
		parameter CH_WIDTH_WIDTH = 2
	) (
		/* Configuration IO */
		mode,
		c_clk,
		c_bus,
		c_uid,
		c_dimension,

		/* Regular IO (vertical) */
		ch_up_n,
		ch_up_s,
		ch_dn_n,
		ch_dn_s,

		/* Regular IO (horizontal) */
		ch_lt_n,
		ch_lt_s,
		ch_rt_n,
		ch_rt_s
	);

	/* Size of configuration word */
	parameter CONFIG_WORD_WIDTH = (DIMENSION*(CH_WIDTH_WIDTH+1))+(CH_WIDTH_WIDTH+1);

	/* Configuration IO */
	input mode;
	input c_clk;
	input [CONFIG_WORD_WIDTH-1:0] c_bus;
	input [UID_WIDTH-1:0] c_uid;
	input [DIMENSION_WIDTH-1:0] c_dimension;

	/* Regular IO (vertical) */
	output [CH_UP_WIDTH-1:0] ch_up_n;
	input [CH_UP_WIDTH-1:0] ch_up_s;
	input [CH_DN_WIDTH-1:0] ch_dn_n;
	output [CH_DN_WIDTH-1:0] ch_dn_s;

	/* Regular IO (horizontal) */
	output [CH_UP_WIDTH-1:0] ch_lt_n;
	input [CH_UP_WIDTH-1:0] ch_lt_s;
	input [CH_DN_WIDTH-1:0] ch_rt_n;
	output [CH_DN_WIDTH-1:0] ch_rt_s;

	/* Generate block */
	genvar i;
	generate
		/* Create multiplexers for up_north channels. Block addresses from 0 to CH_UP_WIDTH-1 */
		for(i = 0; i < CH_UP_WIDTH; i = i+1) begin : MDimMuxGen
			wire filteredClk = c_clk && (i == `C_BUS_MUX_ADDR) && (UID == c_uid);
			MDimMux#(DIMENSION, (CH_UP_WIDTH+CH_DN_WIDTH)*2, DIMENSION_WIDTH, CH_WIDTH_WIDTH+1) inst(
				.mode(mode),
				.c_clk(filteredClk),
				.c_bus(`C_BUS_MUX_SWITCH),
				.c_dimension(c_dimension),

				.ch_in({ch_lt_s, ch_up_s, ch_rt_n, ch_dn_n}),
				.ch_out(ch_up_n[i])
			);
		end
		/* Create multiplexers for left_north channels. Block addresses from CH_UP_WIDTH to 2*CH_UP_WIDTH-1 */
		for(i = 0; i < CH_UP_WIDTH; i = i+1) begin : MDimMuxGen2
			wire filteredClk = c_clk && ((i + CH_UP_WIDTH) == `C_BUS_MUX_ADDR) && (UID == c_uid);
			MDimMux#(DIMENSION, (CH_UP_WIDTH+CH_DN_WIDTH)*2, DIMENSION_WIDTH, CH_WIDTH_WIDTH+1) inst(
				.mode(mode),
				.c_clk(filteredClk),
				.c_bus(`C_BUS_MUX_SWITCH),
				.c_dimension(c_dimension),

				.ch_in({ch_lt_s, ch_up_s, ch_rt_n, ch_dn_n}),
				.ch_out(ch_lt_n[i])
			);
		end
		/* Create multiplexers for down_south channels. Block addresses from 2*CH_UP_WIDTH to CH_DN_WIDTH+2*CH_UP_WIDTH-1 */
		for(i = 0; i < CH_DN_WIDTH; i = i+1) begin : MDimMuxGen3
			wire filteredClk = c_clk && ((i + CH_UP_WIDTH + CH_UP_WIDTH) == `C_BUS_MUX_ADDR) && (UID == c_uid);
			MDimMux#(DIMENSION, (CH_UP_WIDTH+CH_DN_WIDTH)*2, DIMENSION_WIDTH, CH_WIDTH_WIDTH+1) inst(
				.mode(mode),
				.c_clk(filteredClk),
				.c_bus(`C_BUS_MUX_SWITCH),
				.c_dimension(c_dimension),

				.ch_in({ch_lt_s, ch_up_s, ch_rt_n, ch_dn_n}),
				.ch_out(ch_dn_s[i])
			);
		end
		/* Create multiplexers for right_south channels. Block addresses from CH_DN_WIDTH+2*CH_UP_WIDTH to 2*CH_DN_WIDTH+2*CH_UP_WIDTH-1 */
		for(i = 0; i < CH_DN_WIDTH; i = i+1) begin : MDimMuxGen4
			wire filteredClk = c_clk && ((i + CH_UP_WIDTH + CH_UP_WIDTH + CH_DN_WIDTH) == `C_BUS_MUX_ADDR) && (UID == c_uid);
			MDimMux#(DIMENSION, (CH_UP_WIDTH+CH_DN_WIDTH)*2, DIMENSION_WIDTH, CH_WIDTH_WIDTH+1) inst(
				.mode(mode),
				.c_clk(filteredClk),
				.c_bus(`C_BUS_MUX_SWITCH),
				.c_dimension(c_dimension),

				.ch_in({ch_lt_s, ch_up_s, ch_rt_n, ch_dn_n}),
				.ch_out(ch_rt_s[i])
			);
		end
	endgenerate

endmodule
