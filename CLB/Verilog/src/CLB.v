/* ********************************************************************************************* */
/* * NovaCORE Configurable Logic Block                                                         * */
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
/* LUT data (async ram word) */
`define C_BUS_LUT_DATA c_bus[DIMENSION-1:0]
/* LUT addr (async ram address) */
`define C_BUS_LUT_ADDR c_bus[DIMENSION+LUT_WIDTH-1:DIMENSION]
/* Output type selector: 0 for unregistered, 1 otherwise */
`define C_BUS_OUTPUTTYPESELECTOR c_bus[DIMENSION-1:0]
/* Assert this if data provided in configuration bus is for LUT programming */
`define C_BUS_RAM_WRITE c_bus[DIMENSION+LUT_WIDTH]
/* Assert this if data provided in configuration bus is for registers programming */
`define C_BUS_REG_WRITE c_bus[DIMENSION+LUT_WIDTH+1]

/* Configuration register offsets */
/* Full select for output type selector */
`define CONFIGREG_OUTPUTTYPESELECTOR_FULL configReg[DIMENSION-1:0]
/* Output type selector bit for current dimension */
`define CONFIGREG_OUTPUTTYPESELECTOR_DIM configReg[c_dimension]

module CLB#(
		/* Unique identifier */
		parameter UID = 0,
		/* Number of dimensions */
		parameter DIMENSION = 4,
		/* ceil(log2(UID - 1)) */
		parameter UID_WIDTH = 16,
		/* LUT width (number of inputs for logic block) */
		parameter LUT_WIDTH = 4,
		/* ceil(log2(DIMENSION - 1)) */
		parameter DIMENSION_WIDTH = 2
	) (
		/* Clock and enable for registered output */
		clk,
		clk_en,

		/* Configuration IO */
		mode,
		c_clk,
		c_bus,
		c_uid,
		c_dimension,

		/* Logic block IO */
		b_in,
		b_out
	);

	/* Size of configuration word */
	parameter CONFIG_WORD_WIDTH = DIMENSION + LUT_WIDTH + 2;

	/* Clock and enable for registered output */
	input clk;
	input clk_en;

	/* Configuration IO */
	input mode;
	input c_clk;
	input [CONFIG_WORD_WIDTH-1:0] c_bus;
	input [UID_WIDTH-1:0] c_uid;
	input [DIMENSION_WIDTH-1:0] c_dimension;

	/* Logic block IO */
	input [LUT_WIDTH-1:0] b_in;
	output b_out;

	wire w_lut_clk;
	wire [LUT_WIDTH-1:0]  w_lut_addr;
	wire w_lut_rw;
	wire [DIMENSION-1:0] w_lut_data_in;
	wire [DIMENSION-1:0] w_lut_data_out;

	reg [DIMENSION-1:0] configReg;
	reg registeredOutput;

	/* LUT */
	AsyncRAM#(LUT_WIDTH, DIMENSION) lut (
		.clk(w_lut_clk),
		.addr(w_lut_addr),
		.rw(w_lut_rw),
		.data_in(w_lut_data_in),
		.data_out(w_lut_data_out)
	);

	/* Handle connections to LUT */
	assign w_lut_clk = c_clk;
	assign w_lut_addr = mode? `C_BUS_LUT_ADDR : b_in;
	assign w_lut_rw = mode && `C_BUS_RAM_WRITE && (UID == c_uid);
	assign w_lut_data_in = `C_BUS_LUT_DATA;
	assign b_out = (`CONFIGREG_OUTPUTTYPESELECTOR_DIM)? registeredOutput : w_lut_data_out[c_dimension];

	/* Configuration register write block */
	always @(posedge c_clk) begin
		if(mode && `C_BUS_REG_WRITE && (UID == c_uid)) begin
			`CONFIGREG_OUTPUTTYPESELECTOR_FULL = `C_BUS_OUTPUTTYPESELECTOR;
		end
	end

	// TODO: Is registeredOutput <= 'b0; necessary or just pure overhead?
	/* Output register write block */
	always @(posedge clk or posedge mode) begin
		if(mode) begin
			registeredOutput <= 'b0;
		end
		else if(clk_en) begin
			registeredOutput <= w_lut_data_out[c_dimension];
		end
	end

endmodule
