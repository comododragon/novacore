/* ********************************************************************************************* */
/* * NovaCORE                                                                                  * */
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

/* Configuration register offsets */
`define CONFIGREG_DIMENSION configRegGen.configReg

/* Configuration word width for all components */
`define CLB_CONFIG_WORD_WIDTH (DIMENSION + LUT_WIDTH + 2)
`define CBOX_CONFIG_WORD_WIDTH ((DIMENSION*CH_WIDTH)+LUT_WIDTH_WIDTH+1)
`define CBOX2_CONFIG_WORD_WIDTH ((DIMENSION*CH_WIDTH)+1)
`define SBOX_CONFIG_WORD_WIDTH ((DIMENSION*(CH_WIDTH_WIDTH+1))+(CH_WIDTH_WIDTH+1))

module NovaCORE#(
		/* Number of dimensions */
		parameter DIMENSION = 4,
		/* Number of CLBs per line */
		parameter CLB_WIDTH = 16,
		/* Channel size (including up and down) */
		parameter CH_WIDTH = 4,
		/* Number of LUT inputs */
		parameter LUT_WIDTH = 2,
		/* ceil(log2(DIMENSION - 1)) */
		parameter DIMENSION_WIDTH = 2,
		/* ceil(log2(CH_WIDTH - 1)) */
		parameter CH_WIDTH_WIDTH = 2,
		/* ceil(log2(LUT_WIDTH - 1)) */
		parameter LUT_WIDTH_WIDTH = 1,
		/* ceil(log2(UID - 1)) */
		parameter UID_WIDTH = 16
	) (
		/* Global clock */
		clk,

		/* Configuration IO */
		mode,
		c_clk,
		c_bus,
		c_uid,
		c_dimension,
		c_dimswitch,

		/* Regular IO */
		io_up_n,
		io_up_s,
		io_dn_n,
		io_dn_s,
		io_lt_n,
		io_lt_s,
		io_rt_n,
		io_rt_s
	);

	/* Configuration bus size is defined as the biggest configuration word of all components */
	parameter CONFIG_WORD_WIDTH = (`CLB_CONFIG_WORD_WIDTH > `CBOX_CONFIG_WORD_WIDTH)?
									(`CLB_CONFIG_WORD_WIDTH > `SBOX_CONFIG_WORD_WIDTH)?
										`CLB_CONFIG_WORD_WIDTH
										:
										`SBOX_CONFIG_WORD_WIDTH
									:
									(`CBOX_CONFIG_WORD_WIDTH > `SBOX_CONFIG_WORD_WIDTH)?
										`CBOX_CONFIG_WORD_WIDTH
										:
										`SBOX_CONFIG_WORD_WIDTH;

	/* Global clock */
	input clk;

	/* Configuration IO */
	input mode;
	input c_clk;
	input [CONFIG_WORD_WIDTH-1:0] c_bus;
	input [UID_WIDTH-1:0] c_uid;
	input [DIMENSION_WIDTH-1:0] c_dimension;
	input c_dimswitch;

	/* Regular IO */
	output [(CLB_WIDTH*(CH_WIDTH>>1))-1:0] io_up_n;
	input [(CLB_WIDTH*(CH_WIDTH>>1))-1:0] io_up_s;
	input [(CLB_WIDTH*(CH_WIDTH>>1))-1:0] io_dn_n;
	output [(CLB_WIDTH*(CH_WIDTH>>1))-1:0] io_dn_s;
	output [(CLB_WIDTH*(CH_WIDTH>>1))-1:0] io_lt_n;
	input [(CLB_WIDTH*(CH_WIDTH>>1))-1:0] io_lt_s;
	input [(CLB_WIDTH*(CH_WIDTH>>1))-1:0] io_rt_n;
	output [(CLB_WIDTH*(CH_WIDTH>>1))-1:0] io_rt_s;

	/* Dimension register generator */
	generate
		/* If there is multidimensionality, generate register and write block */
		if(DIMENSION != 1) begin : configRegGen
			reg [DIMENSION_WIDTH-1:0] configReg;

			// TODO: Should this depend on c_clk or not?
			always @(posedge c_dimswitch) begin
				if(mode) begin
					`CONFIGREG_DIMENSION = c_dimension;
				end
			end
		end
		/* Just generate a constant otherwise */
		else begin : configRegGen
			wire configReg;
			assign configReg = 'b0;
		end
	endgenerate

	/* Inner channels wires */
	wire [(CH_WIDTH>>1)-1:0] vUpChannels [0:(CLB_WIDTH<<2)][0:CLB_WIDTH-1];
	wire [(CH_WIDTH>>1)-1:0] vDnChannels [0:(CLB_WIDTH<<2)][0:CLB_WIDTH-1];
	wire [(CH_WIDTH>>1)-1:0] hLtChannels [0:CLB_WIDTH-1][0:(CLB_WIDTH<<2)];
	wire [(CH_WIDTH>>1)-1:0] hRtChannels [0:CLB_WIDTH-1][0:(CLB_WIDTH<<2)];

	/* CLB<->CB wires */
	wire [LUT_WIDTH:0] vCLBIn [0:CLB_WIDTH-1][0:CLB_WIDTH-1];
	wire hCLBOut [0:CLB_WIDTH-1][0:CLB_WIDTH-1];

	/* Full vFPGA generate block */
	genvar i, j;
	generate
		for(i = 0; i < (CLB_WIDTH << 1); i = i+2) begin : ArrayGen
			for(j = 0; j < (CLB_WIDTH << 1); j = j+2) begin : CBoxGen
				/* Upper CB */
				CBox#(((CLB_WIDTH << 1) * i) + j, DIMENSION, (CH_WIDTH >> 1), (CH_WIDTH >> 1), LUT_WIDTH+1, 1, LUT_WIDTH_WIDTH+1, UID_WIDTH, DIMENSION_WIDTH) cboxInst(
					.mode(mode),
					.c_clk(c_clk),
					.c_bus(c_bus[`CBOX_CONFIG_WORD_WIDTH-1:0]),
					.c_uid(c_uid),
					.c_dimension(`CONFIGREG_DIMENSION),

					.ch_up_n(hLtChannels[i>>1][j]),
					.ch_up_s(hLtChannels[i>>1][j+1]),
					.ch_dn_n(hRtChannels[i>>1][j]),
					.ch_dn_s(hRtChannels[i>>1][j+1]),

					.clb_in(vCLBIn[(i >> 1)][(j >> 1)]),
					.clb_out()
				);
				/* SB */
				SBox#(((CLB_WIDTH << 1) * i) + j + 1, DIMENSION, (CH_WIDTH >> 1), (CH_WIDTH >> 1), UID_WIDTH, DIMENSION_WIDTH, CH_WIDTH_WIDTH) sboxInst(
					.mode(mode),
					.c_clk(c_clk),
					.c_bus(c_bus[`SBOX_CONFIG_WORD_WIDTH-1:0]),
					.c_uid(c_uid),
					.c_dimension(`CONFIGREG_DIMENSION),

					.ch_up_n(vUpChannels[i][j>>1]),
					.ch_up_s(vUpChannels[i+1][j>>1]),
					.ch_dn_n(vDnChannels[i][j>>1]),
					.ch_dn_s(vDnChannels[i+1][j>>1]),

					.ch_lt_n(hLtChannels[i>>1][j+1]),
					.ch_lt_s(hLtChannels[i>>1][j+2]),
					.ch_rt_n(hRtChannels[i>>1][j+1]),
					.ch_rt_s(hRtChannels[i>>1][j+2])
				);
				/* CLB */
				CLB#(((CLB_WIDTH << 1) * (i + 1)) + j, DIMENSION, UID_WIDTH, LUT_WIDTH, DIMENSION_WIDTH) clbInst(
					.clk(clk),
					.clk_en(vCLBIn[(i >> 1)][(j >> 1)][2]),

					.mode(mode),
					.c_clk(c_clk),
					.c_bus(c_bus[`CLB_CONFIG_WORD_WIDTH-1:0]),
					.c_uid(c_uid),
					.c_dimension(`CONFIGREG_DIMENSION),

					.b_in(vCLBIn[(i >> 1)][(j >> 1)][1:0]),
					.b_out(hCLBOut[(i >> 1)][(j >> 1)])
				);
				/* Lower CB */
				CBox#(((CLB_WIDTH << 1) * (i + 1)) + j + 1, DIMENSION, (CH_WIDTH >> 1), (CH_WIDTH >> 1), 1, 1, 1, UID_WIDTH, DIMENSION_WIDTH) cboxInst2(
					.mode(mode),
					.c_clk(c_clk),
					.c_bus(c_bus[`CBOX2_CONFIG_WORD_WIDTH-1:0]),
					.c_uid(c_uid),
					.c_dimension(`CONFIGREG_DIMENSION),

					.ch_up_n(vUpChannels[i+1][j>>1]),
					.ch_up_s(vUpChannels[i+2][j>>1]),
					.ch_dn_n(vDnChannels[i+1][j>>1]),
					.ch_dn_s(vDnChannels[i+2][j>>1]),

					.clb_in(),
					.clb_out(hCLBOut[(i >> 1)][(j >> 1)])
				);
			end
		end
		/* Assign outer channel pins to IO pins */
		for(i = 0; i < CLB_WIDTH; i = i+1) begin : IOGen
			assign io_up_n[((CH_WIDTH>>1)*(i+1))-1:((CH_WIDTH>>1)*i)] = vUpChannels[0][CLB_WIDTH-i-1];
			assign vUpChannels[(CLB_WIDTH<<1)][CLB_WIDTH-i-1] = io_up_s[((CH_WIDTH>>1)*(i+1))-1:((CH_WIDTH>>1)*i)];
			assign vDnChannels[0][CLB_WIDTH-i-1] = io_dn_n[((CH_WIDTH>>1)*(i+1))-1:((CH_WIDTH>>1)*i)];
			assign io_dn_s[((CH_WIDTH>>1)*(i+1))-1:((CH_WIDTH>>1)*i)] = vDnChannels[(CLB_WIDTH<<1)][CLB_WIDTH-i-1];
			assign io_lt_n[((CH_WIDTH>>1)*(i+1))-1:((CH_WIDTH>>1)*i)] = hLtChannels[i][0];
			assign hLtChannels[i][(CLB_WIDTH<<1)] = io_lt_s[((CH_WIDTH>>1)*(i+1))-1:((CH_WIDTH>>1)*i)];
			assign hRtChannels[i][0] = io_rt_n[((CH_WIDTH>>1)*(i+1))-1:((CH_WIDTH>>1)*i)];
			assign io_rt_s[((CH_WIDTH>>1)*(i+1))-1:((CH_WIDTH>>1)*i)] = hRtChannels[i][(CLB_WIDTH<<1)];
		end
	endgenerate

endmodule
