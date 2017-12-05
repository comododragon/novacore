	set_location_assignment PIN_AW20 -to ddr3bot_wen
	set_location_assignment PIN_AW21 -to ddr3bot_rasn
	set_location_assignment PIN_AV19 -to ddr3bot_casn
	set_location_assignment PIN_AR20 -to ddr3bot_ck_p
	set_location_assignment PIN_AT20 -to ddr3bot_ck_n
	set_location_assignment PIN_AW19 -to ddr3bot_cke
	set_location_assignment PIN_AN20 -to ddr3bot_csn
	set_location_assignment PIN_AP20 -to ddr3bot_rstn
	set_location_assignment PIN_AU20 -to ddr3bot_odt
	set_location_assignment PIN_C19 -to ddr3top_wen
	set_location_assignment PIN_A24 -to ddr3top_rasn
	set_location_assignment PIN_B19 -to ddr3top_casn
	set_location_assignment PIN_D24 -to ddr3top_ck_p
	set_location_assignment PIN_C24 -to ddr3top_ck_n
	set_location_assignment PIN_A25 -to ddr3top_cke
	set_location_assignment PIN_D15 -to ddr3top_csn
	set_location_assignment PIN_L20 -to ddr3top_rstn
	set_location_assignment PIN_K15 -to ddr3top_odt
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to ddr3bot_a
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to ddr3bot_ba
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to ddr3bot_dq
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to ddr3bot_dqs_p
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to ddr3bot_dqs_n
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to ddr3bot_dm
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to ddr3bot_wen
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to ddr3bot_rasn
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to ddr3bot_casn
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to ddr3bot_ck_p
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to ddr3bot_ck_n
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to ddr3bot_cke
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to ddr3bot_csn
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to ddr3bot_rstn
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to ddr3bot_odt
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to ddr3top_a
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to ddr3top_ba
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to ddr3top_dq
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to ddr3top_dqs_p
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to ddr3top_dqs_n
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to ddr3top_dm
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to ddr3top_wen
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to ddr3top_rasn
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to ddr3top_casn
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to ddr3top_ck_p
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to ddr3top_ck_n
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to ddr3top_cke
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to ddr3top_csn
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to ddr3top_rstn
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to ddr3top_odt
	set_location_assignment PIN_AC34 -to clkin_50
	set_instance_assignment -name IO_STANDARD "2.5 V" -to clkin_50
	set_location_assignment PIN_A21 -to clkintop_100_p
	set_instance_assignment -name IO_STANDARD LVDS -to clkintop_100_p
	set_location_assignment PIN_AV22 -to clkinbot_100_p
	set_instance_assignment -name IO_STANDARD LVDS -to clkinbot_100_p
	set_location_assignment PIN_W33 -to clkout_sma
	set_instance_assignment -name IO_STANDARD "2.5 V" -to clkout_sma
	set_location_assignment PIN_C27 -to qdr2top0_rpsn
	set_location_assignment PIN_K24 -to qdr2top0_wpsn
	set_location_assignment PIN_H28 -to qdr2top0_cq_p
	set_location_assignment PIN_K27 -to qdr2top0_cq_n
	set_location_assignment PIN_H26 -to qdr2top0_qvld
	set_location_assignment PIN_A22 -to qdr2top0_odt
	set_location_assignment PIN_B22 -to qdr2top0_doffn
	set_instance_assignment -name IO_STANDARD "1.5-V HSTL CLASS I" -to qdr2top0_a
	set_instance_assignment -name IO_STANDARD "1.5-V HSTL CLASS I" -to qdr2top0_d
	set_instance_assignment -name IO_STANDARD "1.5-V HSTL CLASS I" -to qdr2top0_q
	set_instance_assignment -name IO_STANDARD "1.5-V HSTL CLASS I" -to qdr2top0_rpsn
	set_instance_assignment -name IO_STANDARD "1.5-V HSTL CLASS I" -to qdr2top0_wpsn
	set_instance_assignment -name IO_STANDARD "1.5-V HSTL CLASS I" -to qdr2top0_bwsn
	set_instance_assignment -name IO_STANDARD "1.5-V HSTL CLASS I" -to qdr2top0_k_p
	set_instance_assignment -name IO_STANDARD "1.5-V HSTL CLASS I" -to qdr2top0_k_n
	set_instance_assignment -name IO_STANDARD "1.5-V HSTL CLASS I" -to qdr2top0_cq_p
	set_instance_assignment -name IO_STANDARD "1.5-V HSTL CLASS I" -to qdr2top0_cq_n
	set_instance_assignment -name IO_STANDARD "1.5-V HSTL CLASS I" -to qdr2top0_qvld
	set_instance_assignment -name IO_STANDARD "1.5-V HSTL CLASS I" -to qdr2top0_odt
	set_instance_assignment -name IO_STANDARD "1.5-V HSTL CLASS I" -to qdr2top0_doffn
	set_instance_assignment -name IO_STANDARD "1.5-V HSTL CLASS I" -to qdr2top1_a
	set_instance_assignment -name IO_STANDARD "1.5-V HSTL CLASS I" -to qdr2top1_d
	set_instance_assignment -name IO_STANDARD "1.5-V HSTL CLASS I" -to qdr2top1_q
	set_instance_assignment -name IO_STANDARD "1.5-V HSTL CLASS I" -to qdr2top1_rpsn
	set_instance_assignment -name IO_STANDARD "1.5-V HSTL CLASS I" -to qdr2top1_wpsn
	set_instance_assignment -name IO_STANDARD "1.5-V HSTL CLASS I" -to qdr2top1_bwsn
	set_instance_assignment -name IO_STANDARD "1.5-V HSTL CLASS I" -to qdr2top1_k_p
	set_instance_assignment -name IO_STANDARD "1.5-V HSTL CLASS I" -to qdr2top1_k_n
	set_instance_assignment -name IO_STANDARD "1.5-V HSTL CLASS I" -to qdr2top1_cq_p
	set_instance_assignment -name IO_STANDARD "1.5-V HSTL CLASS I" -to qdr2top1_cq_n
	set_instance_assignment -name IO_STANDARD "1.5-V HSTL CLASS I" -to qdr2top1_qvld
	set_instance_assignment -name IO_STANDARD "1.5-V HSTL CLASS I" -to qdr2top1_odt
	set_instance_assignment -name IO_STANDARD "1.5-V HSTL CLASS I" -to qdr2top1_doffn
	set_location_assignment PIN_F19 -to qdr2top1_rpsn
	set_location_assignment PIN_D18 -to qdr2top1_wpsn
	set_location_assignment PIN_N16 -to qdr2top1_k_p
	set_location_assignment PIN_M16 -to qdr2top1_k_n
	set_location_assignment PIN_H13 -to qdr2top1_cq_p
	set_location_assignment PIN_L13 -to qdr2top1_cq_n
	set_location_assignment PIN_D13 -to qdr2top1_qvld
	set_location_assignment PIN_C20 -to qdr2top1_odt
	set_location_assignment PIN_D20 -to qdr2top1_doffn
	set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top
	set_instance_assignment -name IO_STANDARD LVDS -to clk_125_p
	set_instance_assignment -name IO_STANDARD LVDS -to clk_148_p
	set_location_assignment PIN_AL2 -to clk_148_p
	set_instance_assignment -name IO_STANDARD LVDS -to clk_156_p
	set_location_assignment PIN_AA2 -to clk_156_p
	set_instance_assignment -name IO_STANDARD "2.5 V" -to sense_smb_data
	set_location_assignment PIN_AH32 -to sense_smb_data
	set_instance_assignment -name IO_STANDARD "2.5 V" -to sense_smb_clk
	set_location_assignment PIN_W34 -to sense_smb_clk
	set_instance_assignment -name IO_STANDARD "2.5 V" -to sense_sck
	set_location_assignment PIN_AE28 -to sense_sck
	set_instance_assignment -name IO_STANDARD "2.5 V" -to sense_sdi
	set_location_assignment PIN_J35 -to sense_sdi
	set_instance_assignment -name IO_STANDARD "2.5 V" -to sense_sdo
	set_location_assignment PIN_V28 -to sense_sdo
	set_instance_assignment -name IO_STANDARD LVDS -to enet_tx_p
	set_location_assignment PIN_L29 -to enet_tx_p
	set_instance_assignment -name IO_STANDARD LVDS -to enet_rx_p
	set_location_assignment PIN_AC31 -to enet_rx_p
	set_instance_assignment -name IO_STANDARD "2.5 V" -to enet_resetn
	set_location_assignment PIN_V31 -to enet_resetn
	set_instance_assignment -name IO_STANDARD "2.5 V" -to enet_mdc
	set_location_assignment PIN_AH34 -to enet_mdc
	set_instance_assignment -name IO_STANDARD "2.5 V" -to enet_mdio
	set_location_assignment PIN_M33 -to enet_mdio
	set_instance_assignment -name IO_STANDARD "1.8 V" -to hdmi_clk
	set_location_assignment PIN_AD25 -to hdmi_clk
	set_instance_assignment -name IO_STANDARD "1.8 V" -to hdmi_vsync
	set_location_assignment PIN_AE25 -to hdmi_vsync
	set_instance_assignment -name IO_STANDARD "1.8 V" -to hdmi_hsync
	set_location_assignment PIN_AE24 -to hdmi_hsync
	set_instance_assignment -name IO_STANDARD "1.8 V" -to hdmi_de
	set_location_assignment PIN_AK27 -to hdmi_de
	set_instance_assignment -name IO_STANDARD "1.8 V" -to hdmi_d
	set_instance_assignment -name IO_STANDARD "1.8 V" -to hdmi_spdif
	set_location_assignment PIN_AR28 -to hdmi_spdif
	set_instance_assignment -name IO_STANDARD "1.8 V" -to hdmi_mclk
	set_location_assignment PIN_AP28 -to hdmi_mclk
	set_instance_assignment -name IO_STANDARD "1.8 V" -to hdmi_i2s
	set_instance_assignment -name IO_STANDARD "1.8 V" -to hdmi_lrclk
	set_location_assignment PIN_AG24 -to hdmi_lrclk
	set_instance_assignment -name IO_STANDARD "1.8 V" -to hdmi_sclk
	set_location_assignment PIN_AH24 -to hdmi_sclk
	set_instance_assignment -name IO_STANDARD "1.5 V" -to hdmi_intn
	set_location_assignment PIN_AV23 -to hdmi_intn
	set_instance_assignment -name IO_STANDARD "1.8 V" -to hdmi_sda
	set_location_assignment PIN_AU27 -to hdmi_sda
	set_instance_assignment -name IO_STANDARD "1.8 V" -to hdmi_scl
	set_location_assignment PIN_AT27 -to hdmi_scl
	set_instance_assignment -name OUTPUT_ENABLE_GROUP 7766 -to ddr3top_dq
	set_instance_assignment -name OUTPUT_ENABLE_GROUP 7766 -to ddr3top_dqs_p
	set_instance_assignment -name OUTPUT_ENABLE_GROUP 7766 -to ddr3top_dqs_n
	set_instance_assignment -name OUTPUT_ENABLE_GROUP 7767 -to ddr3bot_dq
	set_instance_assignment -name OUTPUT_ENABLE_GROUP 7767 -to ddr3bot_dqs_p
	set_instance_assignment -name OUTPUT_ENABLE_GROUP 7767 -to ddr3bot_dqs_n
	set_instance_assignment -name DYNAMIC_OCT_CONTROL_GROUP 7766 -to ddr3top_dq
	set_instance_assignment -name DYNAMIC_OCT_CONTROL_GROUP 7766 -to ddr3top_dqs_p
	set_instance_assignment -name DYNAMIC_OCT_CONTROL_GROUP 7766 -to ddr3top_dqs_n
	set_instance_assignment -name DYNAMIC_OCT_CONTROL_GROUP 7767 -to ddr3bot_dq
	set_instance_assignment -name DYNAMIC_OCT_CONTROL_GROUP 7767 -to ddr3bot_dqs_p
	set_instance_assignment -name DYNAMIC_OCT_CONTROL_GROUP 7767 -to ddr3bot_dqs_n
	set_instance_assignment -name IO_STANDARD "2.5 V" -to fsm_a
	set_instance_assignment -name IO_STANDARD "2.5 V" -to fsm_d
	set_instance_assignment -name IO_STANDARD "2.5 V" -to flash_clk
	set_location_assignment PIN_AF26 -to flash_clk
	set_instance_assignment -name IO_STANDARD "2.5 V" -to flash_cen
	set_location_assignment PIN_AU31 -to flash_cen
	set_instance_assignment -name IO_STANDARD "2.5 V" -to flash_oen
	set_location_assignment PIN_AG27 -to flash_oen
	set_instance_assignment -name IO_STANDARD "2.5 V" -to flash_wen
	set_location_assignment PIN_AT31 -to flash_wen
	set_instance_assignment -name IO_STANDARD "2.5 V" -to flash_advn
	set_location_assignment PIN_AN31 -to flash_advn
	set_instance_assignment -name IO_STANDARD "2.5 V" -to flash_resetn
	set_location_assignment PIN_AL30 -to flash_resetn
	set_instance_assignment -name IO_STANDARD "2.5 V" -to sram_clk
	set_location_assignment PIN_AE26 -to sram_clk
	set_instance_assignment -name IO_STANDARD "2.5 V" -to sram_cen
	set_location_assignment PIN_AT30 -to sram_cen
	set_instance_assignment -name IO_STANDARD "2.5 V" -to sram_dqp
	set_instance_assignment -name IO_STANDARD "2.5 V" -to sram_bwn
	set_instance_assignment -name IO_STANDARD "2.5 V" -to sram_gwn
	set_location_assignment PIN_AC29 -to sram_gwn
	set_instance_assignment -name IO_STANDARD "2.5 V" -to sram_bwen
	set_location_assignment PIN_AK30 -to sram_bwen
	set_instance_assignment -name IO_STANDARD "2.5 V" -to sram_oen
	set_location_assignment PIN_AK34 -to sram_oen
	set_instance_assignment -name IO_STANDARD "2.5 V" -to sram_advn
	set_location_assignment PIN_AU32 -to sram_advn
	set_instance_assignment -name IO_STANDARD "2.5 V" -to sram_adspn
	set_location_assignment PIN_AG28 -to sram_adspn
	set_instance_assignment -name IO_STANDARD "2.5 V" -to sram_adscn
	set_location_assignment PIN_AM31 -to sram_adscn
	set_instance_assignment -name IO_STANDARD "2.5 V" -to sram_zz
	set_location_assignment PIN_AJ29 -to sram_zz
	set_instance_assignment -name IO_STANDARD "2.5 V" -to max2_clk
	set_location_assignment PIN_K32 -to max2_clk
	set_instance_assignment -name IO_STANDARD "2.5 V" -to max2_csn
	set_location_assignment PIN_E34 -to max2_csn
	set_instance_assignment -name IO_STANDARD "2.5 V" -to max2_oen
	set_location_assignment PIN_J33 -to max2_oen
	set_instance_assignment -name IO_STANDARD "2.5 V" -to max2_ben
	set_instance_assignment -name IO_STANDARD "2.5 V" -to lcd_data
	set_instance_assignment -name IO_STANDARD "2.5 V" -to lcd_d_cn
	set_location_assignment PIN_AB30 -to lcd_d_cn
	set_instance_assignment -name IO_STANDARD "2.5 V" -to lcd_wen
	set_location_assignment PIN_AL34 -to lcd_wen
	set_instance_assignment -name IO_STANDARD "2.5 V" -to user_dipsw
	set_instance_assignment -name IO_STANDARD "2.5 V" -to user_led
	set_instance_assignment -name IO_STANDARD "2.5 V" -to user_pb
	set_instance_assignment -name IO_STANDARD LVDS -to hsma_tx_d_p
	set_instance_assignment -name IO_STANDARD LVDS -to hsma_rx_d_p
	set_instance_assignment -name IO_STANDARD "2.5 V" -to hsma_d
	set_instance_assignment -name IO_STANDARD "2.5 V" -to hsma_clk_in0
	set_location_assignment PIN_AB34 -to hsma_clk_in0
	set_instance_assignment -name IO_STANDARD "2.5 V" -to hsma_clk_out0
	set_location_assignment PIN_AM29 -to hsma_clk_out0
	set_instance_assignment -name IO_STANDARD LVDS -to hsma_clk_in_p1
	set_location_assignment PIN_AC6 -to hsma_clk_in_p1
	set_instance_assignment -name IO_STANDARD LVDS -to hsma_clk_out_p1
	set_location_assignment PIN_AL10 -to hsma_clk_out_p1
	set_instance_assignment -name IO_STANDARD LVDS -to hsma_clk_in_p2
	set_location_assignment PIN_AF6 -to hsma_clk_in_p2
	set_instance_assignment -name IO_STANDARD LVDS -to hsma_clk_out_p2
	set_location_assignment PIN_AF13 -to hsma_clk_out_p2
	set_instance_assignment -name IO_STANDARD LVDS -to hsmb_tx_d_p
	set_instance_assignment -name IO_STANDARD LVDS -to hsmb_rx_d_p
	set_instance_assignment -name IO_STANDARD "2.5 V" -to hsmb_d
	set_instance_assignment -name IO_STANDARD "2.5 V" -to hsmb_clk_in0
	set_location_assignment PIN_AA35 -to hsmb_clk_in0
	set_instance_assignment -name IO_STANDARD "2.5 V" -to hsmb_clk_out0
	set_location_assignment PIN_AK29 -to hsmb_clk_out0
	set_instance_assignment -name IO_STANDARD LVDS -to hsmb_clk_in_p1
	set_location_assignment PIN_AB6 -to hsmb_clk_in_p1
	set_instance_assignment -name IO_STANDARD LVDS -to hsmb_clk_out_p1
	set_location_assignment PIN_K8 -to hsmb_clk_out_p1
	set_instance_assignment -name IO_STANDARD LVDS -to hsmb_clk_in_p2
	set_location_assignment PIN_W6 -to hsmb_clk_in_p2
	set_instance_assignment -name IO_STANDARD LVDS -to hsmb_clk_out_p2
	set_location_assignment PIN_K10 -to hsmb_clk_out_p2
	set_instance_assignment -name OUTPUT_ENABLE_GROUP 1357 -to fsm_d
	set_instance_assignment -name IO_STANDARD "2.5 V" -to pcie_smbclk
	set_location_assignment PIN_AE31 -to pcie_smbclk
	set_instance_assignment -name IO_STANDARD "2.5 V" -to pcie_smbdat
	set_location_assignment PIN_P32 -to pcie_smbdat
	set_instance_assignment -name IO_STANDARD "2.5 V" -to pcie_perstn
	set_location_assignment PIN_R32 -to pcie_perstn
	set_instance_assignment -name IO_STANDARD "2.5 V" -to pcie_waken
	set_location_assignment PIN_P31 -to pcie_waken
	set_instance_assignment -name IO_STANDARD "2.5 V" -to pcie_led_x1
	set_location_assignment PIN_R29 -to pcie_led_x1
	set_instance_assignment -name IO_STANDARD "2.5 V" -to pcie_led_x4
	set_location_assignment PIN_AH35 -to pcie_led_x4
	set_instance_assignment -name IO_STANDARD "2.5 V" -to pcie_led_x8
	set_location_assignment PIN_AE29 -to pcie_led_x8
	set_instance_assignment -name IO_STANDARD "2.5 V" -to pcie_led_g2
	set_location_assignment PIN_AB28 -to pcie_led_g2
	set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "0 MHz" -to sense_smb_data
	set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "0 MHz" -to sense_smb_clk
	set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "0 MHz" -to sense_sck
	set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "0 MHz" -to sense_sdi
	set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "0 MHz" -to sense_sdo
	set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "0 MHz" -to qdr2top0_doffn
	set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "0 MHz" -to qdr2top1_doffn
	set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "0 MHz" -to enet_resetn
	set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "0 MHz" -to enet_mdc
	set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "0 MHz" -to enet_mdio
	set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "0 MHz" -to hdmi_intn
	set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "0 MHz" -to hdmi_sda
	set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "0 MHz" -to hdmi_scl
	set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "0 MHz" -to flash_resetn
	set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "0 MHz" -to sram_zz
	set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "0 MHz" -to user_dipsw
	set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "0 MHz" -to user_pb
	set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "0 MHz" -to hsma_sda
	set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "0 MHz" -to hsma_scl
	set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "0 MHz" -to hsma_prsntn
	set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "0 MHz" -to hsmb_sda
	set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "0 MHz" -to hsmb_scl
	set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "0 MHz" -to hsmb_prsntn
	set_location_assignment PIN_M25 -to qdr2top0_q[17]
	set_location_assignment PIN_L25 -to qdr2top0_q[16]
	set_location_assignment PIN_N25 -to qdr2top0_q[15]
	set_location_assignment PIN_P25 -to qdr2top0_q[14]
	set_location_assignment PIN_G27 -to qdr2top0_q[13]
	set_location_assignment PIN_F27 -to qdr2top0_q[12]
	set_location_assignment PIN_D28 -to qdr2top0_q[11]
	set_location_assignment PIN_E28 -to qdr2top0_q[10]
	set_location_assignment PIN_D29 -to qdr2top0_q[9]
	set_location_assignment PIN_E29 -to qdr2top0_q[8]
	set_location_assignment PIN_F28 -to qdr2top0_q[7]
	set_location_assignment PIN_G29 -to qdr2top0_q[6]
	set_location_assignment PIN_J26 -to qdr2top0_q[5]
	set_location_assignment PIN_K26 -to qdr2top0_q[4]
	set_location_assignment PIN_J27 -to qdr2top0_q[3]
	set_location_assignment PIN_L26 -to qdr2top0_q[2]
	set_location_assignment PIN_K28 -to qdr2top0_q[1]
	set_location_assignment PIN_M27 -to qdr2top0_q[0]
	set_location_assignment PIN_N13 -to qdr2top1_q[17]
	set_location_assignment PIN_N15 -to qdr2top1_q[16]
	set_location_assignment PIN_R14 -to qdr2top1_q[15]
	set_location_assignment PIN_P14 -to qdr2top1_q[14]
	set_location_assignment PIN_M14 -to qdr2top1_q[13]
	set_location_assignment PIN_N14 -to qdr2top1_q[12]
	set_location_assignment PIN_M13 -to qdr2top1_q[11]
	set_location_assignment PIN_K14 -to qdr2top1_q[10]
	set_location_assignment PIN_L14 -to qdr2top1_q[9]
	set_location_assignment PIN_E14 -to qdr2top1_q[8]
	set_location_assignment PIN_F14 -to qdr2top1_q[7]
	set_location_assignment PIN_F12 -to qdr2top1_q[6]
	set_location_assignment PIN_G14 -to qdr2top1_q[5]
	set_location_assignment PIN_H14 -to qdr2top1_q[4]
	set_location_assignment PIN_K12 -to qdr2top1_q[3]
	set_location_assignment PIN_J12 -to qdr2top1_q[2]
	set_location_assignment PIN_K13 -to qdr2top1_q[1]
	set_location_assignment PIN_J13 -to qdr2top1_q[0]
	set_location_assignment PIN_J25 -to qdr2top0_bwsn[1]
	set_location_assignment PIN_L23 -to qdr2top0_bwsn[0]
	set_location_assignment PIN_AK16 -to ddr3bot_dqs_p[3]
	set_location_assignment PIN_AL16 -to ddr3bot_dqs_n[3]
	set_location_assignment PIN_AP16 -to ddr3bot_dqs_p[2]
	set_location_assignment PIN_AR16 -to ddr3bot_dqs_n[2]
	set_location_assignment PIN_AV13 -to ddr3bot_dqs_p[1]
	set_location_assignment PIN_AW13 -to ddr3bot_dqs_n[1]
	set_location_assignment PIN_AR13 -to ddr3bot_dqs_p[0]
	set_location_assignment PIN_AT13 -to ddr3bot_dqs_n[0]
	set_location_assignment PIN_AE22 -to ddr3bot_dq[63]
	set_location_assignment PIN_AH22 -to ddr3bot_dq[62]
	set_location_assignment PIN_AJ22 -to ddr3bot_dq[61]
	set_location_assignment PIN_AG22 -to ddr3bot_dq[60]
	set_location_assignment PIN_AH23 -to ddr3bot_dq[59]
	set_location_assignment PIN_AF23 -to ddr3bot_dq[58]
	set_location_assignment PIN_AK24 -to ddr3bot_dq[57]
	set_location_assignment PIN_AJ23 -to ddr3bot_dq[56]
	set_location_assignment PIN_AF17 -to ddr3bot_dm[3]
	set_location_assignment PIN_AW26 -to ddr3bot_dq[55]
	set_location_assignment PIN_AP25 -to ddr3bot_dq[54]
	set_location_assignment PIN_AP24 -to ddr3bot_dq[53]
	set_location_assignment PIN_AR25 -to ddr3bot_dq[52]
	set_location_assignment PIN_AN25 -to ddr3bot_dq[51]
	set_location_assignment PIN_AT25 -to ddr3bot_dq[50]
	set_location_assignment PIN_AU25 -to ddr3bot_dq[49]
	set_location_assignment PIN_AV26 -to ddr3bot_dq[48]
	set_location_assignment PIN_AU16 -to ddr3bot_dm[2]
	set_location_assignment PIN_AU11 -to ddr3bot_dm[1]
	set_location_assignment PIN_AF22 -to ddr3bot_dm[7]
	set_location_assignment PIN_AN24 -to ddr3bot_dm[6]
	set_location_assignment PIN_AN18 -to ddr3bot_dm[5]
	set_location_assignment PIN_AM22 -to ddr3bot_dm[4]
	set_location_assignment PIN_AL13 -to ddr3bot_dm[0]
	set_location_assignment PIN_AT17 -to ddr3bot_dq[47]
	set_location_assignment PIN_AW18 -to ddr3bot_dq[46]
	set_location_assignment PIN_AU18 -to ddr3bot_dq[45]
	set_location_assignment PIN_AT18 -to ddr3bot_dq[44]
	set_location_assignment PIN_AN19 -to ddr3bot_dq[43]
	set_location_assignment PIN_AP18 -to ddr3bot_dq[42]
	set_location_assignment PIN_AP19 -to ddr3bot_dq[41]
	set_location_assignment PIN_AR19 -to ddr3bot_dq[40]
	set_location_assignment PIN_AN22 -to ddr3bot_dq[39]
	set_location_assignment PIN_AR23 -to ddr3bot_dq[38]
	set_location_assignment PIN_AL22 -to ddr3bot_dq[37]
	set_location_assignment PIN_AP23 -to ddr3bot_dq[36]
	set_location_assignment PIN_AM23 -to ddr3bot_dq[35]
	set_location_assignment PIN_AT23 -to ddr3bot_dq[34]
	set_location_assignment PIN_AN23 -to ddr3bot_dq[33]
	set_location_assignment PIN_AU23 -to ddr3bot_dq[32]
	set_location_assignment PIN_AK17 -to ddr3bot_dq[31]
	set_location_assignment PIN_AG17 -to ddr3bot_dq[30]
	set_location_assignment PIN_AH17 -to ddr3bot_dq[29]
	set_location_assignment PIN_AG16 -to ddr3bot_dq[28]
	set_location_assignment PIN_AL17 -to ddr3bot_dq[27]
	set_location_assignment PIN_AH16 -to ddr3bot_dq[26]
	set_location_assignment PIN_AM17 -to ddr3bot_dq[25]
	set_location_assignment PIN_AJ16 -to ddr3bot_dq[24]
	set_location_assignment PIN_AU15 -to ddr3bot_dq[23]
	set_location_assignment PIN_AR17 -to ddr3bot_dq[22]
	set_location_assignment PIN_AT15 -to ddr3bot_dq[21]
	set_location_assignment PIN_AP17 -to ddr3bot_dq[20]
	set_location_assignment PIN_AV16 -to ddr3bot_dq[19]
	set_location_assignment PIN_AN16 -to ddr3bot_dq[18]
	set_location_assignment PIN_AW16 -to ddr3bot_dq[17]
	set_location_assignment PIN_AT16 -to ddr3bot_dq[16]
	set_location_assignment PIN_AW12 -to ddr3bot_dq[15]
	set_location_assignment PIN_AV11 -to ddr3bot_dq[14]
	set_location_assignment PIN_AU14 -to ddr3bot_dq[13]
	set_location_assignment PIN_AW11 -to ddr3bot_dq[12]
	set_location_assignment PIN_AV14 -to ddr3bot_dq[11]
	set_location_assignment PIN_AU12 -to ddr3bot_dq[10]
	set_location_assignment PIN_AW14 -to ddr3bot_dq[9]
	set_location_assignment PIN_AT12 -to ddr3bot_dq[8]
	set_location_assignment PIN_AP13 -to ddr3bot_dq[7]
	set_location_assignment PIN_AP14 -to ddr3bot_dq[6]
	set_location_assignment PIN_AN13 -to ddr3bot_dq[5]
	set_location_assignment PIN_AR14 -to ddr3bot_dq[4]
	set_location_assignment PIN_AL14 -to ddr3bot_dq[3]
	set_location_assignment PIN_AN14 -to ddr3bot_dq[2]
	set_location_assignment PIN_AM13 -to ddr3bot_dq[1]
	set_location_assignment PIN_AM14 -to ddr3bot_dq[0]
	set_location_assignment PIN_AL23 -to ddr3bot_dqs_n[7]
	set_location_assignment PIN_AU26 -to ddr3bot_dqs_n[6]
	set_location_assignment PIN_AV17 -to ddr3bot_dqs_n[5]
	set_location_assignment PIN_AU24 -to ddr3bot_dqs_n[4]
	set_location_assignment PIN_AK23 -to ddr3bot_dqs_p[7]
	set_location_assignment PIN_AT26 -to ddr3bot_dqs_p[6]
	set_location_assignment PIN_AU17 -to ddr3bot_dqs_p[5]
	set_location_assignment PIN_AT24 -to ddr3bot_dqs_p[4]
	set_location_assignment PIN_AB27 -to hsmb_scl
	set_location_assignment PIN_AF29 -to hsmb_sda
	set_location_assignment PIN_T27 -to max2_wen
	set_location_assignment PIN_AL29 -to sram_bwn[3]
	set_location_assignment PIN_AH28 -to sram_bwn[2]
	set_location_assignment PIN_AR31 -to sram_bwn[1]
	set_location_assignment PIN_AH27 -to sram_bwn[0]
	set_location_assignment PIN_R27 -to max2_ben[3]
	set_location_assignment PIN_P29 -to max2_ben[2]
	set_location_assignment PIN_F34 -to max2_ben[1]
	set_location_assignment PIN_H34 -to max2_ben[0]
	set_location_assignment PIN_D14 -to ddr3top_dqs_p[0]
	set_location_assignment PIN_C14 -to ddr3top_dqs_n[0]
	set_location_assignment PIN_J23 -to ddr3top_dqs_p[1]
	set_location_assignment PIN_H23 -to ddr3top_dqs_n[1]
	set_location_assignment PIN_A10 -to ddr3top_dq[0]
	set_location_assignment PIN_D11 -to ddr3top_dq[1]
	set_location_assignment PIN_B10 -to ddr3top_dq[2]
	set_location_assignment PIN_C12 -to ddr3top_dq[3]
	set_location_assignment PIN_C11 -to ddr3top_dq[4]
	set_location_assignment PIN_C13 -to ddr3top_dq[5]
	set_location_assignment PIN_A11 -to ddr3top_dq[6]
	set_location_assignment PIN_B13 -to ddr3top_dq[7]
	set_location_assignment PIN_B11 -to ddr3top_dm[0]
	set_location_assignment PIN_K22 -to ddr3top_dq[8]
	set_location_assignment PIN_D22 -to ddr3top_dq[9]
	set_location_assignment PIN_J22 -to ddr3top_dq[10]
	set_location_assignment PIN_E22 -to ddr3top_dq[11]
	set_location_assignment PIN_G22 -to ddr3top_dq[12]
	set_location_assignment PIN_F23 -to ddr3top_dq[13]
	set_location_assignment PIN_H22 -to ddr3top_dq[14]
	set_location_assignment PIN_D23 -to ddr3top_dq[15]
	set_location_assignment PIN_G23 -to ddr3top_dm[1]
	set_location_assignment PIN_AE5 -to "hsma_clk_in_p2(n)"
	set_location_assignment PIN_AC5 -to "hsma_clk_in_p1(n)"
	set_location_assignment PIN_AA5 -to "hsmb_clk_in_p1(n)"
	set_location_assignment PIN_W5 -to "hsmb_clk_in_p2(n)"
	set_location_assignment PIN_N23 -to qdr2top0_k_n
	set_location_assignment PIN_P23 -to qdr2top0_k_p
	set_location_assignment PIN_P16 -to qdr2top1_d[0]
	set_location_assignment PIN_M17 -to qdr2top1_d[1]
	set_location_assignment PIN_N17 -to qdr2top1_d[2]
	set_location_assignment PIN_K17 -to qdr2top1_d[3]
	set_location_assignment PIN_P17 -to qdr2top1_d[4]
	set_location_assignment PIN_L16 -to qdr2top1_d[5]
	set_location_assignment PIN_K16 -to qdr2top1_d[6]
	set_location_assignment PIN_J16 -to qdr2top1_d[7]
	set_location_assignment PIN_G17 -to qdr2top1_d[8]
	set_location_assignment PIN_G16 -to qdr2top1_d[9]
	set_location_assignment PIN_A16 -to qdr2top1_d[10]
	set_location_assignment PIN_B16 -to qdr2top1_d[11]
	set_location_assignment PIN_C16 -to qdr2top1_d[12]
	set_location_assignment PIN_C15 -to qdr2top1_d[13]
	set_location_assignment PIN_D16 -to qdr2top1_d[14]
	set_location_assignment PIN_E16 -to qdr2top1_d[15]
	set_location_assignment PIN_F15 -to qdr2top1_d[16]
	set_location_assignment PIN_G15 -to qdr2top1_d[17]
	set_instance_assignment -name IO_STANDARD "2.5 V" -to sense_adc_f0
	set_location_assignment PIN_G35 -to sense_adc_f0
	set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "0 MHz" -to sense_adc_f0
	set_instance_assignment -name IO_STANDARD LVDS -to clkin_125_p
	set_instance_assignment -name INPUT_TERMINATION DIFFERENTIAL -to clkin_125_p
	set_location_assignment PIN_AK13 -to ddr3bot_a[0]
	set_location_assignment PIN_AG15 -to ddr3bot_a[1]
	set_location_assignment PIN_AH14 -to ddr3bot_a[2]
	set_location_assignment PIN_AT14 -to ddr3bot_a[3]
	set_location_assignment PIN_AF16 -to ddr3bot_a[4]
	set_location_assignment PIN_AL15 -to ddr3bot_a[5]
	set_location_assignment PIN_AG14 -to ddr3bot_a[6]
	set_location_assignment PIN_AP15 -to ddr3bot_a[7]
	set_location_assignment PIN_AH13 -to ddr3bot_a[8]
	set_location_assignment PIN_AK14 -to ddr3bot_a[9]
	set_location_assignment PIN_AE16 -to ddr3bot_a[10]
	set_location_assignment PIN_AJ13 -to ddr3bot_a[11]
	set_location_assignment PIN_AE14 -to ddr3bot_a[12]
	set_location_assignment PIN_AN15 -to ddr3bot_a[13]
	set_location_assignment PIN_AJ14 -to ddr3bot_a[14]
	set_location_assignment PIN_AF14 -to ddr3bot_ba[0]
	set_location_assignment PIN_AD15 -to ddr3bot_ba[1]
	set_location_assignment PIN_AE15 -to ddr3bot_ba[2]
	set_location_assignment PIN_D19 -to ddr3top_a[0]
	set_location_assignment PIN_C22 -to ddr3top_a[1]
	set_location_assignment PIN_N19 -to ddr3top_a[2]
	set_location_assignment PIN_R20 -to ddr3top_a[3]
	set_location_assignment PIN_D21 -to ddr3top_a[4]
	set_location_assignment PIN_P19 -to ddr3top_a[5]
	set_location_assignment PIN_G21 -to ddr3top_a[6]
	set_location_assignment PIN_M20 -to ddr3top_a[7]
	set_location_assignment PIN_F21 -to ddr3top_a[8]
	set_location_assignment PIN_M21 -to ddr3top_a[9]
	set_location_assignment PIN_B23 -to ddr3top_a[10]
	set_location_assignment PIN_A19 -to ddr3top_a[11]
	set_location_assignment PIN_A23 -to ddr3top_a[12]
	set_location_assignment PIN_M22 -to ddr3top_a[13]
	set_location_assignment PIN_B20 -to ddr3top_a[14]
	set_location_assignment PIN_B14 -to ddr3top_ba[0]
	set_location_assignment PIN_E23 -to ddr3top_ba[1]
	set_location_assignment PIN_A14 -to ddr3top_ba[2]
	set_location_assignment PIN_N21 -to qdr2top0_a[0]
	set_location_assignment PIN_P24 -to qdr2top0_a[1]
	set_location_assignment PIN_G26 -to qdr2top0_a[2]
	set_location_assignment PIN_A27 -to qdr2top0_a[3]
	set_location_assignment PIN_F26 -to qdr2top0_a[4]
	set_location_assignment PIN_D27 -to qdr2top0_a[5]
	set_location_assignment PIN_B29 -to qdr2top0_a[6]
	set_location_assignment PIN_B31 -to qdr2top0_a[7]
	set_location_assignment PIN_P20 -to qdr2top0_a[8]
	set_location_assignment PIN_A29 -to qdr2top0_a[9]
	set_location_assignment PIN_A31 -to qdr2top0_a[10]
	set_location_assignment PIN_N20 -to qdr2top0_a[11]
	set_location_assignment PIN_R24 -to qdr2top0_a[12]
	set_location_assignment PIN_B28 -to qdr2top0_a[13]
	set_location_assignment PIN_C29 -to qdr2top0_a[14]
	set_location_assignment PIN_C30 -to qdr2top0_a[15]
	set_location_assignment PIN_G28 -to qdr2top0_a[16]
	set_location_assignment PIN_C28 -to qdr2top0_a[17]
	set_location_assignment PIN_J24 -to qdr2top0_a[18]
	set_location_assignment PIN_A28 -to qdr2top0_a[19]
	set_location_assignment PIN_F25 -to qdr2top0_d[0]
	set_location_assignment PIN_G25 -to qdr2top0_d[1]
	set_location_assignment PIN_E25 -to qdr2top0_d[2]
	set_location_assignment PIN_D26 -to qdr2top0_d[3]
	set_location_assignment PIN_D25 -to qdr2top0_d[4]
	set_location_assignment PIN_C26 -to qdr2top0_d[5]
	set_location_assignment PIN_C25 -to qdr2top0_d[6]
	set_location_assignment PIN_B26 -to qdr2top0_d[7]
	set_location_assignment PIN_A26 -to qdr2top0_d[8]
	set_location_assignment PIN_P22 -to qdr2top0_d[9]
	set_location_assignment PIN_N22 -to qdr2top0_d[10]
	set_location_assignment PIN_R22 -to qdr2top0_d[11]
	set_location_assignment PIN_M23 -to qdr2top0_d[12]
	set_location_assignment PIN_K23 -to qdr2top0_d[13]
	set_location_assignment PIN_M24 -to qdr2top0_d[14]
	set_location_assignment PIN_F24 -to qdr2top0_d[15]
	set_location_assignment PIN_G24 -to qdr2top0_d[16]
	set_location_assignment PIN_B25 -to qdr2top0_d[17]
	set_location_assignment PIN_C17 -to qdr2top1_a[0]
	set_location_assignment PIN_H19 -to qdr2top1_a[1]
	set_location_assignment PIN_A17 -to qdr2top1_a[2]
	set_location_assignment PIN_A18 -to qdr2top1_a[3]
	set_location_assignment PIN_C18 -to qdr2top1_a[4]
	set_location_assignment PIN_G19 -to qdr2top1_a[5]
	set_location_assignment PIN_L19 -to qdr2top1_a[6]
	set_location_assignment PIN_G18 -to qdr2top1_a[7]
	set_location_assignment PIN_D17 -to qdr2top1_a[8]
	set_location_assignment PIN_P18 -to qdr2top1_a[9]
	set_location_assignment PIN_F16 -to qdr2top1_a[10]
	set_location_assignment PIN_F17 -to qdr2top1_a[11]
	set_location_assignment PIN_F18 -to qdr2top1_a[12]
	set_location_assignment PIN_R18 -to qdr2top1_a[13]
	set_location_assignment PIN_M19 -to qdr2top1_a[14]
	set_location_assignment PIN_J18 -to qdr2top1_a[15]
	set_location_assignment PIN_E17 -to qdr2top1_a[16]
	set_location_assignment PIN_G20 -to qdr2top1_a[17]
	set_location_assignment PIN_B17 -to qdr2top1_a[18]
	set_location_assignment PIN_F20 -to qdr2top1_a[19]
	set_location_assignment PIN_H17 -to qdr2top1_bwsn[0]
	set_location_assignment PIN_J17 -to qdr2top1_bwsn[1]
	set_location_assignment PIN_AL25 -to hdmi_d[0]
	set_location_assignment PIN_AP26 -to hdmi_d[1]
	set_location_assignment PIN_AM26 -to hdmi_d[2]
	set_location_assignment PIN_AN26 -to hdmi_d[3]
	set_location_assignment PIN_AN27 -to hdmi_d[4]
	set_location_assignment PIN_AW29 -to hdmi_d[5]
	set_location_assignment PIN_AW28 -to hdmi_d[6]
	set_location_assignment PIN_AW30 -to hdmi_d[7]
	set_location_assignment PIN_AV31 -to hdmi_d[8]
	set_location_assignment PIN_AW32 -to hdmi_d[9]
	set_location_assignment PIN_AW34 -to hdmi_d[10]
	set_location_assignment PIN_AK25 -to hdmi_d[11]
	set_location_assignment PIN_AH26 -to hdmi_d[12]
	set_location_assignment PIN_AK26 -to hdmi_d[13]
	set_location_assignment PIN_AP27 -to hdmi_d[14]
	set_location_assignment PIN_AV28 -to hdmi_d[15]
	set_location_assignment PIN_AW27 -to hdmi_d[16]
	set_location_assignment PIN_AV29 -to hdmi_d[17]
	set_location_assignment PIN_AW31 -to hdmi_d[18]
	set_location_assignment PIN_AV32 -to hdmi_d[19]
	set_location_assignment PIN_AW33 -to hdmi_d[20]
	set_location_assignment PIN_AJ25 -to hdmi_d[21]
	set_location_assignment PIN_AL27 -to hdmi_d[22]
	set_location_assignment PIN_AJ26 -to hdmi_d[23]
	set_location_assignment PIN_AT29 -to hdmi_i2s[0]
	set_location_assignment PIN_AU29 -to hdmi_i2s[1]
	set_location_assignment PIN_AU28 -to hdmi_i2s[2]
	set_location_assignment PIN_AT28 -to hdmi_i2s[3]
	set_location_assignment PIN_AN32 -to fsm_a[0]
	set_location_assignment PIN_AP33 -to fsm_a[1]
	set_location_assignment PIN_AC26 -to fsm_a[2]
	set_location_assignment PIN_AD26 -to fsm_a[3]
	set_location_assignment PIN_AN33 -to fsm_a[4]
	set_location_assignment PIN_AP34 -to fsm_a[5]
	set_location_assignment PIN_AD27 -to fsm_a[6]
	set_location_assignment PIN_AE27 -to fsm_a[7]
	set_location_assignment PIN_AT34 -to fsm_a[8]
	set_location_assignment PIN_AR34 -to fsm_a[9]
	set_location_assignment PIN_AJ31 -to fsm_a[10]
	set_location_assignment PIN_AH30 -to fsm_a[11]
	set_location_assignment PIN_AT33 -to fsm_a[12]
	set_location_assignment PIN_AU33 -to fsm_a[13]
	set_location_assignment PIN_AK32 -to fsm_a[14]
	set_location_assignment PIN_AL32 -to fsm_a[15]
	set_location_assignment PIN_AP35 -to fsm_a[16]
	set_location_assignment PIN_AR35 -to fsm_a[17]
	set_location_assignment PIN_AG29 -to fsm_a[18]
	set_location_assignment PIN_AH29 -to fsm_a[19]
	set_location_assignment PIN_AP32 -to fsm_a[20]
	set_location_assignment PIN_AR32 -to fsm_a[21]
	set_location_assignment PIN_AK31 -to fsm_a[22]
	set_location_assignment PIN_AL31 -to fsm_a[23]
	set_location_assignment PIN_AN30 -to fsm_a[24]
	set_location_assignment PIN_AP30 -to fsm_a[25]
	set_location_assignment PIN_AL35 -to user_dipsw[0]
	set_location_assignment PIN_AC35 -to user_dipsw[1]
	set_location_assignment PIN_J34 -to user_dipsw[2]
	set_location_assignment PIN_AN35 -to user_dipsw[3]
	set_location_assignment PIN_G33 -to user_dipsw[4]
	set_location_assignment PIN_K35 -to user_dipsw[5]
	set_location_assignment PIN_AG34 -to user_dipsw[6]
	set_location_assignment PIN_AG31 -to user_dipsw[7]
	set_location_assignment PIN_F33 -to user_led[0]
	set_location_assignment PIN_AK33 -to user_led[1]
	set_location_assignment PIN_W28 -to user_led[2]
	set_location_assignment PIN_L34 -to user_led[3]
	set_location_assignment PIN_AM34 -to user_led[4]
	set_location_assignment PIN_M32 -to user_led[5]
	set_location_assignment PIN_L35 -to user_led[6]
	set_location_assignment PIN_N34 -to user_led[8]
	set_location_assignment PIN_W35 -to user_led[9]
	set_location_assignment PIN_AE30 -to user_led[10]
	set_location_assignment PIN_V30 -to user_led[11]
	set_location_assignment PIN_AG30 -to user_led[12]
	set_location_assignment PIN_AD29 -to user_led[13]
	set_location_assignment PIN_U31 -to user_led[14]
	set_location_assignment PIN_U35 -to user_led[15]
	set_location_assignment PIN_AK35 -to user_pb[0]
	set_location_assignment PIN_W32 -to user_pb[1]
	set_location_assignment PIN_M34 -to user_pb[2]
	set_location_assignment PIN_AN9 -to hsma_tx_d_p[0]
	set_location_assignment PIN_AN7 -to hsma_tx_d_p[1]
	set_location_assignment PIN_AE13 -to hsma_tx_d_p[2]
	set_location_assignment PIN_AL8 -to hsma_tx_d_p[3]
	set_location_assignment PIN_AK9 -to hsma_tx_d_p[4]
	set_location_assignment PIN_AK8 -to hsma_tx_d_p[5]
	set_location_assignment PIN_AH10 -to hsma_tx_d_p[6]
	set_location_assignment PIN_AH9 -to hsma_tx_d_p[7]
	set_location_assignment PIN_AG8 -to hsma_tx_d_p[8]
	set_location_assignment PIN_AG10 -to hsma_tx_d_p[9]
	set_location_assignment PIN_AF11 -to hsma_tx_d_p[10]
	set_location_assignment PIN_AD10 -to hsma_tx_d_p[11]
	set_location_assignment PIN_AE11 -to hsma_tx_d_p[12]
	set_location_assignment PIN_AD13 -to hsma_tx_d_p[13]
	set_location_assignment PIN_AB13 -to hsma_tx_d_p[14]
	set_location_assignment PIN_AB11 -to hsma_tx_d_p[15]
	set_location_assignment PIN_AC11 -to hsma_tx_d_p[16]
	set_location_assignment PIN_L11 -to hsma_scl
	set_location_assignment PIN_AG12 -to hsma_prsntn
	set_location_assignment PIN_W12 -to hsmb_tx_d_p[0]
	set_location_assignment PIN_V12 -to hsmb_tx_d_p[1]
	set_location_assignment PIN_V10 -to hsmb_tx_d_p[2]
	set_location_assignment PIN_U10 -to hsmb_tx_d_p[3]
	set_location_assignment PIN_T10 -to hsmb_tx_d_p[4]
	set_location_assignment PIN_R9 -to hsmb_tx_d_p[5]
	set_location_assignment PIN_N9 -to hsmb_tx_d_p[6]
	set_location_assignment PIN_N11 -to hsmb_tx_d_p[7]
	set_location_assignment PIN_M8 -to hsmb_tx_d_p[8]
	set_location_assignment PIN_L8 -to hsmb_tx_d_p[9]
	set_location_assignment PIN_K7 -to hsmb_tx_d_p[10]
	set_location_assignment PIN_K9 -to hsmb_tx_d_p[11]
	set_location_assignment PIN_H7 -to hsmb_tx_d_p[12]
	set_location_assignment PIN_M10 -to hsmb_tx_d_p[13]
	set_location_assignment PIN_R12 -to hsmb_tx_d_p[14]
	set_location_assignment PIN_T13 -to hsmb_tx_d_p[15]
	set_location_assignment PIN_R13 -to hsmb_tx_d_p[16]
	set_location_assignment PIN_D9 -to hsmb_prsntn
	set_location_assignment PIN_C34 -to fsm_d[0]
	set_location_assignment PIN_D34 -to fsm_d[1]
	set_location_assignment PIN_J30 -to fsm_d[2]
	set_location_assignment PIN_K30 -to fsm_d[3]
	set_location_assignment PIN_C31 -to fsm_d[4]
	set_location_assignment PIN_D31 -to fsm_d[5]
	set_location_assignment PIN_M28 -to fsm_d[6]
	set_location_assignment PIN_N28 -to fsm_d[7]
	set_location_assignment PIN_C35 -to fsm_d[8]
	set_location_assignment PIN_D35 -to fsm_d[9]
	set_location_assignment PIN_H32 -to fsm_d[10]
	set_location_assignment PIN_J32 -to fsm_d[11]
	set_location_assignment PIN_B32 -to fsm_d[12]
	set_location_assignment PIN_C32 -to fsm_d[13]
	set_location_assignment PIN_M31 -to fsm_d[14]
	set_location_assignment PIN_N31 -to fsm_d[15]
	set_location_assignment PIN_C33 -to fsm_d[16]
	set_location_assignment PIN_D33 -to fsm_d[17]
	set_location_assignment PIN_M30 -to fsm_d[18]
	set_location_assignment PIN_N30 -to fsm_d[19]
	set_location_assignment PIN_G31 -to fsm_d[20]
	set_location_assignment PIN_H31 -to fsm_d[21]
	set_location_assignment PIN_M29 -to fsm_d[22]
	set_location_assignment PIN_N29 -to fsm_d[23]
	set_location_assignment PIN_E31 -to fsm_d[24]
	set_location_assignment PIN_F31 -to fsm_d[25]
	set_location_assignment PIN_K31 -to fsm_d[26]
	set_location_assignment PIN_L31 -to fsm_d[27]
	set_location_assignment PIN_E32 -to fsm_d[28]
	set_location_assignment PIN_F32 -to fsm_d[29]
	set_location_assignment PIN_R28 -to fsm_d[30]
	set_location_assignment PIN_T28 -to fsm_d[31]
	set_location_assignment PIN_F35 -to sram_dqp[0]
	set_location_assignment PIN_AJ32 -to sram_dqp[1]
	set_location_assignment PIN_N33 -to sram_dqp[2]
	set_location_assignment PIN_AJ35 -to sram_dqp[3]
	set_location_assignment PIN_AD31 -to lcd_data[0]
	set_location_assignment PIN_AJ34 -to lcd_data[1]
	set_location_assignment PIN_R31 -to lcd_data[2]
	set_location_assignment PIN_L32 -to lcd_data[3]
	set_location_assignment PIN_T30 -to lcd_data[4]
	set_location_assignment PIN_AN34 -to lcd_data[5]
	set_location_assignment PIN_T31 -to lcd_data[6]
	set_location_assignment PIN_AD30 -to lcd_data[7]
	set_location_assignment PIN_AJ11 -to hsma_sda
	set_location_assignment PIN_AW10 -to hsma_d[0]
	set_location_assignment PIN_AV10 -to hsma_d[1]
	set_location_assignment PIN_AW7 -to hsma_d[2]
	set_location_assignment PIN_AV7 -to hsma_d[3]
	set_location_assignment PIN_AP10 -to hsmb_d[0]
	set_location_assignment PIN_AN10 -to hsmb_d[1]
	set_location_assignment PIN_AW8 -to hsmb_d[2]
	set_location_assignment PIN_AV8 -to hsmb_d[3]
	set_location_assignment PIN_AT9 -to hsma_rx_d_p[0]
	set_location_assignment PIN_AT8 -to hsma_rx_d_p[1]
	set_location_assignment PIN_AP8 -to hsma_rx_d_p[2]
	set_location_assignment PIN_AW6 -to hsma_rx_d_p[3]
	set_location_assignment PIN_AV5 -to hsma_rx_d_p[4]
	set_location_assignment PIN_AT7 -to hsma_rx_d_p[5]
	set_location_assignment PIN_AT6 -to hsma_rx_d_p[6]
	set_location_assignment PIN_AR5 -to hsma_rx_d_p[7]
	set_location_assignment PIN_AP6 -to hsma_rx_d_p[8]
	set_location_assignment PIN_AN6 -to hsma_rx_d_p[9]
	set_location_assignment PIN_AM6 -to hsma_rx_d_p[10]
	set_location_assignment PIN_AL6 -to hsma_rx_d_p[11]
	set_location_assignment PIN_AK6 -to hsma_rx_d_p[12]
	set_location_assignment PIN_AJ6 -to hsma_rx_d_p[13]
	set_location_assignment PIN_AH6 -to hsma_rx_d_p[14]
	set_location_assignment PIN_AG6 -to hsma_rx_d_p[15]
	set_location_assignment PIN_AB9 -to hsma_rx_d_p[16]
	set_location_assignment PIN_W8 -to hsmb_rx_d_p[0]
	set_location_assignment PIN_V6 -to hsmb_rx_d_p[1]
	set_location_assignment PIN_R7 -to hsmb_rx_d_p[2]
	set_location_assignment PIN_R6 -to hsmb_rx_d_p[3]
	set_location_assignment PIN_N6 -to hsmb_rx_d_p[4]
	set_location_assignment PIN_N8 -to hsmb_rx_d_p[5]
	set_location_assignment PIN_M6 -to hsmb_rx_d_p[6]
	set_location_assignment PIN_K6 -to hsmb_rx_d_p[7]
	set_location_assignment PIN_J6 -to hsmb_rx_d_p[8]
	set_location_assignment PIN_G8 -to hsmb_rx_d_p[9]
	set_location_assignment PIN_G6 -to hsmb_rx_d_p[10]
	set_location_assignment PIN_G5 -to hsmb_rx_d_p[11]
	set_location_assignment PIN_F7 -to hsmb_rx_d_p[12]
	set_location_assignment PIN_G9 -to hsmb_rx_d_p[13]
	set_location_assignment PIN_D7 -to hsmb_rx_d_p[14]
	set_location_assignment PIN_D8 -to hsmb_rx_d_p[15]
	set_location_assignment PIN_F10 -to hsmb_rx_d_p[16]
	set_location_assignment PIN_AU34 -to termination_blk0~_rup_pad
	set_location_assignment PIN_AV34 -to termination_blk0~_rdn_pad
	set_location_assignment PIN_P26 -to termination_blk1~_rup_pad
	set_location_assignment PIN_N26 -to termination_blk1~_rdn_pad
	set_location_assignment PIN_AF25 -to termination_blk2~_rup_pad
	set_location_assignment PIN_AG25 -to termination_blk2~_rdn_pad
	set_instance_assignment -name IO_STANDARD HCSL -to pcie_refclk_p
	set_instance_assignment -name INPUT_TERMINATION DIFFERENTIAL -to pcie_refclk_p
	set_location_assignment PIN_AN38 -to pcie_refclk_p
	set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to pcie_tx_p
	set_location_assignment PIN_AT36 -to pcie_tx_p[0]
	set_location_assignment PIN_AP36 -to pcie_tx_p[1]
	set_location_assignment PIN_AH36 -to pcie_tx_p[2]
	set_location_assignment PIN_AF36 -to pcie_tx_p[3]
	set_location_assignment PIN_AD36 -to pcie_tx_p[4]
	set_location_assignment PIN_AB36 -to pcie_tx_p[5]
	set_location_assignment PIN_T36 -to pcie_tx_p[6]
	set_location_assignment PIN_P36 -to pcie_tx_p[7]
	set_location_assignment PIN_AU38 -to pcie_rx_p[0]
	set_location_assignment PIN_AR38 -to pcie_rx_p[1]
	set_location_assignment PIN_AJ38 -to pcie_rx_p[2]
	set_location_assignment PIN_AG38 -to pcie_rx_p[3]
	set_location_assignment PIN_AE38 -to pcie_rx_p[4]
	set_location_assignment PIN_AC38 -to pcie_rx_p[5]
	set_location_assignment PIN_U38 -to pcie_rx_p[6]
	set_location_assignment PIN_R38 -to pcie_rx_p[7]
	set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to pcie_rx_p
	set_instance_assignment -name INPUT_TERMINATION DIFFERENTIAL -to pcie_rx_p
	set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to hsma_tx_p
	set_location_assignment PIN_AT4 -to hsma_tx_p[0]
	set_location_assignment PIN_AP4 -to hsma_tx_p[1]
	set_location_assignment PIN_AH4 -to hsma_tx_p[2]
	set_location_assignment PIN_AF4 -to hsma_tx_p[3]
	set_location_assignment PIN_AB4 -to hsma_tx_p[5]
	set_location_assignment PIN_T4 -to hsma_tx_p[6]
	set_location_assignment PIN_P4 -to hsma_tx_p[7]
	set_location_assignment PIN_AU2 -to hsma_rx_p[0]
	set_location_assignment PIN_AR2 -to hsma_rx_p[1]
	set_location_assignment PIN_AJ2 -to hsma_rx_p[2]
	set_location_assignment PIN_AG2 -to hsma_rx_p[3]
	set_location_assignment PIN_AE2 -to hsma_rx_p[4]
	set_location_assignment PIN_AC2 -to hsma_rx_p[5]
	set_location_assignment PIN_U2 -to hsma_rx_p[6]
	set_location_assignment PIN_R2 -to hsma_rx_p[7]
	set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to hsma_rx_p
	set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to hsmb_tx_p
	set_location_assignment PIN_M36 -to hsmb_tx_p[0]
	set_location_assignment PIN_K36 -to hsmb_tx_p[1]
	set_location_assignment PIN_D36 -to hsmb_tx_p[2]
	set_location_assignment PIN_B36 -to hsmb_tx_p[3]
	set_location_assignment PIN_B4 -to hsmb_tx_p[4]
	set_location_assignment PIN_D4 -to hsmb_tx_p[5]
	set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to hsmb_rx_p
	set_location_assignment PIN_N38 -to hsmb_rx_p[0]
	set_location_assignment PIN_L38 -to hsmb_rx_p[1]
	set_location_assignment PIN_E38 -to hsmb_rx_p[2]
	set_location_assignment PIN_C38 -to hsmb_rx_p[3]
	set_location_assignment PIN_C2 -to hsmb_rx_p[4]
	set_location_assignment PIN_E2 -to hsmb_rx_p[5]
	set_instance_assignment -name INPUT_TERMINATION DIFFERENTIAL -to enet_rx_p
	set_instance_assignment -name IO_STANDARD "2.5 V" -to sdi_clk148_up
	set_location_assignment PIN_AH12 -to sdi_clk148_up
	set_instance_assignment -name IO_STANDARD "2.5 V" -to sdi_clk148_dn
	set_location_assignment PIN_AH11 -to sdi_clk148_dn
	set_location_assignment PIN_AM35 -to user_led[7]
	set_location_assignment PIN_V29 -to sdi_tx_sd_hdn
	set_instance_assignment -name IO_STANDARD "2.5 V" -to sdi_tx_sd_hdn
	set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "0 MHz" -to sdi_tx_sd_hdn
	set_instance_assignment -name INPUT_TERMINATION DIFFERENTIAL -to hsma_clk_in_p2
	set_instance_assignment -name INPUT_TERMINATION DIFFERENTIAL -to hsmb_clk_in_p2
	set_instance_assignment -name IO_STANDARD LVDS -to clkinlt_100_p
	set_location_assignment PIN_G38 -to clkinlt_100_p
	set_instance_assignment -name IO_STANDARD LVDS -to clkinrt_100_p
	set_location_assignment PIN_G2 -to clkinrt_100_p
	set_instance_assignment -name IO_STANDARD "2.5 V" -to cpu_resetn
	set_location_assignment PIN_V34 -to cpu_resetn
	set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "0 MHz" -to cpu_resetn
	set_instance_assignment -name IO_STANDARD "2.5 V" -to enet_intn
	set_location_assignment PIN_R30 -to enet_intn
	set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "0 MHz" -to enet_intn
	set_instance_assignment -name IO_STANDARD "2.5 V" -to flash_rdybsyn
	set_location_assignment PIN_AT32 -to flash_rdybsyn
	set_location_assignment PIN_D5 -to hsma_tx_led
	set_location_assignment PIN_AT10 -to hsmb_rx_led
	set_location_assignment PIN_AH33 -to hsmb_tx_led
	set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "0 MHz" -to sense_cs0n
	set_instance_assignment -name IO_STANDARD "2.5 V" -to lcd_csn
	set_instance_assignment -name IO_STANDARD "2.5 V" -to sense_cs0n
	set_location_assignment PIN_AB31 -to sense_cs0n
	set_location_assignment PIN_H35 -to sense_cs1n
	set_location_assignment PIN_K34 -to lcd_csn
	set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "0 MHz" -to sense_cs1n
	set_instance_assignment -name IO_STANDARD "2.5 V" -to sense_cs1n
	set_location_assignment PIN_J2 -to clk_125_p[0]
	set_location_assignment PIN_AF34 -to clk_125_p[1]
	set_location_assignment PIN_J38 -to clk_155_p
	set_location_assignment PIN_AC32 -to "enet_rx_p(n)"
	set_location_assignment PIN_K29 -to "enet_tx_p(n)"
	set_location_assignment PIN_AM10 -to "hsma_clk_out_p1(n)"
	set_location_assignment PIN_AG13 -to "hsma_clk_out_p2(n)"
	set_location_assignment PIN_C6 -to hsma_rx_led
	set_location_assignment PIN_AD4 -to hsma_tx_p[4]
	set_location_assignment PIN_J8 -to "hsmb_clk_out_p1(n)"
	set_location_assignment PIN_J10 -to "hsmb_clk_out_p2(n)"
	set_location_assignment PIN_AN39 -to "pcie_refclk_p(n)"
	set_location_assignment PIN_L2 -to sdi_rx_p
	set_location_assignment PIN_L1 -to "sdi_rx_p(n)"
	set_location_assignment PIN_K4 -to sdi_tx_p
	set_location_assignment PIN_K3 -to "sdi_tx_p(n)"
	set_location_assignment PIN_N38 -to tempdiode_n
	set_location_assignment PIN_L38 -to tempdiode_p
	set_instance_assignment -name INPUT_TERMINATION DIFFERENTIAL -to clk_125_p[1]
	set_instance_assignment -name IO_STANDARD LVDS -to clk_155_p
	set_location_assignment PIN_M4 -to sma_tx_p
	set_instance_assignment -name IO_STANDARD "1.4-V PCML" -to sma_tx_p
