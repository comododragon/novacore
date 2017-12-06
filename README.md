# NovaCORE vFPGA

## Authors

* André Bannwart Perina
* Jesimar da Silva Arantes
* Vanderleu Bonato

## Introduction

NovaCORE is a virtual FPGA system developed in Verilog. It features a simple architecture with support to multidimensionality, i.e., multiple configurations may be held on the configuration memory. Thus, switching between those dimensions may be performed in a single clock cycle.

## Licence

This project is licensed under GPLv3 (see LICENSE file).

## In-depth Description

The NovaCORE is composed mainly of three modules:

* ***CLB***: Configurable Logic Block, composed of one LUT and one register;
* ***CB***: Connection box, used to connect the CLBs to the interconnect network;
* ***SB***: Switch box, used to interconnect vertical and horizontal channels of the interconnect network.

Further information about the architecture and its features may be found in this article:

* SOON!

## Simulating the modules

The CLB, CB and SB modules may be simulated by using provided testbenches. These generate waveform files that may be visualised for validation.

### Required tools

* ***Icarus Verilog simulator***: http://iverilog.icarus.com/
* ***GNU Make***
* ***GtkWave*** or any other visualisation tool for opening VCD files: http://gtkwave.sourceforge.net/

### Simulating the CLB

* Head to the CLB Verilog folder:
```
$ cd CLB/Verilog
```
* Run make:
```
$ make bin/CLB_tb
```
* Execute the generated binary:
```
$ ./bin/CLB_tb
```
* A waveform file `CLB_tb.vcd` will be generated.

### Simulating the CB

Same instructions for the CLB module, however there are three available testbenches:

* ***CBox_tb.v***: Simulate the CB module;
* ***FromChannelBusToCLBJunction_tb.v***: Simulate the Channel Bus -> CLB junction module;
* ***FromCLBToChannelBusJunction_tb.v***: Simulate the CLB -> Channel Bus junction module;

### Simulating the SB

Same instructions for the SB module. Available testbench:

* ***SBox_tb.v***: Simulate the SB module.

## Running NovaCORE on an actual FPGA

The NovaCORE system was tested on an Intel FPGA Stratix IV EP4SGX230KF40C2ES. For other FPGAs, the Quartus project must be changed accordingly (or migrated to other EDA tools). Currently there are no tools for analysis and synthesis. Therefore, the bitstream must be manually created (have fun). There is a working project with 4 CLBs, 4 dimensions at `NovaCORE/Quartus/Full/2x2`.

* Create a Text Object File (.tof) describing all bitstream packets (see section ***Packets Description*** for further info). An example of .tof file is available at `NovaCORE/Bitstream.tof`, with its textual description present in `NovaCORE/Bitstream.v`;
* Use the `tof2mif.sh` tool to generate a Memory Initialisation File (.mif):
```
$ ./Utils/tof2mif.sh Bitstream.tof Bitstream.mif
```
* Convert the generated MIF file to HEX file (this conversion will be removed in future versions). Script for conversion between MIF and HEX files: https://www.altera.com/support/support-resources/knowledge-base/solutions/rd05252007_766.html
* Copy the MIF/HEX file to the NovaCORE Quartus folder:
```
$ cp Bitstream.hex Quartus/Full/2x2/bitstream.hex
```
* Compile the project using Quartus;
* Import the BitstreamLoader NIOS II project using the NIOS II SBT for Eclipse located at `NovaCORE/Quartus/Full/2x2/software`;
* Program the host FPGA;
* Compile and execute the BitstreamLoader;
* Follow on-screen instructions for programming the virtual FPGA or to change its dimension.

## Packets Description

The NovaCORE vFPGA is programmed by packets. One or more packets are sent to each module (CLBs, SBs and CBs) for programming. Each module is identified by a Unique ID (UID). Verilog files `CBox.v`, `CLB.v` and `SBox.v` have brief visual explanation on their functionality. Refer to Figure 3 on the article for an example of how modules are organised and identified.

### Packet description for CLB

```
| UID | 01 | ADDR | DATA |
| UID | 10 |   OUTTYPE   |

The first type of packet writes DATA to ADDR on the LUT. ADDR has LUT_WIDTH bits. DATA has DIMENSION bits, where the i-th bit of DATA defines the LUT output when on dimension i.

The second type of packet defines if the LUT's output should be registered or not by reading OUTTYPE. OUTTYPE has DIMENSION bits, where the i-th bit defines if the output should be registered when on dimension i (1 for registered, 0 for unregistered).

NOTE: LUT_WIDTH and DIMENSION are Verilog parameters.
```

### Packet description for CB

```
| UID | BLK | Dn-1 | ... | D2 | D1 | D0 |

A CB is composed of blocks, CLB_IN_WIDTH blocks for CB -> CLB junctions and CLB_OUT_WIDTH blocks for CLB -> CB junctions. Each junction may be connected to one of the vertical interconnect channels, CH_UP_WIDTH channels goind upwards and CH_DN_WIDTH channels goind downwards. Di defines how block BLK should be connected on dimension i. The values of Di have different behaviours for each type of junction:

CB -> CLB junction: Bit i defines if the junction should be connected to the i-th channel, from right to left. More than one bit may be 1.
CLB -> CB junction: If number i is set, the junction is connected to the i-th channel, from right to left.

Refer to Figure 5 on the article for an example of CB configuration.

NOTE: CLB_IN_WIDTH, CLB_OUT_WIDTH, CH_UP_WIDTH and CH_DN_WIDTH are Verilog parameters.
```

### Packet description for SB

```
| UID | MUX | Dn-1 | ... | D2 | D1 | D0 |

A SB is composed of 2 * (CH_UP_WIDTH + CH_DN_WIDTH) multiplexers, each with 2 * (CH_UP_WIDTH + CH_DN_WIDTH) inputs. The value in Di defines to which input the multiplexer MUX is connected on dimension i. Refer to the Verilog file SB.v for how multiplexers and inputs are numbered.

NOTE: CH_UP_WIDTH, CH_DN_WIDTH are Verilog parameters.
```

## Repository structure

* ***CBox***: CB module;
	* ***Verilog/src***
		* ***CBox.v***: CB Verilog module;
		* ***CBox_tb.v***: Testbench for the CB Verilog module;
		* ***FromChannelBusToCLBJunction.v***: CB -> CLB junction Verilog module;
		* ***FromChannelBusToCLBJunction_tb.v***: Testbench;
		* ***FromCLBToChannelBusJunction.v***: CLB -> CB junction Verilog module;
		* ***FromCLBToChannelBusJunction_tb.v***: Testbench;
	* ***Makefile***
* ***CLB***: CLB module;
	* ***Verilog/src***
		* ***AsyncRAM.v***: Asynchronous-read inferrable RAM Verilog module;
		* ***CLB.v***: CLB Verilog module;
		* ***CLB_tb.v***: Testbench for the CLB Verilog module;
	* ***Makefile***
* ***SBox***: SB module;
	* ***Verilog/src***
		* ***MDimMux.v***: Multidimensional multiplexer Verilog module;
		* ***SBox.v***: SB Verilog module;
		* ***SBox_tb.v***: Testbench for the SB Verilog module;
	* ***Makefile***
* ***NovaCORE***: The vFPGA;
	* ***Verilog/scr***
		* ***NovaCORE.v***: The virtual FPGA Verilog module;
	* ***Utils***
		* ***tof2mif.sh***: TOF (Text Object File) to MIF (Memory Initialisation File) converter script;
	* ***Quartus***:
		* ***Full/2x2***: Working project for a 2x2 NovaCORE FPGA with 4 dimensions;
			* ***NovaCOREBlaster***: Qsys system for the bitstream loader;
			* ***software***: BitstreamLoader projects for the NIOS II SBT for Eclipse tool;
			* ***bitstream.hex***: Bitstream to be loaded;
			* ***TOP.v***: Top-level Verilog module;
		* ***Standalone***: Several Quartus projects for synthesis and resource count;
	* ***Bitstream.mif***: Example MIF file generated from Bitstream.tof;
	* ***Bitstream.tof***: Text Object File with an example of bitstream as described in Bitstream.v;
	* ***Bitstream.v***: Example of configuration for a 4-dimension FPGA.
