/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'nios2_gen2' in SOPC Builder design 'NovaCOREBlaster'
 * SOPC Builder design path: ../../NovaCOREBlaster.sopcinfo
 *
 * Generated: Fri Mar 31 13:24:36 BRT 2017
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/* Include definitions from linker script generator */
#include "linker.h"


/*
 * CPU configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "altera_nios2_gen2"
#define ALT_CPU_BIG_ENDIAN 0
#define ALT_CPU_BREAK_ADDR 0x00110820
#define ALT_CPU_CPU_ARCH_NIOS2_R1
#define ALT_CPU_CPU_FREQ 50000000u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x00000000
#define ALT_CPU_CPU_IMPLEMENTATION "tiny"
#define ALT_CPU_DATA_ADDR_WIDTH 0x15
#define ALT_CPU_DCACHE_LINE_SIZE 0
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_DCACHE_SIZE 0
#define ALT_CPU_EXCEPTION_ADDR 0x00080020
#define ALT_CPU_FLASH_ACCELERATOR_LINES 0
#define ALT_CPU_FLASH_ACCELERATOR_LINE_SIZE 0
#define ALT_CPU_FLUSHDA_SUPPORTED
#define ALT_CPU_FREQ 50000000
#define ALT_CPU_HARDWARE_DIVIDE_PRESENT 0
#define ALT_CPU_HARDWARE_MULTIPLY_PRESENT 0
#define ALT_CPU_HARDWARE_MULX_PRESENT 0
#define ALT_CPU_HAS_DEBUG_CORE 1
#define ALT_CPU_HAS_DEBUG_STUB
#define ALT_CPU_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define ALT_CPU_HAS_JMPI_INSTRUCTION
#define ALT_CPU_ICACHE_LINE_SIZE 0
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_ICACHE_SIZE 0
#define ALT_CPU_INST_ADDR_WIDTH 0x15
#define ALT_CPU_NAME "nios2_gen2"
#define ALT_CPU_OCI_VERSION 1
#define ALT_CPU_RESET_ADDR 0x00080000


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x00110820
#define NIOS2_CPU_ARCH_NIOS2_R1
#define NIOS2_CPU_FREQ 50000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x00000000
#define NIOS2_CPU_IMPLEMENTATION "tiny"
#define NIOS2_DATA_ADDR_WIDTH 0x15
#define NIOS2_DCACHE_LINE_SIZE 0
#define NIOS2_DCACHE_LINE_SIZE_LOG2 0
#define NIOS2_DCACHE_SIZE 0
#define NIOS2_EXCEPTION_ADDR 0x00080020
#define NIOS2_FLASH_ACCELERATOR_LINES 0
#define NIOS2_FLASH_ACCELERATOR_LINE_SIZE 0
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 0
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 0
#define NIOS2_HARDWARE_MULX_PRESENT 0
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 0
#define NIOS2_ICACHE_LINE_SIZE_LOG2 0
#define NIOS2_ICACHE_SIZE 0
#define NIOS2_INST_ADDR_WIDTH 0x15
#define NIOS2_OCI_VERSION 1
#define NIOS2_RESET_ADDR 0x00080000


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_TIMER
#define __ALTERA_NIOS2_GEN2


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "Stratix IV"
#define ALT_ENHANCED_INTERRUPT_API_PRESENT
#define ALT_IRQ_BASE NULL
#define ALT_LOG_PORT "/dev/null"
#define ALT_LOG_PORT_BASE 0x0
#define ALT_LOG_PORT_DEV null
#define ALT_LOG_PORT_TYPE ""
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/jtag_uart"
#define ALT_STDERR_BASE 0x111080
#define ALT_STDERR_DEV jtag_uart
#define ALT_STDERR_IS_JTAG_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/jtag_uart"
#define ALT_STDIN_BASE 0x111080
#define ALT_STDIN_DEV jtag_uart
#define ALT_STDIN_IS_JTAG_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/jtag_uart"
#define ALT_STDOUT_BASE 0x111080
#define ALT_STDOUT_DEV jtag_uart
#define ALT_STDOUT_IS_JTAG_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "NovaCOREBlaster"


/*
 * bitstream_memory configuration
 *
 */

#define ALT_MODULE_CLASS_bitstream_memory altera_avalon_onchip_memory2
#define BITSTREAM_MEMORY_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define BITSTREAM_MEMORY_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define BITSTREAM_MEMORY_BASE 0x100000
#define BITSTREAM_MEMORY_CONTENTS_INFO ""
#define BITSTREAM_MEMORY_DUAL_PORT 0
#define BITSTREAM_MEMORY_GUI_RAM_BLOCK_TYPE "AUTO"
#define BITSTREAM_MEMORY_INIT_CONTENTS_FILE "bitstream"
#define BITSTREAM_MEMORY_INIT_MEM_CONTENT 1
#define BITSTREAM_MEMORY_INSTANCE_ID "NONE"
#define BITSTREAM_MEMORY_IRQ -1
#define BITSTREAM_MEMORY_IRQ_INTERRUPT_CONTROLLER_ID -1
#define BITSTREAM_MEMORY_NAME "/dev/bitstream_memory"
#define BITSTREAM_MEMORY_NON_DEFAULT_INIT_FILE_ENABLED 1
#define BITSTREAM_MEMORY_RAM_BLOCK_TYPE "AUTO"
#define BITSTREAM_MEMORY_READ_DURING_WRITE_MODE "DONT_CARE"
#define BITSTREAM_MEMORY_SINGLE_CLOCK_OP 0
#define BITSTREAM_MEMORY_SIZE_MULTIPLE 1
#define BITSTREAM_MEMORY_SIZE_VALUE 65536
#define BITSTREAM_MEMORY_SPAN 65536
#define BITSTREAM_MEMORY_TYPE "altera_avalon_onchip_memory2"
#define BITSTREAM_MEMORY_WRITABLE 1


/*
 * hal configuration
 *
 */

#define ALT_INCLUDE_INSTRUCTION_RELATED_EXCEPTION_API
#define ALT_MAX_FD 32
#define ALT_SYS_CLK TIMER
#define ALT_TIMESTAMP_CLK none


/*
 * jtag_uart configuration
 *
 */

#define ALT_MODULE_CLASS_jtag_uart altera_avalon_jtag_uart
#define JTAG_UART_BASE 0x111080
#define JTAG_UART_IRQ 1
#define JTAG_UART_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_NAME "/dev/jtag_uart"
#define JTAG_UART_READ_DEPTH 64
#define JTAG_UART_READ_THRESHOLD 8
#define JTAG_UART_SPAN 8
#define JTAG_UART_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_WRITE_DEPTH 64
#define JTAG_UART_WRITE_THRESHOLD 8


/*
 * onchip_memory2 configuration
 *
 */

#define ALT_MODULE_CLASS_onchip_memory2 altera_avalon_onchip_memory2
#define ONCHIP_MEMORY2_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define ONCHIP_MEMORY2_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define ONCHIP_MEMORY2_BASE 0x80000
#define ONCHIP_MEMORY2_CONTENTS_INFO ""
#define ONCHIP_MEMORY2_DUAL_PORT 0
#define ONCHIP_MEMORY2_GUI_RAM_BLOCK_TYPE "AUTO"
#define ONCHIP_MEMORY2_INIT_CONTENTS_FILE "NovaCOREBlaster_onchip_memory2"
#define ONCHIP_MEMORY2_INIT_MEM_CONTENT 1
#define ONCHIP_MEMORY2_INSTANCE_ID "NONE"
#define ONCHIP_MEMORY2_IRQ -1
#define ONCHIP_MEMORY2_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ONCHIP_MEMORY2_NAME "/dev/onchip_memory2"
#define ONCHIP_MEMORY2_NON_DEFAULT_INIT_FILE_ENABLED 0
#define ONCHIP_MEMORY2_RAM_BLOCK_TYPE "AUTO"
#define ONCHIP_MEMORY2_READ_DURING_WRITE_MODE "DONT_CARE"
#define ONCHIP_MEMORY2_SINGLE_CLOCK_OP 0
#define ONCHIP_MEMORY2_SIZE_MULTIPLE 1
#define ONCHIP_MEMORY2_SIZE_VALUE 262144
#define ONCHIP_MEMORY2_SPAN 262144
#define ONCHIP_MEMORY2_TYPE "altera_avalon_onchip_memory2"
#define ONCHIP_MEMORY2_WRITABLE 1


/*
 * pio_c_bus configuration
 *
 */

#define ALT_MODULE_CLASS_pio_c_bus altera_avalon_pio
#define PIO_C_BUS_BASE 0x111060
#define PIO_C_BUS_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_C_BUS_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_C_BUS_CAPTURE 0
#define PIO_C_BUS_DATA_WIDTH 28
#define PIO_C_BUS_DO_TEST_BENCH_WIRING 0
#define PIO_C_BUS_DRIVEN_SIM_VALUE 0
#define PIO_C_BUS_EDGE_TYPE "NONE"
#define PIO_C_BUS_FREQ 50000000
#define PIO_C_BUS_HAS_IN 0
#define PIO_C_BUS_HAS_OUT 1
#define PIO_C_BUS_HAS_TRI 0
#define PIO_C_BUS_IRQ -1
#define PIO_C_BUS_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_C_BUS_IRQ_TYPE "NONE"
#define PIO_C_BUS_NAME "/dev/pio_c_bus"
#define PIO_C_BUS_RESET_VALUE 0
#define PIO_C_BUS_SPAN 16
#define PIO_C_BUS_TYPE "altera_avalon_pio"


/*
 * pio_c_clk configuration
 *
 */

#define ALT_MODULE_CLASS_pio_c_clk altera_avalon_pio
#define PIO_C_CLK_BASE 0x111030
#define PIO_C_CLK_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_C_CLK_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_C_CLK_CAPTURE 0
#define PIO_C_CLK_DATA_WIDTH 1
#define PIO_C_CLK_DO_TEST_BENCH_WIRING 0
#define PIO_C_CLK_DRIVEN_SIM_VALUE 0
#define PIO_C_CLK_EDGE_TYPE "NONE"
#define PIO_C_CLK_FREQ 50000000
#define PIO_C_CLK_HAS_IN 0
#define PIO_C_CLK_HAS_OUT 1
#define PIO_C_CLK_HAS_TRI 0
#define PIO_C_CLK_IRQ -1
#define PIO_C_CLK_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_C_CLK_IRQ_TYPE "NONE"
#define PIO_C_CLK_NAME "/dev/pio_c_clk"
#define PIO_C_CLK_RESET_VALUE 0
#define PIO_C_CLK_SPAN 16
#define PIO_C_CLK_TYPE "altera_avalon_pio"


/*
 * pio_c_dimension configuration
 *
 */

#define ALT_MODULE_CLASS_pio_c_dimension altera_avalon_pio
#define PIO_C_DIMENSION_BASE 0x111040
#define PIO_C_DIMENSION_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_C_DIMENSION_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_C_DIMENSION_CAPTURE 0
#define PIO_C_DIMENSION_DATA_WIDTH 4
#define PIO_C_DIMENSION_DO_TEST_BENCH_WIRING 0
#define PIO_C_DIMENSION_DRIVEN_SIM_VALUE 0
#define PIO_C_DIMENSION_EDGE_TYPE "NONE"
#define PIO_C_DIMENSION_FREQ 50000000
#define PIO_C_DIMENSION_HAS_IN 0
#define PIO_C_DIMENSION_HAS_OUT 1
#define PIO_C_DIMENSION_HAS_TRI 0
#define PIO_C_DIMENSION_IRQ -1
#define PIO_C_DIMENSION_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_C_DIMENSION_IRQ_TYPE "NONE"
#define PIO_C_DIMENSION_NAME "/dev/pio_c_dimension"
#define PIO_C_DIMENSION_RESET_VALUE 0
#define PIO_C_DIMENSION_SPAN 16
#define PIO_C_DIMENSION_TYPE "altera_avalon_pio"


/*
 * pio_c_dimswitch configuration
 *
 */

#define ALT_MODULE_CLASS_pio_c_dimswitch altera_avalon_pio
#define PIO_C_DIMSWITCH_BASE 0x111050
#define PIO_C_DIMSWITCH_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_C_DIMSWITCH_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_C_DIMSWITCH_CAPTURE 0
#define PIO_C_DIMSWITCH_DATA_WIDTH 1
#define PIO_C_DIMSWITCH_DO_TEST_BENCH_WIRING 0
#define PIO_C_DIMSWITCH_DRIVEN_SIM_VALUE 0
#define PIO_C_DIMSWITCH_EDGE_TYPE "NONE"
#define PIO_C_DIMSWITCH_FREQ 50000000
#define PIO_C_DIMSWITCH_HAS_IN 0
#define PIO_C_DIMSWITCH_HAS_OUT 1
#define PIO_C_DIMSWITCH_HAS_TRI 0
#define PIO_C_DIMSWITCH_IRQ -1
#define PIO_C_DIMSWITCH_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_C_DIMSWITCH_IRQ_TYPE "NONE"
#define PIO_C_DIMSWITCH_NAME "/dev/pio_c_dimswitch"
#define PIO_C_DIMSWITCH_RESET_VALUE 0
#define PIO_C_DIMSWITCH_SPAN 16
#define PIO_C_DIMSWITCH_TYPE "altera_avalon_pio"


/*
 * pio_c_uid configuration
 *
 */

#define ALT_MODULE_CLASS_pio_c_uid altera_avalon_pio
#define PIO_C_UID_BASE 0x111020
#define PIO_C_UID_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_C_UID_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_C_UID_CAPTURE 0
#define PIO_C_UID_DATA_WIDTH 4
#define PIO_C_UID_DO_TEST_BENCH_WIRING 0
#define PIO_C_UID_DRIVEN_SIM_VALUE 0
#define PIO_C_UID_EDGE_TYPE "NONE"
#define PIO_C_UID_FREQ 50000000
#define PIO_C_UID_HAS_IN 0
#define PIO_C_UID_HAS_OUT 1
#define PIO_C_UID_HAS_TRI 0
#define PIO_C_UID_IRQ -1
#define PIO_C_UID_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_C_UID_IRQ_TYPE "NONE"
#define PIO_C_UID_NAME "/dev/pio_c_uid"
#define PIO_C_UID_RESET_VALUE 0
#define PIO_C_UID_SPAN 16
#define PIO_C_UID_TYPE "altera_avalon_pio"


/*
 * pio_mode configuration
 *
 */

#define ALT_MODULE_CLASS_pio_mode altera_avalon_pio
#define PIO_MODE_BASE 0x111070
#define PIO_MODE_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_MODE_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_MODE_CAPTURE 0
#define PIO_MODE_DATA_WIDTH 1
#define PIO_MODE_DO_TEST_BENCH_WIRING 0
#define PIO_MODE_DRIVEN_SIM_VALUE 0
#define PIO_MODE_EDGE_TYPE "NONE"
#define PIO_MODE_FREQ 50000000
#define PIO_MODE_HAS_IN 0
#define PIO_MODE_HAS_OUT 1
#define PIO_MODE_HAS_TRI 0
#define PIO_MODE_IRQ -1
#define PIO_MODE_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_MODE_IRQ_TYPE "NONE"
#define PIO_MODE_NAME "/dev/pio_mode"
#define PIO_MODE_RESET_VALUE 1
#define PIO_MODE_SPAN 16
#define PIO_MODE_TYPE "altera_avalon_pio"


/*
 * timer configuration
 *
 */

#define ALT_MODULE_CLASS_timer altera_avalon_timer
#define TIMER_ALWAYS_RUN 0
#define TIMER_BASE 0x111000
#define TIMER_COUNTER_SIZE 32
#define TIMER_FIXED_PERIOD 0
#define TIMER_FREQ 50000000
#define TIMER_IRQ 0
#define TIMER_IRQ_INTERRUPT_CONTROLLER_ID 0
#define TIMER_LOAD_VALUE 49999
#define TIMER_MULT 0.001
#define TIMER_NAME "/dev/timer"
#define TIMER_PERIOD 1
#define TIMER_PERIOD_UNITS "ms"
#define TIMER_RESET_OUTPUT 0
#define TIMER_SNAPSHOT 1
#define TIMER_SPAN 32
#define TIMER_TICKS_PER_SEC 1000
#define TIMER_TIMEOUT_PULSE_OUTPUT 0
#define TIMER_TYPE "altera_avalon_timer"

#endif /* __SYSTEM_H_ */