/* ********************************************************************************************* */
/* * NovaCORE Connection Box Testbench                                                         * */
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

module CBox_tb;

	reg r_clk;
	reg r_mode;
	reg [17:0] r_c_bus;
	reg [1:0] r_c_dimension;
	reg [1:0] r_ch_up_s;
	reg [1:0] r_ch_dn_n;
	reg [1:0] r_clb_out;
	wire [1:0] w_ch_up_n;
	wire [1:0] w_ch_dn_s;
	wire [1:0] w_clb_in;

	CBox#(0, 4, 2, 2, 2, 2, 2, 16, 2) inst(
		.mode(r_mode),
		.c_clk(r_clk),
		.c_bus(r_c_bus),
		.c_dimension(r_c_dimension),

		.ch_up_n(w_ch_up_n),
		.ch_up_s(r_ch_up_s),
		.ch_dn_n(r_ch_dn_n),
		.ch_dn_s(w_ch_dn_s),

		.clb_in(w_clb_in),
		.clb_out(r_clb_out)
	);

	/* Configs.:     */
	/* DIMENSION 0:  */
	/*    1  1  ^  ^ */
	/* <--|--|--|--X */
	/* <--|--|--|--X */
	/* >--|--|--|--| */
	/* >--X--X--X--X */
	/*    V  V  1  1 */
	/* DIMENSION 1:  */
	/*    1  1  ^  ^ */
	/* <--X--|--|--| */
	/* <--|--|--|--X */
	/* >--|--|--X--| */
	/* >--|--|--|--X */
	/*    V  V  1  1 */
	/* DIMENSION 2:  */
	/*    1  1  ^  ^ */
	/* <--X--|--|--| */
	/* <--|--X--|--| */
	/* >--X--|--|--| */
	/* >--|--|--|--| */
	/*    V  V  1  1 */
	/* DIMENSION 3:  */
	/*    1  1  ^  ^ */
	/* <--|--|--|--X */
	/* <--|--|--|--X */
	/* >--|--|--|--| */
	/* >--|--|--|--| */
	/*    V  V  1  1 */

	initial begin
		$dumpfile("CBox_tb.vcd");
		$dumpvars(1, r_clk, r_mode, r_c_bus, r_c_dimension, r_ch_up_s, r_ch_dn_n, r_clb_out, w_ch_up_n, w_ch_dn_s, w_clb_in, inst);
		r_clk <= 'b1;
		r_mode <= 'b0;
		r_c_bus <= 'h0;
		r_c_dimension <= 'h0;
		r_ch_up_s <= 'h3;
		r_ch_dn_n <= 'h3;
		r_clb_out <= 'h0;
		#100 @(posedge r_clk);

		/* Enter configuration mode */
		r_mode <= 'b1;
		#100 @(posedge r_clk);

		/*                                     1  1  ^  ^            1  1  ^  ^            1  1  ^  ^            1  1  ^  ^     */
		/* Set: First CLB interconnect: D3: <--|--|--|--X (0) D2: <--X--|--|--| (3) D1: <--X--|--|--| (3) D0: <--|--|--|--X (0) */
		/*                                     V  V  1  1            V  V  1  1            V  V  1  1            V  V  1  1     */
		r_c_bus <= {2'h0, 16'h0330};
		#50 @(posedge r_clk);

		/*                                      1  1  ^  ^            1  1  ^  ^            1  1  ^  ^            1  1  ^  ^     */
		/* Set: Second CLB interconnect: D3: <--|--|--|--X (0) D2: <--|--X--|--| (2) D1: <--|--|--|--X (0) D0: <--|--|--|--X (0) */
		/*                                      V  V  1  1            V  V  1  1            V  V  1  1            V  V  1  1     */
		r_c_bus <= {2'h1, 16'h0200};
		#50 @(posedge r_clk);

		/*                                     1  1  ^  ^        1  1  ^  ^        1  1  ^  ^        1  1  ^  ^ */
		/* Set: Third CLB interconnect: D3: >--|--|--|--| D2: >--X--|--|--| D1: >--|--|--X--| D0: >--|--|--|--| */
		/*                                     V  V  1  1        V  V  1  1        V  V  1  1        V  V  1  1 */
		r_c_bus <= {2'h2, 8'b00100000, 8'b00001000};
		#50 @(posedge r_clk);

		/*                                      1  1  ^  ^        1  1  ^  ^        1  1  ^  ^        1  1  ^  ^ */
		/* Set: Fourth CLB interconnect: D3: >--|--|--|--| D2: >--|--|--|--| D1: >--|--|--|--X D0: >--X--X--X--X */
		/*                                      V  V  1  1        V  V  1  1        V  V  1  1        V  V  1  1 */
		r_c_bus <= {2'h3, 8'b00000011, 8'b00000111};
		#50 @(posedge r_clk);

		/* Enter active mode */
		r_mode <= 'b0;
		#100 @(posedge r_clk);

		/* Test all possible inputs */
		r_clb_out <= 'h0;
		#50 @(posedge r_clk);
		/* w_ch_dn_s == 00 */
		/* w_ch_up_n == 00 */
		/* w_clb_in == 00 */
		r_clb_out <= 'h1;
		#50 @(posedge r_clk);
		/* w_ch_dn_s == 00 */
		/* w_ch_up_n == 00 */
		/* w_clb_in == 00 */
		r_clb_out <= 'h2;
		#50 @(posedge r_clk);
		/* w_ch_dn_s == 11 */
		/* w_ch_up_n == 11 */
		/* w_clb_in == 11 */
		r_clb_out <= 'h3;
		#50 @(posedge r_clk);
		/* w_ch_dn_s == 11 */
		/* w_ch_up_n == 11 */
		/* w_clb_in == 11 */

		/* Enter configuration mode */
		r_mode <= 'b1;
		#100 @(posedge r_clk);

		/* Change dimension */
		r_c_dimension <= 'h1;
		#50@(posedge r_clk);

		/* Enter active mode */
		r_mode <= 'b0;
		#100 @(posedge r_clk);

		/* Test all possible inputs */
		r_clb_out <= 'h0;
		#50 @(posedge r_clk);
		/* w_ch_dn_s == 11 */
		/* w_ch_up_n == 00 */
		/* w_clb_in == 01 */
		r_clb_out <= 'h1;
		#50 @(posedge r_clk);
		/* w_ch_dn_s == 11 */
		/* w_ch_up_n == 10 */
		/* w_clb_in == 01 */
		r_clb_out <= 'h2;
		#50 @(posedge r_clk);
		/* w_ch_dn_s == 11 */
		/* w_ch_up_n == 01 */
		/* w_clb_in == 11 */
		r_clb_out <= 'h3;
		#50 @(posedge r_clk);
		/* w_ch_dn_s == 11 */
		/* w_ch_up_n == 11 */
		/* w_clb_in == 11 */

		/* Enter configuration mode */
		r_mode <= 'b1;
		#100 @(posedge r_clk);

		/* Change dimension */
		r_c_dimension <= 'h2;
		#50@(posedge r_clk);

		/* Enter active mode */
		r_mode <= 'b0;
		#100 @(posedge r_clk);

		/* Test all possible inputs */
		r_clb_out <= 'h0;
		#50 @(posedge r_clk);
		/* w_ch_dn_s == 01 */
		/* w_ch_up_n == 11 */
		/* w_clb_in == 11 */
		r_clb_out <= 'h1;
		#50 @(posedge r_clk);
		/* w_ch_dn_s == 11 */
		/* w_ch_up_n == 11 */
		/* w_clb_in == 11 */
		r_clb_out <= 'h2;
		#50 @(posedge r_clk);
		/* w_ch_dn_s == 01 */
		/* w_ch_up_n == 11 */
		/* w_clb_in == 11 */
		r_clb_out <= 'h3;
		#50 @(posedge r_clk);
		/* w_ch_dn_s == 11 */
		/* w_ch_up_n == 11 */
		/* w_clb_in == 11 */

		/* Enter configuration mode */
		r_mode <= 'b1;
		#100 @(posedge r_clk);

		/* Change dimension */
		r_c_dimension <= 'h3;
		#50@(posedge r_clk);

		/* Enter active mode */
		r_mode <= 'b0;
		#100 @(posedge r_clk);

		/* Test all possible inputs */
		r_clb_out <= 'h0;
		#50 @(posedge r_clk);
		/* w_ch_dn_s == 11 */
		/* w_ch_up_n == 11 */
		/* w_clb_in == 11 */
		r_clb_out <= 'h1;
		#50 @(posedge r_clk);
		/* w_ch_dn_s == 11 */
		/* w_ch_up_n == 11 */
		/* w_clb_in == 11 */
		r_clb_out <= 'h2;
		#50 @(posedge r_clk);
		/* w_ch_dn_s == 11 */
		/* w_ch_up_n == 11 */
		/* w_clb_in == 11 */
		r_clb_out <= 'h3;
		#50 @(posedge r_clk);
		/* w_ch_dn_s == 11 */
		/* w_ch_up_n == 11 */
		/* w_clb_in == 11 */

		#50 @(posedge r_clk);

		$finish;
	end

	always begin
		#50 r_clk <= ~r_clk;
	end

endmodule
