#!/bin/sh

# ############################################################################################# #
# # tof2mif: Text Object File to MIF converter                                                # #
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

if [ $# -ne 2 ]; then
	echo "Usage: $0 TOFFILE SOFFILE"
	echo -e "\tConverts a file filled with 0s, 1s and Xs (don't care) to a 32-bit MIF file. Whitespaces (except newlines) are ignored."
	exit 1
fi

TMPFILE=`mktemp`
TMPFILE2=`mktemp`
TMPFILE3=`mktemp`
TMPFILE4=`mktemp`

tr -d '\t\r\f ' < $1 > $TMPFILE
sed s/X/0/g $TMPFILE > $TMPFILE2
sed /^$/d $TMPFILE2 > $TMPFILE3
awk '{ print FNR-1 ": " $0 ";" }' $TMPFILE3 > $TMPFILE4

echo -ne "-- MIF File generated using tof2mif\n\nDEPTH = 16384;\nWIDTH = 32;\nADDRESS_RADIX = DEC;\nDATA_RADIX = BIN;\n\nCONTENT BEGIN\n" > $2
cat $TMPFILE4 >> $2
echo -ne "END;\n" >> $2

rm $TMPFILE
rm $TMPFILE2
rm $TMPFILE3
rm $TMPFILE4
