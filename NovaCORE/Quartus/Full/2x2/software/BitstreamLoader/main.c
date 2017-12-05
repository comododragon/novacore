#include <stdio.h>
#include <stdbool.h>

#include "system.h"
#include "altera_avalon_pio_regs.h"

#define BITSTREAM_SZ 76

int main(void) {
	char c;
	bool quit = false;
	unsigned int i, curDim = 0, memWord;

	printf(">> Changing NovaCORE mode to CONFIG...\n");
	IOWR_ALTERA_AVALON_PIO_DATA(PIO_C_BUS_BASE, 0x0);
	IOWR_ALTERA_AVALON_PIO_DATA(PIO_C_UID_BASE, 0x0);
	IOWR_ALTERA_AVALON_PIO_DATA(PIO_C_CLK_BASE, 0x0);
	IOWR_ALTERA_AVALON_PIO_DATA(PIO_C_DIMENSION_BASE, curDim);
	IOWR_ALTERA_AVALON_PIO_DATA(PIO_C_DIMSWITCH_BASE, 0x0);
	IOWR_ALTERA_AVALON_PIO_DATA(PIO_MODE_BASE, 0x1);

	printf(">> Setting dimension to 0...\n");
	IOWR_ALTERA_AVALON_PIO_DATA(PIO_C_DIMENSION_BASE, 0x0);
	IOWR_ALTERA_AVALON_PIO_DATA(PIO_C_DIMSWITCH_BASE, 0x1);
	IOWR_ALTERA_AVALON_PIO_DATA(PIO_C_DIMSWITCH_BASE, 0x0);

	printf("Welcome to NovaCORE Blaster.\n");

	do {
		printf("Available options:\n");
		printf(" a) Load and run bitstream;\n");
		printf(" b) Change dimension;\n");
		printf(" q) Quit.\n");
		printf("Option: ");

		c = getchar();
		getchar();

		switch(c) {
			case 'a':
				printf(">> Programming NovaCORE...\n");
				printf(">> Changing NovaCORE mode to CONFIG...\n");
				IOWR_ALTERA_AVALON_PIO_DATA(PIO_MODE_BASE, 0x1);
				IOWR_ALTERA_AVALON_PIO_DATA(PIO_C_DIMSWITCH_BASE, 0x0);
				IOWR_ALTERA_AVALON_PIO_DATA(PIO_C_CLK_BASE, 0x0);

				printf(">> Sending data...\n");
				for(i = 0; i < BITSTREAM_SZ; i++) {
					memWord = IORD(BITSTREAM_MEMORY_BASE, i);
					IOWR_ALTERA_AVALON_PIO_DATA(PIO_C_UID_BASE, (memWord >> 28) & 0xf);
					IOWR_ALTERA_AVALON_PIO_DATA(PIO_C_BUS_BASE, memWord & 0xfffffff);

					IOWR_ALTERA_AVALON_PIO_DATA(PIO_C_CLK_BASE, 0x1);
					IOWR_ALTERA_AVALON_PIO_DATA(PIO_C_CLK_BASE, 0x0);
				}

				printf(">> Changing NovaCORE mode to RUN...\n");
				IOWR_ALTERA_AVALON_PIO_DATA(PIO_MODE_BASE, 0x0);
				printf(">> Done!\n");
				break;
			case 'b':
				printf(">> Changing NovaCORE dimension from %d to %d...\n", curDim, (curDim + 1) % 4);
				printf(">> Changing NovaCORE mode to CONFIG...\n");
				IOWR_ALTERA_AVALON_PIO_DATA(PIO_MODE_BASE, 0x1);
				IOWR_ALTERA_AVALON_PIO_DATA(PIO_C_DIMSWITCH_BASE, 0x0);

				printf(">> Changing dimension...\n");
				curDim = (curDim + 1) % 4;
				IOWR_ALTERA_AVALON_PIO_DATA(PIO_C_DIMENSION_BASE, curDim);
				IOWR_ALTERA_AVALON_PIO_DATA(PIO_C_DIMSWITCH_BASE, 0x1);
				IOWR_ALTERA_AVALON_PIO_DATA(PIO_C_DIMSWITCH_BASE, 0x0);

				printf(">> Changing NovaCORE mode to RUN...\n");
				IOWR_ALTERA_AVALON_PIO_DATA(PIO_MODE_BASE, 0x0);
				printf(">> Done!\n");
				break;
			case 'q':
				quit = true;
				break;
			default:
				printf("Invalid option.\n");
				break;
		}
	} while(!quit);

	printf("Bye!\n");

	return 0;
}
