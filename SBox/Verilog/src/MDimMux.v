/* ********************************************************************************************* */
/* * NovaCORE Inner Switch Box Modules                                                         * */
/* * Multi-Dimensional Multiplexer                                                             * */
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
/* Mux switch */
`define C_BUS_MUX_VALUE c_bus[(DIMENSION*CH_IN_WIDTH_WIDTH)-1:0]

/* Configuration register offsets */
`define CONFIGREG_MUX_VALUE configReg[(DIMENSION*CH_IN_WIDTH_WIDTH)-1:0]

module MDimMux#(
		/* Number of dimensions */
		parameter DIMENSION = 4,
		/* Channel width */
		parameter CH_IN_WIDTH = 8,
		/* ceil(log2(DIMENSION - 1)) */
		parameter DIMENSION_WIDTH = 2,
		/* ceil(log2(CH_IN_WIDTH - 1)) */
		parameter CH_IN_WIDTH_WIDTH = 3
	) (
		/* Configuration IO */
		mode,
		c_clk,
		c_bus,
		c_dimension,

		/* Regular IO */
		ch_in,
		ch_out
	);

	/* Size of configuration word */
	parameter CONFIG_WORD_WIDTH = DIMENSION*CH_IN_WIDTH_WIDTH;

	/* Configuration IO */
	input mode;
	input c_clk;
	input [CONFIG_WORD_WIDTH-1:0] c_bus;
	input [DIMENSION_WIDTH-1:0] c_dimension;

	/* Regular IO */
	input [CH_IN_WIDTH-1:0] ch_in;
	output ch_out;

	/* Configuration register */
	reg [CONFIG_WORD_WIDTH-1:0] configReg;

	wire [CH_IN_WIDTH-1:0] muxWires;

	/* Configuration register write block */
	always @(posedge c_clk) begin
		if(mode) begin
			`CONFIGREG_MUX_VALUE = `C_BUS_MUX_VALUE;
		end
	end

	/* Generate block */
	genvar i;
	generate
		for(i = 0; i < CH_IN_WIDTH; i = i+1) begin : muxWiresGen
			assign muxWires[i] = (i == ((`CONFIGREG_MUX_VALUE >> (c_dimension * CH_IN_WIDTH_WIDTH)) & CH_IN_WIDTH-1))? ch_in[i] : 1'b0;
		end
	endgenerate

	/* OR-Reduce wires assigned by generate block, generating a multiplexer */
	assign ch_out = (| muxWires);

endmodule
