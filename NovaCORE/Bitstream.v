// THIS IS NOT A VERILOG MODULE, JUST A FILE WITH .v EXTENSION FOR HIGHLIGHTING PURPOSES
// LEDs and buttons here are being considered assert on high

// Dimensions functions descriptions:

Dimension 0:

led_g[7] = c[31] OR c[30]
led_g[6] = c[31] OR c[30]
led_g[5] = c[31] AND c[30]
led_g[4] = c[31] AND c[30]

Dimension 1:

led_g[7] = c[31] NAND c[30]
led_g[6] = c[31] NAND c[30]
led_g[5] = c[31] XOR c[30]
led_g[4] = c[31] XOR c[30]

Dimension 2:

led_g[7] = user_pb[2] OR user_pb[2]
led_g[6] = user_pb[2] OR user_pb[2]
led_g[5] = user_pb[2] AND user_pb[2]
led_g[4] = user_pb[2] AND user_pb[2]

Dimension 3:

led_g[7] = 1
led_g[6] = 1
led_g[5] = 1
led_g[4] = 1

// All information hereafter are translated to pure binary and don't cares on a text object file (TOF) and converted using tof2mif.sh

CB 0:
	{ UID,  BLK,      D3,      D2,      D1,      D0}
	{4'h0, 2'h0,    4'hX,    4'hX,    4'h3,    4'h3}
	{4'h0, 2'h1,    4'hX,    4'hX,    4'h2     4'h2}
	{4'h0, 2'h2,    4'hX,    4'hX,    4'hX,    4'hX}
	{4'h0, 2'h3, 8'b00000000, 8'b00000000}

SB 1:
	{ UID,  BLK,   D3,   D2,   D1,   D0}
	{4'h1, 3'h0, 3'hX, 3'hX, 3'hX, 3'hX}
	{4'h1, 3'h1, 3'hX, 3'hX, 3'hX, 3'hX}
	{4'h1, 3'h2, 3'h6, 3'h6, 3'h4, 3'h4}
	{4'h1, 3'h3, 3'h6, 3'h6, 3'h4, 3'h4}
	{4'h1, 3'h4, 3'hX, 3'h0, 3'hX, 3'hX}
	{4'h1, 3'h5, 3'hX, 3'h1, 3'hX, 3'hX}
	{4'h1, 3'h6, 3'hX, 3'h0, 3'hX, 3'hX}
	{4'h1, 3'h7, 3'hX, 3'h1, 3'hX, 3'hX}

CB 2:
	{ UID,  BLK,      D3,      D2,      D1,      D0}
	{4'h2, 2'h0,    4'hX,    4'h2,    4'hX,    4'hX}
	{4'h2, 2'h1,    4'hX,    4'h3,    4'hX     4'hX}
	{4'h2, 2'h2,    4'hX,    4'hX,    4'hX,    4'hX}
	{4'h2, 2'h3, 8'b0000000000, 8'b0000000000}

SB 3:
	{ UID,  BLK,   D3,   D2,   D1,   D0}
	{4'h3, 3'h0, 3'hX, 3'hX, 3'hX, 3'hX}
	{4'h3, 3'h1, 3'hX, 3'hX, 3'hX, 3'hX}
	{4'h3, 3'h2, 3'h0, 3'h4, 3'hX, 3'hX}
	{4'h3, 3'h3, 3'hX, 3'hX, 3'hX, 3'hX}
	{4'h3, 3'h4, 3'hX, 3'hX, 3'hX, 3'hX}
	{4'h3, 3'h5, 3'hX, 3'hX, 3'hX, 3'hX}
	{4'h3, 3'h6, 3'hX, 3'hX, 3'hX, 3'hX}
	{4'h3, 3'h7, 3'hX, 3'hX, 3'hX, 3'hX}

CLB 4:
	{ UID,  RWR,  MWR, ADDR,    DATA}
	{4'h4, 1'b0, 1'b1, 2'h0, 4'bXX00}
	{4'h4, 1'b0, 1'b1, 2'h1, 4'bXX10}
	{4'h4, 1'b0, 1'b1, 2'h2, 4'bXX10}
	{4'h4, 1'b0, 1'b1, 2'h3, 4'bXX01}
	{ UID,  RWR,  MWR,   NC,  OUTTYP}
	{4'h4, 1'b1, 1'b0, 2'hX, 4'bXX00}

CB 5:
	{ UID,  BLK,      D3,      D2,      D1,      D0}
	{4'h5, 1'b0,    4'hX,    4'hX,    4'hX,    4'hX}
	{4'h5, 1'b1, 4'b00000000, 4'b00000101}

CLB 6:
	{ UID,  RWR,  MWR, ADDR,    DATA}
	{4'h6, 1'b0, 1'b1, 2'h0, 4'bX0XX}
	{4'h6, 1'b0, 1'b1, 2'h1, 4'bX1XX}
	{4'h6, 1'b0, 1'b1, 2'h2, 4'bX1XX}
	{4'h6, 1'b0, 1'b1, 2'h3, 4'bX1XX}
	{ UID,  RWR,  MWR,   NC,  OUTTYP}
	{4'h6, 1'b1, 1'b0, 2'hX, 4'bX0XX}

CB 7:
	{ UID,  BLK,      D3,      D2,      D1,      D0}
	{4'h7, 1'b0,    4'hX,    4'hX,    4'hX,    4'hX}
	{4'h7, 1'b1, 8'b0000XXXX, 8'b0001XXXX}

CB 8:
	// Same as CB 0

SB 9:
	// Same as SB 1

CB 10:
	// Same as CB 2

SB 11:
	// Same as SB 3

CLB 12:
	{  UID,  RWR,  MWR, ADDR,    DATA}
	{4'h12, 1'b0, 1'b1, 2'h0, 4'bXX10}
	{4'h12. 1'b0, 1'b1, 2'h1, 4'bXX01}
	{4'h12, 1'b0, 1'b1, 2'h2, 4'bXX01}
	{4'h12, 1'b0, 1'b1, 2'h3, 4'bXX01}
	{  UID,  RWR,  MWR,   NC,  OUTTYP}
	{4'h12, 1'b1, 1'b0, 2'hX, 4'bXX00}

CB 13:
	// Same as CB 5

CLB 14:
	{  UID,  RWR,  MWR, ADDR,    DATA}
	{4'h14, 1'b0, 1'b1, 2'h0, 4'bX0XX}
	{4'h14, 1'b0, 1'b1, 2'h1, 4'bX1XX}
	{4'h14, 1'b0, 1'b1, 2'h2, 4'bX1XX}
	{4'h14, 1'b0, 1'b1, 2'h3, 4'bX1XX}
	{  UID,  RWR,  MWR,   NC,  OUTTYP}
	{4'h14, 1'b1, 1'b0, 2'hX, 4'bX0XX}

CB 15:
	// Same as CB 7
