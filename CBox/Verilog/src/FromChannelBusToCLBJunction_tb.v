/* ********************************************************************************************* */
/* * NovaCORE Channel Bus -> CLB Junction Testbench                                            * */
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

`timescale 1ns/1ps

module FromChannelBusToCLBJunction_tb;

	reg r_clk;
	reg r_mode;
	reg [16:0] r_c_bus;
	reg [1:0] r_c_dimension;
	reg [1:0] r_ch_up_s;
	reg [1:0] r_ch_dn_n;
	wire w_clb_in;
	
	FromChannelBusToCLBJunction#(4, 4, 2) inst(
		.mode(r_mode),
		.c_bus(r_c_bus),
		.c_dimension(r_c_dimension),

		.ch({r_ch_dn_n, r_ch_up_s}),
		.clb_in(w_clb_in)
	);

	/* Configs.:     */
	/* DIMENSION 0:  */
	/*    1  1  ^  ^ */
	/* <--|--|--|--X */
	/*    V  V  1  1 */
	/* DIMENSION 1:  */
	/*    1  1  ^  ^ */
	/* <--|--|--X--| */
	/*    V  V  1  1 */
	/* DIMENSION 2:  */
	/*    1  1  ^  ^ */
	/* <--|--X--|--| */
	/*    V  V  1  1 */
	/* DIMENSION 3:  */
	/*    1  1  ^  ^ */
	/* <--X--|--|--| */
	/*    V  V  1  1 */

	initial begin
		$dumpfile("FromChannelBusToCLBJunction_tb.vcd");
		$dumpvars(1, r_clk, r_mode, r_c_bus, r_c_dimension, r_ch_up_s, r_ch_dn_n, w_clb_in, inst);
		r_clk <= 'b1;
		r_mode <= 'b0;
		r_c_bus <= 'h0;
		r_c_dimension <= 'h0;
		r_ch_up_s <= 'h0;
		r_ch_dn_n <= 'h0;

		#100 @(posedge r_clk);
		/* Enter configuration mode */
		r_mode <= 'b1;

		/* Note that data is valid BEFORE and AFTER memory write due to asynchronous falling/rising edges */
		#50 @(posedge r_clk);
		/* Holding data before reg_write assert */
		r_c_bus <= {1'b0, 16'h3210};
		#50 @(posedge r_clk);
		/*                               1  1  ^  ^            1  1  ^  ^            1  1  ^  ^            1  1  ^  ^     */
		/* Set: CLB interconnect: D3: <--X--|--|--| (3) D2: <--|--X--|--| (2) D1: <--|--|--X--| (1) D0: <--|--|--|--X (0) */
		/*                               V  V  1  1            V  V  1  1            V  V  1  1            V  V  1  1     */
		r_c_bus <= {1'b1, 16'h3210};
		#50 @(posedge r_clk);
		/* Holding data after reg_write deassert */
		r_c_bus <= {1'b0, 16'h3210};

		#100 @(posedge r_clk);
		/* Enter active mode */
		r_mode <= 'b0;

		/* Test some possible inputs */
		#50 @(posedge r_clk);
		r_ch_up_s <= 'b00;
		r_ch_dn_n <= 'b00;
		/* w_clb_in == 0 */
		#50 @(posedge r_clk);
		r_ch_up_s <= 'b01;
		r_ch_dn_n <= 'b00;
		/* w_clb_in == 1 */

		#100 @(posedge r_clk);
		/* Enter configuration mode */
		r_mode <= 'b1;

		#50@(posedge r_clk);
		/* Change dimension */
		r_c_dimension <= 'h1;

		#100 @(posedge r_clk);
		/* Enter active mode */
		r_mode <= 'b0;

		/* Test some possible inputs */
		#50 @(posedge r_clk);
		r_ch_up_s <= 'b00;
		r_ch_dn_n <= 'b00;
		/* w_clb_in == 0 */
		#50 @(posedge r_clk);
		r_ch_up_s <= 'b10;
		r_ch_dn_n <= 'b00;
		/* w_clb_in == 1 */

		#100 @(posedge r_clk);
		/* Enter configuration mode */
		r_mode <= 'b1;

		#50@(posedge r_clk);
		/* Change dimension */
		r_c_dimension <= 'h2;

		#100 @(posedge r_clk);
		/* Enter active mode */
		r_mode <= 'b0;

		/* Test some possible inputs */
		#50 @(posedge r_clk);
		r_ch_up_s <= 'b00;
		r_ch_dn_n <= 'b00;
		/* w_clb_in == 0 */
		#50 @(posedge r_clk);
		r_ch_up_s <= 'b00;
		r_ch_dn_n <= 'b01;
		/* w_clb_in == 1 */

		#100 @(posedge r_clk);
		/* Enter configuration mode */
		r_mode <= 'b1;

		#50@(posedge r_clk);
		/* Change dimension */
		r_c_dimension <= 'h3;

		#100 @(posedge r_clk);
		/* Enter active mode */
		r_mode <= 'b0;

		/* Test some possible inputs */
		#50 @(posedge r_clk);
		r_ch_up_s <= 'b00;
		r_ch_dn_n <= 'b00;
		/* w_clb_in == 0 */
		#50 @(posedge r_clk);
		r_ch_up_s <= 'b00;
		r_ch_dn_n <= 'b01;
		/* w_clb_in == 0 */

		#50 @(posedge r_clk);
		$finish;
	end

	always begin
		#50 r_clk <= ~r_clk;
	end

endmodule
