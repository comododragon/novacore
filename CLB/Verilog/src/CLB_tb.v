/* ********************************************************************************************* */
/* * NovaCORE Configurable Logic Block Testbench                                               * */
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

module CLB_tb;

	reg r_clk;
	reg r_clk_en;
	reg r_mode;
	reg [7:0] r_c_bus;
	reg [1:0] r_c_dimension;
	reg [1:0] r_b_in;
	wire w_b_out;

	CLB#(0, 4, 1, 2, 2) inst (
		.clk(r_clk),
		.clk_en(r_clk_en),
		.mode(r_mode),

		.c_clk(r_clk),
		.c_bus(r_c_bus),
		.c_uid(1'b0),
		.c_dimension(r_c_dimension),

		.b_in(r_b_in),
		.b_out(w_b_out)
	);

	initial begin
		$dumpfile("CLB_tb.vcd");
		$dumpvars(1, r_clk, r_clk_en, r_mode, r_c_bus, r_c_dimension, r_b_in, w_b_out, inst);
		r_clk <= 'b1;
		r_clk_en <= 'b0;
		r_mode <= 'b0;
		r_c_bus <= 'h0;
		r_c_dimension <= 'h0;
		r_b_in <= 'h0;
		#100 @(posedge r_clk);

		/* Enter configuration mode */
		r_mode <= 'b1;
		#100 @(posedge r_clk);

		/* Set: LUT first word: 'b0001 */
		r_c_bus <= {1'b0, 1'b1, 2'h0, 4'h1};
		#50 @(posedge r_clk);
		/* Set: LUT second word; 'b1101 */
		r_c_bus <= {1'b0, 1'b1, 2'h1, 4'hd};
		#50 @(posedge r_clk);
		/* Set: LUT third word; 'b1101 */
		r_c_bus <= {1'b0, 1'b1, 2'h2, 4'hd};
		#50 @(posedge r_clk);
		/* Set: LUT fourth word; 'b1011 */
		r_c_bus <= {1'b0, 1'b1, 2'h3, 4'hb};
		#50 @(posedge r_clk);
		/* Set registers: Output is registered on 3rd dimension */
		r_c_bus <= {1'b1, 1'b0, 2'h0, 4'h4};
		#50 @(posedge r_clk);

		/* Enter active mode */
		r_mode <= 'b0;
		#100 @(posedge r_clk);

		/* Test all possible inputs */
		r_b_in <= 'h0;
		#50 @(posedge r_clk);
		/* w_b_out == 1 */
		r_b_in <= 'h1;
		#50 @(posedge r_clk);
		/* w_b_out == 1 */
		r_b_in <= 'h2;
		#50 @(posedge r_clk);
		/* w_b_out == 1 */
		r_b_in <= 'h3;
		#50 @(posedge r_clk);
		/* w_b_out == 1 */

		/* Enter configuration mode */
		r_mode <= 'b1;
		#100 @(posedge r_clk);

		/* Change to second dimension */
		r_c_dimension <= 'h1;
		#50 @(posedge r_clk);

		/* Enter active mode */
		r_mode <= 'b0;
		#100 @(posedge r_clk);

		/* Test all possible inputs */
		r_b_in <= 'h0;
		#50 @(posedge r_clk);
		/* w_b_out == 0 */
		r_b_in <= 'h1;
		#50 @(posedge r_clk);
		/* w_b_out == 0 */
		r_b_in <= 'h2;
		#50 @(posedge r_clk);
		/* w_b_out == 0 */
		r_b_in <= 'h3;
		#50 @(posedge r_clk);
		/* w_b_out == 1 */

		/* Enter configuration mode */
		r_mode <= 'b1;
		#100 @(posedge r_clk);

		/* Change to third dimension */
		r_c_dimension <= 'h2;
		#50 @(posedge r_clk);

		/* Enter active mode */
		r_mode <= 'b0;
		#100 @(posedge r_clk);

		/* Test all possible inputs */
		r_b_in <= 'h0;
		#50 @(posedge r_clk);
		/* w_b_out == X */
		r_b_in <= 'h1;
		#50 @(posedge r_clk);
		/* w_b_out == X */
		r_b_in <= 'h2;
		#50 @(posedge r_clk);
		/* w_b_out == X */
		r_b_in <= 'h3;
		#50 @(posedge r_clk);
		/* w_b_out == X */

		/* Enter configuration mode */
		r_mode <= 'b1;
		#100 @(posedge r_clk);

		/* Change to fourth dimension */
		r_c_dimension <= 'h3;
		#50 @(posedge r_clk);

		/* Enter active mode */
		r_mode <= 'b0;
		#100 @(posedge r_clk);

		/* Test all possible inputs */
		r_b_in <= 'h0;
		#50 @(posedge r_clk);
		/* w_b_out == 0 */
		r_b_in <= 'h1;
		#50 @(posedge r_clk);
		/* w_b_out == 1 */
		r_b_in <= 'h2;
		#50 @(posedge r_clk);
		/* w_b_out == 1 */
		r_b_in <= 'h3;
		#50 @(posedge r_clk);
		/* w_b_out == 1 */

		/* Enter configuration mode */
		r_mode <= 'b1;
		#100 @(posedge r_clk);

		/* Change to third dimension */
		r_c_dimension <= 'h2;
		#50 @(posedge r_clk);

		/* Enter active mode */
		r_mode <= 'b0;
		#100 @(posedge r_clk);

		/* Test all possible inputs: Result is registered only on inputs 01 and 11 */
		r_b_in <= 'h0;
		#50 @(posedge r_clk);
		/* w_b_out == X */
		r_b_in <= 'h1;
		#50 @(posedge r_clk);
		/* w_b_out == X */
		r_clk_en <= 'b1;
		#50 @(posedge r_clk);
		/* w_b_out == X */
		r_clk_en <= 'b0;
		#50 @(posedge r_clk);
		/* w_b_out == 1 */
		r_b_in <= 'h2;
		#50 @(posedge r_clk);
		/* w_b_out == 1 */
		r_b_in <= 'h3;
		#50 @(posedge r_clk);
		/* w_b_out == 1 */
		r_clk_en <= 'b1;
		#50 @(posedge r_clk);
		/* w_b_out == 1 */
		r_clk_en <= 'b0;
		#50 @(posedge r_clk);
		/* w_b_out == 0 */

		#200 @(posedge r_clk);

		$finish;
	end

	always begin
		#50 r_clk <= ~r_clk;
	end

endmodule
