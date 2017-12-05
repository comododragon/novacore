/* ********************************************************************************************* */
/* * NovaCORE Inner Connection Box Modules                                                     * */
/* * From CLB to Channels Junctions                                                            * */
/* ********************************************************************************************* */
/* * Mapping example:                                                                          * */
/* * CH_UP_WIDTH: 3                                                                            * */
/* * CH_DN_WIDTH: 3                                                                            * */
/* *                                                                                           * */
/* *    ch_dn_n  ch_up_n                                                                       * */
/* *    2  1  0  2  1  0                                                                       * */
/* *    V  V  V  ^  ^  ^                                                                       * */
/* * >--|--|--|--|--|--|                                                                       * */
/* *    V  V  V  ^  ^  ^                                                                       * */
/* *    2  1  0  2  1  0                                                                       * */
/* *    ch_dn_s  ch_up_s                                                                       * */
/* *                                                                                           * */
/* ********************************************************************************************* */
/* * Functionality example:                                                                    * */
/* * DIMENSION: 4                                                                              * */
/* * configReg: 000000 000001 011011 101010                                                    * */
/* *                                                                                           * */
/* *    V  V  V  ^  ^  ^                                                                       * */
/* * >--X--|--X--|--X--| Dimension 0                                                           * */
/* *    V  V  V  ^  ^  ^                                                                       * */
/* *                                                                                           * */
/* *    V  V  V  ^  ^  ^                                                                       * */
/* * >--|--X--X--|--X--X Dimension 1                                                           * */
/* *    V  V  V  ^  ^  ^                                                                       * */
/* *                                                                                           * */
/* *    V  V  V  ^  ^  ^                                                                       * */
/* * >--|--|--|--|--|--X Dimension 2                                                           * */
/* *    V  V  V  ^  ^  ^                                                                       * */
/* *                                                                                           * */
/* *    V  V  V  ^  ^  ^                                                                       * */
/* * >--|--|--|--|--|--| Dimension 3                                                           * */
/* *    V  V  V  ^  ^  ^                                                                       * */
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
/* UP channels junctions */
`define C_BUS_CLB_UP_JUNCTION c_bus[(DIMENSION*CH_UP_WIDTH)-1:0]
/* Down channels junctions */
`define C_BUS_CLB_DN_JUNCTION c_bus[(DIMENSION*(CH_UP_WIDTH+CH_DN_WIDTH))-1:(DIMENSION*CH_UP_WIDTH)]

/* Configuration register offsets */
`define CONFIGREG_CLB_UP_JUNCTION configReg[(DIMENSION*CH_UP_WIDTH)-1:0]
`define CONFIGREG_CLB_DN_JUNCTION configReg[(DIMENSION*(CH_UP_WIDTH+CH_DN_WIDTH))-1:(DIMENSION*CH_UP_WIDTH)]

module FromCLBToChannelBusJunction#( 
		/* Number of dimensions */
		parameter DIMENSION = 4,
		/* UP channel width */
		parameter CH_UP_WIDTH = 2,
		/* DOWN channel width */
		parameter CH_DN_WIDTH = 2,
		/* ceil(log2(DIMENSION - 1)) */
		parameter DIMENSION_WIDTH = 2
	) (
		/* Configuration IO */
		mode,
		c_clk,
		c_bus,
		c_dimension,

		/* Regular IO */
		ch_up_n,
		ch_up_s,
		ch_dn_n,
		ch_dn_s,
		clb_out
	);

	/* Size of configuration word */
	parameter CONFIG_WORD_WIDTH = DIMENSION*(CH_UP_WIDTH+CH_DN_WIDTH);

	/* Configuration IO */
	input mode;
	input c_clk;
	input [CONFIG_WORD_WIDTH-1:0] c_bus;
	input [DIMENSION_WIDTH-1:0] c_dimension;

	/* Regular IO */
	output [CH_UP_WIDTH-1:0] ch_up_n;
	input [CH_UP_WIDTH-1:0] ch_up_s;
	input [CH_DN_WIDTH-1:0] ch_dn_n;
	output [CH_DN_WIDTH-1:0] ch_dn_s;
	input clb_out;

	/* Configuration register */
	reg [CONFIG_WORD_WIDTH-1:0] configReg;

	/* Configuration register write block */
	always @(posedge c_clk) begin
		if(mode) begin
			`CONFIGREG_CLB_UP_JUNCTION = `C_BUS_CLB_UP_JUNCTION;
			`CONFIGREG_CLB_DN_JUNCTION = `C_BUS_CLB_DN_JUNCTION;
		end
	end

	/* Generate block */
	genvar i;
	generate
		/* For each channel, connect to CLB junction if corresponding bit is set for current dimension in configuration register. Bypass channel otherwise */
		for(i = 0; i < CH_UP_WIDTH; i = i+1) begin : ch_up_nGen
			assign ch_up_n[i] = ((`CONFIGREG_CLB_UP_JUNCTION >> ((c_dimension * CH_UP_WIDTH) + i)) & 'b1)? clb_out : ch_up_s[i];
		end
		for(i = 0; i < CH_DN_WIDTH; i = i+1) begin : ch_dn_sGen
			assign ch_dn_s[i] = ((`CONFIGREG_CLB_DN_JUNCTION >> ((c_dimension * CH_DN_WIDTH) + i)) & 'b1)? clb_out : ch_dn_n[i];
		end
	endgenerate

endmodule
