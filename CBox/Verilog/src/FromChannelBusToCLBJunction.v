/* ********************************************************************************************* */
/* * NovaCORE Inner Connection Box Modules                                                     * */
/* * From Channels to CLB Junctions                                                            * */
/* ********************************************************************************************* */
/* * Mapping example:                                                                          * */
/* * CH_UP_WIDTH: 3                                                                            * */
/* * CH_DN_WIDTH: 3                                                                            * */
/* *                                                                                           * */
/* *    5  4  3  2  1  0                                                                       * */
/* *    ch_dn_n  ch_up_n                                                                       * */
/* *    2  1  0  2  1  0                                                                       * */
/* *    V  V  V  ^  ^  ^                                                                       * */
/* * <--|--|--|--|--|--|                                                                       * */
/* *    V  V  V  ^  ^  ^                                                                       * */
/* *    2  1  0  2  1  0                                                                       * */
/* *    ch_dn_s  ch_up_s                                                                       * */
/* *    5  4  3  2  1  0                                                                       * */
/* *                                                                                           * */
/* ********************************************************************************************* */
/* * Functionality example:                                                                    * */
/* * DIMENSION: 4                                                                              * */
/* * configReg: 000000 000001 000011 000101                                                    * */
/* *                                                                                           * */
/* *    5  4  3  2  1  0                                                                       * */
/* *                                                                                           * */
/* *    V  V  V  ^  ^  ^                                                                       * */
/* * <--X--|--|--|--|--| Dimension 0                                                           * */
/* *    V  V  V  ^  ^  ^                                                                       * */
/* *                                                                                           * */
/* *    V  V  V  ^  ^  ^                                                                       * */
/* * <--|--|--X--|--|--| Dimension 1                                                           * */
/* *    V  V  V  ^  ^  ^                                                                       * */
/* *                                                                                           * */
/* *    V  V  V  ^  ^  ^                                                                       * */
/* * <--|--|--|--|--X--| Dimension 2                                                           * */
/* *    V  V  V  ^  ^  ^                                                                       * */
/* *                                                                                           * */
/* *    V  V  V  ^  ^  ^                                                                       * */
/* * <--|--|--|--|--|--X Dimension 3                                                           * */
/* *    V  V  V  ^  ^  ^                                                                       * */
/* *                                                                                           * */
/* *    5  4  3  2  1  0                                                                       * */
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
`define C_BUS_CLB_JUNCTION c_bus[(DIMENSION*CH_WIDTH)-1:0]

/* Configuration register offsets */
`define CONFIGREG_CLB_JUNCTION configReg[(DIMENSION*CH_WIDTH)-1:0]

module FromChannelBusToCLBJunction#(
		/* Number of dimensions */
		parameter DIMENSION = 4,
		/* UP + DOWN channel width */
		parameter CH_WIDTH = 4,
		/* ceil(log2(DIMENSION - 1)) */
		parameter DIMENSION_WIDTH = 2
	) (
		/* Configuration IO */
		mode,
		c_clk,
		c_bus,
		c_dimension,

		/* Regular IO */
		ch,

		/* CLB IO */
		clb_in
	);

	/* Size of configuration word */
	parameter CONFIG_WORD_WIDTH = DIMENSION*CH_WIDTH;

	/* Configuration IO */
	input mode;
	input c_clk;
	input [CONFIG_WORD_WIDTH-1:0] c_bus;
	input [DIMENSION_WIDTH-1:0] c_dimension;

	/* Regular IO */
	input [CH_WIDTH-1:0] ch;

	/* CLB IO */
	output clb_in;

	/* Configuration register */
	reg [CONFIG_WORD_WIDTH-1:0] configReg;

	/* Configuration register write block */
	always @(posedge c_clk) begin
		if(mode) begin
			`CONFIGREG_CLB_JUNCTION = `C_BUS_CLB_JUNCTION;
		end
	end

	/* Connect channel n to CLB junction, where n is the number set for current dimension in configuration register */ 
	assign clb_in = ch[(`CONFIGREG_CLB_JUNCTION >> (c_dimension * CH_WIDTH)) & (CH_WIDTH - 1)];

endmodule
