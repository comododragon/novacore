/* ********************************************************************************************* */
/* * NovaCORE CLB -> Channel Bus Junction Testbench                                            * */
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

module FromCLBToChannelBusJunction_tb;

	reg r_clk;
	reg r_mode;
	reg [16:0] r_c_bus;
	reg [1:0] r_c_dimension;
	reg [1:0] r_ch_up_s;
	reg [1:0] r_ch_dn_n;
	reg r_clb_out;
	wire [1:0] w_ch_up_n;
	wire [1:0] w_ch_dn_s;
	
	FromCLBToChannelBusJunction#(4, 2, 2, 2) inst(
		.mode(r_mode),
		.c_bus(r_c_bus),
		.c_dimension(r_c_dimension),

		.ch_up_n(w_ch_up_n),
		.ch_up_s(r_ch_up_s),
		.ch_dn_n(r_ch_dn_n),
		.ch_dn_s(w_ch_dn_s),
		.clb_out(r_clb_out)
	);

	/* Configs.:     */
	/* DIMENSION 0:  */
	/*    1  1  ^  ^ */
	/* >--X--X--X--X */
	/*    V  V  1  1 */
	/* DIMENSION 1:  */
	/*    1  1  ^  ^ */
	/* >--|--|--|--X */
	/*    V  V  1  1 */
	/* DIMENSION 2:  */
	/*    1  1  ^  ^ */
	/* >--|--|--|--| */
	/*    V  V  1  1 */
	/* DIMENSION 3:  */
	/*    1  1  ^  ^ */
	/* >--X--|--X--| */
	/*    V  V  1  1 */
	initial begin
		$dumpfile("FromCLBToChannelBusJunction_tb.vcd");
		$dumpvars(1, r_clk, r_mode, r_c_bus, r_c_dimension, r_ch_up_s, r_ch_dn_n, r_clb_out, w_ch_up_n, w_ch_dn_s, inst);
		r_clk <= 'b1;
		r_mode <= 'b0;
		r_c_bus <= 'h0;
		r_c_dimension <= 'h0;
		r_ch_up_s <= 'h3;
		r_ch_dn_n <= 'h3;
		r_clb_out <= 'b0;

		#100 @(posedge r_clk);
		/* Enter configuration mode */
		r_mode <= 'b1;

		/* Note that data is valid BEFORE and AFTER memory write due to asynchronous falling/rising edges */
		#50 @(posedge r_clk);
		/* Holding data before reg_write assert */
		r_c_bus <= {1'b0, 8'b10000011, 8'b10000111};
		#50 @(posedge r_clk);
		/*                               1  1  ^  ^        1  1  ^  ^        1  1  ^  ^        1  1  ^  ^ */
		/* Set: CLB interconnect: D3: >--X--|--X--| D2: >--|--|--|--| D1: >--|--|--|--X D0: >--X--X--X--X */
		/*                               V  V  1  1        V  V  1  1        V  V  1  1        V  V  1  1 */
		r_c_bus <= {1'b1, 8'b10000011, 8'b10000111};
		#50 @(posedge r_clk);
		/* Holding data after reg_write deassert */
		r_c_bus <= {1'b0, 8'b10000011, 8'b10000111};

		#100 @(posedge r_clk);
		/* Enter active mode */
		r_mode <= 'b0;

		/* Test some possible inputs */
		#50 @(posedge r_clk);
		r_clb_out <= 'b0;
		/* w_ch_dn_s == 00 */
		/* w_ch_up_n == 00 */
		#50 @(posedge r_clk);
		r_clb_out <= 'b1;
		/* w_ch_dn_s == 11 */
		/* w_ch_up_n == 11 */

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
		r_clb_out <= 'b0;
		/* w_ch_dn_s == 11 */
		/* w_ch_up_n == 10 */
		#50 @(posedge r_clk);
		r_clb_out <= 'b1;
		/* w_ch_dn_s == 11 */
		/* w_ch_up_n == 11 */

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
		r_clb_out <= 'b0;
		/* w_ch_dn_s == 11 */
		/* w_ch_up_n == 11 */
		#50 @(posedge r_clk);
		r_clb_out <= 'b1;
		/* w_ch_dn_s == 11 */
		/* w_ch_up_n == 11 */

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
		r_clb_out <= 'b0;
		/* w_ch_dn_s == 01 */
		/* w_ch_up_n == 01 */
		#50 @(posedge r_clk);
		r_clb_out <= 'b1;
		/* w_ch_dn_s == 11 */
		/* w_ch_up_n == 11 */

		#50 @(posedge r_clk);
		$finish;
	end

	always begin
		#50 r_clk <= ~r_clk;
	end

endmodule
