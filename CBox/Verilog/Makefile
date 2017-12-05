# ############################################################################################# #
# # Makefile                                                                                  # #
# # Author: André Bannwart Perina                                                             # #
# ############################################################################################# #
# # Copyright (c) 2016 André B. Perina                                                        # #
# #                                                                                           # #
# # Permission is hereby granted, free of charge, to any person obtaining a copy of this      # #
# # software and associated documentation files (the "Software"), to deal in the Software     # #
# # without restriction, including without limitation the rights to use, copy, modify,        # #
# # merge, publish, distribute, sublicense, and/or sell copies of the Software, and to        # #
# # permit persons to whom the Software is furnished to do so, subject to the following       # #
# # conditions:                                                                               # #
# #                                                                                           # #
# # The above copyright notice and this permission notice shall be included in all copies     # #
# # or substantial portions of the Software.                                                  # #
# #                                                                                           # #
# # THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,       # #
# # INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR  # #
# # PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE # #
# # FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR      # #
# # OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER    # #
# # DEALINGS IN THE SOFTWARE.                                                                 # #
# ############################################################################################# #

CBOXSRCS=src/CBox_tb.v src/CBox.v src/FromCLBToChannelBusJunction.v src/FromChannelBusToCLBJunction.v
FROMCLBTOCHANNELBUSJUNCTIONSRCS=src/FromCLBToChannelBusJunction_tb.v src/FromCLBToChannelBusJunction.v
FROMCHANNELBUSTOCLBJUNCTIONSRCS=src/FromChannelBusToCLBJunction_tb.v src/FromChannelBusToCLBJunction.v
CBOXBIN=bin/CBox_tb
FROMCLBTOCHANNELBUSJUNCTIONBIN=bin/FromCLBToChannelBusJunction_tb
FROMCHANNELBUSTOCLBJUNCTIONBIN=bin/FromChannelBusToCLBJunction_tb

$(CBOXBIN): $(CBOXSRCS)
	mkdir -p bin
	iverilog $(CBOXSRCS) -o $(CBOXBIN)

$(FROMCLBTOCHANNELBUSJUNCTIONBIN): $(FROMCLBTOCHANNELBUSJUNCTIONSRCS)
	mkdir -p bin
	iverilog $(FROMCLBTOCHANNELBUSJUNCTIONSRCS) -o $(FROMCLBTOCHANNELBUSJUNCTIONBIN)

$(FROMCHANNELBUSTOCLBJUNCTIONBIN): $(FROMCHANNELBUSTOCLBJUNCTIONSRCS)
	mkdir -p bin
	iverilog $(FROMCHANNELBUSTOCLBJUNCTIONSRCS) -o $(FROMCHANNELBUSTOCLBJUNCTIONBIN)

clean:
	rm -rf bin
