/* ********************************************************************************************* */
/* * NovaCORE Switch Box Testbench                                                             * */
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

module SBox_tb;

	reg r_clk;
	reg r_mode;
	reg [8:0] r_c_bus;
	reg r_c_dimension;
	reg [1:0] r_ch_up_s;
	reg [1:0] r_ch_dn_n;
	reg [1:0] r_ch_lt_s;
	reg [1:0] r_ch_rt_n;
	wire [1:0] w_ch_up_n;
	wire [1:0] w_ch_dn_s;
	wire [1:0] w_ch_lt_n;
	wire [1:0] w_ch_rt_s;

	SBox#(0, 2, 2, 2, 16, 1, 2) inst(
		.mode(r_mode),
		.c_clk(r_clk),
		.c_bus(r_c_bus),
		.c_dimension(r_c_dimension),

		.ch_up_n(w_ch_up_n),
		.ch_up_s(r_ch_up_s),
		.ch_dn_n(r_ch_dn_n),
		.ch_dn_s(w_ch_dn_s),

		.ch_lt_n(w_ch_lt_n),
		.ch_lt_s(r_ch_lt_s),
		.ch_rt_n(r_ch_rt_n),
		.ch_rt_s(w_ch_rt_s)
	);

	/* IO Numbering:          */
    /*       1  0  1  0       */
	/*     __V__V__^__^__     */
	/*    |              |    */
    /* 2 <                < 6 */
    /* 3 <                < 7 */
    /* 2 >                > 6 */
    /* 3 >                > 7 */
	/*    |__ __ ________|    */
	/*       V  V  ^  ^       */
	/*       5  4  5  4       */

	/* Configs.:                                                                                                                                               */
	/* DIMENSION 0:                                                                                                                                            */
	/*   __V__V_____^__     __V__V__^_____     __V__V________     __V__V________     __V__V________     __V__V________     __V__V________     __V__V________   */
	/*  |           |  |   |        |     |   |              |   |  |           |   |              |   |              |   |              |   |              |  */
    /*  |           +-- <  |        |      < < --------+      <  |  |            <  |     +--+--+-- <  |               <  |               <  |               < */
    /*  |               <  |        |      <  |        |      < < --+            <  |     |         <  |               <  |               <  |               < */
    /* >               |  >         |     |  >         |     |  >               |  >      |        |  >               |  > -------------- > > -----------+  |  */
    /* >               |  >         |     |  >         |     |  >               |  >      |        |  > --+           |  >               |  >            +-- > */
	/*  |______________|   |________|_____|   |________|_____|   |______________|   |_____|________|   |__|___________|   |______________|   |______________|  */
	/*           ^  ^               ^  ^               ^  ^               ^  ^            V  ^  ^         V     ^  ^               ^  ^               ^  ^     */
	/* DIMENSION 1:                                                                                                                                            */
	/*   __V__V_____^__     __V__V__^_____     __V__V________     __V__V________     __V__V________     __V__V________     __V__V________     __V__V________   */
	/*  |           |  |   |        |     |   |              |   |              |   |              |   |              |   |              |   |              |  */
    /*  |           |   <  |        +--+   < < -----------+   <  |               <  |               <  |               <  |               <  |               < */
    /*  |           |   <  |           |   <  |           |   < < -----------+   <  |               <  |               <  |               <  |               < */
    /* >            |  |  >            |  |  >            |  |  >            |  |  >               |  >               |  >            +-- > >               |  */
    /* >            |  |  >            |  |  >            |  |  >            |  |  >      +-----+  |  >   +--------+  |  >            |  |  >            +-- > */
	/*  |___________|__|   |___________|__|   |___________|__|   |___________|__|   |_____|_____|__|   |__|________|__|   |___________|__|   |___________|__|  */
	/*           ^  ^               ^  ^               ^  ^               ^  ^            V  ^  ^         V     ^  ^               ^  ^               ^  ^     */

	initial begin
		$dumpfile("SBox_tb.vcd");
		$dumpvars(1, r_clk, r_mode, r_c_bus, r_c_dimension, r_ch_up_s, r_ch_dn_n, r_ch_lt_s, r_ch_rt_n, w_ch_up_n, w_ch_dn_s, w_ch_lt_n, w_ch_rt_s);
		r_clk <= 'b1;
		r_mode <= 'b0;
		r_c_bus <= 'h0;
		r_c_dimension <= 'b0;
		r_ch_up_s <= 'h3;
		r_ch_dn_n <= 'h3;
		r_ch_lt_s <= 'h3;
		r_ch_rt_n <= 'h3;
		#100 @(posedge r_clk);

		/* Enter configuration mode */
		r_mode <= 'b1;
		#100 @(posedge r_clk);

		/* Set: Output 0: Input 4 (D1); Input 6 (D0) */
		r_c_bus <= {3'h0, 6'b100110};
		#50 @(posedge r_clk);
		/* Set: Output 1: Input 4 (D1); Input 5 (D0) */
		r_c_bus <= {3'h1, 6'b100101};
		#50 @(posedge r_clk);
		/* Set: Output 2: Input 4 (D1); Input 5 (D0) */
		r_c_bus <= {3'h2, 6'b100101};
		#50 @(posedge r_clk);
		/* Set: Output 3: Input 4 (D1); Input 1 (D0) */
		r_c_bus <= {3'h3, 6'b100001};
		#50 @(posedge r_clk);
		/* Set: Output 4: Input 4 (D1); Input 6 (D0) */
		r_c_bus <= {3'h4, 6'b100110};
		#50 @(posedge r_clk);
		/* Set: Output 5: Input 4 (D1); Input 3 (D0) */
		r_c_bus <= {3'h5, 6'b100011};
		#50 @(posedge r_clk);
		/* Set: Output 6: Input 4 (D1); Input 2 (D0) */
		r_c_bus <= {3'h6, 6'b100010};
		#50 @(posedge r_clk);
		/* Set: Output 7: Input 4 (D1); Input 2 (D0) */
		r_c_bus <= {3'h7, 6'b100010};
		#50 @(posedge r_clk);

		/* Enter active mode */
		r_mode <= 'b0;
		#100 @(posedge r_clk);

		/* Test possible inputs */
		r_ch_dn_n <= 'h0;
		r_ch_rt_n <= 'h0;
		r_ch_up_s <= 'h0;
		r_ch_lt_s <= 'h0;
		#50 @(posedge r_clk);
		/* w_ch_dn_s == 00 */
		/* w_ch_lt_n == 00 */
		/* w_ch_rt_s == 00 */
		/* w_ch_up_n == 00 */
		r_ch_dn_n <= 'h2;
		r_ch_rt_n <= 'h1;
		r_ch_up_s <= 'h0;
		r_ch_lt_s <= 'h0;
		#50 @(posedge r_clk);
		/* w_ch_dn_s == 00 */
		/* w_ch_lt_n == 10 */
		/* w_ch_rt_s == 11 */
		/* w_ch_up_n == 00 */
		r_ch_dn_n <= 'h2;
		r_ch_rt_n <= 'h3;
		r_ch_up_s <= 'h0;
		r_ch_lt_s <= 'h0;
		#50 @(posedge r_clk);
		/* w_ch_dn_s == 10 */
		/* w_ch_lt_n == 10 */
		/* w_ch_rt_s == 11 */
		/* w_ch_up_n == 00 */
		r_ch_dn_n <= 'h2;
		r_ch_rt_n <= 'h3;
		r_ch_up_s <= 'h2;
		r_ch_lt_s <= 'h3;
		#50 @(posedge r_clk);
		/* w_ch_dn_s == 11 */
		/* w_ch_lt_n == 11 */
		/* w_ch_rt_s == 11 */
		/* w_ch_up_n == 11 */
		r_ch_dn_n <= 'h1;
		r_ch_rt_n <= 'h0;
		r_ch_up_s <= 'h1;
		r_ch_lt_s <= 'h0;
		#50 @(posedge r_clk);
		/* w_ch_dn_s == 00 */
		/* w_ch_lt_n == 00 */
		/* w_ch_rt_s == 00 */
		/* w_ch_up_n == 00 */

		/* Enter configuration mode */
		r_mode <= 'b1;
		#100 @(posedge r_clk);

		/* Change dimension */
		r_c_dimension <= 'h1;
		#50@(posedge r_clk);

		/* Enter active mode */
		r_mode <= 'b0;
		#100 @(posedge r_clk);

		/* Test possible inputs */
		r_ch_dn_n <= 'h0;
		r_ch_rt_n <= 'h0;
		r_ch_up_s <= 'h0;
		r_ch_lt_s <= 'h0;
		#50 @(posedge r_clk);
		/* w_ch_dn_s == 00 */
		/* w_ch_lt_n == 00 */
		/* w_ch_rt_s == 00 */
		/* w_ch_up_n == 00 */
		r_ch_dn_n <= 'h2;
		r_ch_rt_n <= 'h1;
		r_ch_up_s <= 'h0;
		r_ch_lt_s <= 'h0;
		#50 @(posedge r_clk);
		/* w_ch_dn_s == 00 */
		/* w_ch_lt_n == 00 */
		/* w_ch_rt_s == 00 */
		/* w_ch_up_n == 00 */
		r_ch_dn_n <= 'h2;
		r_ch_rt_n <= 'h3;
		r_ch_up_s <= 'h0;
		r_ch_lt_s <= 'h0;
		#50 @(posedge r_clk);
		/* w_ch_dn_s == 00 */
		/* w_ch_lt_n == 00 */
		/* w_ch_rt_s == 00 */
		/* w_ch_up_n == 00 */
		r_ch_dn_n <= 'h2;
		r_ch_rt_n <= 'h3;
		r_ch_up_s <= 'h2;
		r_ch_lt_s <= 'h3;
		#50 @(posedge r_clk);
		/* w_ch_dn_s == 00 */
		/* w_ch_lt_n == 00 */
		/* w_ch_rt_s == 00 */
		/* w_ch_up_n == 00 */
		r_ch_dn_n <= 'h1;
		r_ch_rt_n <= 'h0;
		r_ch_up_s <= 'h1;
		r_ch_lt_s <= 'h0;
		#50 @(posedge r_clk);
		/* w_ch_dn_s == 11 */
		/* w_ch_lt_n == 11 */
		/* w_ch_rt_s == 11 */
		/* w_ch_up_n == 11 */

		#50 @(posedge r_clk);

		$finish;
	end

	always begin
		#50 r_clk <= ~r_clk;
	end

endmodule
