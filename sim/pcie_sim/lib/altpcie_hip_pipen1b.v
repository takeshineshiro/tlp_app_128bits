
//Legal Notice: (C)2010 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings
// altera message_level Level1
// altera message_off 10034 10035 10036 10037 10230 10240 10030

module altpcie_hip_pipen1b
#(
   parameter pcie_qsys = 0,
  parameter CB_A2P_ADDR_MAP_FIXED_TABLE_0_LOW  = 32'h00000000,
  parameter CB_A2P_ADDR_MAP_FIXED_TABLE_0_HIGH  = 32'h00000000,
  parameter CB_A2P_ADDR_MAP_FIXED_TABLE_1_LOW  = 32'h00000000,
  parameter CB_A2P_ADDR_MAP_FIXED_TABLE_1_HIGH  = 32'h00000000,
  parameter CB_A2P_ADDR_MAP_FIXED_TABLE_2_LOW  = 32'h00000000,
  parameter CB_A2P_ADDR_MAP_FIXED_TABLE_2_HIGH  = 32'h00000000,
  parameter CB_A2P_ADDR_MAP_FIXED_TABLE_3_LOW  = 32'h00000000,
  parameter CB_A2P_ADDR_MAP_FIXED_TABLE_3_HIGH  = 32'h00000000,
  parameter CB_A2P_ADDR_MAP_FIXED_TABLE_4_LOW  = 32'h00000000,
  parameter CB_A2P_ADDR_MAP_FIXED_TABLE_4_HIGH  = 32'h00000000,
  parameter CB_A2P_ADDR_MAP_FIXED_TABLE_5_LOW  = 32'h00000000,
  parameter CB_A2P_ADDR_MAP_FIXED_TABLE_5_HIGH  = 32'h00000000,
  parameter CB_A2P_ADDR_MAP_FIXED_TABLE_6_LOW  = 32'h00000000,
  parameter CB_A2P_ADDR_MAP_FIXED_TABLE_6_HIGH  = 32'h00000000,
  parameter CB_A2P_ADDR_MAP_FIXED_TABLE_7_LOW  = 32'h00000000,
  parameter CB_A2P_ADDR_MAP_FIXED_TABLE_7_HIGH  = 32'h00000000,
  parameter CB_A2P_ADDR_MAP_FIXED_TABLE_8_LOW  = 32'h00000000,
  parameter CB_A2P_ADDR_MAP_FIXED_TABLE_8_HIGH  = 32'h00000000,
  parameter CB_A2P_ADDR_MAP_FIXED_TABLE_9_LOW  = 32'h00000000,
  parameter CB_A2P_ADDR_MAP_FIXED_TABLE_9_HIGH  = 32'h00000000,
  parameter CB_A2P_ADDR_MAP_FIXED_TABLE_10_LOW  = 32'h00000000,
  parameter CB_A2P_ADDR_MAP_FIXED_TABLE_10_HIGH  = 32'h00000000,
  parameter CB_A2P_ADDR_MAP_FIXED_TABLE_11_LOW  = 32'h00000000,
  parameter CB_A2P_ADDR_MAP_FIXED_TABLE_11_HIGH  = 32'h00000000,
  parameter CB_A2P_ADDR_MAP_FIXED_TABLE_12_LOW  = 32'h00000000,
  parameter CB_A2P_ADDR_MAP_FIXED_TABLE_12_HIGH  = 32'h00000000,
  parameter CB_A2P_ADDR_MAP_FIXED_TABLE_13_LOW  = 32'h00000000,
  parameter CB_A2P_ADDR_MAP_FIXED_TABLE_13_HIGH  = 32'h00000000,
  parameter CB_A2P_ADDR_MAP_FIXED_TABLE_14_LOW  = 32'h00000000,
  parameter CB_A2P_ADDR_MAP_FIXED_TABLE_14_HIGH  = 32'h00000000,
  parameter CB_A2P_ADDR_MAP_FIXED_TABLE_15_LOW  = 32'h00000000,
  parameter CB_A2P_ADDR_MAP_FIXED_TABLE_15_HIGH  = 32'h00000000,

  parameter CB_P2A_AVALON_ADDR_B0 = 32'h80000000,
  parameter CB_P2A_AVALON_ADDR_B5 = 32'h00000000,
  parameter CG_NO_CPL_REORDERING = 0,
  parameter enable_gen2_core = "true",
  parameter use_crc_forwarding = "false",
  parameter enable_function_msi_support = "true",
  parameter flow_control_timeout_count = 200,
  parameter CG_IMPL_CRA_AV_SLAVE_PORT = 1,
  parameter CG_ENABLE_A2P_INTERRUPT = 0,
  parameter vc0_clk_enable = "true",
  parameter RH_NUM = 7,
  parameter CB_P2A_AVALON_ADDR_B3 = 32'h00000000,
  parameter INTENDED_DEVICE_FAMILY = "Stratix IV GX",
  parameter RX_BUF = 10,
  parameter l0_exit_latency_sameclock = 0,
  parameter enable_hip_x1_loopback = "false",
  parameter enable_ecrc_gen = "false",
  parameter vc1_rx_flow_ctrl_posted_data = 360,
  parameter l01_entry_latency = 31,
  parameter msix_pba_bir = 0,
  parameter vc1_rx_flow_ctrl_posted_header = 50,
  parameter ei_delay_powerdown_count = 10,
  parameter TL_SELECTION = 6,
  parameter bar0_prefetchable = "true",
  parameter bar4_size_mask = 0,
  parameter enable_coreclk_out_half_rate = "false",
  parameter maximum_current = 0,
  parameter p_pcie_use_pcie_reconfig = "0",
  parameter class_code = 16711680,
  parameter bridge_port_vga_enable = "false",
  parameter ssvid = 0,
  parameter enable_adapter_half_rate_mode = "false",
  parameter bar1_64bit_mem_space = "false",
  parameter subsystem_vendor_id = 4466,
  parameter sameclock_nfts_count = 0,
  parameter msix_table_offset = 0,
  parameter l0_exit_latency_diffclock = 0,
  parameter eie_before_nfts_count = 4,
  parameter CB_P2A_AVALON_ADDR_B4 = 32'h00000000,
  parameter retry_buffer_memory_settings = 0,
  parameter bar0_size_mask = 0,
  parameter surprise_down_error_support = "false",
  parameter vc0_rx_buffer_memory_settings = 0,
  parameter credit_buffer_allocation_aux = "BALANCED",
  parameter enable_rx0buf_ecc = "true",
  parameter bar3_size_mask = 0,
  parameter enable_rx_reordering = "true",
  parameter bar4_io_space = "false",
  parameter CG_COMMON_CLOCK_MODE = 0,
  parameter extend_tag_field = "false",
  parameter core_clk_divider = 0,
  parameter G_TAG_NUM0 = 32,
  parameter enable_retrybuf_x8_clk_stealing = 0,
  parameter flow_control_update_count = 30,
  parameter rx_ptr1_posted_dpram_max = 0,
  parameter rx_ptr0_posted_dpram_min = 0,
  parameter pme_state_enable = 5'b00000,
  parameter port_link_number = 1,
  parameter vc0_rx_flow_ctrl_posted_header = 50,
  parameter ssid = 0,
  parameter endpoint_l1_latency = 0,
  parameter rx_ptr0_nonposted_dpram_min = 0,
  parameter l1_exit_latency_diffclock = 0,
  parameter retry_buffer_last_active_address = 2047,
  parameter CB_P2A_AVALON_ADDR_B1 = 32'h00000000,
  parameter bar_io_window_size = "32BIT",
  parameter CB_A2P_ADDR_MAP_PASS_THRU_BITS = 20,
  parameter rx_ptr1_posted_dpram_min = 0,
  parameter CB_A2P_ADDR_MAP_IS_FIXED = 0,
  parameter rx_ptr1_nonposted_dpram_max = 0,
  parameter bar5_io_space = "false",
  parameter gen2_sameclock_nfts_count = 255,
  parameter max_payload_size = 512,
  parameter gen2_diffclock_nfts_count = 255,
  parameter vc_arbitration = 1,
  parameter disable_snoop_packet = 8'b00000000,
  parameter vc0_rx_flow_ctrl_posted_data = 360,
  parameter AST_LITE = 0,
  parameter CB_A2P_ADDR_MAP_NUM_ENTRIES = 2,
  parameter vc1_rx_flow_ctrl_compl_data = 448,
  parameter expansion_base_address_register = 0,
  parameter msi_function_count = 4,
  parameter vc0_rx_flow_ctrl_compl_data = 448,
  parameter single_rx_detect = 0,
  parameter CB_P2A_AVALON_ADDR_B2 = 32'h80000000,
  parameter slot_number = 0,
  parameter enable_rx_buffer_checking = "true",
  parameter deemphasis_enable = "false",
  parameter bar5_prefetchable = "false",
  parameter device_number = 0,
  parameter msix_pba_offset = 0,
  parameter gen2_lane_rate_mode = "true",
  parameter subsystem_device_id = 1,
  parameter bypass_cdc = "false",
  parameter tx_cdc_full_value = 4'h12,
  parameter bar_prefetchable = 32,
  parameter enable_retrybuf_ecc = "true",
  parameter fc_init_timer = 1024,
  parameter base_address = 0,
  parameter register_pipe_signals = "false",
  parameter core_clk_source = "PLL_FIXED_CLK",
  parameter no_command_completed = "true",
  parameter msix_table_size = 0,
  parameter bar3_prefetchable = "false",
  parameter enable_msi_64bit_addressing = "true",
  parameter port_address = 0,
  parameter enable_rx1buf_x8_clk_stealing = 0,
  parameter bar0_io_space = "false",
  parameter vc1_rx_flow_ctrl_nonposted_header = 54,
  parameter bar2_size_mask = 0,
  parameter slot_power_limit = 0,
  parameter enable_function_msix_support = "true",
  parameter bar3_io_space = "false",
  parameter bar0_64bit_mem_space = "true",
  parameter millisecond_cycle_count = 0,
  parameter enable_msi_masking = "false",
  parameter endpoint_l0_latency = 0,
  parameter bar4_prefetchable = "false",
  parameter lpm_type = "stratixiv_hssi_pcie_hip",
  parameter diffclock_nfts_count = 0,
  parameter indicator = 0,
  parameter bar1_io_space = "false",
  parameter enable_l1_aspm = "false",
  parameter vc1_rx_flow_ctrl_nonposted_data = 0,
  parameter vc1_rx_flow_ctrl_compl_header = 112,
  parameter low_priority_vc = 0,
  parameter l1_exit_latency_sameclock = 0,
  parameter bar1_size_mask = 0,
  parameter vc0_rx_flow_ctrl_nonposted_header = 54,
  parameter lane_mask = 8'hF0,
  parameter bar2_io_space = "false",
  parameter enable_ch0_pclk_out = "true",
  parameter CB_A2P_ADDR_MAP_FIXED_TABLE = 1024'h0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000,
  parameter enable_ecrc_check = "false",
  parameter rx_ptr0_posted_dpram_max = 0,
  parameter bar1_prefetchable = "false",
  parameter p_pcie_hip_type = "0",
  parameter bar2_64bit_mem_space = "false",
  parameter vc0_rx_flow_ctrl_nonposted_data = 0,
  parameter bar5_size_mask = 0,
  parameter disable_link_x2_support = "false",
  parameter bridge_port_ssid_support = "false",
  parameter enable_rx0buf_x8_clk_stealing = 0,
  parameter dll_active_report_support = "false",
  parameter CB_PCIE_MODE = 0,
  parameter vendor_id = 4466,
  parameter msix_table_bir = 0,
  parameter slot_power_scale = 0,
  parameter device_address = 0,
  parameter bar3_64bit_mem_space = "false",
  parameter CG_AVALON_S_ADDR_WIDTH = 21,
  parameter advanced_errors = "false",
  parameter enable_rx1buf_ecc = "true",
  parameter vc1_rx_buffer_memory_settings = 0,
  parameter bypass_tl = "false",
  parameter vc_enable = 7'b0000000,
  parameter completion_timeout = "NONE",
  parameter hot_plug_support = 7'b0000000,
  parameter disable_cdc_clk_ppm = "false",
  parameter no_soft_reset = "false",
  parameter enable_slot_register = "false",
  parameter rx_ptr0_nonposted_dpram_max = 0,
  parameter bar5_64bit_mem_space = "false",
  parameter vc0_rx_flow_ctrl_compl_header = 112,
  parameter revision_id = 1,
  parameter pcie_mode = "EP_NATIVE",
  parameter max_link_width = 4,
  parameter rx_ptr1_nonposted_dpram_min = 0,
  parameter device_id = 1,
  parameter bar4_64bit_mem_space = "false",
  parameter enable_completion_timeout_disable = "false",
  parameter skp_os_schedule_count = 0,
  parameter vc1_clk_enable = "false",
  parameter bar2_prefetchable = "false",



  parameter RXM_DATA_WIDTH = 64,
  parameter RXM_BEN_WIDTH = 8,
  parameter RXM_BCNT_WIDTH = (pcie_qsys == 0) ?  10 : 7,
  parameter TXS_BCNT_WIDTH = (pcie_qsys == 0) ?  10 : 7,
  parameter CG_RXM_IRQ_NUM = 1,
  parameter CG_IRQ_BIT_ENA = 65535
    )

(
  output           CraIrq_o,
  output  [ 31: 0] CraReadData_o,
  output           CraWaitRequest_o,
  output  [ 31: 0] RxmAddress_o,
  output  [  RXM_BCNT_WIDTH-1: 0] RxmBurstCount_o,
  output  [  RXM_BEN_WIDTH-1: 0] RxmByteEnable_o,
  output           RxmRead_o,
  output  [ RXM_DATA_WIDTH-1 : 0] RxmWriteData_o,
  output           RxmWrite_o,
  output           TxsReadDataValid_o,
  output  [ 63: 0] TxsReadData_o,
  output           TxsWaitRequest_o,
  output           app_int_ack,
  output           app_msi_ack,
  output  [ 15: 0] avs_pcie_reconfig_readdata,
  output           avs_pcie_reconfig_readdatavalid,
  output           avs_pcie_reconfig_waitrequest,
  output           core_clk_out,
  output           derr_cor_ext_rcv0,
  output           derr_cor_ext_rcv1,
  output           derr_cor_ext_rpl,
  output           derr_rpl,
  output  [  4: 0] dl_ltssm,
  output           dlup_exit,
  output  [ 23: 0] eidle_infer_sel,
  output           ev_128ns,
  output           ev_1us,
  output  [  1: 0] hip_extraclkout,
  output           hotrst_exit,
  output  [  3: 0] int_status,
  output           l2_exit,
  output  [  3: 0] lane_act,
  output           lmi_ack,
  output  [ 31: 0] lmi_dout,
  output           npd_alloc_1cred_vc0,
  output           npd_alloc_1cred_vc1,
  output           npd_cred_vio_vc0,
  output           npd_cred_vio_vc1,
  output           nph_alloc_1cred_vc0,
  output           nph_alloc_1cred_vc1,
  output           nph_cred_vio_vc0,
  output           nph_cred_vio_vc1,
  output           pme_to_sr,
  output  [  1: 0] powerdown0_ext,
  output  [  1: 0] powerdown1_ext,
  output  [  1: 0] powerdown2_ext,
  output  [  1: 0] powerdown3_ext,
  output  [  1: 0] powerdown4_ext,
  output  [  1: 0] powerdown5_ext,
  output  [  1: 0] powerdown6_ext,
  output  [  1: 0] powerdown7_ext,
  output           r2c_err0,
  output           r2c_err1,
  output           rate_ext,
  output           rc_gxb_powerdown,
  output           rc_rx_analogreset,
  output           rc_rx_digitalreset,
  output           rc_tx_digitalreset,
  output           reset_status,
  output           rx_fifo_empty0,
  output           rx_fifo_empty1,
  output           rx_fifo_full0,
  output           rx_fifo_full1,
  output  [  7: 0] rx_st_bardec0,
  output  [  7: 0] rx_st_bardec1,
  output  [  7: 0] rx_st_be0,
  output  [  7: 0] rx_st_be0_p1,
  output  [  7: 0] rx_st_be1,
  output  [  7: 0] rx_st_be1_p1,
  output  [ 63: 0] rx_st_data0,
  output  [ 63: 0] rx_st_data0_p1,
  output  [ 63: 0] rx_st_data1,
  output  [ 63: 0] rx_st_data1_p1,
  output           rx_st_eop0,
  output           rx_st_eop0_p1,
  output           rx_st_eop1,
  output           rx_st_eop1_p1,
  output           rx_st_err0,
  output           rx_st_err1,
  output           rx_st_sop0,
  output           rx_st_sop0_p1,
  output           rx_st_sop1,
  output           rx_st_sop1_p1,
  output           rx_st_valid0,
  output           rx_st_valid1,
  output           rxpolarity0_ext,
  output           rxpolarity1_ext,
  output           rxpolarity2_ext,
  output           rxpolarity3_ext,
  output           rxpolarity4_ext,
  output           rxpolarity5_ext,
  output           rxpolarity6_ext,
  output           rxpolarity7_ext,
  output           serr_out,
  output           suc_spd_neg,
  output           swdn_wake,
  output           swup_hotrst,
  output  [ 63: 0] test_out,
  output  [  3: 0] tl_cfg_add,
  output  [ 31: 0] tl_cfg_ctl,
  output           tl_cfg_ctl_wr,
  output  [ 52: 0] tl_cfg_sts,
  output           tl_cfg_sts_wr,
  output  [  1: 0] tlbp_dl_ack_phypm,
  output           tlbp_dl_ack_requpfc,
  output           tlbp_dl_ack_sndupfc,
  output           tlbp_dl_current_deemp,
  output  [  1: 0] tlbp_dl_currentspeed,
  output           tlbp_dl_dll_req,
  output  [  4: 0] tlbp_dl_err_dll,
  output           tlbp_dl_errphy,
  output           tlbp_dl_link_autobdw_status,
  output           tlbp_dl_link_bdwmng_status,
  output           tlbp_dl_rpbuf_emp,
  output           tlbp_dl_rst_enter_comp_bit,
  output           tlbp_dl_rst_tx_margin_field,
  output  [  2: 0] tlbp_dl_rx_typ_pm,
  output           tlbp_dl_rx_valpm,
  output           tlbp_dl_tx_ackpm,
  output           tlbp_dl_up,
  output  [  7: 0] tlbp_dl_vc_status,
  output           tlbp_link_up,
  output  [ 35: 0] tx_cred0,
  output  [ 35: 0] tx_cred1,
  output  [  7: 0] tx_deemph,
  output           tx_fifo_empty0,
  output           tx_fifo_empty1,
  output           tx_fifo_full0,
  output           tx_fifo_full1,
  output  [  3: 0] tx_fifo_rdptr0,
  output  [  3: 0] tx_fifo_rdptr1,
  output  [  3: 0] tx_fifo_wrptr0,
  output  [  3: 0] tx_fifo_wrptr1,
  output  [ 23: 0] tx_margin,
  output           tx_st_ready0,
  output           tx_st_ready1,
  output           txcompl0_ext,
  output           txcompl1_ext,
  output           txcompl2_ext,
  output           txcompl3_ext,
  output           txcompl4_ext,
  output           txcompl5_ext,
  output           txcompl6_ext,
  output           txcompl7_ext,
  output  [  7: 0] txdata0_ext,
  output  [  7: 0] txdata1_ext,
  output  [  7: 0] txdata2_ext,
  output  [  7: 0] txdata3_ext,
  output  [  7: 0] txdata4_ext,
  output  [  7: 0] txdata5_ext,
  output  [  7: 0] txdata6_ext,
  output  [  7: 0] txdata7_ext,
  output           txdatak0_ext,
  output           txdatak1_ext,
  output           txdatak2_ext,
  output           txdatak3_ext,
  output           txdatak4_ext,
  output           txdatak5_ext,
  output           txdatak6_ext,
  output           txdatak7_ext,
  output           txdetectrx0_ext,
  output           txdetectrx1_ext,
  output           txdetectrx2_ext,
  output           txdetectrx3_ext,
  output           txdetectrx4_ext,
  output           txdetectrx5_ext,
  output           txdetectrx6_ext,
  output           txdetectrx7_ext,
  output           txelecidle0_ext,
  output           txelecidle1_ext,
  output           txelecidle2_ext,
  output           txelecidle3_ext,
  output           txelecidle4_ext,
  output           txelecidle5_ext,
  output           txelecidle6_ext,
  output           txelecidle7_ext,
  output           use_pcie_reconfig,
  output           wake_oen,
  input            AvlClk_i,
  input   [ 11: 0] CraAddress_i,
  input   [  3: 0] CraByteEnable_i,
  input            CraChipSelect_i,
  input            CraRead,
  input            CraWrite,
  input   [ 31: 0] CraWriteData_i,
  input            Rstn_i,
  input   [  5: 0] RxmIrqNum_i,
  input   [ CG_RXM_IRQ_NUM-1:0 ] RxmIrq_i,
  input            RxmReadDataValid_i,
  input   [ RXM_DATA_WIDTH-1: 0] RxmReadData_i,
  input            RxmWaitRequest_i,
  input   [CG_AVALON_S_ADDR_WIDTH - 1: 0] TxsAddress_i,
  input   [  TXS_BCNT_WIDTH-1: 0] TxsBurstCount_i,
  input   [  7: 0] TxsByteEnable_i,
  input            TxsChipSelect_i,
  input            TxsRead_i,
  input   [ 63: 0] TxsWriteData_i,
  input            TxsWrite_i,
  input   [  4: 0] aer_msi_num,
  input            app_int_sts,
  input   [  4: 0] app_msi_num,
  input            app_msi_req,
  input   [  2: 0] app_msi_tc,
  input   [  7: 0] avs_pcie_reconfig_address,
  input            avs_pcie_reconfig_chipselect,
  input            avs_pcie_reconfig_clk,
  input            avs_pcie_reconfig_read,
  input            avs_pcie_reconfig_rstn,
  input            avs_pcie_reconfig_write,
  input   [ 15: 0] avs_pcie_reconfig_writedata,
  input            core_clk_in,
  input   [  6: 0] cpl_err,
  input            cpl_pending,
  input            crst,
  input   [ 14: 0] dbg_pipex1_rx,
  input   [  4: 0] hpg_ctrler,
  input   [ 11: 0] lmi_addr,
  input   [ 31: 0] lmi_din,
  input            lmi_rden,
  input            lmi_wren,
  input   [  1: 0] mode,
  input            npor,
  input            pclk_central,
  input            pclk_ch0,
  input   [  4: 0] pex_msi_num,
  input            phystatus0_ext,
  input            phystatus1_ext,
  input            phystatus2_ext,
  input            phystatus3_ext,
  input            phystatus4_ext,
  input            phystatus5_ext,
  input            phystatus6_ext,
  input            phystatus7_ext,
  input            pld_clk,
  input            pll_fixed_clk,
  input            pm_auxpwr,
  input   [  9: 0] pm_data,
  input            pm_event,
  input            pme_to_cr,
  input            rc_areset,
  input            rc_inclk_eq_125mhz,
  input            rc_pll_locked,
  input            rc_rx_pll_locked_one,
  input            rx_st_mask0,
  input            rx_st_mask1,
  input            rx_st_ready0,
  input            rx_st_ready1,
  input   [  7: 0] rxdata0_ext,
  input   [  7: 0] rxdata1_ext,
  input   [  7: 0] rxdata2_ext,
  input   [  7: 0] rxdata3_ext,
  input   [  7: 0] rxdata4_ext,
  input   [  7: 0] rxdata5_ext,
  input   [  7: 0] rxdata6_ext,
  input   [  7: 0] rxdata7_ext,
  input            rxdatak0_ext,
  input            rxdatak1_ext,
  input            rxdatak2_ext,
  input            rxdatak3_ext,
  input            rxdatak4_ext,
  input            rxdatak5_ext,
  input            rxdatak6_ext,
  input            rxdatak7_ext,
  input            rxelecidle0_ext,
  input            rxelecidle1_ext,
  input            rxelecidle2_ext,
  input            rxelecidle3_ext,
  input            rxelecidle4_ext,
  input            rxelecidle5_ext,
  input            rxelecidle6_ext,
  input            rxelecidle7_ext,
  input   [  2: 0] rxstatus0_ext,
  input   [  2: 0] rxstatus1_ext,
  input   [  2: 0] rxstatus2_ext,
  input   [  2: 0] rxstatus3_ext,
  input   [  2: 0] rxstatus4_ext,
  input   [  2: 0] rxstatus5_ext,
  input   [  2: 0] rxstatus6_ext,
  input   [  2: 0] rxstatus7_ext,
  input            rxvalid0_ext,
  input            rxvalid1_ext,
  input            rxvalid2_ext,
  input            rxvalid3_ext,
  input            rxvalid4_ext,
  input            rxvalid5_ext,
  input            rxvalid6_ext,
  input            rxvalid7_ext,
  input            srst,
  input   [  2: 0] swdn_in,
  input   [  6: 0] swup_in,
  input   [ 39: 0] test_in,
  input            tl_slotclk_cfg,
  input            tlbp_dl_aspm_cr0,
  input            tlbp_dl_comclk_reg,
  input   [ 12: 0] tlbp_dl_ctrl_link2,
  input   [ 11: 0] tlbp_dl_data_upfc,
  input   [  7: 0] tlbp_dl_hdr_upfc,
  input            tlbp_dl_inh_dllp,
  input   [  2: 0] tlbp_dl_maxpload_dcr,
  input   [  3: 0] tlbp_dl_req_phycfg,
  input   [  3: 0] tlbp_dl_req_phypm,
  input            tlbp_dl_req_upfc,
  input            tlbp_dl_req_wake,
  input            tlbp_dl_rx_ecrcchk,
  input            tlbp_dl_snd_upfc,
  input            tlbp_dl_tx_reqpm,
  input   [  2: 0] tlbp_dl_tx_typpm,
  input            tlbp_dl_txcfg_extsy,
  input   [  1: 0] tlbp_dl_typ_upfc,
  input   [  7: 0] tlbp_dl_vc_ctrl,
  input   [ 23: 0] tlbp_dl_vcid_map,
  input   [  2: 0] tlbp_dl_vcid_upfc,
  input   [ 63: 0] tx_st_data0,
  input   [ 63: 0] tx_st_data0_p1,
  input   [ 63: 0] tx_st_data1,
  input   [ 63: 0] tx_st_data1_p1,
  input            tx_st_eop0,
  input            tx_st_eop0_p1,
  input            tx_st_eop1,
  input            tx_st_eop1_p1,
  input            tx_st_err0,
  input            tx_st_err1,
  input            tx_st_sop0,
  input            tx_st_sop0_p1,
  input            tx_st_sop1,
  input            tx_st_sop1_p1,
  input            tx_st_valid0,
  input            tx_st_valid1
                                )
;


  localparam CB_A2P_ADDR_MAP_FIXED_TABLE_INT = (pcie_qsys == 0) ? CB_A2P_ADDR_MAP_FIXED_TABLE :
                                                                 { CB_A2P_ADDR_MAP_FIXED_TABLE_15_HIGH,
                                                                   CB_A2P_ADDR_MAP_FIXED_TABLE_15_LOW,
                                                                   CB_A2P_ADDR_MAP_FIXED_TABLE_14_HIGH,
                                                                   CB_A2P_ADDR_MAP_FIXED_TABLE_14_LOW,
                                                                   CB_A2P_ADDR_MAP_FIXED_TABLE_13_HIGH,
                                                                   CB_A2P_ADDR_MAP_FIXED_TABLE_13_LOW,
                                                                   CB_A2P_ADDR_MAP_FIXED_TABLE_12_HIGH,
                                                                   CB_A2P_ADDR_MAP_FIXED_TABLE_12_LOW,
                                                                   CB_A2P_ADDR_MAP_FIXED_TABLE_11_HIGH,
                                                                   CB_A2P_ADDR_MAP_FIXED_TABLE_11_LOW,
                                                                   CB_A2P_ADDR_MAP_FIXED_TABLE_10_HIGH,
                                                                   CB_A2P_ADDR_MAP_FIXED_TABLE_10_LOW,
                                                                   CB_A2P_ADDR_MAP_FIXED_TABLE_9_HIGH,
                                                                   CB_A2P_ADDR_MAP_FIXED_TABLE_9_LOW,
                                                                   CB_A2P_ADDR_MAP_FIXED_TABLE_8_HIGH,
                                                                   CB_A2P_ADDR_MAP_FIXED_TABLE_8_LOW,
                                                                   CB_A2P_ADDR_MAP_FIXED_TABLE_7_HIGH,
                                                                   CB_A2P_ADDR_MAP_FIXED_TABLE_7_LOW,
                                                                   CB_A2P_ADDR_MAP_FIXED_TABLE_6_HIGH,
                                                                   CB_A2P_ADDR_MAP_FIXED_TABLE_6_LOW,
                                                                   CB_A2P_ADDR_MAP_FIXED_TABLE_5_HIGH,
                                                                   CB_A2P_ADDR_MAP_FIXED_TABLE_5_LOW,
                                                                   CB_A2P_ADDR_MAP_FIXED_TABLE_4_HIGH,
                                                                   CB_A2P_ADDR_MAP_FIXED_TABLE_4_LOW,
                                                                   CB_A2P_ADDR_MAP_FIXED_TABLE_3_HIGH,
                                                                   CB_A2P_ADDR_MAP_FIXED_TABLE_3_LOW,
                                                                   CB_A2P_ADDR_MAP_FIXED_TABLE_2_HIGH,
                                                                   CB_A2P_ADDR_MAP_FIXED_TABLE_2_LOW,
                                                                   CB_A2P_ADDR_MAP_FIXED_TABLE_1_HIGH,
                                                                   CB_A2P_ADDR_MAP_FIXED_TABLE_1_LOW,
                                                                   CB_A2P_ADDR_MAP_FIXED_TABLE_0_HIGH,
                                                                   CB_A2P_ADDR_MAP_FIXED_TABLE_0_LOW
                                                                };


  localparam SOPC_BUILDER_MODE=((TL_SELECTION == 1)||(TL_SELECTION == 2)||(TL_SELECTION == 3)||(TL_SELECTION == 4)||(TL_SELECTION==5))?1:0;

  wire    [  35: 0] tx_cred0_int;
  wire    [  35: 0] tx_cred1_int;
  wire    [  4: 0] aer_msi_num_int;
  wire    [  4: 0] aer_msi_num_sopc;
  wire             app_int_sts_int;
  wire             app_int_sts_sopc;
  wire             app_msi_req_int;
  wire             app_msi_req_sopc;
  wire    [  2: 0] app_msi_tc_int;
  wire    [  2: 0] app_msi_tc_sopc;
  wire             avs_pcie_reconfig_rstn_int;
  wire             clrrxpath;
  wire             core_crst;
  wire             core_por;
  wire             core_rst;
  wire             core_srst;
  wire             cpl_pending_int;
  wire             cpl_pending_sopc;
  wire    [ 14: 0] dbgpipex1rx;
  wire    [  1: 0] dlackphypm;
  wire             dlackrequpfc;
  wire             dlacksndupfc;
  wire    [ 12: 0] dlctrllink2;
  wire             dlcurrentdeemp;
  wire    [  1: 0] dlcurrentspeed;
  wire    [ 11: 0] dldataupfc;
  wire             dldllreq;
  wire    [  4: 0] dlerrdll;
  wire             dlerrphy;
  wire    [  7: 0] dlhdrupfc;
  wire             dlinhdllp;
  wire    [  3: 0] dlreqphycfg;
  wire    [  3: 0] dlreqphypm;
  wire             dlrequpfc;
  wire             dlreqwake;
  wire             dlrpbufemp;
  wire             dlrxecrcchk;
  wire    [  2: 0] dlrxtyppm;
  wire             dlrxvalpm;
  wire             dlsndupfc;
  wire             dltxackpm;
  wire             dltxcfgextsy;
  wire             dltxreqpm;
  wire    [  2: 0] dltxtyppm;
  wire    [  1: 0] dltypupfc;
  wire             dlup;
 // wire             dlup_exit;
  wire    [  7: 0] dlvcctrl;
  wire    [ 23: 0] dlvcidmap;
  wire    [  2: 0] dlvcidupfc;
  wire    [  7: 0] dlvcstatus;
  wire             dpclk;
  wire             dpriodisable;
  wire             dprioin;
  wire             dprioload;
  wire             dprioout;
  wire             gen2rate;
  wire             gnd_bistenrcv0;
  wire             gnd_bistenrcv1;
  wire             gnd_bistenrpl;
  wire             gnd_bistscanen;
  wire             gnd_bistscanin;
  wire             gnd_bisttesten;
  wire             gnd_mram_hip_test_enable;
  wire             gnd_mramregscanen;
  wire             gnd_mramregscanin;
  wire             gnd_scanen;
  wire    [  6: 0] hip_extraout;
  wire             in_l0s_req;
  wire             in_l1_rec;
  wire             linkup;
  wire             ltssml0state;
  wire             nowhere;
  wire             open_bistdonearcv0;
  wire             open_bistdonearcv1;
  wire             open_bistdonearpl;
  wire             open_bistdonebrcv0;
  wire             open_bistdonebrcv1;
  wire             open_bistdonebrpl;
  wire             open_bistpassrcv0;
  wire             open_bistpassrcv1;
  wire             open_bistpassrpl;
  wire             open_bistscanoutrcv0;
  wire             open_bistscanoutrcv1;
  wire             open_bistscanoutrpl;
  wire             open_dataenablen;
  wire    [  2: 0] open_dpriostate;
  wire             open_gen2rategnd;
  wire             open_mramregscanout;
  wire    [  3: 0] open_rxfifordpvc0;
  wire    [  3: 0] open_rxfifordpvc1;
  wire    [  3: 0] open_rxfifowrpvc0;
  wire    [  3: 0] open_rxfifowrpvc1;
  wire             phy_rst;
  wire             phy_srst;
  wire    [  7: 0] phystatus;
  wire             pld_rst;
  wire             pld_srst;
  wire             pm_event_int;
  wire             pm_event_sopc;
  wire             pme_to_cr_int;
  wire             pme_to_cr_sopc;
  wire    [ 15: 0] powerdown;
  wire             r2cerr0ext_cycloneiv;
  wire             rx_st_mask0_int;
  wire             rx_st_mask0_sopc;
  wire             rx_st_ready0_int;
  wire             rx_st_ready0_sopc;
  wire    [ 63: 0] rxdata;
  wire    [  7: 0] rxdatak;
  wire    [  7: 0] rxelecidle;
  wire    [  7: 0] rxpolarity;
  wire    [ 23: 0] rxstatus;
  wire    [  7: 0] rxvalid;
  wire             scanmoden;
  wire    [ 12: 0] sopc_dlctrllink2;
  wire    [ 11: 0] sopc_dldataupfc;
  wire    [  7: 0] sopc_dlhdrupfc;
  wire             sopc_dlinhdllp;
  wire    [  3: 0] sopc_dlreqphycfg;
  wire    [  3: 0] sopc_dlreqphypm;
  wire             sopc_dlrequpfc;
  wire             sopc_dlreqwake;
  wire             sopc_dlrxecrcchk;
  wire             sopc_dlsndupfc;
  wire             sopc_dltxcfgextsy;
  wire             sopc_dltxreqpm;
  wire    [  2: 0] sopc_dltxtyppm;
  wire    [  1: 0] sopc_dltypupfc;
  wire    [ 23: 0] sopc_dlvcidmap;
  wire    [  2: 0] sopc_dlvcidupfc;
  wire             sopc_mode;
  wire             srstn;
  wire             successspeednegoint;
  wire             swdn_hotrst;
  wire    [  2: 0] swdn_in_int;
  wire    [  2: 0] swdn_in_sopc;
  wire    [  6: 0] swup_in_int;
  wire    [  6: 0] swup_in_sopc;
  wire    [  3: 0] tl_sel;
  wire             tlbp_clrrx_path;
  wire    [ 63: 0] tx_st_data0_int;
  wire    [ 63: 0] tx_st_data0_sopc;
  wire    [ 63: 0] tx_st_data1_int;
  wire             tx_st_eop0_int;
  wire             tx_st_eop0_sopc;
  wire             tx_st_err0_int;
  wire             tx_st_err0_sopc;
  wire             tx_st_sop0_int;
  wire             tx_st_sop0_sopc;
  wire             tx_st_sop1_int;
  wire             tx_st_valid0_int;
  wire             tx_st_valid0_sopc;
  wire             tx_st_valid1_int;
  wire    [  7: 0] txcompl;
  wire    [ 63: 0] txdata;
  wire    [  7: 0] txdatak;
  wire    [  7: 0] txdetectrx;
  wire    [  7: 0] txelecidle;
  wire    [39:0]  test_in_sopc;
  wire  [  3: 0] tl_cfg_add_hip;
  wire  [ 31: 0] tl_cfg_ctl_hip;
  wire           tl_cfg_ctl_wr_hip;
  wire  [ 52: 0] tl_cfg_sts_hip;
  wire           tl_cfg_sts_wr_hip;
  assign gnd_bistenrcv0 = 0;
  assign gnd_bistenrcv1 = 0;
  assign gnd_bistenrpl = 0;
  assign gnd_bistscanen = 0;
  assign gnd_bistscanin = 0;
  assign gnd_bisttesten = 0;
  assign test_in_sopc = {test_in[39:8], 1'b1, test_in[6:0]};  // turn on bit 7 for SOPC TLBP
  assign dlctrllink2 = sopc_mode ? sopc_dlctrllink2 : tlbp_dl_ctrl_link2;
  assign dldataupfc = sopc_mode ? sopc_dldataupfc : tlbp_dl_data_upfc;
  assign dlhdrupfc = sopc_mode ? sopc_dlhdrupfc : tlbp_dl_hdr_upfc;
  assign dlinhdllp = sopc_mode ? sopc_dlinhdllp : tlbp_dl_inh_dllp;
  assign dlreqphycfg = sopc_mode ? sopc_dlreqphycfg : tlbp_dl_req_phycfg;
  assign dlreqphypm = sopc_mode ? sopc_dlreqphypm : tlbp_dl_req_phypm;
  assign dlrequpfc = sopc_mode ? sopc_dlrequpfc : tlbp_dl_req_upfc;
  assign dlreqwake = sopc_mode ? sopc_dlreqwake : tlbp_dl_req_wake;
  assign dlrxecrcchk = sopc_mode ? sopc_dlrxecrcchk : tlbp_dl_rx_ecrcchk;
  assign dlsndupfc = sopc_mode ? sopc_dlsndupfc : tlbp_dl_snd_upfc;
  assign dltxcfgextsy = sopc_mode ? sopc_dltxcfgextsy : tlbp_dl_txcfg_extsy;
  assign dltypupfc = sopc_mode ? sopc_dltypupfc : tlbp_dl_typ_upfc;
  assign dlvcctrl = sopc_mode ? 8'h1 : tlbp_dl_vc_ctrl;
  assign dlvcidmap = sopc_mode ? sopc_dlvcidmap : tlbp_dl_vcid_map;
  assign dltxreqpm = sopc_mode ? sopc_dltxreqpm : tlbp_dl_tx_reqpm;
  assign dltxtyppm = sopc_mode ? sopc_dltxtyppm : tlbp_dl_tx_typpm;
  assign gnd_mram_hip_test_enable = 0;
  assign dlvcidupfc = sopc_mode ? sopc_dlvcidupfc : tlbp_dl_vcid_upfc;
  assign gnd_mramregscanen = 0;
  assign gnd_mramregscanin = 0;
  assign gnd_scanen = 0;
  assign pme_to_cr_int = sopc_mode ? pme_to_cr_sopc : pme_to_cr;
  assign pm_event_int = sopc_mode ? pm_event_sopc : pm_event;
  assign rx_st_mask0_int = sopc_mode ? rx_st_mask0_sopc : rx_st_mask0;
  assign rx_st_ready0_int = sopc_mode ? rx_st_ready0_sopc : rx_st_ready0;
  assign tx_st_valid0_int = sopc_mode ? tx_st_valid0_sopc : tx_st_valid0;
  assign tx_st_valid1_int = tx_st_valid1;
  assign tx_st_err0_int = sopc_mode ? tx_st_err0_sopc : tx_st_err0;
  assign tx_st_sop0_int = sopc_mode ? tx_st_sop0_sopc : tx_st_sop0;
  assign cpl_pending_int = sopc_mode ? cpl_pending_sopc : cpl_pending;
  assign tx_st_sop1_int = tx_st_sop1;
  assign tx_st_eop0_int = sopc_mode ? tx_st_eop0_sopc : tx_st_eop0;
  assign tx_st_data0_int = sopc_mode ? tx_st_data0_sopc : tx_st_data0;
  assign tx_st_data1_int = tx_st_data1;
  assign swdn_in_int = sopc_mode ?  swdn_in_sopc : swdn_in;
  assign swup_in_int = sopc_mode ?  swup_in_sopc : swup_in;
  assign in_l0s_req = swup_in_sopc[6];
  assign in_l1_rec = swup_in_sopc[5];
  assign swdn_hotrst = swdn_in_sopc[0];
  assign app_msi_tc_int = sopc_mode ? app_msi_tc_sopc : app_msi_tc;
  assign aer_msi_num_int = sopc_mode ? aer_msi_num_sopc : aer_msi_num;
  assign app_int_sts_int = sopc_mode ? app_int_sts_sopc : app_int_sts;
  assign app_msi_req_int = sopc_mode ? app_msi_req_sopc : app_msi_req;
  assign tlbp_clrrx_path = clrrxpath;
  assign tlbp_dl_ack_phypm = dlackphypm;
  assign tlbp_dl_ack_requpfc = dlackrequpfc;
  assign tlbp_dl_ack_sndupfc = dlacksndupfc;
  assign tlbp_dl_current_deemp = dlcurrentdeemp;
  assign tlbp_dl_currentspeed = dlcurrentspeed;
  assign tlbp_dl_dll_req = dldllreq;
  assign tlbp_dl_err_dll = dlerrdll;
  assign tlbp_dl_errphy = dlerrphy;
  assign tlbp_dl_rpbuf_emp = dlrpbufemp;
  assign tlbp_dl_rx_typ_pm = dlrxtyppm;
  assign tlbp_dl_rx_valpm = dlrxvalpm;
  assign tlbp_dl_tx_ackpm = dltxackpm;
  assign tlbp_dl_up = dlup;
  assign tlbp_dl_vc_status = dlvcstatus;
  assign tlbp_link_up = linkup;
  //Transcation layer mode
  assign tl_sel = TL_SELECTION;

  assign sopc_mode = (tl_sel == 4'h1) ? 1'b1: 1'b0;
  assign srstn = ~srst;
  assign rxdata[7 : 0] = rxdata0_ext;
  assign rxdatak[0] = rxdatak0_ext;
  assign phystatus[0] = phystatus0_ext;
  assign rxelecidle[0] = rxelecidle0_ext;
  assign rxvalid[0] = rxvalid0_ext;
  assign txdata0_ext = txdata[7 : 0];
  assign rxstatus[2 : 0] = rxstatus0_ext;
  assign powerdown0_ext = powerdown[1 : 0];
  assign rxpolarity0_ext = rxpolarity[0];
  assign txcompl0_ext = txcompl[0];
  assign txdatak0_ext = txdatak[0];
  assign txdetectrx0_ext = txdetectrx[0];
  assign txelecidle0_ext = txelecidle[0];
  assign rxdata[15 : 8] = rxdata1_ext;
  assign rxdatak[1] = rxdatak1_ext;
  assign phystatus[1] = phystatus1_ext;
  assign rxelecidle[1] = rxelecidle1_ext;
  assign rxvalid[1] = rxvalid1_ext;
  assign txdata1_ext = txdata[15 : 8];
  assign rxstatus[5 : 3] = rxstatus1_ext;
  assign powerdown1_ext = powerdown[3 : 2];
  assign rxpolarity1_ext = rxpolarity[1];
  assign txcompl1_ext = txcompl[1];
  assign txdatak1_ext = txdatak[1];
  assign txdetectrx1_ext = txdetectrx[1];
  assign txelecidle1_ext = txelecidle[1];
  assign rxdata[23 : 16] = rxdata2_ext;
  assign rxdatak[2] = rxdatak2_ext;
  assign phystatus[2] = phystatus2_ext;
  assign rxelecidle[2] = rxelecidle2_ext;
  assign rxvalid[2] = rxvalid2_ext;
  assign txdata2_ext = txdata[23 : 16];
  assign rxstatus[8 : 6] = rxstatus2_ext;
  assign powerdown2_ext = powerdown[5 : 4];
  assign rxpolarity2_ext = rxpolarity[2];
  assign txcompl2_ext = txcompl[2];
  assign txdatak2_ext = txdatak[2];
  assign txdetectrx2_ext = txdetectrx[2];
  assign txelecidle2_ext = txelecidle[2];
  assign rxdata[31 : 24] = rxdata3_ext;
  assign rxdatak[3] = rxdatak3_ext;
  assign phystatus[3] = phystatus3_ext;
  assign rxelecidle[3] = rxelecidle3_ext;
  assign rxvalid[3] = rxvalid3_ext;
  assign txdata3_ext = txdata[31 : 24];
  assign rxstatus[11 : 9] = rxstatus3_ext;
  assign powerdown3_ext = powerdown[7 : 6];
  assign rxpolarity3_ext = rxpolarity[3];
  assign txcompl3_ext = txcompl[3];
  assign txdatak3_ext = txdatak[3];
  assign txdetectrx3_ext = txdetectrx[3];
  assign txelecidle3_ext = txelecidle[3];
  assign rxdata[39 : 32] = rxdata4_ext;
  assign rxdatak[4] = rxdatak4_ext;
  assign phystatus[4] = phystatus4_ext;
  assign rxelecidle[4] = rxelecidle4_ext;
  assign rxvalid[4] = rxvalid4_ext;
  assign txdata4_ext = txdata[39 : 32];
  assign rxstatus[14 : 12] = rxstatus4_ext;
  assign powerdown4_ext = powerdown[9 : 8];
  assign rxpolarity4_ext = rxpolarity[4];
  assign txcompl4_ext = txcompl[4];
  assign txdatak4_ext = txdatak[4];
  assign txdetectrx4_ext = txdetectrx[4];
  assign txelecidle4_ext = txelecidle[4];
  assign rxdata[47 : 40] = rxdata5_ext;
  assign rxdatak[5] = rxdatak5_ext;
  assign phystatus[5] = phystatus5_ext;
  assign rxelecidle[5] = rxelecidle5_ext;
  assign rxvalid[5] = rxvalid5_ext;
  assign txdata5_ext = txdata[47 : 40];
  assign rxstatus[17 : 15] = rxstatus5_ext;
  assign powerdown5_ext = powerdown[11 : 10];
  assign rxpolarity5_ext = rxpolarity[5];
  assign txcompl5_ext = txcompl[5];
  assign txdatak5_ext = txdatak[5];
  assign txdetectrx5_ext = txdetectrx[5];
  assign txelecidle5_ext = txelecidle[5];
  assign rxdata[55 : 48] = rxdata6_ext;
  assign rxdatak[6] = rxdatak6_ext;
  assign phystatus[6] = phystatus6_ext;
  assign rxelecidle[6] = rxelecidle6_ext;
  assign rxvalid[6] = rxvalid6_ext;
  assign txdata6_ext = txdata[55 : 48];
  assign rxstatus[20 : 18] = rxstatus6_ext;
  assign powerdown6_ext = powerdown[13 : 12];
  assign rxpolarity6_ext = rxpolarity[6];
  assign txcompl6_ext = txcompl[6];
  assign txdatak6_ext = txdatak[6];
  assign txdetectrx6_ext = txdetectrx[6];
  assign txelecidle6_ext = txelecidle[6];
  assign rxdata[63 : 56] = rxdata7_ext;
  assign rxdatak[7] = rxdatak7_ext;
  assign phystatus[7] = phystatus7_ext;
  assign rxelecidle[7] = rxelecidle7_ext;
  assign rxvalid[7] = rxvalid7_ext;
  assign txdata7_ext = txdata[63 : 56];
  assign rxstatus[23 : 21] = rxstatus7_ext;
  assign powerdown7_ext = powerdown[15 : 14];
  assign rxpolarity7_ext = rxpolarity[7];
  assign txcompl7_ext = txcompl[7];
  assign txdatak7_ext = txdatak[7];
  assign txdetectrx7_ext = txdetectrx[7];
  assign txelecidle7_ext = txelecidle[7];
  //Instantiate PCIE Reconfig block
  assign use_pcie_reconfig = p_pcie_use_pcie_reconfig;

  assign avs_pcie_reconfig_rstn_int = (use_pcie_reconfig == 1) ? avs_pcie_reconfig_rstn : 1'b0;
  //GND debug bus
  assign dbgpipex1rx = (enable_hip_x1_loopback == "false") ? 15'h0 : dbg_pipex1_rx;

  // for cycloneiv, remap r2c_err: spr 324831 & 388597
  assign r2c_err0 = (p_pcie_hip_type == "2") ? r2cerr0ext_cycloneiv : hip_extraout[1];

  assign r2c_err1 = hip_extraout[2];

  // for cycloneiv, remap r2c_err: spr 324831 & 388597
  assign suc_spd_neg = (p_pcie_hip_type == "2") ? successspeednegoint : hip_extraout[0];

  assign core_srst = srst;
  assign core_crst = crst;
  assign core_por = ~npor;
  assign core_rst = ~npor;
  assign phy_rst = ~npor;
  assign phy_srst = srst;
  assign pld_rst = ~npor;
  assign pld_srst = srst;
  assign scanmoden = 1;
  assign rate_ext = gen2rate;
generate
if (p_pcie_hip_type == "0")
begin : stratix_iv
  stratixiv_hssi_pcie_hip stratixiv_hssi_pcie_hip
    (
      .bistdonearcv0 (open_bistdonearcv0),
      .bistdonearcv1 (open_bistdonearcv1),
      .bistdonearpl (open_bistdonearpl),
      .bistdonebrcv0 (open_bistdonebrcv0),
      .bistdonebrcv1 (open_bistdonebrcv1),
      .bistdonebrpl (open_bistdonebrpl),
      .bistenrcv0 (gnd_bistenrcv0),
      .bistenrcv1 (gnd_bistenrcv1),
      .bistenrpl (gnd_bistenrpl),
      .bistpassrcv0 (open_bistpassrcv0),
      .bistpassrcv1 (open_bistpassrcv1),
      .bistpassrpl (open_bistpassrpl),
      .bistscanen (gnd_bistscanen),
      .bistscanin (gnd_bistscanin),
      .bistscanoutrcv0 (open_bistscanoutrcv0),
      .bistscanoutrcv1 (open_bistscanoutrcv1),
      .bistscanoutrpl (open_bistscanoutrpl),
      .bisttesten (gnd_bisttesten),
      .clrrxpath (clrrxpath),
      .coreclkin (core_clk_in),
      .coreclkout (core_clk_out),
      .corecrst (core_crst),
      .corepor (core_por),
      .corerst (core_rst),
      .coresrst (core_srst),
      .cplerr (cpl_err),
      .cplpending (cpl_pending_int),
      .dataenablen (open_dataenablen),
      .dbgpipex1rx (dbgpipex1rx),
      .derrcorextrcv0 (derr_cor_ext_rcv0),
      .derrcorextrcv1 (derr_cor_ext_rcv1),
      .derrcorextrpl (derr_cor_ext_rpl),
      .derrrpl (derr_rpl),
      .dlackphypm (dlackphypm),
      .dlackrequpfc (dlackrequpfc),
      .dlacksndupfc (dlacksndupfc),
      .dlaspmcr0 (tlbp_dl_aspm_cr0),
      .dlcomclkreg (tlbp_dl_comclk_reg),
      .dlctrllink2 (dlctrllink2),
      .dlcurrentdeemp (dlcurrentdeemp),
      .dlcurrentspeed (dlcurrentspeed),
      .dldataupfc (dldataupfc),
      .dldllreq (dldllreq),
      .dlerrdll (dlerrdll),
      .dlerrphy (dlerrphy),
      .dlhdrupfc (dlhdrupfc),
      .dlinhdllp (dlinhdllp),
      .dllinkautobdwstatus (tlbp_dl_link_autobdw_status),
      .dllinkbdwmngstatus (tlbp_dl_link_bdwmng_status),
      .dlltssm (dl_ltssm),
      .dlmaxploaddcr (tlbp_dl_maxpload_dcr),
      .dlreqphycfg (dlreqphycfg),
      .dlreqphypm (dlreqphypm),
      .dlrequpfc (dlrequpfc),
      .dlreqwake (dlreqwake),
      .dlrpbufemp (dlrpbufemp),
      .dlrstentercompbit (tlbp_dl_rst_enter_comp_bit),
      .dlrsttxmarginfield (tlbp_dl_rst_tx_margin_field),
      .dlrxecrcchk (dlrxecrcchk),
      .dlrxtyppm (dlrxtyppm),
      .dlrxvalpm (dlrxvalpm),
      .dlsndupfc (dlsndupfc),
      .dltxackpm (dltxackpm),
      .dltxcfgextsy (dltxcfgextsy),
      .dltxreqpm (dltxreqpm),
      .dltxtyppm (dltxtyppm),
      .dltypupfc (dltypupfc),
      .dlup (dlup),
      .dlupexit (dlup_exit),
      .dlvcctrl (dlvcctrl),
      .dlvcidmap (dlvcidmap),
      .dlvcidupfc (dlvcidupfc),
      .dlvcstatus (dlvcstatus),
      .dpclk (dpclk),
      .dpriodisable (dpriodisable),
      .dprioin (dprioin),
      .dprioload (dprioload),
      .dprioout (dprioout),
      .dpriostate (open_dpriostate),
      .eidleinfersel (eidle_infer_sel),
      .ev128ns (ev_128ns),
      .ev1us (ev_1us),
      .extraclkout (hip_extraclkout),
      .extraout (hip_extraout),
      .gen2rate (gen2rate),
      .gen2rategnd (open_gen2rategnd),
      .hotrstexit (hotrst_exit),
      .intstatus (int_status),
      .l2exit (l2_exit),
      .laneact (lane_act),
      .linkup (linkup),
      .lmiack (lmi_ack),
      .lmiaddr (lmi_addr),
      .lmidin (lmi_din),
      .lmidout (lmi_dout),
      .lmirden (lmi_rden),
      .lmiwren (lmi_wren),
      .ltssml0state (ltssml0state),
      .mode (mode),
      .mramhiptestenable (gnd_mram_hip_test_enable),
      .mramregscanen (gnd_mramregscanen),
      .mramregscanin (gnd_mramregscanin),
      .mramregscanout (open_mramregscanout),
      .pclkcentral (pclk_central),
      .pclkch0 (pclk_ch0),
      .phyrst (phy_rst),
      .physrst (phy_srst),
      .phystatus (phystatus),
      .pldclk (pld_clk),
      .pldrst (pld_rst),
      .pldsrst (pld_srst),
      .pllfixedclk (pll_fixed_clk),
      .powerdown (powerdown),
      .resetstatus (reset_status),
      .rxbardecvc0 (rx_st_bardec0),
      .rxbardecvc1 (rx_st_bardec1),
      .rxbevc00 (rx_st_be0),
      .rxbevc01 (rx_st_be0_p1),
      .rxbevc10 (rx_st_be1),
      .rxbevc11 (rx_st_be1_p1),
      .rxdata (rxdata),
      .rxdatak (rxdatak),
      .rxdatavc00 (rx_st_data0),
      .rxdatavc01 (rx_st_data0_p1),
      .rxdatavc10 (rx_st_data1),
      .rxdatavc11 (rx_st_data1_p1),
      .rxelecidle (rxelecidle),
      .rxeopvc00 (rx_st_eop0),
      .rxeopvc01 (rx_st_eop0_p1),
      .rxeopvc10 (rx_st_eop1),
      .rxeopvc11 (rx_st_eop1_p1),
      .rxerrvc0 (rx_st_err0),
      .rxerrvc1 (rx_st_err1),
      .rxfifoemptyvc0 (rx_fifo_empty0),
      .rxfifoemptyvc1 (rx_fifo_empty1),
      .rxfifofullvc0 (rx_fifo_full0),
      .rxfifofullvc1 (rx_fifo_full1),
      .rxfifordpvc0 (open_rxfifordpvc0),
      .rxfifordpvc1 (open_rxfifordpvc1),
      .rxfifowrpvc0 (open_rxfifowrpvc0),
      .rxfifowrpvc1 (open_rxfifowrpvc1),
      .rxmaskvc0 (rx_st_mask0_int),
      .rxmaskvc1 (rx_st_mask1),
      .rxpolarity (rxpolarity),
      .rxreadyvc0 (rx_st_ready0_int),
      .rxreadyvc1 (rx_st_ready1),
      .rxsopvc00 (rx_st_sop0),
      .rxsopvc01 (rx_st_sop0_p1),
      .rxsopvc10 (rx_st_sop1),
      .rxsopvc11 (rx_st_sop1_p1),
      .rxstatus (rxstatus),
      .rxvalid (rxvalid),
      .rxvalidvc0 (rx_st_valid0),
      .rxvalidvc1 (rx_st_valid1),
      .scanen (gnd_scanen),
      .scanmoden (scanmoden),
      .serrout (serr_out),
      .swdnin (swdn_in_int),
      .swdnwake (swdn_wake),
      .swuphotrst (swup_hotrst),
      .swupin (swup_in_int),
      .testin (test_in),
      .testout (test_out),
      .tlaermsinum (aer_msi_num_int),
      .tlappintaack (app_int_ack),
      .tlappintasts (app_int_sts_int),
      .tlappmsiack (app_msi_ack),
      .tlappmsinum (app_msi_num),
      .tlappmsireq (app_msi_req_int),
      .tlappmsitc (app_msi_tc_int),
      .tlcfgadd (tl_cfg_add_hip),
      .tlcfgctl (tl_cfg_ctl_hip),
      .tlcfgctlwr (tl_cfg_ctl_wr_hip),
      .tlcfgsts (tl_cfg_sts_hip),
      .tlcfgstswr (tl_cfg_sts_wr_hip),
      .tlhpgctrler (hpg_ctrler),
      .tlpexmsinum (pex_msi_num),
      .tlpmauxpwr (pm_auxpwr),
      .tlpmdata (pm_data),
      .tlpmetocr (pme_to_cr_int),
      .tlpmetosr (pme_to_sr),
      .tlpmevent (pm_event_int),
      .tlslotclkcfg (tl_slotclk_cfg),
      .txcompl (txcompl),
      .txcredvc0 (tx_cred0_int),
      .txcredvc1 (tx_cred1_int),
      .txdata (txdata),
      .txdatak (txdatak),
      .txdatavc00 (tx_st_data0_int),
      .txdatavc01 (tx_st_data0_p1),
      .txdatavc10 (tx_st_data1),
      .txdatavc11 (tx_st_data1_p1),
      .txdeemph (tx_deemph),
      .txdetectrx (txdetectrx),
      .txelecidle (txelecidle),
      .txeopvc00 (tx_st_eop0_int),
      .txeopvc01 (tx_st_eop0_p1),
      .txeopvc10 (tx_st_eop1),
      .txeopvc11 (tx_st_eop1_p1),
      .txerrvc0 (tx_st_err0_int),
      .txerrvc1 (tx_st_err1),
      .txfifoemptyvc0 (tx_fifo_empty0),
      .txfifoemptyvc1 (tx_fifo_empty1),
      .txfifofullvc0 (tx_fifo_full0),
      .txfifofullvc1 (tx_fifo_full1),
      .txfifordpvc0 (tx_fifo_rdptr0),
      .txfifordpvc1 (tx_fifo_rdptr1),
      .txfifowrpvc0 (tx_fifo_wrptr0),
      .txfifowrpvc1 (tx_fifo_wrptr1),
      .txmargin (tx_margin),
      .txreadyvc0 (tx_st_ready0),
      .txreadyvc1 (tx_st_ready1),
      .txsopvc00 (tx_st_sop0_int),
      .txsopvc01 (tx_st_sop0_p1),
      .txsopvc10 (tx_st_sop1),
      .txsopvc11 (tx_st_sop1_p1),
      .txvalidvc0 (tx_st_valid0_int),
      .txvalidvc1 (tx_st_valid1),
      .wakeoen (wake_oen)
    );

  defparam stratixiv_hssi_pcie_hip.advanced_errors = advanced_errors,
           stratixiv_hssi_pcie_hip.bar0_64bit_mem_space = bar0_64bit_mem_space,
           stratixiv_hssi_pcie_hip.bar0_io_space = bar0_io_space,
           stratixiv_hssi_pcie_hip.bar0_prefetchable = bar0_prefetchable,
           stratixiv_hssi_pcie_hip.bar0_size_mask = bar0_size_mask,
           stratixiv_hssi_pcie_hip.bar1_64bit_mem_space = bar1_64bit_mem_space,
           stratixiv_hssi_pcie_hip.bar1_io_space = bar1_io_space,
           stratixiv_hssi_pcie_hip.bar1_prefetchable = bar1_prefetchable,
           stratixiv_hssi_pcie_hip.bar1_size_mask = bar1_size_mask,
           stratixiv_hssi_pcie_hip.bar2_64bit_mem_space = bar2_64bit_mem_space,
           stratixiv_hssi_pcie_hip.bar2_io_space = bar2_io_space,
           stratixiv_hssi_pcie_hip.bar2_prefetchable = bar2_prefetchable,
           stratixiv_hssi_pcie_hip.bar2_size_mask = bar2_size_mask,
           stratixiv_hssi_pcie_hip.bar3_64bit_mem_space = bar3_64bit_mem_space,
           stratixiv_hssi_pcie_hip.bar3_io_space = bar3_io_space,
           stratixiv_hssi_pcie_hip.bar3_prefetchable = bar3_prefetchable,
           stratixiv_hssi_pcie_hip.bar3_size_mask = bar3_size_mask,
           stratixiv_hssi_pcie_hip.bar4_64bit_mem_space = bar4_64bit_mem_space,
           stratixiv_hssi_pcie_hip.bar4_io_space = bar4_io_space,
           stratixiv_hssi_pcie_hip.bar4_prefetchable = bar4_prefetchable,
           stratixiv_hssi_pcie_hip.bar4_size_mask = bar4_size_mask,
           stratixiv_hssi_pcie_hip.bar5_64bit_mem_space = bar5_64bit_mem_space,
           stratixiv_hssi_pcie_hip.bar5_io_space = bar5_io_space,
           stratixiv_hssi_pcie_hip.bar5_prefetchable = bar5_prefetchable,
           stratixiv_hssi_pcie_hip.bar5_size_mask = bar5_size_mask,
           stratixiv_hssi_pcie_hip.bar_io_window_size = bar_io_window_size,
           stratixiv_hssi_pcie_hip.bar_prefetchable = bar_prefetchable,
           stratixiv_hssi_pcie_hip.bridge_port_ssid_support = bridge_port_ssid_support,
           stratixiv_hssi_pcie_hip.bridge_port_vga_enable = bridge_port_vga_enable,
           stratixiv_hssi_pcie_hip.bypass_cdc = bypass_cdc,
           stratixiv_hssi_pcie_hip.tx_cdc_full_value    =   tx_cdc_full_value ,
           stratixiv_hssi_pcie_hip.bypass_tl = bypass_tl,
           stratixiv_hssi_pcie_hip.class_code = class_code,
           stratixiv_hssi_pcie_hip.completion_timeout = completion_timeout,
           stratixiv_hssi_pcie_hip.core_clk_divider = core_clk_divider,
           stratixiv_hssi_pcie_hip.core_clk_source = core_clk_source,
           stratixiv_hssi_pcie_hip.credit_buffer_allocation_aux = credit_buffer_allocation_aux,
           stratixiv_hssi_pcie_hip.deemphasis_enable = deemphasis_enable,
           stratixiv_hssi_pcie_hip.device_id = device_id,
           stratixiv_hssi_pcie_hip.device_number = device_number,
           stratixiv_hssi_pcie_hip.diffclock_nfts_count = diffclock_nfts_count,
           stratixiv_hssi_pcie_hip.disable_cdc_clk_ppm = disable_cdc_clk_ppm,
           stratixiv_hssi_pcie_hip.disable_link_x2_support = disable_link_x2_support,
           stratixiv_hssi_pcie_hip.disable_snoop_packet = disable_snoop_packet,
           stratixiv_hssi_pcie_hip.dll_active_report_support = dll_active_report_support,
           stratixiv_hssi_pcie_hip.ei_delay_powerdown_count = ei_delay_powerdown_count,
           stratixiv_hssi_pcie_hip.eie_before_nfts_count = eie_before_nfts_count,
           stratixiv_hssi_pcie_hip.enable_adapter_half_rate_mode = enable_adapter_half_rate_mode,
           stratixiv_hssi_pcie_hip.enable_ch0_pclk_out = enable_ch0_pclk_out,
           stratixiv_hssi_pcie_hip.enable_completion_timeout_disable = enable_completion_timeout_disable,
           stratixiv_hssi_pcie_hip.enable_coreclk_out_half_rate = enable_coreclk_out_half_rate,
           stratixiv_hssi_pcie_hip.enable_ecrc_check = enable_ecrc_check,
           stratixiv_hssi_pcie_hip.enable_ecrc_gen = enable_ecrc_gen,
           stratixiv_hssi_pcie_hip.enable_function_msi_support = enable_function_msi_support,
           stratixiv_hssi_pcie_hip.enable_function_msix_support = enable_function_msix_support,
           stratixiv_hssi_pcie_hip.enable_gen2_core = enable_gen2_core,
           stratixiv_hssi_pcie_hip.enable_hip_x1_loopback = enable_hip_x1_loopback,
           stratixiv_hssi_pcie_hip.enable_l1_aspm = enable_l1_aspm,
           stratixiv_hssi_pcie_hip.enable_msi_64bit_addressing = enable_msi_64bit_addressing,
           stratixiv_hssi_pcie_hip.enable_msi_masking = enable_msi_masking,
           stratixiv_hssi_pcie_hip.enable_retrybuf_ecc = enable_retrybuf_ecc,
           stratixiv_hssi_pcie_hip.enable_retrybuf_x8_clk_stealing = enable_retrybuf_x8_clk_stealing,
           stratixiv_hssi_pcie_hip.enable_rx0buf_ecc = enable_rx0buf_ecc,
           stratixiv_hssi_pcie_hip.enable_rx0buf_x8_clk_stealing = enable_rx0buf_x8_clk_stealing,
           stratixiv_hssi_pcie_hip.enable_rx1buf_ecc = enable_rx1buf_ecc,
           stratixiv_hssi_pcie_hip.enable_rx1buf_x8_clk_stealing = enable_rx1buf_x8_clk_stealing,
           stratixiv_hssi_pcie_hip.enable_rx_buffer_checking = enable_rx_buffer_checking,
           stratixiv_hssi_pcie_hip.enable_rx_reordering = enable_rx_reordering,
           stratixiv_hssi_pcie_hip.enable_slot_register = enable_slot_register,
           stratixiv_hssi_pcie_hip.endpoint_l0_latency = endpoint_l0_latency,
           stratixiv_hssi_pcie_hip.endpoint_l1_latency = endpoint_l1_latency,
           stratixiv_hssi_pcie_hip.expansion_base_address_register = expansion_base_address_register,
           stratixiv_hssi_pcie_hip.extend_tag_field = extend_tag_field,
           stratixiv_hssi_pcie_hip.fc_init_timer = fc_init_timer,
           stratixiv_hssi_pcie_hip.flow_control_timeout_count = flow_control_timeout_count,
           stratixiv_hssi_pcie_hip.flow_control_update_count = flow_control_update_count,
           stratixiv_hssi_pcie_hip.gen2_diffclock_nfts_count = gen2_diffclock_nfts_count,
           stratixiv_hssi_pcie_hip.gen2_lane_rate_mode = gen2_lane_rate_mode,
           stratixiv_hssi_pcie_hip.gen2_sameclock_nfts_count = gen2_sameclock_nfts_count,
           stratixiv_hssi_pcie_hip.hot_plug_support = hot_plug_support,
           stratixiv_hssi_pcie_hip.indicator = indicator,
           stratixiv_hssi_pcie_hip.l01_entry_latency = l01_entry_latency,
           stratixiv_hssi_pcie_hip.l0_exit_latency_diffclock = l0_exit_latency_diffclock,
           stratixiv_hssi_pcie_hip.l0_exit_latency_sameclock = l0_exit_latency_sameclock,
           stratixiv_hssi_pcie_hip.l1_exit_latency_diffclock = l1_exit_latency_diffclock,
           stratixiv_hssi_pcie_hip.l1_exit_latency_sameclock = l1_exit_latency_sameclock,
           stratixiv_hssi_pcie_hip.lane_mask = lane_mask,
           stratixiv_hssi_pcie_hip.low_priority_vc = low_priority_vc,
           stratixiv_hssi_pcie_hip.lpm_type = lpm_type,
           stratixiv_hssi_pcie_hip.max_link_width = max_link_width,
           stratixiv_hssi_pcie_hip.max_payload_size = max_payload_size,
           stratixiv_hssi_pcie_hip.maximum_current = maximum_current,
           stratixiv_hssi_pcie_hip.millisecond_cycle_count = millisecond_cycle_count,
           stratixiv_hssi_pcie_hip.msi_function_count = msi_function_count,


           stratixiv_hssi_pcie_hip.msix_pba_bir = msix_pba_bir,
           stratixiv_hssi_pcie_hip.msix_pba_offset = msix_pba_offset,
           stratixiv_hssi_pcie_hip.msix_table_bir = msix_table_bir,
           stratixiv_hssi_pcie_hip.msix_table_offset = msix_table_offset,
           stratixiv_hssi_pcie_hip.msix_table_size = msix_table_size,
           stratixiv_hssi_pcie_hip.no_command_completed = no_command_completed,
           stratixiv_hssi_pcie_hip.no_soft_reset = no_soft_reset,
           stratixiv_hssi_pcie_hip.pcie_mode = pcie_mode,
           stratixiv_hssi_pcie_hip.pme_state_enable = pme_state_enable,
           stratixiv_hssi_pcie_hip.port_link_number = port_link_number,
           stratixiv_hssi_pcie_hip.register_pipe_signals = register_pipe_signals,
           stratixiv_hssi_pcie_hip.retry_buffer_last_active_address = retry_buffer_last_active_address,
           stratixiv_hssi_pcie_hip.retry_buffer_memory_settings = retry_buffer_memory_settings,
           stratixiv_hssi_pcie_hip.revision_id = revision_id,
           stratixiv_hssi_pcie_hip.rx_ptr0_nonposted_dpram_max = rx_ptr0_nonposted_dpram_max,
           stratixiv_hssi_pcie_hip.rx_ptr0_nonposted_dpram_min = rx_ptr0_nonposted_dpram_min,
           stratixiv_hssi_pcie_hip.rx_ptr0_posted_dpram_max = rx_ptr0_posted_dpram_max,
           stratixiv_hssi_pcie_hip.rx_ptr0_posted_dpram_min = rx_ptr0_posted_dpram_min,
           stratixiv_hssi_pcie_hip.rx_ptr1_nonposted_dpram_max = rx_ptr1_nonposted_dpram_max,
           stratixiv_hssi_pcie_hip.rx_ptr1_nonposted_dpram_min = rx_ptr1_nonposted_dpram_min,
           stratixiv_hssi_pcie_hip.rx_ptr1_posted_dpram_max = rx_ptr1_posted_dpram_max,
           stratixiv_hssi_pcie_hip.rx_ptr1_posted_dpram_min = rx_ptr1_posted_dpram_min,
           stratixiv_hssi_pcie_hip.sameclock_nfts_count = sameclock_nfts_count,
           stratixiv_hssi_pcie_hip.single_rx_detect = single_rx_detect,
           stratixiv_hssi_pcie_hip.skp_os_schedule_count = skp_os_schedule_count,
           stratixiv_hssi_pcie_hip.slot_number = slot_number,
           stratixiv_hssi_pcie_hip.slot_power_limit = slot_power_limit,
           stratixiv_hssi_pcie_hip.slot_power_scale = slot_power_scale,
           stratixiv_hssi_pcie_hip.ssid = ssid,
           stratixiv_hssi_pcie_hip.ssvid = ssvid,
           stratixiv_hssi_pcie_hip.subsystem_device_id = subsystem_device_id,
           stratixiv_hssi_pcie_hip.subsystem_vendor_id = subsystem_vendor_id,
           stratixiv_hssi_pcie_hip.surprise_down_error_support = surprise_down_error_support,
           stratixiv_hssi_pcie_hip.use_crc_forwarding = use_crc_forwarding,
           stratixiv_hssi_pcie_hip.vc0_clk_enable = vc0_clk_enable,
           stratixiv_hssi_pcie_hip.vc0_rx_buffer_memory_settings = vc0_rx_buffer_memory_settings,
           stratixiv_hssi_pcie_hip.vc0_rx_flow_ctrl_compl_data = vc0_rx_flow_ctrl_compl_data,
           stratixiv_hssi_pcie_hip.vc0_rx_flow_ctrl_compl_header = vc0_rx_flow_ctrl_compl_header,
           stratixiv_hssi_pcie_hip.vc0_rx_flow_ctrl_nonposted_data = vc0_rx_flow_ctrl_nonposted_data,
           stratixiv_hssi_pcie_hip.vc0_rx_flow_ctrl_nonposted_header = vc0_rx_flow_ctrl_nonposted_header,
           stratixiv_hssi_pcie_hip.vc0_rx_flow_ctrl_posted_data = vc0_rx_flow_ctrl_posted_data,
           stratixiv_hssi_pcie_hip.vc0_rx_flow_ctrl_posted_header = vc0_rx_flow_ctrl_posted_header,
           stratixiv_hssi_pcie_hip.vc1_clk_enable = vc1_clk_enable,
           stratixiv_hssi_pcie_hip.vc1_rx_buffer_memory_settings = vc1_rx_buffer_memory_settings,
           stratixiv_hssi_pcie_hip.vc1_rx_flow_ctrl_compl_data = vc1_rx_flow_ctrl_compl_data,
           stratixiv_hssi_pcie_hip.vc1_rx_flow_ctrl_compl_header = vc1_rx_flow_ctrl_compl_header,
           stratixiv_hssi_pcie_hip.vc1_rx_flow_ctrl_nonposted_data = vc1_rx_flow_ctrl_nonposted_data,
           stratixiv_hssi_pcie_hip.vc1_rx_flow_ctrl_nonposted_header = vc1_rx_flow_ctrl_nonposted_header,
           stratixiv_hssi_pcie_hip.vc1_rx_flow_ctrl_posted_data = vc1_rx_flow_ctrl_posted_data,
           stratixiv_hssi_pcie_hip.vc1_rx_flow_ctrl_posted_header = vc1_rx_flow_ctrl_posted_header,
           stratixiv_hssi_pcie_hip.vc_arbitration = vc_arbitration,
           stratixiv_hssi_pcie_hip.vc_enable = vc_enable,
           stratixiv_hssi_pcie_hip.vendor_id = vendor_id;

end
endgenerate

generate
if (p_pcie_hip_type == "1")
begin : arria_ii
  arriaii_hssi_pcie_hip arriaii_hssi_pcie_hip
    (
      .bistdonearcv0 (open_bistdonearcv0),
      .bistdonearcv1 (open_bistdonearcv1),
      .bistdonearpl (open_bistdonearpl),
      .bistdonebrcv0 (open_bistdonebrcv0),
      .bistdonebrcv1 (open_bistdonebrcv1),
      .bistdonebrpl (open_bistdonebrpl),
      .bistenrcv0 (gnd_bistenrcv0),
      .bistenrcv1 (gnd_bistenrcv1),
      .bistenrpl (gnd_bistenrpl),
      .bistpassrcv0 (open_bistpassrcv0),
      .bistpassrcv1 (open_bistpassrcv1),
      .bistpassrpl (open_bistpassrpl),
      .bistscanen (gnd_bistscanen),
      .bistscanin (gnd_bistscanin),
      .bistscanoutrcv0 (open_bistscanoutrcv0),
      .bistscanoutrcv1 (open_bistscanoutrcv1),
      .bistscanoutrpl (open_bistscanoutrpl),
      .bisttesten (gnd_bisttesten),
      .clrrxpath (clrrxpath),
      .coreclkin (core_clk_in),
      .coreclkout (core_clk_out),
      .corecrst (core_crst),
      .corepor (core_por),
      .corerst (core_rst),
      .coresrst (core_srst),
      .cplerr (cpl_err),
      .cplpending (cpl_pending_int),
      .dataenablen (open_dataenablen),
      .dbgpipex1rx (dbgpipex1rx),
      .derrcorextrcv0 (derr_cor_ext_rcv0),
      .derrcorextrcv1 (derr_cor_ext_rcv1),
      .derrcorextrpl (derr_cor_ext_rpl),
      .derrrpl (derr_rpl),
      .dlackphypm (dlackphypm),
      .dlackrequpfc (dlackrequpfc),
      .dlacksndupfc (dlacksndupfc),
      .dlaspmcr0 (tlbp_dl_aspm_cr0),
      .dlcomclkreg (tlbp_dl_comclk_reg),
      .dlctrllink2 (dlctrllink2),
      .dlcurrentdeemp (dlcurrentdeemp),
      .dlcurrentspeed (dlcurrentspeed),
      .dldataupfc (dldataupfc),
      .dldllreq (dldllreq),
      .dlerrdll (dlerrdll),
      .dlerrphy (dlerrphy),
      .dlhdrupfc (dlhdrupfc),
      .dlinhdllp (dlinhdllp),
      .dllinkautobdwstatus (tlbp_dl_link_autobdw_status),
      .dllinkbdwmngstatus (tlbp_dl_link_bdwmng_status),
      .dlltssm (dl_ltssm),
      .dlmaxploaddcr (tlbp_dl_maxpload_dcr),
      .dlreqphycfg (dlreqphycfg),
      .dlreqphypm (dlreqphypm),
      .dlrequpfc (dlrequpfc),
      .dlreqwake (dlreqwake),
      .dlrpbufemp (dlrpbufemp),
      .dlrstentercompbit (tlbp_dl_rst_enter_comp_bit),
      .dlrsttxmarginfield (tlbp_dl_rst_tx_margin_field),
      .dlrxecrcchk (dlrxecrcchk),
      .dlrxtyppm (dlrxtyppm),
      .dlrxvalpm (dlrxvalpm),
      .dlsndupfc (dlsndupfc),
      .dltxackpm (dltxackpm),
      .dltxcfgextsy (dltxcfgextsy),
      .dltxreqpm (dltxreqpm),
      .dltxtyppm (dltxtyppm),
      .dltypupfc (dltypupfc),
      .dlup (dlup),
      .dlupexit (dlup_exit),
      .dlvcctrl (dlvcctrl),
      .dlvcidmap (dlvcidmap),
      .dlvcidupfc (dlvcidupfc),
      .dlvcstatus (dlvcstatus),
      .dpclk (dpclk),
      .dpriodisable (dpriodisable),
      .dprioin (dprioin),
      .dprioload (dprioload),
      .dprioout (dprioout),
      .dpriostate (open_dpriostate),
      .eidleinfersel (eidle_infer_sel),
      .ev128ns (ev_128ns),
      .ev1us (ev_1us),
      .extraclkout (hip_extraclkout),
      .extraout (hip_extraout),
      .gen2rate (gen2rate),
      .gen2rategnd (open_gen2rategnd),
      .hotrstexit (hotrst_exit),
      .intstatus (int_status),
      .l2exit (l2_exit),
      .laneact (lane_act),
      .linkup (linkup),
      .lmiack (lmi_ack),
      .lmiaddr (lmi_addr),
      .lmidin (lmi_din),
      .lmidout (lmi_dout),
      .lmirden (lmi_rden),
      .lmiwren (lmi_wren),
      .ltssml0state (ltssml0state),
      .mode (mode),
      .mramhiptestenable (gnd_mram_hip_test_enable),
      .mramregscanen (gnd_mramregscanen),
      .mramregscanin (gnd_mramregscanin),
      .mramregscanout (open_mramregscanout),
      .pclkcentral (pclk_central),
      .pclkch0 (pclk_ch0),
      .phyrst (phy_rst),
      .physrst (phy_srst),
      .phystatus (phystatus),
      .pldclk (pld_clk),
      .pldrst (pld_rst),
      .pldsrst (pld_srst),
      .pllfixedclk (pll_fixed_clk),
      .powerdown (powerdown),
      .resetstatus (reset_status),
      .rxbardecvc0 (rx_st_bardec0),
      .rxbardecvc1 (rx_st_bardec1),
      .rxbevc00 (rx_st_be0),
      .rxbevc01 (rx_st_be0_p1),
      .rxbevc10 (rx_st_be1),
      .rxbevc11 (rx_st_be1_p1),
      .rxdata (rxdata),
      .rxdatak (rxdatak),
      .rxdatavc00 (rx_st_data0),
      .rxdatavc01 (rx_st_data0_p1),
      .rxdatavc10 (rx_st_data1),
      .rxdatavc11 (rx_st_data1_p1),
      .rxelecidle (rxelecidle),
      .rxeopvc00 (rx_st_eop0),
      .rxeopvc01 (rx_st_eop0_p1),
      .rxeopvc10 (rx_st_eop1),
      .rxeopvc11 (rx_st_eop1_p1),
      .rxerrvc0 (rx_st_err0),
      .rxerrvc1 (rx_st_err1),
      .rxfifoemptyvc0 (rx_fifo_empty0),
      .rxfifoemptyvc1 (rx_fifo_empty1),
      .rxfifofullvc0 (rx_fifo_full0),
      .rxfifofullvc1 (rx_fifo_full1),
      .rxfifordpvc0 (open_rxfifordpvc0),
      .rxfifordpvc1 (open_rxfifordpvc1),
      .rxfifowrpvc0 (open_rxfifowrpvc0),
      .rxfifowrpvc1 (open_rxfifowrpvc1),
      .rxmaskvc0 (rx_st_mask0_int),
      .rxmaskvc1 (rx_st_mask1),
      .rxpolarity (rxpolarity),
      .rxreadyvc0 (rx_st_ready0_int),
      .rxreadyvc1 (rx_st_ready1),
      .rxsopvc00 (rx_st_sop0),
      .rxsopvc01 (rx_st_sop0_p1),
      .rxsopvc10 (rx_st_sop1),
      .rxsopvc11 (rx_st_sop1_p1),
      .rxstatus (rxstatus),
      .rxvalid (rxvalid),
      .rxvalidvc0 (rx_st_valid0),
      .rxvalidvc1 (rx_st_valid1),
      .scanen (gnd_scanen),
      .scanmoden (scanmoden),
      .serrout (serr_out),
      .swdnin (swdn_in_int),
      .swdnwake (swdn_wake),
      .swuphotrst (swup_hotrst),
      .swupin (swup_in_int),
      .testin (test_in),
      .testout (test_out),
      .tlaermsinum (aer_msi_num_int),
      .tlappintaack (app_int_ack),
      .tlappintasts (app_int_sts_int),
      .tlappmsiack (app_msi_ack),
      .tlappmsinum (app_msi_num),
      .tlappmsireq (app_msi_req_int),
      .tlappmsitc (app_msi_tc_int),
      .tlcfgadd (tl_cfg_add_hip),
      .tlcfgctl (tl_cfg_ctl_hip),
      .tlcfgctlwr (tl_cfg_ctl_wr_hip),
      .tlcfgsts (tl_cfg_sts_hip),
      .tlcfgstswr (tl_cfg_sts_wr_hip),
      .tlhpgctrler (hpg_ctrler),
      .tlpexmsinum (pex_msi_num),
      .tlpmauxpwr (pm_auxpwr),
      .tlpmdata (pm_data),
      .tlpmetocr (pme_to_cr_int),
      .tlpmetosr (pme_to_sr),
      .tlpmevent (pm_event_int),
      .tlslotclkcfg (tl_slotclk_cfg),
      .txcompl (txcompl),
      .txcredvc0 (tx_cred0_int),
      .txcredvc1 (tx_cred1_int),
      .txdata (txdata),
      .txdatak (txdatak),
      .txdatavc00 (tx_st_data0_int),
      .txdatavc01 (tx_st_data0_p1),
      .txdatavc10 (tx_st_data1),
      .txdatavc11 (tx_st_data1_p1),
      .txdeemph (tx_deemph),
      .txdetectrx (txdetectrx),
      .txelecidle (txelecidle),
      .txeopvc00 (tx_st_eop0_int),
      .txeopvc01 (tx_st_eop0_p1),
      .txeopvc10 (tx_st_eop1),
      .txeopvc11 (tx_st_eop1_p1),
      .txerrvc0 (tx_st_err0_int),
      .txerrvc1 (tx_st_err1),
      .txfifoemptyvc0 (tx_fifo_empty0),
      .txfifoemptyvc1 (tx_fifo_empty1),
      .txfifofullvc0 (tx_fifo_full0),
      .txfifofullvc1 (tx_fifo_full1),
      .txfifordpvc0 (tx_fifo_rdptr0),
      .txfifordpvc1 (tx_fifo_rdptr1),
      .txfifowrpvc0 (tx_fifo_wrptr0),
      .txfifowrpvc1 (tx_fifo_wrptr1),
      .txmargin (tx_margin),
      .txreadyvc0 (tx_st_ready0),
      .txreadyvc1 (tx_st_ready1),
      .txsopvc00 (tx_st_sop0_int),
      .txsopvc01 (tx_st_sop0_p1),
      .txsopvc10 (tx_st_sop1),
      .txsopvc11 (tx_st_sop1_p1),
      .txvalidvc0 (tx_st_valid0_int),
      .txvalidvc1 (tx_st_valid1),
      .wakeoen (wake_oen)
    );

  defparam arriaii_hssi_pcie_hip.advanced_errors = advanced_errors,
           arriaii_hssi_pcie_hip.bar0_64bit_mem_space = bar0_64bit_mem_space,
           arriaii_hssi_pcie_hip.bar0_io_space = bar0_io_space,
           arriaii_hssi_pcie_hip.bar0_prefetchable = bar0_prefetchable,
           arriaii_hssi_pcie_hip.bar0_size_mask = bar0_size_mask,
           arriaii_hssi_pcie_hip.bar1_64bit_mem_space = bar1_64bit_mem_space,
           arriaii_hssi_pcie_hip.bar1_io_space = bar1_io_space,
           arriaii_hssi_pcie_hip.bar1_prefetchable = bar1_prefetchable,
           arriaii_hssi_pcie_hip.bar1_size_mask = bar1_size_mask,
           arriaii_hssi_pcie_hip.bar2_64bit_mem_space = bar2_64bit_mem_space,
           arriaii_hssi_pcie_hip.bar2_io_space = bar2_io_space,
           arriaii_hssi_pcie_hip.bar2_prefetchable = bar2_prefetchable,
           arriaii_hssi_pcie_hip.bar2_size_mask = bar2_size_mask,
           arriaii_hssi_pcie_hip.bar3_64bit_mem_space = bar3_64bit_mem_space,
           arriaii_hssi_pcie_hip.bar3_io_space = bar3_io_space,
           arriaii_hssi_pcie_hip.bar3_prefetchable = bar3_prefetchable,
           arriaii_hssi_pcie_hip.bar3_size_mask = bar3_size_mask,
           arriaii_hssi_pcie_hip.bar4_64bit_mem_space = bar4_64bit_mem_space,
           arriaii_hssi_pcie_hip.bar4_io_space = bar4_io_space,
           arriaii_hssi_pcie_hip.bar4_prefetchable = bar4_prefetchable,
           arriaii_hssi_pcie_hip.bar4_size_mask = bar4_size_mask,
           arriaii_hssi_pcie_hip.bar5_64bit_mem_space = bar5_64bit_mem_space,
           arriaii_hssi_pcie_hip.bar5_io_space = bar5_io_space,
           arriaii_hssi_pcie_hip.bar5_prefetchable = bar5_prefetchable,
           arriaii_hssi_pcie_hip.bar5_size_mask = bar5_size_mask,
           arriaii_hssi_pcie_hip.bar_io_window_size = bar_io_window_size,
           arriaii_hssi_pcie_hip.bar_prefetchable = bar_prefetchable,
           arriaii_hssi_pcie_hip.bridge_port_ssid_support = bridge_port_ssid_support,
           arriaii_hssi_pcie_hip.bridge_port_vga_enable = bridge_port_vga_enable,
           arriaii_hssi_pcie_hip.bypass_cdc = bypass_cdc,
           arriaii_hssi_pcie_hip.tx_cdc_full_value    =   tx_cdc_full_value ,
           arriaii_hssi_pcie_hip.bypass_tl = bypass_tl,
           arriaii_hssi_pcie_hip.class_code = class_code,
           arriaii_hssi_pcie_hip.completion_timeout = completion_timeout,
           arriaii_hssi_pcie_hip.core_clk_divider = core_clk_divider,
           arriaii_hssi_pcie_hip.core_clk_source = core_clk_source,
           arriaii_hssi_pcie_hip.credit_buffer_allocation_aux = credit_buffer_allocation_aux,
           arriaii_hssi_pcie_hip.deemphasis_enable = deemphasis_enable,
           arriaii_hssi_pcie_hip.device_id = device_id,
           arriaii_hssi_pcie_hip.device_number = device_number,
           arriaii_hssi_pcie_hip.diffclock_nfts_count = diffclock_nfts_count,
           arriaii_hssi_pcie_hip.disable_cdc_clk_ppm = disable_cdc_clk_ppm,
           arriaii_hssi_pcie_hip.disable_link_x2_support = disable_link_x2_support,
           arriaii_hssi_pcie_hip.disable_snoop_packet = disable_snoop_packet,
           arriaii_hssi_pcie_hip.dll_active_report_support = dll_active_report_support,
           arriaii_hssi_pcie_hip.ei_delay_powerdown_count = ei_delay_powerdown_count,
           arriaii_hssi_pcie_hip.eie_before_nfts_count = eie_before_nfts_count,
           arriaii_hssi_pcie_hip.enable_adapter_half_rate_mode = enable_adapter_half_rate_mode,
           arriaii_hssi_pcie_hip.enable_ch0_pclk_out = enable_ch0_pclk_out,
           arriaii_hssi_pcie_hip.enable_completion_timeout_disable = enable_completion_timeout_disable,
           arriaii_hssi_pcie_hip.enable_coreclk_out_half_rate = enable_coreclk_out_half_rate,
           arriaii_hssi_pcie_hip.enable_ecrc_check = enable_ecrc_check,
           arriaii_hssi_pcie_hip.enable_ecrc_gen = enable_ecrc_gen,
           arriaii_hssi_pcie_hip.enable_function_msi_support = enable_function_msi_support,
           arriaii_hssi_pcie_hip.enable_function_msix_support = enable_function_msix_support,
           arriaii_hssi_pcie_hip.enable_gen2_core = enable_gen2_core,
           arriaii_hssi_pcie_hip.enable_hip_x1_loopback = enable_hip_x1_loopback,
           arriaii_hssi_pcie_hip.enable_l1_aspm = enable_l1_aspm,
           arriaii_hssi_pcie_hip.enable_msi_64bit_addressing = enable_msi_64bit_addressing,
           arriaii_hssi_pcie_hip.enable_msi_masking = enable_msi_masking,
           arriaii_hssi_pcie_hip.enable_retrybuf_ecc = enable_retrybuf_ecc,
           arriaii_hssi_pcie_hip.enable_retrybuf_x8_clk_stealing = enable_retrybuf_x8_clk_stealing,
           arriaii_hssi_pcie_hip.enable_rx0buf_ecc = enable_rx0buf_ecc,
           arriaii_hssi_pcie_hip.enable_rx0buf_x8_clk_stealing = enable_rx0buf_x8_clk_stealing,
           arriaii_hssi_pcie_hip.enable_rx1buf_ecc = enable_rx1buf_ecc,
           arriaii_hssi_pcie_hip.enable_rx1buf_x8_clk_stealing = enable_rx1buf_x8_clk_stealing,
           arriaii_hssi_pcie_hip.enable_rx_buffer_checking = enable_rx_buffer_checking,
           arriaii_hssi_pcie_hip.enable_rx_reordering = enable_rx_reordering,
           arriaii_hssi_pcie_hip.enable_slot_register = enable_slot_register,
           arriaii_hssi_pcie_hip.endpoint_l0_latency = endpoint_l0_latency,
           arriaii_hssi_pcie_hip.endpoint_l1_latency = endpoint_l1_latency,
           arriaii_hssi_pcie_hip.expansion_base_address_register = expansion_base_address_register,
           arriaii_hssi_pcie_hip.extend_tag_field = extend_tag_field,
           arriaii_hssi_pcie_hip.fc_init_timer = fc_init_timer,
           arriaii_hssi_pcie_hip.flow_control_timeout_count = flow_control_timeout_count,
           arriaii_hssi_pcie_hip.flow_control_update_count = flow_control_update_count,
           arriaii_hssi_pcie_hip.gen2_diffclock_nfts_count = gen2_diffclock_nfts_count,
           arriaii_hssi_pcie_hip.gen2_lane_rate_mode = gen2_lane_rate_mode,
           arriaii_hssi_pcie_hip.gen2_sameclock_nfts_count = gen2_sameclock_nfts_count,
           arriaii_hssi_pcie_hip.hot_plug_support = hot_plug_support,
           arriaii_hssi_pcie_hip.indicator = indicator,
           arriaii_hssi_pcie_hip.l01_entry_latency = l01_entry_latency,
           arriaii_hssi_pcie_hip.l0_exit_latency_diffclock = l0_exit_latency_diffclock,
           arriaii_hssi_pcie_hip.l0_exit_latency_sameclock = l0_exit_latency_sameclock,
           arriaii_hssi_pcie_hip.l1_exit_latency_diffclock = l1_exit_latency_diffclock,
           arriaii_hssi_pcie_hip.l1_exit_latency_sameclock = l1_exit_latency_sameclock,
           arriaii_hssi_pcie_hip.lane_mask = lane_mask,
           arriaii_hssi_pcie_hip.low_priority_vc = low_priority_vc,
           arriaii_hssi_pcie_hip.lpm_type = lpm_type,
           arriaii_hssi_pcie_hip.max_link_width = max_link_width,
           arriaii_hssi_pcie_hip.max_payload_size = max_payload_size,
           arriaii_hssi_pcie_hip.maximum_current = maximum_current,
           arriaii_hssi_pcie_hip.millisecond_cycle_count = millisecond_cycle_count,
           arriaii_hssi_pcie_hip.msi_function_count = msi_function_count,
           arriaii_hssi_pcie_hip.msix_pba_bir = msix_pba_bir,
           arriaii_hssi_pcie_hip.msix_pba_offset = msix_pba_offset,
           arriaii_hssi_pcie_hip.msix_table_bir = msix_table_bir,
           arriaii_hssi_pcie_hip.msix_table_offset = msix_table_offset,
           arriaii_hssi_pcie_hip.msix_table_size = msix_table_size,
           arriaii_hssi_pcie_hip.no_command_completed = no_command_completed,
           arriaii_hssi_pcie_hip.no_soft_reset = no_soft_reset,
           arriaii_hssi_pcie_hip.pcie_mode = pcie_mode,
           arriaii_hssi_pcie_hip.pme_state_enable = pme_state_enable,
           arriaii_hssi_pcie_hip.port_link_number = port_link_number,
           arriaii_hssi_pcie_hip.register_pipe_signals = register_pipe_signals,
           arriaii_hssi_pcie_hip.retry_buffer_last_active_address = retry_buffer_last_active_address,
           arriaii_hssi_pcie_hip.retry_buffer_memory_settings = retry_buffer_memory_settings,
           arriaii_hssi_pcie_hip.revision_id = revision_id,
           arriaii_hssi_pcie_hip.rx_ptr0_nonposted_dpram_max = rx_ptr0_nonposted_dpram_max,
           arriaii_hssi_pcie_hip.rx_ptr0_nonposted_dpram_min = rx_ptr0_nonposted_dpram_min,
           arriaii_hssi_pcie_hip.rx_ptr0_posted_dpram_max = rx_ptr0_posted_dpram_max,
           arriaii_hssi_pcie_hip.rx_ptr0_posted_dpram_min = rx_ptr0_posted_dpram_min,
           arriaii_hssi_pcie_hip.rx_ptr1_nonposted_dpram_max = rx_ptr1_nonposted_dpram_max,
           arriaii_hssi_pcie_hip.rx_ptr1_nonposted_dpram_min = rx_ptr1_nonposted_dpram_min,
           arriaii_hssi_pcie_hip.rx_ptr1_posted_dpram_max = rx_ptr1_posted_dpram_max,
           arriaii_hssi_pcie_hip.rx_ptr1_posted_dpram_min = rx_ptr1_posted_dpram_min,
           arriaii_hssi_pcie_hip.sameclock_nfts_count = sameclock_nfts_count,
           arriaii_hssi_pcie_hip.single_rx_detect = single_rx_detect,
           arriaii_hssi_pcie_hip.skp_os_schedule_count = skp_os_schedule_count,
           arriaii_hssi_pcie_hip.slot_number = slot_number,
           arriaii_hssi_pcie_hip.slot_power_limit = slot_power_limit,
           arriaii_hssi_pcie_hip.slot_power_scale = slot_power_scale,
           arriaii_hssi_pcie_hip.ssid = ssid,
           arriaii_hssi_pcie_hip.ssvid = ssvid,
           arriaii_hssi_pcie_hip.subsystem_device_id = subsystem_device_id,
           arriaii_hssi_pcie_hip.subsystem_vendor_id = subsystem_vendor_id,
           arriaii_hssi_pcie_hip.surprise_down_error_support = surprise_down_error_support,
           arriaii_hssi_pcie_hip.use_crc_forwarding = use_crc_forwarding,
           arriaii_hssi_pcie_hip.vc0_clk_enable = vc0_clk_enable,
           arriaii_hssi_pcie_hip.vc0_rx_buffer_memory_settings = vc0_rx_buffer_memory_settings,
           arriaii_hssi_pcie_hip.vc0_rx_flow_ctrl_compl_data = vc0_rx_flow_ctrl_compl_data,
           arriaii_hssi_pcie_hip.vc0_rx_flow_ctrl_compl_header = vc0_rx_flow_ctrl_compl_header,
           arriaii_hssi_pcie_hip.vc0_rx_flow_ctrl_nonposted_data = vc0_rx_flow_ctrl_nonposted_data,
           arriaii_hssi_pcie_hip.vc0_rx_flow_ctrl_nonposted_header = vc0_rx_flow_ctrl_nonposted_header,
           arriaii_hssi_pcie_hip.vc0_rx_flow_ctrl_posted_data = vc0_rx_flow_ctrl_posted_data,
           arriaii_hssi_pcie_hip.vc0_rx_flow_ctrl_posted_header = vc0_rx_flow_ctrl_posted_header,
           arriaii_hssi_pcie_hip.vc1_clk_enable = vc1_clk_enable,
           arriaii_hssi_pcie_hip.vc1_rx_buffer_memory_settings = vc1_rx_buffer_memory_settings,
           arriaii_hssi_pcie_hip.vc1_rx_flow_ctrl_compl_data = vc1_rx_flow_ctrl_compl_data,
           arriaii_hssi_pcie_hip.vc1_rx_flow_ctrl_compl_header = vc1_rx_flow_ctrl_compl_header,
           arriaii_hssi_pcie_hip.vc1_rx_flow_ctrl_nonposted_data = vc1_rx_flow_ctrl_nonposted_data,
           arriaii_hssi_pcie_hip.vc1_rx_flow_ctrl_nonposted_header = vc1_rx_flow_ctrl_nonposted_header,
           arriaii_hssi_pcie_hip.vc1_rx_flow_ctrl_posted_data = vc1_rx_flow_ctrl_posted_data,
           arriaii_hssi_pcie_hip.vc1_rx_flow_ctrl_posted_header = vc1_rx_flow_ctrl_posted_header,
           arriaii_hssi_pcie_hip.vc_arbitration = vc_arbitration,
           arriaii_hssi_pcie_hip.vc_enable = vc_enable,
           arriaii_hssi_pcie_hip.vendor_id = vendor_id;

end
endgenerate

generate
if (p_pcie_hip_type == "2")
begin : cyclone_iii
  cycloneiv_hssi_pcie_hip cycloneiv_hssi_pcie_hip
    (
      .bistdonearcv0 (open_bistdonearcv0),
      .bistdonearcv1 (open_bistdonearcv1),
      .bistdonearpl (open_bistdonearpl),
      .bistdonebrcv0 (open_bistdonebrcv0),
      .bistdonebrcv1 (open_bistdonebrcv1),
      .bistdonebrpl (open_bistdonebrpl),
      .bistenrcv0 (gnd_bistenrcv0),
      .bistenrcv1 (gnd_bistenrcv1),
      .bistenrpl (gnd_bistenrpl),
      .bistpassrcv0 (open_bistpassrcv0),
      .bistpassrcv1 (open_bistpassrcv1),
      .bistpassrpl (open_bistpassrpl),
      .bistscanen (gnd_bistscanen),
      .bistscanin (gnd_bistscanin),
      .bistscanoutrcv0 (open_bistscanoutrcv0),
      .bistscanoutrcv1 (open_bistscanoutrcv1),
      .bistscanoutrpl (open_bistscanoutrpl),
      .bisttesten (gnd_bisttesten),
      .clrrxpath (clrrxpath),
      .coreclkin (core_clk_in),
      .coreclkout (core_clk_out),
      .corecrst (core_crst),
      .corepor (core_por),
      .corerst (core_rst),
      .coresrst (core_srst),
      .cplerr (cpl_err),
      .cplpending (cpl_pending_int),
      .dataenablen (open_dataenablen),
      .dbgpipex1rx (dbgpipex1rx),
      .derrcorextrcv0 (derr_cor_ext_rcv0),
      .derrcorextrcv1 (derr_cor_ext_rcv1),
      .derrcorextrpl (derr_cor_ext_rpl),
      .derrrpl (derr_rpl),
      .dlackphypm (dlackphypm),
      .dlackrequpfc (dlackrequpfc),
      .dlacksndupfc (dlacksndupfc),
      .dlaspmcr0 (tlbp_dl_aspm_cr0),
      .dlcomclkreg (tlbp_dl_comclk_reg),
      .dlctrllink2 (dlctrllink2),
      .dlcurrentdeemp (dlcurrentdeemp),
      .dlcurrentspeed (dlcurrentspeed),
      .dldataupfc (dldataupfc),
      .dldllreq (dldllreq),
      .dlerrdll (dlerrdll),
      .dlerrphy (dlerrphy),
      .dlhdrupfc (dlhdrupfc),
      .dlinhdllp (dlinhdllp),
      .dllinkautobdwstatus (tlbp_dl_link_autobdw_status),
      .dllinkbdwmngstatus (tlbp_dl_link_bdwmng_status),
      .dlltssm (dl_ltssm),
      .dlmaxploaddcr (tlbp_dl_maxpload_dcr),
      .dlreqphycfg (dlreqphycfg),
      .dlreqphypm (dlreqphypm),
      .dlrequpfc (dlrequpfc),
      .dlreqwake (dlreqwake),
      .dlrpbufemp (dlrpbufemp),
      .dlrstentercompbit (tlbp_dl_rst_enter_comp_bit),
      .dlrsttxmarginfield (tlbp_dl_rst_tx_margin_field),
      .dlrxecrcchk (dlrxecrcchk),
      .dlrxtyppm (dlrxtyppm),
      .dlrxvalpm (dlrxvalpm),
      .dlsndupfc (dlsndupfc),
      .dltxackpm (dltxackpm),
      .dltxcfgextsy (dltxcfgextsy),
      .dltxreqpm (dltxreqpm),
      .dltxtyppm (dltxtyppm),
      .dltypupfc (dltypupfc),
      .dlup (dlup),
      .dlupexit (dlup_exit),
      .dlvcctrl (dlvcctrl),
      .dlvcidmap (dlvcidmap),
      .dlvcidupfc (dlvcidupfc),
      .dlvcstatus (dlvcstatus),
      .dpclk (dpclk),
      .dpriodisable (dpriodisable),
      .dprioin (dprioin),
      .dprioload (dprioload),
      .dprioout (dprioout),
      .dpriostate (open_dpriostate),
      .eidleinfersel (eidle_infer_sel),
      .ev128ns (ev_128ns),
      .ev1us (ev_1us),
      .extraclkout (hip_extraclkout),
      .extraout (hip_extraout),
      .gen2rate (gen2rate),
      .gen2rategnd (open_gen2rategnd),
      .hotrstexit (hotrst_exit),
      .intstatus (int_status),
      .l2exit (l2_exit),
      .laneact (lane_act),
      .linkup (linkup),
      .lmiack (lmi_ack),
      .lmiaddr (lmi_addr),
      .lmidin (lmi_din),
      .lmidout (lmi_dout),
      .lmirden (lmi_rden),
      .lmiwren (lmi_wren),
      .ltssml0state (ltssml0state),
      .mode (mode),
      .mramhiptestenable (gnd_mram_hip_test_enable),
      .mramregscanen (gnd_mramregscanen),
      .mramregscanin (gnd_mramregscanin),
      .mramregscanout (open_mramregscanout),
      .pclkcentral (pclk_central),
      .pclkch0 (pclk_ch0),
      .phyrst (phy_rst),
      .physrst (phy_srst),
      .phystatus (phystatus),
      .pldclk (pld_clk),
      .pldrst (pld_rst),
      .pldsrst (pld_srst),
      .pllfixedclk (pll_fixed_clk),
      .powerdown (powerdown),
      .r2cerr0ext (r2cerr0ext_cycloneiv),
      .resetstatus (reset_status),
      .rxbardecvc0 (rx_st_bardec0),
      .rxbardecvc1 (rx_st_bardec1),
      .rxbevc00 (rx_st_be0),
      .rxbevc01 (rx_st_be0_p1),
      .rxbevc10 (rx_st_be1),
      .rxbevc11 (rx_st_be1_p1),
      .rxdata (rxdata),
      .rxdatak (rxdatak),
      .rxdatavc00 (rx_st_data0),
      .rxdatavc01 (rx_st_data0_p1),
      .rxdatavc10 (rx_st_data1),
      .rxdatavc11 (rx_st_data1_p1),
      .rxelecidle (rxelecidle),
      .rxeopvc00 (rx_st_eop0),
      .rxeopvc01 (rx_st_eop0_p1),
      .rxeopvc10 (rx_st_eop1),
      .rxeopvc11 (rx_st_eop1_p1),
      .rxerrvc0 (rx_st_err0),
      .rxerrvc1 (rx_st_err1),
      .rxfifoemptyvc0 (rx_fifo_empty0),
      .rxfifoemptyvc1 (rx_fifo_empty1),
      .rxfifofullvc0 (rx_fifo_full0),
      .rxfifofullvc1 (rx_fifo_full1),
      .rxfifordpvc0 (open_rxfifordpvc0),
      .rxfifordpvc1 (open_rxfifordpvc1),
      .rxfifowrpvc0 (open_rxfifowrpvc0),
      .rxfifowrpvc1 (open_rxfifowrpvc1),
      .rxmaskvc0 (rx_st_mask0_int),
      .rxmaskvc1 (rx_st_mask1),
      .rxpolarity (rxpolarity),
      .rxreadyvc0 (rx_st_ready0_int),
      .rxreadyvc1 (rx_st_ready1),
      .rxsopvc00 (rx_st_sop0),
      .rxsopvc01 (rx_st_sop0_p1),
      .rxsopvc10 (rx_st_sop1),
      .rxsopvc11 (rx_st_sop1_p1),
      .rxstatus (rxstatus),
      .rxvalid (rxvalid),
      .rxvalidvc0 (rx_st_valid0),
      .rxvalidvc1 (rx_st_valid1),
      .scanen (gnd_scanen),
      .scanmoden (scanmoden),
      .serrout (serr_out),
      .successspeednegoint(successspeednegoint),
      .swdnin (swdn_in_int),
      .swdnwake (swdn_wake),
      .swuphotrst (swup_hotrst),
      .swupin (swup_in_int),
      .testin (test_in),
      .testout (test_out),
      .tlaermsinum (aer_msi_num_int),
      .tlappintaack (app_int_ack),
      .tlappintasts (app_int_sts_int),
      .tlappmsiack (app_msi_ack),
      .tlappmsinum (app_msi_num),
      .tlappmsireq (app_msi_req_int),
      .tlappmsitc (app_msi_tc_int),
      .tlcfgadd (tl_cfg_add_hip),
      .tlcfgctl (tl_cfg_ctl_hip),
      .tlcfgctlwr (tl_cfg_ctl_wr_hip),
      .tlcfgsts (tl_cfg_sts_hip),
      .tlcfgstswr (tl_cfg_sts_wr_hip),
      .tlhpgctrler (hpg_ctrler),
      .tlpexmsinum (pex_msi_num),
      .tlpmauxpwr (pm_auxpwr),
      .tlpmdata (pm_data),
      .tlpmetocr (pme_to_cr_int),
      .tlpmetosr (pme_to_sr),
      .tlpmevent (pm_event_int),
      .tlslotclkcfg (tl_slotclk_cfg),
      .txcompl (txcompl),
      .txcredvc0 (tx_cred0_int),
      .txcredvc1 (tx_cred1_int),
      .txdata (txdata),
      .txdatak (txdatak),
      .txdatavc00 (tx_st_data0_int),
      .txdatavc01 (tx_st_data0_p1),
      .txdatavc10 (tx_st_data1),
      .txdatavc11 (tx_st_data1_p1),
      .txdeemph (tx_deemph),
      .txdetectrx (txdetectrx),
      .txelecidle (txelecidle),
      .txeopvc00 (tx_st_eop0_int),
      .txeopvc01 (tx_st_eop0_p1),
      .txeopvc10 (tx_st_eop1),
      .txeopvc11 (tx_st_eop1_p1),
      .txerrvc0 (tx_st_err0_int),
      .txerrvc1 (tx_st_err1),
      .txfifoemptyvc0 (tx_fifo_empty0),
      .txfifoemptyvc1 (tx_fifo_empty1),
      .txfifofullvc0 (tx_fifo_full0),
      .txfifofullvc1 (tx_fifo_full1),
      .txfifordpvc0 (tx_fifo_rdptr0),
      .txfifordpvc1 (tx_fifo_rdptr1),
      .txfifowrpvc0 (tx_fifo_wrptr0),
      .txfifowrpvc1 (tx_fifo_wrptr1),
      .txmargin (tx_margin),
      .txreadyvc0 (tx_st_ready0),
      .txreadyvc1 (tx_st_ready1),
      .txsopvc00 (tx_st_sop0_int),
      .txsopvc01 (tx_st_sop0_p1),
      .txsopvc10 (tx_st_sop1),
      .txsopvc11 (tx_st_sop1_p1),
      .txvalidvc0 (tx_st_valid0_int),
      .txvalidvc1 (tx_st_valid1),
      .wakeoen (wake_oen)
    );

  defparam cycloneiv_hssi_pcie_hip.advanced_errors = advanced_errors,
           cycloneiv_hssi_pcie_hip.bar0_64bit_mem_space = bar0_64bit_mem_space,
           cycloneiv_hssi_pcie_hip.bar0_io_space = bar0_io_space,
           cycloneiv_hssi_pcie_hip.bar0_prefetchable = bar0_prefetchable,
           cycloneiv_hssi_pcie_hip.bar0_size_mask = bar0_size_mask,
           cycloneiv_hssi_pcie_hip.bar1_64bit_mem_space = bar1_64bit_mem_space,
           cycloneiv_hssi_pcie_hip.bar1_io_space = bar1_io_space,
           cycloneiv_hssi_pcie_hip.bar1_prefetchable = bar1_prefetchable,
           cycloneiv_hssi_pcie_hip.bar1_size_mask = bar1_size_mask,
           cycloneiv_hssi_pcie_hip.bar2_64bit_mem_space = bar2_64bit_mem_space,
           cycloneiv_hssi_pcie_hip.bar2_io_space = bar2_io_space,
           cycloneiv_hssi_pcie_hip.bar2_prefetchable = bar2_prefetchable,
           cycloneiv_hssi_pcie_hip.bar2_size_mask = bar2_size_mask,
           cycloneiv_hssi_pcie_hip.bar3_64bit_mem_space = bar3_64bit_mem_space,
           cycloneiv_hssi_pcie_hip.bar3_io_space = bar3_io_space,
           cycloneiv_hssi_pcie_hip.bar3_prefetchable = bar3_prefetchable,
           cycloneiv_hssi_pcie_hip.bar3_size_mask = bar3_size_mask,
           cycloneiv_hssi_pcie_hip.bar4_64bit_mem_space = bar4_64bit_mem_space,
           cycloneiv_hssi_pcie_hip.bar4_io_space = bar4_io_space,
           cycloneiv_hssi_pcie_hip.bar4_prefetchable = bar4_prefetchable,
           cycloneiv_hssi_pcie_hip.bar4_size_mask = bar4_size_mask,
           cycloneiv_hssi_pcie_hip.bar5_64bit_mem_space = bar5_64bit_mem_space,
           cycloneiv_hssi_pcie_hip.bar5_io_space = bar5_io_space,
           cycloneiv_hssi_pcie_hip.bar5_prefetchable = bar5_prefetchable,
           cycloneiv_hssi_pcie_hip.bar5_size_mask = bar5_size_mask,
           cycloneiv_hssi_pcie_hip.bar_io_window_size = bar_io_window_size,
           cycloneiv_hssi_pcie_hip.bar_prefetchable = bar_prefetchable,
           cycloneiv_hssi_pcie_hip.bridge_port_ssid_support = bridge_port_ssid_support,
           cycloneiv_hssi_pcie_hip.bridge_port_vga_enable = bridge_port_vga_enable,
           cycloneiv_hssi_pcie_hip.bypass_cdc = bypass_cdc,
           cycloneiv_hssi_pcie_hip.tx_cdc_full_value    =   tx_cdc_full_value ,
           cycloneiv_hssi_pcie_hip.bypass_tl = bypass_tl,
           cycloneiv_hssi_pcie_hip.class_code = class_code,
           cycloneiv_hssi_pcie_hip.completion_timeout = completion_timeout,
           cycloneiv_hssi_pcie_hip.core_clk_divider = core_clk_divider,
           cycloneiv_hssi_pcie_hip.core_clk_source = core_clk_source,
           cycloneiv_hssi_pcie_hip.credit_buffer_allocation_aux = credit_buffer_allocation_aux,
           cycloneiv_hssi_pcie_hip.deemphasis_enable = deemphasis_enable,
           cycloneiv_hssi_pcie_hip.device_id = device_id,
           cycloneiv_hssi_pcie_hip.device_number = device_number,
           cycloneiv_hssi_pcie_hip.diffclock_nfts_count = diffclock_nfts_count,
           cycloneiv_hssi_pcie_hip.disable_cdc_clk_ppm = disable_cdc_clk_ppm,
           cycloneiv_hssi_pcie_hip.disable_link_x2_support = disable_link_x2_support,
           cycloneiv_hssi_pcie_hip.disable_snoop_packet = disable_snoop_packet,
           cycloneiv_hssi_pcie_hip.dll_active_report_support = dll_active_report_support,
           cycloneiv_hssi_pcie_hip.ei_delay_powerdown_count = ei_delay_powerdown_count,
           cycloneiv_hssi_pcie_hip.eie_before_nfts_count = eie_before_nfts_count,
           cycloneiv_hssi_pcie_hip.enable_adapter_half_rate_mode = enable_adapter_half_rate_mode,
           cycloneiv_hssi_pcie_hip.enable_ch0_pclk_out = enable_ch0_pclk_out,
           cycloneiv_hssi_pcie_hip.enable_completion_timeout_disable = enable_completion_timeout_disable,
           cycloneiv_hssi_pcie_hip.enable_coreclk_out_half_rate = enable_coreclk_out_half_rate,
           cycloneiv_hssi_pcie_hip.enable_ecrc_check = enable_ecrc_check,
           cycloneiv_hssi_pcie_hip.enable_ecrc_gen = enable_ecrc_gen,
           cycloneiv_hssi_pcie_hip.enable_function_msi_support = enable_function_msi_support,
           cycloneiv_hssi_pcie_hip.enable_function_msix_support = enable_function_msix_support,
           cycloneiv_hssi_pcie_hip.enable_gen2_core = enable_gen2_core,
           cycloneiv_hssi_pcie_hip.enable_hip_x1_loopback = enable_hip_x1_loopback,
           cycloneiv_hssi_pcie_hip.enable_l1_aspm = enable_l1_aspm,
           cycloneiv_hssi_pcie_hip.enable_msi_64bit_addressing = enable_msi_64bit_addressing,
           cycloneiv_hssi_pcie_hip.enable_msi_masking = enable_msi_masking,
           cycloneiv_hssi_pcie_hip.enable_retrybuf_ecc = enable_retrybuf_ecc,
           cycloneiv_hssi_pcie_hip.enable_retrybuf_x8_clk_stealing = enable_retrybuf_x8_clk_stealing,
           cycloneiv_hssi_pcie_hip.enable_rx0buf_ecc = enable_rx0buf_ecc,
           cycloneiv_hssi_pcie_hip.enable_rx0buf_x8_clk_stealing = enable_rx0buf_x8_clk_stealing,
           cycloneiv_hssi_pcie_hip.enable_rx1buf_ecc = enable_rx1buf_ecc,
           cycloneiv_hssi_pcie_hip.enable_rx1buf_x8_clk_stealing = enable_rx1buf_x8_clk_stealing,
           cycloneiv_hssi_pcie_hip.enable_rx_buffer_checking = enable_rx_buffer_checking,
           cycloneiv_hssi_pcie_hip.enable_rx_reordering = enable_rx_reordering,
           cycloneiv_hssi_pcie_hip.enable_slot_register = enable_slot_register,
           cycloneiv_hssi_pcie_hip.endpoint_l0_latency = endpoint_l0_latency,
           cycloneiv_hssi_pcie_hip.endpoint_l1_latency = endpoint_l1_latency,
           cycloneiv_hssi_pcie_hip.expansion_base_address_register = expansion_base_address_register,
           cycloneiv_hssi_pcie_hip.extend_tag_field = extend_tag_field,
           cycloneiv_hssi_pcie_hip.fc_init_timer = fc_init_timer,
           cycloneiv_hssi_pcie_hip.flow_control_timeout_count = flow_control_timeout_count,
           cycloneiv_hssi_pcie_hip.flow_control_update_count = flow_control_update_count,
           cycloneiv_hssi_pcie_hip.gen2_diffclock_nfts_count = gen2_diffclock_nfts_count,
           cycloneiv_hssi_pcie_hip.gen2_lane_rate_mode = gen2_lane_rate_mode,
           cycloneiv_hssi_pcie_hip.gen2_sameclock_nfts_count = gen2_sameclock_nfts_count,
           cycloneiv_hssi_pcie_hip.hot_plug_support = hot_plug_support,
           cycloneiv_hssi_pcie_hip.indicator = indicator,
           cycloneiv_hssi_pcie_hip.l01_entry_latency = l01_entry_latency,
           cycloneiv_hssi_pcie_hip.l0_exit_latency_diffclock = l0_exit_latency_diffclock,
           cycloneiv_hssi_pcie_hip.l0_exit_latency_sameclock = l0_exit_latency_sameclock,
           cycloneiv_hssi_pcie_hip.l1_exit_latency_diffclock = l1_exit_latency_diffclock,
           cycloneiv_hssi_pcie_hip.l1_exit_latency_sameclock = l1_exit_latency_sameclock,
           cycloneiv_hssi_pcie_hip.lane_mask = lane_mask,
           cycloneiv_hssi_pcie_hip.low_priority_vc = low_priority_vc,
           cycloneiv_hssi_pcie_hip.lpm_type = lpm_type,
           cycloneiv_hssi_pcie_hip.max_link_width = max_link_width,
           cycloneiv_hssi_pcie_hip.max_payload_size = max_payload_size,
           cycloneiv_hssi_pcie_hip.maximum_current = maximum_current,
           cycloneiv_hssi_pcie_hip.millisecond_cycle_count = millisecond_cycle_count,
           cycloneiv_hssi_pcie_hip.msi_function_count = msi_function_count,
           cycloneiv_hssi_pcie_hip.msix_pba_bir = msix_pba_bir,
           cycloneiv_hssi_pcie_hip.msix_pba_offset = msix_pba_offset,
           cycloneiv_hssi_pcie_hip.msix_table_bir = msix_table_bir,
           cycloneiv_hssi_pcie_hip.msix_table_offset = msix_table_offset,
           cycloneiv_hssi_pcie_hip.msix_table_size = msix_table_size,
           cycloneiv_hssi_pcie_hip.no_command_completed = no_command_completed,
           cycloneiv_hssi_pcie_hip.no_soft_reset = no_soft_reset,
           cycloneiv_hssi_pcie_hip.pcie_mode = pcie_mode,
           cycloneiv_hssi_pcie_hip.pme_state_enable = pme_state_enable,
           cycloneiv_hssi_pcie_hip.port_link_number = port_link_number,
           cycloneiv_hssi_pcie_hip.register_pipe_signals = register_pipe_signals,
           cycloneiv_hssi_pcie_hip.retry_buffer_last_active_address = retry_buffer_last_active_address,
           cycloneiv_hssi_pcie_hip.retry_buffer_memory_settings = retry_buffer_memory_settings,
           cycloneiv_hssi_pcie_hip.revision_id = revision_id,
           cycloneiv_hssi_pcie_hip.rx_ptr0_nonposted_dpram_max = rx_ptr0_nonposted_dpram_max,
           cycloneiv_hssi_pcie_hip.rx_ptr0_nonposted_dpram_min = rx_ptr0_nonposted_dpram_min,
           cycloneiv_hssi_pcie_hip.rx_ptr0_posted_dpram_max = rx_ptr0_posted_dpram_max,
           cycloneiv_hssi_pcie_hip.rx_ptr0_posted_dpram_min = rx_ptr0_posted_dpram_min,
           cycloneiv_hssi_pcie_hip.rx_ptr1_nonposted_dpram_max = rx_ptr1_nonposted_dpram_max,
           cycloneiv_hssi_pcie_hip.rx_ptr1_nonposted_dpram_min = rx_ptr1_nonposted_dpram_min,
           cycloneiv_hssi_pcie_hip.rx_ptr1_posted_dpram_max = rx_ptr1_posted_dpram_max,
           cycloneiv_hssi_pcie_hip.rx_ptr1_posted_dpram_min = rx_ptr1_posted_dpram_min,
           cycloneiv_hssi_pcie_hip.sameclock_nfts_count = sameclock_nfts_count,
           cycloneiv_hssi_pcie_hip.single_rx_detect = single_rx_detect,
           cycloneiv_hssi_pcie_hip.skp_os_schedule_count = skp_os_schedule_count,
           cycloneiv_hssi_pcie_hip.slot_number = slot_number,
           cycloneiv_hssi_pcie_hip.slot_power_limit = slot_power_limit,
           cycloneiv_hssi_pcie_hip.slot_power_scale = slot_power_scale,
           cycloneiv_hssi_pcie_hip.ssid = ssid,
           cycloneiv_hssi_pcie_hip.ssvid = ssvid,
           cycloneiv_hssi_pcie_hip.subsystem_device_id = subsystem_device_id,
           cycloneiv_hssi_pcie_hip.subsystem_vendor_id = subsystem_vendor_id,
           cycloneiv_hssi_pcie_hip.surprise_down_error_support = surprise_down_error_support,
           cycloneiv_hssi_pcie_hip.use_crc_forwarding = use_crc_forwarding,
           cycloneiv_hssi_pcie_hip.vc0_clk_enable = vc0_clk_enable,
           cycloneiv_hssi_pcie_hip.vc0_rx_buffer_memory_settings = vc0_rx_buffer_memory_settings,
           cycloneiv_hssi_pcie_hip.vc0_rx_flow_ctrl_compl_data = vc0_rx_flow_ctrl_compl_data,
           cycloneiv_hssi_pcie_hip.vc0_rx_flow_ctrl_compl_header = vc0_rx_flow_ctrl_compl_header,
           cycloneiv_hssi_pcie_hip.vc0_rx_flow_ctrl_nonposted_data = vc0_rx_flow_ctrl_nonposted_data,
           cycloneiv_hssi_pcie_hip.vc0_rx_flow_ctrl_nonposted_header = vc0_rx_flow_ctrl_nonposted_header,
           cycloneiv_hssi_pcie_hip.vc0_rx_flow_ctrl_posted_data = vc0_rx_flow_ctrl_posted_data,
           cycloneiv_hssi_pcie_hip.vc0_rx_flow_ctrl_posted_header = vc0_rx_flow_ctrl_posted_header,
           cycloneiv_hssi_pcie_hip.vc1_clk_enable = vc1_clk_enable,
           cycloneiv_hssi_pcie_hip.vc1_rx_buffer_memory_settings = vc1_rx_buffer_memory_settings,
           cycloneiv_hssi_pcie_hip.vc1_rx_flow_ctrl_compl_data = vc1_rx_flow_ctrl_compl_data,
           cycloneiv_hssi_pcie_hip.vc1_rx_flow_ctrl_compl_header = vc1_rx_flow_ctrl_compl_header,
           cycloneiv_hssi_pcie_hip.vc1_rx_flow_ctrl_nonposted_data = vc1_rx_flow_ctrl_nonposted_data,
           cycloneiv_hssi_pcie_hip.vc1_rx_flow_ctrl_nonposted_header = vc1_rx_flow_ctrl_nonposted_header,
           cycloneiv_hssi_pcie_hip.vc1_rx_flow_ctrl_posted_data = vc1_rx_flow_ctrl_posted_data,
           cycloneiv_hssi_pcie_hip.vc1_rx_flow_ctrl_posted_header = vc1_rx_flow_ctrl_posted_header,
           cycloneiv_hssi_pcie_hip.vc_arbitration = vc_arbitration,
           cycloneiv_hssi_pcie_hip.vc_enable = vc_enable,
           cycloneiv_hssi_pcie_hip.vendor_id = vendor_id;

end
endgenerate

generate
if (p_pcie_hip_type == "3")
begin : hc_iv
  hardcopyiv_hssi_pcie_hip hardcopyiv_hssi_pcie_hip
    (
      .bistdonearcv0 (open_bistdonearcv0),
      .bistdonearcv1 (open_bistdonearcv1),
      .bistdonearpl (open_bistdonearpl),
      .bistdonebrcv0 (open_bistdonebrcv0),
      .bistdonebrcv1 (open_bistdonebrcv1),
      .bistdonebrpl (open_bistdonebrpl),
      .bistenrcv0 (gnd_bistenrcv0),
      .bistenrcv1 (gnd_bistenrcv1),
      .bistenrpl (gnd_bistenrpl),
      .bistpassrcv0 (open_bistpassrcv0),
      .bistpassrcv1 (open_bistpassrcv1),
      .bistpassrpl (open_bistpassrpl),
      .bistscanen (gnd_bistscanen),
      .bistscanin (gnd_bistscanin),
      .bistscanoutrcv0 (open_bistscanoutrcv0),
      .bistscanoutrcv1 (open_bistscanoutrcv1),
      .bistscanoutrpl (open_bistscanoutrpl),
      .bisttesten (gnd_bisttesten),
      .clrrxpath (clrrxpath),
      .coreclkin (core_clk_in),
      .coreclkout (core_clk_out),
      .corecrst (core_crst),
      .corepor (core_por),
      .corerst (core_rst),
      .coresrst (core_srst),
      .cplerr (cpl_err),
      .cplpending (cpl_pending_int),
      .dataenablen (open_dataenablen),
      .dbgpipex1rx (dbgpipex1rx),
      .derrcorextrcv0 (derr_cor_ext_rcv0),
      .derrcorextrcv1 (derr_cor_ext_rcv1),
      .derrcorextrpl (derr_cor_ext_rpl),
      .derrrpl (derr_rpl),
      .dlackphypm (dlackphypm),
      .dlackrequpfc (dlackrequpfc),
      .dlacksndupfc (dlacksndupfc),
      .dlaspmcr0 (tlbp_dl_aspm_cr0),
      .dlcomclkreg (tlbp_dl_comclk_reg),
      .dlctrllink2 (dlctrllink2),
      .dlcurrentdeemp (dlcurrentdeemp),
      .dlcurrentspeed (dlcurrentspeed),
      .dldataupfc (dldataupfc),
      .dldllreq (dldllreq),
      .dlerrdll (dlerrdll),
      .dlerrphy (dlerrphy),
      .dlhdrupfc (dlhdrupfc),
      .dlinhdllp (dlinhdllp),
      .dllinkautobdwstatus (tlbp_dl_link_autobdw_status),
      .dllinkbdwmngstatus (tlbp_dl_link_bdwmng_status),
      .dlltssm (dl_ltssm),
      .dlmaxploaddcr (tlbp_dl_maxpload_dcr),
      .dlreqphycfg (dlreqphycfg),
      .dlreqphypm (dlreqphypm),
      .dlrequpfc (dlrequpfc),
      .dlreqwake (dlreqwake),
      .dlrpbufemp (dlrpbufemp),
      .dlrstentercompbit (tlbp_dl_rst_enter_comp_bit),
      .dlrsttxmarginfield (tlbp_dl_rst_tx_margin_field),
      .dlrxecrcchk (dlrxecrcchk),
      .dlrxtyppm (dlrxtyppm),
      .dlrxvalpm (dlrxvalpm),
      .dlsndupfc (dlsndupfc),
      .dltxackpm (dltxackpm),
      .dltxcfgextsy (dltxcfgextsy),
      .dltxreqpm (dltxreqpm),
      .dltxtyppm (dltxtyppm),
      .dltypupfc (dltypupfc),
      .dlup (dlup),
      .dlupexit (dlup_exit),
      .dlvcctrl (dlvcctrl),
      .dlvcidmap (dlvcidmap),
      .dlvcidupfc (dlvcidupfc),
      .dlvcstatus (dlvcstatus),
      .dpclk (dpclk),
      .dpriodisable (dpriodisable),
      .dprioin (dprioin),
      .dprioload (dprioload),
      .dprioout (dprioout),
      .dpriostate (open_dpriostate),
      .eidleinfersel (eidle_infer_sel),
      .ev128ns (ev_128ns),
      .ev1us (ev_1us),
      .extraclkout (hip_extraclkout),
      .extraout (hip_extraout),
      .gen2rate (gen2rate),
      .gen2rategnd (open_gen2rategnd),
      .hotrstexit (hotrst_exit),
      .intstatus (int_status),
      .l2exit (l2_exit),
      .laneact (lane_act),
      .linkup (linkup),
      .lmiack (lmi_ack),
      .lmiaddr (lmi_addr),
      .lmidin (lmi_din),
      .lmidout (lmi_dout),
      .lmirden (lmi_rden),
      .lmiwren (lmi_wren),
      .ltssml0state (ltssml0state),
      .mode (mode),
      .mramhiptestenable (gnd_mram_hip_test_enable),
      .mramregscanen (gnd_mramregscanen),
      .mramregscanin (gnd_mramregscanin),
      .mramregscanout (open_mramregscanout),
      .pclkcentral (pclk_central),
      .pclkch0 (pclk_ch0),
      .phyrst (phy_rst),
      .physrst (phy_srst),
      .phystatus (phystatus),
      .pldclk (pld_clk),
      .pldrst (pld_rst),
      .pldsrst (pld_srst),
      .pllfixedclk (pll_fixed_clk),
      .powerdown (powerdown),
      .resetstatus (reset_status),
      .rxbardecvc0 (rx_st_bardec0),
      .rxbardecvc1 (rx_st_bardec1),
      .rxbevc00 (rx_st_be0),
      .rxbevc01 (rx_st_be0_p1),
      .rxbevc10 (rx_st_be1),
      .rxbevc11 (rx_st_be1_p1),
      .rxdata (rxdata),
      .rxdatak (rxdatak),
      .rxdatavc00 (rx_st_data0),
      .rxdatavc01 (rx_st_data0_p1),
      .rxdatavc10 (rx_st_data1),
      .rxdatavc11 (rx_st_data1_p1),
      .rxelecidle (rxelecidle),
      .rxeopvc00 (rx_st_eop0),
      .rxeopvc01 (rx_st_eop0_p1),
      .rxeopvc10 (rx_st_eop1),
      .rxeopvc11 (rx_st_eop1_p1),
      .rxerrvc0 (rx_st_err0),
      .rxerrvc1 (rx_st_err1),
      .rxfifoemptyvc0 (rx_fifo_empty0),
      .rxfifoemptyvc1 (rx_fifo_empty1),
      .rxfifofullvc0 (rx_fifo_full0),
      .rxfifofullvc1 (rx_fifo_full1),
      .rxfifordpvc0 (open_rxfifordpvc0),
      .rxfifordpvc1 (open_rxfifordpvc1),
      .rxfifowrpvc0 (open_rxfifowrpvc0),
      .rxfifowrpvc1 (open_rxfifowrpvc1),
      .rxmaskvc0 (rx_st_mask0_int),
      .rxmaskvc1 (rx_st_mask1),
      .rxpolarity (rxpolarity),
      .rxreadyvc0 (rx_st_ready0_int),
      .rxreadyvc1 (rx_st_ready1),
      .rxsopvc00 (rx_st_sop0),
      .rxsopvc01 (rx_st_sop0_p1),
      .rxsopvc10 (rx_st_sop1),
      .rxsopvc11 (rx_st_sop1_p1),
      .rxstatus (rxstatus),
      .rxvalid (rxvalid),
      .rxvalidvc0 (rx_st_valid0),
      .rxvalidvc1 (rx_st_valid1),
      .scanen (gnd_scanen),
      .scanmoden (scanmoden),
      .serrout (serr_out),
      .swdnin (swdn_in_int),
      .swdnwake (swdn_wake),
      .swuphotrst (swup_hotrst),
      .swupin (swup_in_int),
      .testin (test_in),
      .testout (test_out),
      .tlaermsinum (aer_msi_num_int),
      .tlappintaack (app_int_ack),
      .tlappintasts (app_int_sts_int),
      .tlappmsiack (app_msi_ack),
      .tlappmsinum (app_msi_num),
      .tlappmsireq (app_msi_req_int),
      .tlappmsitc (app_msi_tc_int),
      .tlcfgadd (tl_cfg_add_hip),
      .tlcfgctl (tl_cfg_ctl_hip),
      .tlcfgctlwr (tl_cfg_ctl_wr_hip),
      .tlcfgsts (tl_cfg_sts_hip),
      .tlcfgstswr (tl_cfg_sts_wr_hip),
      .tlhpgctrler (hpg_ctrler),
      .tlpexmsinum (pex_msi_num),
      .tlpmauxpwr (pm_auxpwr),
      .tlpmdata (pm_data),
      .tlpmetocr (pme_to_cr_int),
      .tlpmetosr (pme_to_sr),
      .tlpmevent (pm_event_int),
      .tlslotclkcfg (tl_slotclk_cfg),
      .txcompl (txcompl),
      .txcredvc0 (tx_cred0_int),
      .txcredvc1 (tx_cred1_int),
      .txdata (txdata),
      .txdatak (txdatak),
      .txdatavc00 (tx_st_data0_int),
      .txdatavc01 (tx_st_data0_p1),
      .txdatavc10 (tx_st_data1),
      .txdatavc11 (tx_st_data1_p1),
      .txdeemph (tx_deemph),
      .txdetectrx (txdetectrx),
      .txelecidle (txelecidle),
      .txeopvc00 (tx_st_eop0_int),
      .txeopvc01 (tx_st_eop0_p1),
      .txeopvc10 (tx_st_eop1),
      .txeopvc11 (tx_st_eop1_p1),
      .txerrvc0 (tx_st_err0_int),
      .txerrvc1 (tx_st_err1),
      .txfifoemptyvc0 (tx_fifo_empty0),
      .txfifoemptyvc1 (tx_fifo_empty1),
      .txfifofullvc0 (tx_fifo_full0),
      .txfifofullvc1 (tx_fifo_full1),
      .txfifordpvc0 (tx_fifo_rdptr0),
      .txfifordpvc1 (tx_fifo_rdptr1),
      .txfifowrpvc0 (tx_fifo_wrptr0),
      .txfifowrpvc1 (tx_fifo_wrptr1),
      .txmargin (tx_margin),
      .txreadyvc0 (tx_st_ready0),
      .txreadyvc1 (tx_st_ready1),
      .txsopvc00 (tx_st_sop0_int),
      .txsopvc01 (tx_st_sop0_p1),
      .txsopvc10 (tx_st_sop1),
      .txsopvc11 (tx_st_sop1_p1),
      .txvalidvc0 (tx_st_valid0_int),
      .txvalidvc1 (tx_st_valid1),
      .wakeoen (wake_oen)
    );

  defparam hardcopyiv_hssi_pcie_hip.advanced_errors = advanced_errors,
           hardcopyiv_hssi_pcie_hip.bar0_64bit_mem_space = bar0_64bit_mem_space,
           hardcopyiv_hssi_pcie_hip.bar0_io_space = bar0_io_space,
           hardcopyiv_hssi_pcie_hip.bar0_prefetchable = bar0_prefetchable,
           hardcopyiv_hssi_pcie_hip.bar0_size_mask = bar0_size_mask,
           hardcopyiv_hssi_pcie_hip.bar1_64bit_mem_space = bar1_64bit_mem_space,
           hardcopyiv_hssi_pcie_hip.bar1_io_space = bar1_io_space,
           hardcopyiv_hssi_pcie_hip.bar1_prefetchable = bar1_prefetchable,
           hardcopyiv_hssi_pcie_hip.bar1_size_mask = bar1_size_mask,
           hardcopyiv_hssi_pcie_hip.bar2_64bit_mem_space = bar2_64bit_mem_space,
           hardcopyiv_hssi_pcie_hip.bar2_io_space = bar2_io_space,
           hardcopyiv_hssi_pcie_hip.bar2_prefetchable = bar2_prefetchable,
           hardcopyiv_hssi_pcie_hip.bar2_size_mask = bar2_size_mask,
           hardcopyiv_hssi_pcie_hip.bar3_64bit_mem_space = bar3_64bit_mem_space,
           hardcopyiv_hssi_pcie_hip.bar3_io_space = bar3_io_space,
           hardcopyiv_hssi_pcie_hip.bar3_prefetchable = bar3_prefetchable,
           hardcopyiv_hssi_pcie_hip.bar3_size_mask = bar3_size_mask,
           hardcopyiv_hssi_pcie_hip.bar4_64bit_mem_space = bar4_64bit_mem_space,
           hardcopyiv_hssi_pcie_hip.bar4_io_space = bar4_io_space,
           hardcopyiv_hssi_pcie_hip.bar4_prefetchable = bar4_prefetchable,
           hardcopyiv_hssi_pcie_hip.bar4_size_mask = bar4_size_mask,
           hardcopyiv_hssi_pcie_hip.bar5_64bit_mem_space = bar5_64bit_mem_space,
           hardcopyiv_hssi_pcie_hip.bar5_io_space = bar5_io_space,
           hardcopyiv_hssi_pcie_hip.bar5_prefetchable = bar5_prefetchable,
           hardcopyiv_hssi_pcie_hip.bar5_size_mask = bar5_size_mask,
           hardcopyiv_hssi_pcie_hip.bar_io_window_size = bar_io_window_size,
           hardcopyiv_hssi_pcie_hip.bar_prefetchable = bar_prefetchable,
           hardcopyiv_hssi_pcie_hip.bridge_port_ssid_support = bridge_port_ssid_support,
           hardcopyiv_hssi_pcie_hip.bridge_port_vga_enable = bridge_port_vga_enable,
           hardcopyiv_hssi_pcie_hip.bypass_cdc = bypass_cdc,
           hardcopyiv_hssi_pcie_hip.tx_cdc_full_value    =   tx_cdc_full_value ,
           hardcopyiv_hssi_pcie_hip.bypass_tl = bypass_tl,
           hardcopyiv_hssi_pcie_hip.class_code = class_code,
           hardcopyiv_hssi_pcie_hip.completion_timeout = completion_timeout,
           hardcopyiv_hssi_pcie_hip.core_clk_divider = core_clk_divider,
           hardcopyiv_hssi_pcie_hip.core_clk_source = core_clk_source,
           hardcopyiv_hssi_pcie_hip.credit_buffer_allocation_aux = credit_buffer_allocation_aux,
           hardcopyiv_hssi_pcie_hip.deemphasis_enable = deemphasis_enable,
           hardcopyiv_hssi_pcie_hip.device_id = device_id,
           hardcopyiv_hssi_pcie_hip.device_number = device_number,
           hardcopyiv_hssi_pcie_hip.diffclock_nfts_count = diffclock_nfts_count,
           hardcopyiv_hssi_pcie_hip.disable_cdc_clk_ppm = disable_cdc_clk_ppm,
           hardcopyiv_hssi_pcie_hip.disable_link_x2_support = disable_link_x2_support,
           hardcopyiv_hssi_pcie_hip.disable_snoop_packet = disable_snoop_packet,
           hardcopyiv_hssi_pcie_hip.dll_active_report_support = dll_active_report_support,
           hardcopyiv_hssi_pcie_hip.ei_delay_powerdown_count = ei_delay_powerdown_count,
           hardcopyiv_hssi_pcie_hip.eie_before_nfts_count = eie_before_nfts_count,
           hardcopyiv_hssi_pcie_hip.enable_adapter_half_rate_mode = enable_adapter_half_rate_mode,
           hardcopyiv_hssi_pcie_hip.enable_ch0_pclk_out = enable_ch0_pclk_out,
           hardcopyiv_hssi_pcie_hip.enable_completion_timeout_disable = enable_completion_timeout_disable,
           hardcopyiv_hssi_pcie_hip.enable_coreclk_out_half_rate = enable_coreclk_out_half_rate,
           hardcopyiv_hssi_pcie_hip.enable_ecrc_check = enable_ecrc_check,
           hardcopyiv_hssi_pcie_hip.enable_ecrc_gen = enable_ecrc_gen,
           hardcopyiv_hssi_pcie_hip.enable_function_msi_support = enable_function_msi_support,
           hardcopyiv_hssi_pcie_hip.enable_function_msix_support = enable_function_msix_support,
           hardcopyiv_hssi_pcie_hip.enable_gen2_core = enable_gen2_core,
           hardcopyiv_hssi_pcie_hip.enable_hip_x1_loopback = enable_hip_x1_loopback,
           hardcopyiv_hssi_pcie_hip.enable_l1_aspm = enable_l1_aspm,
           hardcopyiv_hssi_pcie_hip.enable_msi_64bit_addressing = enable_msi_64bit_addressing,
           hardcopyiv_hssi_pcie_hip.enable_msi_masking = enable_msi_masking,
           hardcopyiv_hssi_pcie_hip.enable_retrybuf_ecc = enable_retrybuf_ecc,
           hardcopyiv_hssi_pcie_hip.enable_retrybuf_x8_clk_stealing = enable_retrybuf_x8_clk_stealing,
           hardcopyiv_hssi_pcie_hip.enable_rx0buf_ecc = enable_rx0buf_ecc,
           hardcopyiv_hssi_pcie_hip.enable_rx0buf_x8_clk_stealing = enable_rx0buf_x8_clk_stealing,
           hardcopyiv_hssi_pcie_hip.enable_rx1buf_ecc = enable_rx1buf_ecc,
           hardcopyiv_hssi_pcie_hip.enable_rx1buf_x8_clk_stealing = enable_rx1buf_x8_clk_stealing,
           hardcopyiv_hssi_pcie_hip.enable_rx_buffer_checking = enable_rx_buffer_checking,
           hardcopyiv_hssi_pcie_hip.enable_rx_reordering = enable_rx_reordering,
           hardcopyiv_hssi_pcie_hip.enable_slot_register = enable_slot_register,
           hardcopyiv_hssi_pcie_hip.endpoint_l0_latency = endpoint_l0_latency,
           hardcopyiv_hssi_pcie_hip.endpoint_l1_latency = endpoint_l1_latency,
           hardcopyiv_hssi_pcie_hip.expansion_base_address_register = expansion_base_address_register,
           hardcopyiv_hssi_pcie_hip.extend_tag_field = extend_tag_field,
           hardcopyiv_hssi_pcie_hip.fc_init_timer = fc_init_timer,
           hardcopyiv_hssi_pcie_hip.flow_control_timeout_count = flow_control_timeout_count,
           hardcopyiv_hssi_pcie_hip.flow_control_update_count = flow_control_update_count,
           hardcopyiv_hssi_pcie_hip.gen2_diffclock_nfts_count = gen2_diffclock_nfts_count,
           hardcopyiv_hssi_pcie_hip.gen2_lane_rate_mode = gen2_lane_rate_mode,
           hardcopyiv_hssi_pcie_hip.gen2_sameclock_nfts_count = gen2_sameclock_nfts_count,
           hardcopyiv_hssi_pcie_hip.hot_plug_support = hot_plug_support,
           hardcopyiv_hssi_pcie_hip.indicator = indicator,
           hardcopyiv_hssi_pcie_hip.l01_entry_latency = l01_entry_latency,
           hardcopyiv_hssi_pcie_hip.l0_exit_latency_diffclock = l0_exit_latency_diffclock,
           hardcopyiv_hssi_pcie_hip.l0_exit_latency_sameclock = l0_exit_latency_sameclock,
           hardcopyiv_hssi_pcie_hip.l1_exit_latency_diffclock = l1_exit_latency_diffclock,
           hardcopyiv_hssi_pcie_hip.l1_exit_latency_sameclock = l1_exit_latency_sameclock,
           hardcopyiv_hssi_pcie_hip.lane_mask = lane_mask,
           hardcopyiv_hssi_pcie_hip.low_priority_vc = low_priority_vc,
           hardcopyiv_hssi_pcie_hip.lpm_type = lpm_type,
           hardcopyiv_hssi_pcie_hip.max_link_width = max_link_width,
           hardcopyiv_hssi_pcie_hip.max_payload_size = max_payload_size,
           hardcopyiv_hssi_pcie_hip.maximum_current = maximum_current,
           hardcopyiv_hssi_pcie_hip.millisecond_cycle_count = millisecond_cycle_count,
           hardcopyiv_hssi_pcie_hip.msi_function_count = msi_function_count,
           hardcopyiv_hssi_pcie_hip.msix_pba_bir = msix_pba_bir,
           hardcopyiv_hssi_pcie_hip.msix_pba_offset = msix_pba_offset,
           hardcopyiv_hssi_pcie_hip.msix_table_bir = msix_table_bir,
           hardcopyiv_hssi_pcie_hip.msix_table_offset = msix_table_offset,
           hardcopyiv_hssi_pcie_hip.msix_table_size = msix_table_size,
           hardcopyiv_hssi_pcie_hip.no_command_completed = no_command_completed,
           hardcopyiv_hssi_pcie_hip.no_soft_reset = no_soft_reset,
           hardcopyiv_hssi_pcie_hip.pcie_mode = pcie_mode,
           hardcopyiv_hssi_pcie_hip.pme_state_enable = pme_state_enable,
           hardcopyiv_hssi_pcie_hip.port_link_number = port_link_number,
           hardcopyiv_hssi_pcie_hip.register_pipe_signals = register_pipe_signals,
           hardcopyiv_hssi_pcie_hip.retry_buffer_last_active_address = retry_buffer_last_active_address,
           hardcopyiv_hssi_pcie_hip.retry_buffer_memory_settings = retry_buffer_memory_settings,
           hardcopyiv_hssi_pcie_hip.revision_id = revision_id,
           hardcopyiv_hssi_pcie_hip.rx_ptr0_nonposted_dpram_max = rx_ptr0_nonposted_dpram_max,
           hardcopyiv_hssi_pcie_hip.rx_ptr0_nonposted_dpram_min = rx_ptr0_nonposted_dpram_min,
           hardcopyiv_hssi_pcie_hip.rx_ptr0_posted_dpram_max = rx_ptr0_posted_dpram_max,
           hardcopyiv_hssi_pcie_hip.rx_ptr0_posted_dpram_min = rx_ptr0_posted_dpram_min,
           hardcopyiv_hssi_pcie_hip.rx_ptr1_nonposted_dpram_max = rx_ptr1_nonposted_dpram_max,
           hardcopyiv_hssi_pcie_hip.rx_ptr1_nonposted_dpram_min = rx_ptr1_nonposted_dpram_min,
           hardcopyiv_hssi_pcie_hip.rx_ptr1_posted_dpram_max = rx_ptr1_posted_dpram_max,
           hardcopyiv_hssi_pcie_hip.rx_ptr1_posted_dpram_min = rx_ptr1_posted_dpram_min,
           hardcopyiv_hssi_pcie_hip.sameclock_nfts_count = sameclock_nfts_count,
           hardcopyiv_hssi_pcie_hip.single_rx_detect = single_rx_detect,
           hardcopyiv_hssi_pcie_hip.skp_os_schedule_count = skp_os_schedule_count,
           hardcopyiv_hssi_pcie_hip.slot_number = slot_number,
           hardcopyiv_hssi_pcie_hip.slot_power_limit = slot_power_limit,
           hardcopyiv_hssi_pcie_hip.slot_power_scale = slot_power_scale,
           hardcopyiv_hssi_pcie_hip.ssid = ssid,
           hardcopyiv_hssi_pcie_hip.ssvid = ssvid,
           hardcopyiv_hssi_pcie_hip.subsystem_device_id = subsystem_device_id,
           hardcopyiv_hssi_pcie_hip.subsystem_vendor_id = subsystem_vendor_id,
           hardcopyiv_hssi_pcie_hip.surprise_down_error_support = surprise_down_error_support,
           hardcopyiv_hssi_pcie_hip.use_crc_forwarding = use_crc_forwarding,
           hardcopyiv_hssi_pcie_hip.vc0_clk_enable = vc0_clk_enable,
           hardcopyiv_hssi_pcie_hip.vc0_rx_buffer_memory_settings = vc0_rx_buffer_memory_settings,
           hardcopyiv_hssi_pcie_hip.vc0_rx_flow_ctrl_compl_data = vc0_rx_flow_ctrl_compl_data,
           hardcopyiv_hssi_pcie_hip.vc0_rx_flow_ctrl_compl_header = vc0_rx_flow_ctrl_compl_header,
           hardcopyiv_hssi_pcie_hip.vc0_rx_flow_ctrl_nonposted_data = vc0_rx_flow_ctrl_nonposted_data,
           hardcopyiv_hssi_pcie_hip.vc0_rx_flow_ctrl_nonposted_header = vc0_rx_flow_ctrl_nonposted_header,
           hardcopyiv_hssi_pcie_hip.vc0_rx_flow_ctrl_posted_data = vc0_rx_flow_ctrl_posted_data,
           hardcopyiv_hssi_pcie_hip.vc0_rx_flow_ctrl_posted_header = vc0_rx_flow_ctrl_posted_header,
           hardcopyiv_hssi_pcie_hip.vc1_clk_enable = vc1_clk_enable,
           hardcopyiv_hssi_pcie_hip.vc1_rx_buffer_memory_settings = vc1_rx_buffer_memory_settings,
           hardcopyiv_hssi_pcie_hip.vc1_rx_flow_ctrl_compl_data = vc1_rx_flow_ctrl_compl_data,
           hardcopyiv_hssi_pcie_hip.vc1_rx_flow_ctrl_compl_header = vc1_rx_flow_ctrl_compl_header,
           hardcopyiv_hssi_pcie_hip.vc1_rx_flow_ctrl_nonposted_data = vc1_rx_flow_ctrl_nonposted_data,
           hardcopyiv_hssi_pcie_hip.vc1_rx_flow_ctrl_nonposted_header = vc1_rx_flow_ctrl_nonposted_header,
           hardcopyiv_hssi_pcie_hip.vc1_rx_flow_ctrl_posted_data = vc1_rx_flow_ctrl_posted_data,
           hardcopyiv_hssi_pcie_hip.vc1_rx_flow_ctrl_posted_header = vc1_rx_flow_ctrl_posted_header,
           hardcopyiv_hssi_pcie_hip.vc_arbitration = vc_arbitration,
           hardcopyiv_hssi_pcie_hip.vc_enable = vc_enable,
           hardcopyiv_hssi_pcie_hip.vendor_id = vendor_id;

end
endgenerate

generate
   if (SOPC_BUILDER_MODE==1) begin : g_reset_controller

     reg  rc_areset_r /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R102 ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
     reg  rc_areset_rr /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R102 ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
     reg  rc_areset_rrr /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R102 ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
     wire rc_areset_n;
     //rc_areset Synchronizer
     assign rc_areset_n = ~rc_areset;
     always @(posedge pld_clk or negedge rc_areset_n) begin
         if (rc_areset_n == 1'b0) begin
             rc_areset_r   <= 1'b1;
             rc_areset_rr  <=1'b1;
             rc_areset_rrr <=1'b1;
         end
         else begin
             rc_areset_r   <= 1'b0;
             rc_areset_rr  <= rc_areset_r;
             rc_areset_rrr <= rc_areset_rr;
         end
     end

     alt4gxb_reset_controller alt4gxb_reset_controller0
       (
         .async_reset (rc_areset_rrr),
         .fifo_err (1'b0),
         .gxb_powerdown (rc_gxb_powerdown),
         .inclk (pld_clk),
         .inclk_eq_125mhz (rc_inclk_eq_125mhz),
         .pll_locked (rc_pll_locked),
         .rx_pll_locked (rc_rx_pll_locked_one),
         .rxanalogreset (rc_rx_analogreset),
         .rxdigitalreset (rc_rx_digitalreset),
         .test_sim (test_in[0]),
         .txdigitalreset (rc_tx_digitalreset)
       );
   end
endgenerate

 

  altpcie_pcie_reconfig_bridge altpcie_pcie_reconfig_bridge0
    (
      .avs_pcie_reconfig_address (avs_pcie_reconfig_address),
      .avs_pcie_reconfig_chipselect (avs_pcie_reconfig_chipselect),
      .avs_pcie_reconfig_clk (avs_pcie_reconfig_clk),
      .avs_pcie_reconfig_read (avs_pcie_reconfig_read),
      .avs_pcie_reconfig_readdata (avs_pcie_reconfig_readdata),
      .avs_pcie_reconfig_readdatavalid (avs_pcie_reconfig_readdatavalid),
      .avs_pcie_reconfig_rstn (avs_pcie_reconfig_rstn_int),
      .avs_pcie_reconfig_waitrequest (avs_pcie_reconfig_waitrequest),
      .avs_pcie_reconfig_write (avs_pcie_reconfig_write),
      .avs_pcie_reconfig_writedata (avs_pcie_reconfig_writedata),
      .dpclk (dpclk),
      .dpriodisable (dpriodisable),
      .dprioin (dprioin),
      .dprioload (dprioload),
      .dprioout (dprioout)
    );

  defparam altpcie_pcie_reconfig_bridge0.base_address = base_address,
           altpcie_pcie_reconfig_bridge0.device_address = device_address,
           altpcie_pcie_reconfig_bridge0.port_address = port_address;



generate
if ((TL_SELECTION == 1) & (AST_LITE == 0))
begin : tl_bypass_hip_sopc
	
	 pciexp_dcram quartus_compile_ram
    (
      .q (nowhere)
    );

	
  altpciexpav_tlbp_app tlbp_app
    (
      .CraAddress_i (CraAddress_i),
      .CraByteEnable_i (CraByteEnable_i),
      .CraChipSelect_i (CraChipSelect_i),
      .CraClk_i (AvlClk_i),
      .CraIrq_o (CraIrq_o),
      .CraRead (CraRead),
      .CraReadData_o (CraReadData_o),
      .CraRstn_i (Rstn_i),
      .CraWaitRequest_o (CraWaitRequest_o),
      .CraWrite (CraWrite),
      .CraWriteData_i (CraWriteData_i),
      .Rstn_i (srstn),
      .RxmAddress_o (RxmAddress_o),
      .RxmBurstCount_o (RxmBurstCount_o),
      .RxmByteEnable_o (RxmByteEnable_o),
      .RxmClk_i (AvlClk_i),
      .RxmIrqNum_i (RxmIrqNum_i),
      .RxmIrq_i (RxmIrq_i),
      .RxmReadDataValid_i (RxmReadDataValid_i),
      .RxmReadData_i (RxmReadData_i),
      .RxmRead_o (RxmRead_o),
      .RxmRstn_i (Rstn_i),
      .RxmWaitRequest_i (RxmWaitRequest_i),
      .RxmWriteData_o (RxmWriteData_o),
      .RxmWrite_o (RxmWrite_o),
      .TlpClk_i (pld_clk),
      .TxsAddress_i (TxsAddress_i),
      .TxsBurstCount_i (TxsBurstCount_i),
      .TxsByteEnable_i (TxsByteEnable_i),
      .TxsChipSelect_i (TxsChipSelect_i),
      .TxsClk_i (AvlClk_i),
      .TxsReadDataValid_o (TxsReadDataValid_o),
      .TxsReadData_o (TxsReadData_o),
      .TxsRead_i (TxsRead_i),
      .TxsRstn_i (Rstn_i),
      .TxsWaitRequest_o (TxsWaitRequest_o),
      .TxsWriteData_i (TxsWriteData_i),
      .TxsWrite_i (TxsWrite_i),
      .ack_req_upfc (dlackrequpfc),
      .ack_snd_upfc (dlacksndupfc),
      .clr_rxpath (clrrxpath),
      .crst (crst),
      .data_upfc (sopc_dldataupfc),
      .dl_up (dlup),
      .dll_current_deemp (dlcurrentdeemp),
      .dll_current_speed (dlcurrentspeed),
      .dll_link2_cntrl (sopc_dlctrllink2),
      .dll_req (dldllreq),
      .err_dll (dlerrdll),
      .err_phy (dlerrphy),
      .ev1us (ev_1us),
      .hdr_upfc (sopc_dlhdrupfc),
      .hip_tx_cred (tx_cred0),
      .hpg_ctrler (hpg_ctrler),
      .in_l0s_req (in_l0s_req),
      .in_l1rec (in_l1_rec),
      .inh_dllp (sopc_dlinhdllp),
      .l0sstate (ltssml0state),
      .lane_act (lane_act),
      .link_up (linkup),
      .npor (npor),
      .pm_event (pm_event_sopc),
      .pme_to_cr (pme_to_cr_sopc),
      .pme_to_sr (pme_to_sr),
      .req_phycfg (sopc_dlreqphycfg),
      .req_phypm (sopc_dlreqphypm),
      .req_upfc (sopc_dlrequpfc),
      .req_wake (sopc_dlreqwake),
      .rpbuf_emp (dlrpbufemp),
      .rstn (npor),
      .rx_data_vc1_0 (rx_st_data1),
      .rx_ecrcchk (sopc_dlrxecrcchk),
      .rx_st_be0 (rx_st_be0),
      .rx_st_data0 (rx_st_data0),
      .rx_st_eop0 (rx_st_eop0),
      .rx_st_ready0 (rx_st_ready0_sopc),
      .rx_st_sop0 (rx_st_sop0),
      .rx_st_valid0 (rx_st_valid0),
      .rx_typ_pm (dlrxtyppm),
      .rx_val_pm (dlrxvalpm),
      .slotclk_cfg (tl_slotclk_cfg),
      .snd_upfc (sopc_dlsndupfc),
      .swdn_hotrst (swdn_hotrst),
      .swdn_int (swdn_in_sopc),
      .swup_int (swup_in_sopc),
      .test_in (test_in_sopc),
      .tx_ack_pm (dltxackpm),
      .tx_req_pm (sopc_dltxreqpm),
      .tx_st_data0 (tx_st_data0_sopc),
      .tx_st_eop0 (tx_st_eop0_sopc),
      .tx_st_err0 (tx_st_err0_sopc),
      .tx_st_ready0 (tx_st_ready0),
      .tx_st_sop0 (tx_st_sop0_sopc),
      .tx_st_valid0 (tx_st_valid0_sopc),
      .tx_typ_pm (sopc_dltxtyppm),
      .txcfg_extsy (sopc_dltxcfgextsy),
      .typ_upfc (sopc_dltypupfc),
      .usrst (srst),
      .vc_status (dlvcstatus),
      .vcid_map (sopc_dlvcidmap),
      .vcid_upfc (sopc_dlvcidupfc)
    );

  defparam tlbp_app.CB_A2P_ADDR_MAP_FIXED_TABLE = CB_A2P_ADDR_MAP_FIXED_TABLE_INT,
           tlbp_app.CB_A2P_ADDR_MAP_IS_FIXED = CB_A2P_ADDR_MAP_IS_FIXED,
           tlbp_app.CB_A2P_ADDR_MAP_NUM_ENTRIES = CB_A2P_ADDR_MAP_NUM_ENTRIES,
           tlbp_app.CB_A2P_ADDR_MAP_PASS_THRU_BITS = CB_A2P_ADDR_MAP_PASS_THRU_BITS,
           tlbp_app.CB_P2A_AVALON_ADDR_B0 = CB_P2A_AVALON_ADDR_B0,
           tlbp_app.CB_P2A_AVALON_ADDR_B1 = CB_P2A_AVALON_ADDR_B1,
           tlbp_app.CB_P2A_AVALON_ADDR_B2 = CB_P2A_AVALON_ADDR_B2,
           tlbp_app.CB_P2A_AVALON_ADDR_B3 = CB_P2A_AVALON_ADDR_B3,
           tlbp_app.CB_P2A_AVALON_ADDR_B4 = CB_P2A_AVALON_ADDR_B4,
           tlbp_app.CB_P2A_AVALON_ADDR_B5 = CB_P2A_AVALON_ADDR_B5,
           tlbp_app.CB_PCIE_MODE = CB_PCIE_MODE,
           tlbp_app.CG_AVALON_S_ADDR_WIDTH = CG_AVALON_S_ADDR_WIDTH,
           tlbp_app.CG_COMMON_CLOCK_MODE = CG_COMMON_CLOCK_MODE,
           tlbp_app.CG_IMPL_CRA_AV_SLAVE_PORT = CG_IMPL_CRA_AV_SLAVE_PORT,
           tlbp_app.INTENDED_DEVICE_FAMILY = INTENDED_DEVICE_FAMILY,
           tlbp_app.RH_NUM = RH_NUM,
           tlbp_app.RX_BUF = RX_BUF,
           tlbp_app.advanced_errors = advanced_errors,
           tlbp_app.bar0_64bit_mem_space = bar0_64bit_mem_space,
           tlbp_app.bar0_io_space = bar0_io_space,
           tlbp_app.bar0_prefetchable = bar0_prefetchable,
           tlbp_app.bar0_size_mask = bar0_size_mask,
           tlbp_app.bar1_64bit_mem_space = bar1_64bit_mem_space,
           tlbp_app.bar1_io_space = bar1_io_space,
           tlbp_app.bar1_prefetchable = bar1_prefetchable,
           tlbp_app.bar1_size_mask = bar1_size_mask,
           tlbp_app.bar2_64bit_mem_space = bar2_64bit_mem_space,
           tlbp_app.bar2_io_space = bar2_io_space,
           tlbp_app.bar2_prefetchable = bar2_prefetchable,
           tlbp_app.bar2_size_mask = bar2_size_mask,
           tlbp_app.bar3_64bit_mem_space = bar3_64bit_mem_space,
           tlbp_app.bar3_io_space = bar3_io_space,
           tlbp_app.bar3_prefetchable = bar3_prefetchable,
           tlbp_app.bar3_size_mask = bar3_size_mask,
           tlbp_app.bar4_64bit_mem_space = bar4_64bit_mem_space,
           tlbp_app.bar4_io_space = bar4_io_space,
           tlbp_app.bar4_prefetchable = bar4_prefetchable,
           tlbp_app.bar4_size_mask = bar4_size_mask,
           tlbp_app.bar5_64bit_mem_space = bar5_64bit_mem_space,
           tlbp_app.bar5_io_space = bar5_io_space,
           tlbp_app.bar5_prefetchable = bar5_prefetchable,
           tlbp_app.bar5_size_mask = bar5_size_mask,
           tlbp_app.bar_io_window_size = bar_io_window_size,
           tlbp_app.bar_prefetchable = bar_prefetchable,
           tlbp_app.bridge_port_ssid_support = bridge_port_ssid_support,
           tlbp_app.bridge_port_vga_enable = bridge_port_vga_enable,
           tlbp_app.bypass_cdc = bypass_cdc,
           tlbp_app.bypass_tl = bypass_tl,
           tlbp_app.class_code = class_code,
           tlbp_app.completion_timeout = completion_timeout,
           tlbp_app.core_clk_divider = core_clk_divider,
           tlbp_app.core_clk_source = core_clk_source,
           tlbp_app.credit_buffer_allocation_aux = credit_buffer_allocation_aux,
           tlbp_app.deemphasis_enable = deemphasis_enable,
           tlbp_app.device_id = device_id,
           tlbp_app.device_number = device_number,
           tlbp_app.diffclock_nfts_count = diffclock_nfts_count,
           tlbp_app.disable_cdc_clk_ppm = disable_cdc_clk_ppm,
           tlbp_app.disable_link_x2_support = disable_link_x2_support,
           tlbp_app.disable_snoop_packet = disable_snoop_packet,
           tlbp_app.dll_active_report_support = dll_active_report_support,
           tlbp_app.ei_delay_powerdown_count = ei_delay_powerdown_count,
           tlbp_app.eie_before_nfts_count = eie_before_nfts_count,
           tlbp_app.enable_adapter_half_rate_mode = enable_adapter_half_rate_mode,
           tlbp_app.enable_ch0_pclk_out = enable_ch0_pclk_out,
           tlbp_app.enable_completion_timeout_disable = enable_completion_timeout_disable,
           tlbp_app.enable_coreclk_out_half_rate = enable_coreclk_out_half_rate,
           tlbp_app.enable_ecrc_check = enable_ecrc_check,
           tlbp_app.enable_ecrc_gen = enable_ecrc_gen,
           tlbp_app.enable_function_msi_support = enable_function_msi_support,
           tlbp_app.enable_function_msix_support = enable_function_msix_support,
           tlbp_app.enable_gen2_core = enable_gen2_core,
           tlbp_app.enable_l1_aspm = enable_l1_aspm,
           tlbp_app.enable_msi_64bit_addressing = enable_msi_64bit_addressing,
           tlbp_app.enable_msi_masking = enable_msi_masking,
           tlbp_app.enable_retrybuf_ecc = enable_retrybuf_ecc,
           tlbp_app.enable_rx0buf_ecc = enable_rx0buf_ecc,
           tlbp_app.enable_rx_buffer_checking = enable_rx_buffer_checking,
           tlbp_app.enable_rx_reordering = enable_rx_reordering,
           tlbp_app.enable_slot_register = enable_slot_register,
           tlbp_app.endpoint_l0_latency = endpoint_l0_latency,
           tlbp_app.endpoint_l1_latency = endpoint_l1_latency,
           tlbp_app.expansion_base_address_register = expansion_base_address_register,
           tlbp_app.extend_tag_field = extend_tag_field,
           tlbp_app.fc_init_timer = fc_init_timer,
           tlbp_app.flow_control_timeout_count = flow_control_timeout_count,
           tlbp_app.flow_control_update_count = flow_control_update_count,
           tlbp_app.gen2_diffclock_nfts_count = gen2_diffclock_nfts_count,
           tlbp_app.gen2_lane_rate_mode = gen2_lane_rate_mode,
           tlbp_app.gen2_sameclock_nfts_count = gen2_sameclock_nfts_count,
           tlbp_app.hot_plug_support = hot_plug_support,
           tlbp_app.indicator = indicator,
           tlbp_app.l01_entry_latency = l01_entry_latency,
           tlbp_app.l0_exit_latency_diffclock = l0_exit_latency_diffclock,
           tlbp_app.l0_exit_latency_sameclock = l0_exit_latency_sameclock,
           tlbp_app.l1_exit_latency_diffclock = l1_exit_latency_diffclock,
           tlbp_app.l1_exit_latency_sameclock = l1_exit_latency_sameclock,
           tlbp_app.lane_mask = lane_mask,
           tlbp_app.low_priority_vc = low_priority_vc,
           tlbp_app.max_link_width = max_link_width,
           tlbp_app.max_payload_size = max_payload_size,
           tlbp_app.maximum_current = maximum_current,
           tlbp_app.millisecond_cycle_count = millisecond_cycle_count,
           tlbp_app.msi_function_count = msi_function_count,
           tlbp_app.msix_pba_bir = msix_pba_bir,
           tlbp_app.msix_pba_offset = msix_pba_offset,
           tlbp_app.msix_table_bir = msix_table_bir,
           tlbp_app.msix_table_offset = msix_table_offset,
           tlbp_app.msix_table_size = msix_table_size,
           tlbp_app.no_command_completed = no_command_completed,
           tlbp_app.no_soft_reset = no_soft_reset,
           tlbp_app.pcie_mode = pcie_mode,
           tlbp_app.pme_state_enable = pme_state_enable,
           tlbp_app.port_link_number = port_link_number,
           tlbp_app.register_pipe_signals = register_pipe_signals,
           tlbp_app.retry_buffer_last_active_address = retry_buffer_last_active_address,
           tlbp_app.retry_buffer_memory_settings = retry_buffer_memory_settings,
           tlbp_app.revision_id = revision_id,
           tlbp_app.rx_ptr0_nonposted_dpram_max = rx_ptr0_nonposted_dpram_max,
           tlbp_app.rx_ptr0_nonposted_dpram_min = rx_ptr0_nonposted_dpram_min,
           tlbp_app.rx_ptr0_posted_dpram_max = rx_ptr0_posted_dpram_max,
           tlbp_app.rx_ptr0_posted_dpram_min = rx_ptr0_posted_dpram_min,
           tlbp_app.rx_ptr1_nonposted_dpram_max = rx_ptr1_nonposted_dpram_max,
           tlbp_app.rx_ptr1_nonposted_dpram_min = rx_ptr1_nonposted_dpram_min,
           tlbp_app.rx_ptr1_posted_dpram_max = rx_ptr1_posted_dpram_max,
           tlbp_app.rx_ptr1_posted_dpram_min = rx_ptr1_posted_dpram_min,
           tlbp_app.sameclock_nfts_count = sameclock_nfts_count,
           tlbp_app.single_rx_detect = single_rx_detect,
           tlbp_app.skp_os_schedule_count = skp_os_schedule_count,
           tlbp_app.slot_number = slot_number,
           tlbp_app.slot_power_limit = slot_power_limit,
           tlbp_app.slot_power_scale = slot_power_scale,
           tlbp_app.ssid = ssid,
           tlbp_app.ssvid = ssvid,
           tlbp_app.subsystem_device_id = subsystem_device_id,
           tlbp_app.subsystem_vendor_id = subsystem_vendor_id,
           tlbp_app.surprise_down_error_support = surprise_down_error_support,
           tlbp_app.use_crc_forwarding = use_crc_forwarding,
           tlbp_app.vc0_clk_enable = vc0_clk_enable,
           tlbp_app.vc0_rx_buffer_memory_settings = vc0_rx_buffer_memory_settings,
           tlbp_app.vc0_rx_flow_ctrl_compl_data = vc0_rx_flow_ctrl_compl_data,
           tlbp_app.vc0_rx_flow_ctrl_compl_header = vc0_rx_flow_ctrl_compl_header,
           tlbp_app.vc0_rx_flow_ctrl_nonposted_data = vc0_rx_flow_ctrl_nonposted_data,
           tlbp_app.vc0_rx_flow_ctrl_nonposted_header = vc0_rx_flow_ctrl_nonposted_header,
           tlbp_app.vc0_rx_flow_ctrl_posted_data = vc0_rx_flow_ctrl_posted_data,
           tlbp_app.vc0_rx_flow_ctrl_posted_header = vc0_rx_flow_ctrl_posted_header,
           tlbp_app.vc1_clk_enable = vc1_clk_enable,
           tlbp_app.vc1_rx_buffer_memory_settings = vc1_rx_buffer_memory_settings,
           tlbp_app.vc1_rx_flow_ctrl_compl_data = vc1_rx_flow_ctrl_compl_data,
           tlbp_app.vc1_rx_flow_ctrl_compl_header = vc1_rx_flow_ctrl_compl_header,
           tlbp_app.vc1_rx_flow_ctrl_nonposted_data = vc1_rx_flow_ctrl_nonposted_data,
           tlbp_app.vc1_rx_flow_ctrl_nonposted_header = vc1_rx_flow_ctrl_nonposted_header,
           tlbp_app.vc1_rx_flow_ctrl_posted_data = vc1_rx_flow_ctrl_posted_data,
           tlbp_app.vc1_rx_flow_ctrl_posted_header = vc1_rx_flow_ctrl_posted_header,
           tlbp_app.vc_arbitration = vc_arbitration,
           tlbp_app.vc_enable = vc_enable,
           tlbp_app.vendor_id = vendor_id;
end
endgenerate




generate
if ((TL_SELECTION == 1) & (AST_LITE == 1))
begin : avalon_lite_hip_sopc
	
	 pciexp_dcram quartus_compile_ram
    (
      .q (nowhere)
    );

	
  altpciexpav_lite_app lite_app
    (
      .AppIntSts_o (app_int_sts_sopc),
      .CfgAddr_i (tl_cfg_add),
      .CfgCtlWr_i (tl_cfg_ctl_wr),
      .CfgCtl_i (tl_cfg_ctl),
      .Clk_i (pld_clk),
      .MsiAck_i (app_msi_ack),
      .MsiNum_o (aer_msi_num_sopc),
      .MsiReq_o (app_msi_req_sopc),
      .MsiTc_o (app_msi_tc_sopc),
      .Rstn_i (srstn),
      .RxStBarDec_i (rx_st_bardec0),
      .RxStData_i (rx_st_data0),
      .RxStEmpty_i (rx_fifo_empty0),
      .RxStEop_i (rx_st_eop0),
      .RxStReady_o (rx_st_ready0_sopc),
      .RxStSop_i (rx_st_sop0),
      .RxStValid_i (rx_st_valid0),
      .RxmAddress_o (RxmAddress_o),
      .RxmByteEnable_o (RxmByteEnable_o[3 : 0]),
      .RxmIrq_i (RxmIrq_i),
      .RxmReadDataValid_i (RxmReadDataValid_i),
      .RxmReadData_i (RxmReadData_i[31 : 0]),
      .RxmRead_o (RxmRead_o),
      .RxmWaitRequest_i (RxmWaitRequest_i),
      .RxmWriteData_o (RxmWriteData_o[31 : 0]),
      .RxmWrite_o (RxmWrite_o),
      .TxStData_o (tx_st_data0_sopc),
      .TxStEop_o (tx_st_eop0_sopc),
      .TxStReady_i (tx_st_ready0),
      .TxStSop_o (tx_st_sop0_sopc),
      .TxStValid_o (tx_st_valid0_sopc)
    );

  defparam lite_app.CB_P2A_AVALON_ADDR_B0 = CB_P2A_AVALON_ADDR_B0,
           lite_app.CB_P2A_AVALON_ADDR_B1 = CB_P2A_AVALON_ADDR_B1,
           lite_app.CB_P2A_AVALON_ADDR_B2 = CB_P2A_AVALON_ADDR_B2,
           lite_app.CB_P2A_AVALON_ADDR_B3 = CB_P2A_AVALON_ADDR_B3,
           lite_app.CB_P2A_AVALON_ADDR_B4 = CB_P2A_AVALON_ADDR_B4,
           lite_app.CB_P2A_AVALON_ADDR_B5 = CB_P2A_AVALON_ADDR_B5,
           lite_app.bar0_64bit_mem_space = bar0_64bit_mem_space,
           lite_app.bar0_io_space = bar0_io_space,
           lite_app.bar0_prefetchable = bar0_prefetchable,
           lite_app.bar0_size_mask = bar0_size_mask,
           lite_app.bar1_64bit_mem_space = bar1_64bit_mem_space,
           lite_app.bar1_io_space = bar1_io_space,
           lite_app.bar1_prefetchable = bar1_prefetchable,
           lite_app.bar1_size_mask = bar1_size_mask,
           lite_app.bar2_64bit_mem_space = bar2_64bit_mem_space,
           lite_app.bar2_io_space = bar2_io_space,
           lite_app.bar2_prefetchable = bar2_prefetchable,
           lite_app.bar2_size_mask = bar2_size_mask,
           lite_app.bar3_64bit_mem_space = bar3_64bit_mem_space,
           lite_app.bar3_io_space = bar3_io_space,
           lite_app.bar3_prefetchable = bar3_prefetchable,
           lite_app.bar3_size_mask = bar3_size_mask,
           lite_app.bar4_64bit_mem_space = bar4_64bit_mem_space,
           lite_app.bar4_io_space = bar4_io_space,
           lite_app.bar4_prefetchable = bar4_prefetchable,
           lite_app.bar4_size_mask = bar4_size_mask,
           lite_app.bar5_64bit_mem_space = bar5_64bit_mem_space,
           lite_app.bar5_io_space = bar5_io_space,
           lite_app.bar5_prefetchable = bar5_prefetchable,
           lite_app.bar5_size_mask = bar5_size_mask,
           lite_app.bar_io_window_size = bar_io_window_size,
           lite_app.bar_prefetchable = bar_prefetchable,
           lite_app.base_address = base_address,
           lite_app.expansion_base_address_register = expansion_base_address_register;
end
endgenerate




generate
if ((TL_SELECTION == 1) & (AST_LITE == 2))
begin : avalon_stream_hip_sopc
	
	 pciexp_dcram quartus_compile_ram
    (
      .q (nowhere)
    );

  altpciexpav_stif_app stif_app
    (
      .CfgAddr_i (tl_cfg_add),
      .CfgCtlWr_i (tl_cfg_ctl_wr),
      .CfgCtl_i (tl_cfg_ctl),
      .CplPending_o (cpl_pending_sopc),
      .CraAddress_i (CraAddress_i),
      .CraByteEnable_i (CraByteEnable_i),
      .CraChipSelect_i (CraChipSelect_i),
      .CraClk_i (AvlClk_i),
      .CraIrq_o (CraIrq_o),
      .CraRead (CraRead),
      .CraReadData_o (CraReadData_o),
      .CraRstn_i (Rstn_i),
      .CraWaitRequest_o (CraWaitRequest_o),
      .CraWrite (CraWrite),
      .CraWriteData_i (CraWriteData_i),
      .MsiAck_i (app_msi_ack),
      .MsiNum_o (aer_msi_num_sopc),
      .MsiReq_o (app_msi_req_sopc),
      .MsiTc_o (app_msi_tc_sopc),
      .IntxReq_o(app_int_sts_sopc),
      .IntxAck_i(app_int_ack),
      .Rstn_i (srstn),
      .RxStBarDec1_i (rx_st_bardec0),
      .RxStBe_i (rx_st_be0),
      .RxStData_i (rx_st_data0),
      .RxStEmpty_i (2'b00),
      .RxStEop_i (rx_st_eop0),
      .RxStErr_i (8'h00),
      .RxStMask_o (rx_st_mask0_sopc),
      .RxStParity_i (32'h00000000),
      .RxStReady_o (rx_st_ready0_sopc),
      .RxStSop_i (rx_st_sop0),
      .RxStValid_i (rx_st_valid0),
      .RxmAddress_o (RxmAddress_o),
      .RxmBurstCount_o (RxmBurstCount_o),
      .RxmByteEnable_o (RxmByteEnable_o),
      .RxmClk_i (AvlClk_i),
      .RxmIrqNum_i (RxmIrqNum_i),
      .RxmIrq_i (RxmIrq_i),
      .RxmReadDataValid_i (RxmReadDataValid_i),
      .RxmReadData_i (RxmReadData_i),
      .RxmRead_o (RxmRead_o),
      .RxmRstn_i (Rstn_i),
      .RxmWaitRequest_i (RxmWaitRequest_i),
      .RxmWriteData_o (RxmWriteData_o),
      .RxmWrite_o (RxmWrite_o),
      .TlpClk_i (pld_clk),
      .TxCredit_i (tx_cred0),
      .TxNpCredOne_i(nph_alloc_1cred_vc0),
      .TxStData_o (tx_st_data0_sopc),
      .TxStEop_o (tx_st_eop0_sopc),
      .TxStErr_o (tx_st_err0_sopc),
      .TxStReady_i (tx_st_ready0),
      .TxStSop_o (tx_st_sop0_sopc),
      .TxStValid_o (tx_st_valid0_sopc),
      .TxAdapterFifoEmpty_i(tx_fifo_empty0),
      .TxsAddress_i (TxsAddress_i),
      .TxsBurstCount_i (TxsBurstCount_i),
      .TxsByteEnable_i (TxsByteEnable_i),
      .TxsChipSelect_i (TxsChipSelect_i),
      .TxsClk_i (AvlClk_i),
      .TxsReadDataValid_o (TxsReadDataValid_o),
      .TxsReadData_o (TxsReadData_o),
      .TxsRead_i (TxsRead_i),
      .TxsRstn_i (Rstn_i),
      .TxsWaitRequest_o (TxsWaitRequest_o),
      .TxsWriteData_i (TxsWriteData_i),
      .TxsWrite_i (TxsWrite_i)
    );

  defparam stif_app.CB_A2P_ADDR_MAP_FIXED_TABLE = CB_A2P_ADDR_MAP_FIXED_TABLE_INT,
           stif_app.CB_A2P_ADDR_MAP_IS_FIXED = CB_A2P_ADDR_MAP_IS_FIXED,
           stif_app.CB_A2P_ADDR_MAP_NUM_ENTRIES = CB_A2P_ADDR_MAP_NUM_ENTRIES,
           stif_app.CB_A2P_ADDR_MAP_PASS_THRU_BITS = CB_A2P_ADDR_MAP_PASS_THRU_BITS,
           stif_app.CB_P2A_AVALON_ADDR_B0 = CB_P2A_AVALON_ADDR_B0,
           stif_app.CB_P2A_AVALON_ADDR_B1 = CB_P2A_AVALON_ADDR_B1,
           stif_app.CB_P2A_AVALON_ADDR_B2 = CB_P2A_AVALON_ADDR_B2,
           stif_app.CB_P2A_AVALON_ADDR_B3 = CB_P2A_AVALON_ADDR_B3,
           stif_app.CB_P2A_AVALON_ADDR_B4 = CB_P2A_AVALON_ADDR_B4,
           stif_app.CB_P2A_AVALON_ADDR_B5 = CB_P2A_AVALON_ADDR_B5,
           stif_app.CB_PCIE_MODE = CB_PCIE_MODE,
           stif_app.CG_AVALON_S_ADDR_WIDTH = CG_AVALON_S_ADDR_WIDTH,
           stif_app.CG_COMMON_CLOCK_MODE = CG_COMMON_CLOCK_MODE,
           stif_app.CG_IMPL_CRA_AV_SLAVE_PORT = CG_IMPL_CRA_AV_SLAVE_PORT,
           stif_app.CG_ENABLE_A2P_INTERRUPT = CG_ENABLE_A2P_INTERRUPT,
           stif_app.CG_RXM_IRQ_NUM = CG_RXM_IRQ_NUM,
           stif_app.INTENDED_DEVICE_FAMILY = INTENDED_DEVICE_FAMILY,
           stif_app.bar0_64bit_mem_space = bar0_64bit_mem_space,
           stif_app.bar0_io_space = bar0_io_space,
           stif_app.bar0_prefetchable = bar0_prefetchable,
           stif_app.bar0_size_mask = bar0_size_mask,
           stif_app.bar1_64bit_mem_space = bar1_64bit_mem_space,
           stif_app.bar1_io_space = bar1_io_space,
           stif_app.bar1_prefetchable = bar1_prefetchable,
           stif_app.bar1_size_mask = bar1_size_mask,
           stif_app.bar2_64bit_mem_space = bar2_64bit_mem_space,
           stif_app.bar2_io_space = bar2_io_space,
           stif_app.bar2_prefetchable = bar2_prefetchable,
           stif_app.bar2_size_mask = bar2_size_mask,
           stif_app.bar3_64bit_mem_space = bar3_64bit_mem_space,
           stif_app.bar3_io_space = bar3_io_space,
           stif_app.bar3_prefetchable = bar3_prefetchable,
           stif_app.bar3_size_mask = bar3_size_mask,
           stif_app.bar4_64bit_mem_space = bar4_64bit_mem_space,
           stif_app.bar4_io_space = bar4_io_space,
           stif_app.bar4_prefetchable = bar4_prefetchable,
           stif_app.bar4_size_mask = bar4_size_mask,
           stif_app.bar5_64bit_mem_space = bar5_64bit_mem_space,
           stif_app.bar5_io_space = bar5_io_space,
           stif_app.bar5_prefetchable = bar5_prefetchable,
           stif_app.bar5_size_mask = bar5_size_mask,
           stif_app.bar_io_window_size = bar_io_window_size,
           stif_app.bar_prefetchable = bar_prefetchable,
           stif_app.expansion_base_address_register = expansion_base_address_register,
           stif_app.CG_IRQ_BIT_ENA = CG_IRQ_BIT_ENA,
            stif_app.CG_NO_CPL_REORDERING = CG_NO_CPL_REORDERING;
end
endgenerate


  altpcie_txcred_patch txcred_patch0
    (
      .clk (pld_clk),
      .npd_alloc_1cred (npd_alloc_1cred_vc0),
      .npd_cred_viol (npd_cred_vio_vc0),
      .nph_alloc_1cred (nph_alloc_1cred_vc0),
      .nph_cred_viol (nph_cred_vio_vc0),
      .rstn (npor),
      .srst (srst),
      .tx_cred (tx_cred0),
      .tx_cred_int (tx_cred0_int),
      .tx_st_data (tx_st_data0_int[31 : 0]),
      .tx_st_eop ({tx_st_eop0_p1, tx_st_eop0_int}),
      .tx_st_err (tx_st_err0_int),
      .tx_st_sop (tx_st_sop0_int),
      .tx_stream_valid (tx_st_valid0_int)
    );

  defparam txcred_patch0.BYP_PATCH = (p_pcie_hip_type == "2") ? 1 : 0,
           txcred_patch0.enable_adapter_half_rate_mode = enable_adapter_half_rate_mode;

  altpcie_txcred_patch txcred_patch1
    (
      .clk (pld_clk),
      .npd_alloc_1cred (npd_alloc_1cred_vc1),
      .npd_cred_viol (npd_cred_vio_vc1),
      .nph_alloc_1cred (nph_alloc_1cred_vc1),
      .nph_cred_viol (nph_cred_vio_vc1),
      .rstn (npor),
      .srst (srst),
      .tx_cred (tx_cred1),
      .tx_cred_int (tx_cred1_int),
      .tx_st_data (tx_st_data1_int[31 : 0]),
      .tx_st_eop ({tx_st_eop1_p1, tx_st_eop1}),
      .tx_st_err (tx_st_err1),
      .tx_st_sop (tx_st_sop1_int),
      .tx_stream_valid (tx_st_valid1_int)
    );

  defparam txcred_patch1.BYP_PATCH = (p_pcie_hip_type == "2") ? 1 : 0,
           txcred_patch1.enable_adapter_half_rate_mode = enable_adapter_half_rate_mode;


  altpcie_tl_cfg_pipe altpcie_tl_cfg_pipe_inst
    (
     .clk (pld_clk),
     .srst (srst),
     .o_tl_cfg_add(tl_cfg_add),
     .o_tl_cfg_ctl(tl_cfg_ctl),
     .o_tl_cfg_ctl_wr(tl_cfg_ctl_wr),
     .o_tl_cfg_sts(tl_cfg_sts),
     .o_tl_cfg_sts_wr(tl_cfg_sts_wr),
     .i_tl_cfg_add(tl_cfg_add_hip),
     .i_tl_cfg_ctl(tl_cfg_ctl_hip),
     .i_tl_cfg_ctl_wr(tl_cfg_ctl_wr_hip),
     .i_tl_cfg_sts(tl_cfg_sts_hip),
     .i_tl_cfg_sts_wr(tl_cfg_sts_wr_hip)
    );     

endmodule

// synthesis VERILOG_INPUT_VERSION VERILOG_2001
//////////////////////////////////////////////////////////////////////////////////////////////
//
// Verilog file generated by X-HDL - Revision 3.2.54  Aug. 8, 2005
// Fri Nov  4 10:07:57 2005
//
//      Input file         : D:/cvs_build/projects/pci_express_r1/altera/src/vhdl/top/alt4gxb_reset_controller.vhd
//      Design name        : alt4gxb_reset_controller
//      Author             :
//      Company            :
//
//      Description        :
//
//
//////////////////////////////////////////////////////////////////////////////////////////////
//
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//      Logic Core:  PCI Express Megacore Function
//         Company:  Altera Corporation.
//                       www.altera.com
//          Author:  IPBU SIO Group
//
//     Description:  Altera PCI Express MegaCore Reset controller for Alt2gxb
//
// Copyright (c) 2005 Altera Corporation. All rights reserved.  This source code
// is highly confidential and proprietary information of Altera and is being
// provided in accordance with and subject to the protections of a
// Non-Disclosure Agreement which governs its use and disclosure.  Altera
// products and services are protected under numerous U.S. and foreign patents,
// maskwork rights, copyrights and other intellectual property laws.  Altera
// assumes no responsibility or liability arising out of the application or use
// of this source code.
//
// For Best Viewing Set tab stops to 4 spaces.
//
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// Reset Controller for the ALT2GXB
//
//
module alt4gxb_reset_controller
  (input inclk,
   input async_reset,
   input test_sim,
   input pll_locked,
   input rx_pll_locked,
   input fifo_err,
   input inclk_eq_125mhz,
   output gxb_powerdown,
   output txdigitalreset,
   output rxanalogreset,
   output rxdigitalreset
) ;

   localparam [19:0] WS_SIM = 20'h00020;
   localparam [19:0] WS_1MS_10000 = 20'h186a0;
   localparam [19:0] WS_1MS_12500 = 20'h1e848;
   localparam [19:0] WS_1MS_15625 = 20'h2625a;
   localparam [19:0] WS_1MS_25000 = 20'h3d090;
   localparam [1:0] idle = 0;
   localparam [1:0] strobe_txpll_locked = 1;
   localparam [1:0] stable_tx_pll = 2;
   localparam [1:0] wait_state = 3;
// Suppressing R102 here because gxb_powredown takes out the whole alt2gxb and no clock
// will be running
  (* syn_encoding = "user" *)  reg  [1:0] rst_ctrl_sm /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL =R102" */ ;
   reg [19:0] waitstate_timer /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL =R102" */ ;

   reg txdigitalreset_r /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL =R102" */ ;
   reg rxanalogreset_r /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL =R102" */ ;
   reg rxdigitalreset_r /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL =R102" */ ;
   reg ws_tmr_eq_0 /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL =R102" */ ;
   reg ld_ws_tmr /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL =R102" */ ;
   reg ld_ws_tmr_short /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL =R102" */ ;
   reg    [2:0] rx_pll_locked_cnt /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL =R102" */ ;
   reg        rx_pll_locked_sync_r /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL =R102" */ ;

   wire pll_locked_sync;
   reg [2:0] pll_locked_r;

   wire rx_pll_locked_sync;
   reg [2:0] rx_pll_locked_r;

   assign gxb_powerdown  = async_reset ;
   assign txdigitalreset = txdigitalreset_r ;
   assign rxanalogreset  = rxanalogreset_r ;
   assign rxdigitalreset = rxdigitalreset_r ;

   // Synchronize rx_pll_locked and pll_locked to inclk
   always @(posedge inclk or posedge async_reset) begin
      if (async_reset == 1'b1) begin
         rx_pll_locked_r[2:0] <= 3'b000;
         pll_locked_r[2:0]    <= 3'b000;
      end
      else begin
         rx_pll_locked_r[2:0] <= {rx_pll_locked_r[1],rx_pll_locked_r[0],rx_pll_locked};
         pll_locked_r[2:0]    <= {pll_locked_r[1]   ,pll_locked_r[0]   ,pll_locked};
      end
   end
   assign rx_pll_locked_sync = rx_pll_locked_r[2];
   assign pll_locked_sync = pll_locked_r[2];

   always @(posedge inclk or posedge async_reset)
   begin
      if (async_reset == 1'b1)
      begin
         txdigitalreset_r <= 1'b1 ;
         rxanalogreset_r  <= 1'b1 ;
         rxdigitalreset_r <= 1'b1 ;
         waitstate_timer  <= 20'hFFFFF ;
         rst_ctrl_sm      <= strobe_txpll_locked ;
         ws_tmr_eq_0      <= 1'b0 ;
         ld_ws_tmr        <= 1'b1 ;
         ld_ws_tmr_short  <= 1'b0 ;
      rx_pll_locked_cnt <= 3'h0;
      rx_pll_locked_sync_r <= 1'b0;
      end
      else
   begin
   // add hysterisis for losing lock
   if (rx_pll_locked_sync == 1'b1)
     rx_pll_locked_cnt <= 3'h7;
   else if (rx_pll_locked_cnt == 3'h0)
     rx_pll_locked_cnt <= 3'h0;
   else if (rx_pll_locked_sync == 1'b0)
     rx_pll_locked_cnt <= rx_pll_locked_cnt - 1;

   rx_pll_locked_sync_r <= (rx_pll_locked_cnt != 3'h0);

         if (ld_ws_tmr == 1'b1)
         begin
            if (test_sim == 1'b1)
            begin
               waitstate_timer <= WS_SIM ;
            end
            else if (inclk_eq_125mhz == 1'b1)
         begin
              waitstate_timer <= WS_1MS_12500 ;
         end
       else
              begin
              waitstate_timer <= WS_1MS_25000 ;
              end
         end
         else if (ld_ws_tmr_short == 1'b1)
      waitstate_timer <= WS_SIM ;
         else if (waitstate_timer != 20'h00000)
         begin
            waitstate_timer <= waitstate_timer - 1 ;
         end
         if (ld_ws_tmr == 1'b1 | ld_ws_tmr_short)
         begin
            ws_tmr_eq_0 <= 1'b0 ;
         end
         else if (waitstate_timer == 20'h00000)
         begin
            ws_tmr_eq_0 <= 1'b1 ;
         end
         else
         begin
            ws_tmr_eq_0 <= 1'b0 ;
         end
         case (rst_ctrl_sm)
            idle :
                     begin
                        if (rx_pll_locked_sync_r == 1'b1)
                          begin
           if (fifo_err == 1'b1)
                            rst_ctrl_sm <= stable_tx_pll ;
           else
                           rst_ctrl_sm <= idle ;
                          end
                        else
                        begin
                           rst_ctrl_sm <= strobe_txpll_locked ;
                           ld_ws_tmr   <= 1'b1 ;
                        end
                     end
            strobe_txpll_locked :
                     begin
                        ld_ws_tmr <= 1'b0 ;
                        if (pll_locked_sync == 1'b1 & ws_tmr_eq_0 == 1'b1)
                        begin
                           rst_ctrl_sm      <= stable_tx_pll ;
                           txdigitalreset_r <= 1'b0 ;
                           rxanalogreset_r  <= 1'b0 ;
                           rxdigitalreset_r <= 1'b1 ;
                        end
                        else
                        begin
                           rst_ctrl_sm      <= strobe_txpll_locked ;
                           txdigitalreset_r <= 1'b1 ;
                           rxanalogreset_r  <= 1'b1 ;
                           rxdigitalreset_r <= 1'b1 ;
                        end
                     end
            stable_tx_pll :
                     begin
                        if (rx_pll_locked_sync_r == 1'b1)
                        begin
                           rst_ctrl_sm      <= wait_state ;
                           txdigitalreset_r <= 1'b0 ;
                           rxanalogreset_r  <= 1'b0 ;
                           rxdigitalreset_r <= 1'b1 ;
                           ld_ws_tmr_short  <= 1'b1 ;
                        end
                        else
                        begin
                           rst_ctrl_sm      <= stable_tx_pll ;
                           txdigitalreset_r <= 1'b0 ;
                           rxanalogreset_r  <= 1'b0 ;
                           rxdigitalreset_r <= 1'b1 ;
                        end
                     end
            wait_state :
                     begin
                        if (rx_pll_locked_sync_r == 1'b1)
                        begin
                           ld_ws_tmr_short <= 1'b0 ;
                           if (ld_ws_tmr_short == 1'b0 & ws_tmr_eq_0 == 1'b1)
                           begin
                              rst_ctrl_sm      <= idle ;
                              txdigitalreset_r <= 1'b0 ;
                              rxanalogreset_r  <= 1'b0 ;
                              rxdigitalreset_r <= 1'b0 ;
                           end
                           else
                           begin
                              rst_ctrl_sm      <= wait_state ;
                              txdigitalreset_r <= 1'b0 ;
                              rxanalogreset_r  <= 1'b0 ;
                              rxdigitalreset_r <= 1'b1 ;
                           end
                        end
                        else
                        begin
                           rst_ctrl_sm      <= stable_tx_pll ;
                           txdigitalreset_r <= 1'b0 ;
                           rxanalogreset_r  <= 1'b0 ;
                           rxdigitalreset_r <= 1'b1 ;
                        end
                     end
            default :
                     begin
                        rst_ctrl_sm     <= idle ;
                        waitstate_timer <= 20'hFFFFF ;
                     end
         endcase
      end
   end
endmodule
//Legal Notice: (C)2009 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.
// synthesis translate_off

`timescale 1ns / 1ps
// synthesis translate_on
// synthesis verilog_input_version verilog_2001
// turn off superfluous verilog processor warnings
// altera message_level Level1
// altera message_off 10034 10035 10036 10037 10230 10240 10030

//-----------------------------------------------------------------------------
// Title         : altpcie_txcred_patch
// Project       : PCI Express MegaCore function
//-----------------------------------------------------------------------------
// File          : altpcie_txcred_patch.v
// Author        : Altera Corporation
//-----------------------------------------------------------------------------
//
//  Description:  This module is a patch for the hip tx_cred
//-----------------------------------------------------------------------------



module altpcie_txcred_patch  # (
    parameter  enable_adapter_half_rate_mode = "false",    // 64 bit vs 128 bit AV-ST mode
    parameter  BYP_PATCH = 0    // Bypasses this patch - routes tx_cred back out as-is.
) (
   input             clk,
   input             rstn,
   input             srst,
   input [35:0]      tx_cred_int,        // tx_cred from HIP
   input             tx_stream_valid,    // means tx_st_data is valid
   input             tx_st_sop,          // Start of TLP
   input[1:0]        tx_st_eop,          // End of TLP
   input             tx_st_err,
   input[31:0]       tx_st_data,         // AV-ST Transmit data H0 (first Header DW on wire.

   output reg        nph_alloc_1cred,    // means NPH negotiated to 1 credit.  credit info is unreliable.
   output reg        npd_alloc_1cred,
   output reg        nph_cred_viol,      // Means application violated tx_cred -- patch is no longer reliable.
   output reg        npd_cred_viol,
   output[35:0]      tx_cred             // corrected tx_cred
   );

   localparam CONSUMED_LAT = 1;                                                      // # clks to delay nph_sent to sync consumed pointers in patch and adaptor.
   localparam AVST_128_BITMODE = (enable_adapter_half_rate_mode=="false") ? 0 : 1;   // AV-ST 128 bit mode

   reg[CONSUMED_LAT-1:0]  nph_sent_pipe;       // synchronization pipe for nph_sent (from AV-ST to reflection on adaptor's consumed pointer)
   reg[CONSUMED_LAT-1:0]  npd_sent_pipe;       // synchronization pipe for npd_sent (from AV-ST to reflection on adaptor's consumed pointer)
   wire[CONSUMED_LAT-1:0] nph_sent_pipe_n;     // synchronization pipe for nph_sent (from AV-ST to reflection on adaptor's consumed pointer)
   wire[CONSUMED_LAT-1:0] npd_sent_pipe_n;     // synchronization pipe for npd_sent (from AV-ST to reflection on adaptor's consumed pointer)

   reg [2:0]          nph_cred_app;            // NPH credits given to application (modified nph_cred_hip)
   reg [2:0]          npd_cred_app;            // NPD credits given to application (modified nph_cred_hip)

   reg[7:0]           nph_cred_cons;           // credits consumed counter

   reg[7:0]           nph_cred_avail,
                      nph_cred_avail_n;        // actual # of known available credits (which is later encoded to 3 bits).
   reg[11:0]          npd_cred_cons;           // credits consumed counter
   reg[11:0]          npd_cred_avail,
                      npd_cred_avail_n;        // actual # of known available credits (which is later encoded to 3 bits).

   reg                nph_unitialized;         // Means NPH credits is not yet initialized
   reg                npd_unitialized;         // Means NPD credits is not yet initialized

   wire               nph_sent;                // means a nonposted TLP was sent on AV-ST TX
   wire               npd_sent;                // means a nonposted TLP with data was sent on AV-ST TX
   wire               has_payld;               // means TLP has payload
   wire [2:0]         nph_cred_hip;            // NonPosted Header credits from HIP
   wire [2:0]         npd_cred_hip;            // NonPosted Data credits from HIP
   wire               cfg0;                    // TLP decoding
   wire               non_posted;              // TLP decoding
   reg [35:0]         tx_cred_reg;             // Registered version of tx_cred from HIP -- boundary reg
   reg                non_posted_hold;         // memorize if TLP is NP - hold for EOP
   reg                has_payld_hold;          // memorize if TLP has payload - hold for EOP
   wire               debug_128bitmode;
   reg                debug_bogus0_nph;
   reg                debug_bogus0_npd;
   wire[1:0]          tx_eop_int;
   wire               bogus_0_detect_nph_n;    // When 1, and tx_cred from HIP is 0, tx_cred is bogus
   wire               bogus_0_detect_npd_n;    // When 1, and tx_cred from HIP is 0, tx_cred is bogus


   reg              rstn_r /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R102 ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
   reg              rstn_rr /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R102 ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;

   assign debug_128bitmode = (enable_adapter_half_rate_mode=="false") ? 1'b0 : 1'b1;

   assign tx_eop_int = {tx_st_eop[0], (tx_st_eop[1] ^ tx_st_eop[0])} ;

   //--------------------------------------
   // tx_cred output:
   //  - pass Posted/CPL credits thru as-is
   //  - replace NP credits with patch

   assign tx_cred[35:21] = tx_cred_int[35:21];
   assign tx_cred[20:18] = (BYP_PATCH==1) ?  tx_cred_int[20:18] : npd_cred_app;
   assign tx_cred[17:15] = (BYP_PATCH==1) ?  tx_cred_int[17:15] : nph_cred_app;
   assign tx_cred[14:0]  = tx_cred_int[14:0];

   //------------------------
   // patch for NP creds

   assign nph_cred_hip = tx_cred_int[17:15];
   assign npd_cred_hip = tx_cred_int[20:18];

   //---------------------------------------------------
   // decoding for non_posted TLPs is
   // identical to HIP Adaptor --
   // do not count CFG0's for NP creds.

   assign cfg0 = (tx_st_data[29:24] == 6'b000100) ? 1'b1 : 1'b0 ;
   assign non_posted = (cfg0 == 1'b0 &
                       ((tx_st_data[30] == 1'b0 & tx_st_data[28:27] == 2'b00) |
                        (tx_st_data[30:29] == 2'b10 & tx_st_data[26:24] != 3'b000 & tx_st_data[28:27] == 2'b00))) ? 1'b1 : 1'b0 ;

   assign has_payld = tx_stream_valid & tx_st_sop & tx_st_data[30];

   // Count NPH creds on EOP
   // Mirror adaptor for tx_st_err behavior.
   assign nph_sent = (tx_stream_valid & tx_st_sop & |tx_eop_int & AVST_128_BITMODE) ? non_posted :
                     (tx_stream_valid & |tx_eop_int & ~tx_st_err)                   ? non_posted_hold : 1'b0;

   assign npd_sent = (tx_stream_valid & tx_st_sop & |tx_eop_int & AVST_128_BITMODE) ? (non_posted & has_payld) :
                     (tx_stream_valid & |tx_eop_int & ~tx_st_err)                   ? has_payld_hold : 1'b0;

   //------------------------------------------------
   //  Synchronization Pipes for nph_sent
   //   - This synchronizes the patch's internal cred_consumed
   //     pointer to the adaptor's cred_consumed pointer.
   //     They are cycle-to-cycle identical.
   //   - length of pipeline depends on CONSUMED_LAT

   generate
       if (CONSUMED_LAT>1) begin: gen_nph_sent_pipe
           assign nph_sent_pipe_n = {nph_sent, nph_sent_pipe[CONSUMED_LAT-1:1]};
       end
   endgenerate
   generate
       if (CONSUMED_LAT==1) begin: gen_nph_sent_del
           assign nph_sent_pipe_n = nph_sent;
       end
   endgenerate

   //--------------------------------------------------
   //  Synchronization Pipes for npd_sent
   generate
       if (CONSUMED_LAT>1) begin: gen_npd_sent_pipe
            assign npd_sent_pipe_n = {npd_sent, npd_sent_pipe[CONSUMED_LAT-1:1]};
       end
   endgenerate
   generate
       if (CONSUMED_LAT==1) begin: gen_npd_sent_del
             assign npd_sent_pipe_n = npd_sent;
       end
   endgenerate

   always @ (posedge clk or negedge rstn)
     begin
     if (rstn == 1'b0)
       begin
       rstn_r <= 1'b0;
       rstn_rr <= 1'b0;
       end
     else
       begin
       rstn_r <= 1'b1;
       rstn_rr <= rstn_r;
       end
     end


   always @ (posedge clk or negedge rstn_rr) begin
      if (~rstn_rr) begin
          nph_sent_pipe   <= {CONSUMED_LAT{1'b0}};
          nph_cred_app    <= 3'h0;
          nph_cred_avail  <= 8'h0;
          nph_cred_cons   <= 8'h0;
          npd_sent_pipe   <= {CONSUMED_LAT{1'b0}};
          npd_cred_app    <= 3'h0;
          npd_cred_avail  <= 12'h0;
          npd_cred_cons   <= 12'h0;
          nph_unitialized <= 1'b1;
          npd_unitialized <= 1'b1;
          nph_alloc_1cred  <= 1'b0;
          npd_alloc_1cred  <= 1'b0;
          nph_cred_viol    <= 1'b0;
          npd_cred_viol    <= 1'b0;
          tx_cred_reg      <= 36'h0;
          non_posted_hold  <= 1'b0;
          has_payld_hold   <= 1'b0;
      end
      else begin
          if (srst) begin
              nph_sent_pipe   <= {CONSUMED_LAT{1'b0}};
              nph_cred_app    <= 3'h0;
              nph_cred_avail  <= 8'h0;
              nph_cred_cons   <= 8'h0;
              npd_sent_pipe   <= {CONSUMED_LAT{1'b0}};
              npd_cred_app    <= 3'h0;
              npd_cred_avail  <= 12'h0;
              npd_cred_cons   <= 12'h0;
              nph_unitialized <= 1'b1;
              npd_unitialized <= 1'b1;
              nph_alloc_1cred  <= 1'b0;
              npd_alloc_1cred  <= 1'b0;
              nph_cred_viol    <= 1'b0;
              npd_cred_viol    <= 1'b0;
              tx_cred_reg      <= 36'h0;
              non_posted_hold  <= 1'b0;
              has_payld_hold   <= 1'b0;
          end
          else begin

              tx_cred_reg <= tx_cred_int;   // input boundary reg for Fmax

              //--------------------------------------
              // Memorize NP decoding from SOP cycle.
              // Hold for EOP.
              if (tx_stream_valid & tx_st_err) begin
                  non_posted_hold  <= 1'b0;
                  has_payld_hold   <= 1'b0;
              end
              else if (tx_stream_valid & tx_st_sop) begin
                  non_posted_hold  <= non_posted;
                  has_payld_hold   <= non_posted & has_payld;
              end

              //-----------------------------------
              // Detect initialized credits
              //  - Flag if only 1 credit is allocated.
              //  - Patch cannot be used for single credit systems
              //    because the patch withholds 1 cred from the user.

              if (nph_unitialized) begin
                  nph_unitialized <= (nph_cred_hip > 8'h0)  ? 1'b0 : 1'b1;
                  nph_alloc_1cred <= (nph_cred_hip == 8'h1) ? 1'b1 : 1'b0;
              end

              if (npd_unitialized) begin
                  npd_unitialized <= (npd_cred_hip > 8'h0)  ? 1'b0 : 1'b1;
                  npd_alloc_1cred <= (npd_cred_hip == 8'h1) ? 1'b1 : 1'b0;
              end
              //----------------------------------------------------
              // Track nph and npd credits consumed.
              // Should exactly shadow the cred_cons counter in HIP.

              nph_sent_pipe <= nph_sent_pipe_n;
              npd_sent_pipe <= npd_sent_pipe_n;

              nph_cred_cons <= nph_sent_pipe[0] ? nph_cred_cons + 8'h1 : nph_cred_cons;
              npd_cred_cons <= npd_sent_pipe[0] ? npd_cred_cons + 12'h1 : npd_cred_cons;

              //---------------------------------------------------
              // Credits available

              nph_cred_avail <= nph_cred_avail_n;
              npd_cred_avail <= npd_cred_avail_n;

              //----------------------------------------------------
              // Credits violated:  Means last credit in HIP has
              // been consumed, and the patch is no longer reliable.

              nph_cred_viol <= ((nph_cred_avail_n ==8'h0) & nph_sent) | nph_cred_viol;
              npd_cred_viol <= ((npd_cred_avail_n ==8'h0) & npd_sent) | npd_cred_viol;

              //----------------------------------------
              // tx_cred output stage.
              // Encode output to 3 bits, top out at 7.
                  //--------
                  // Header
                  if (nph_cred_avail_n > 8'h7) begin
                      nph_cred_app <= 3'h7;
                  end
                  else begin
                      nph_cred_app <= nph_cred_avail_n[2:0];
                  end

                  //--------
                  // Data
                  if (npd_cred_avail_n > 12'h7) begin
                      npd_cred_app <= 3'h7;
                  end
                  else begin
                      npd_cred_app <= npd_cred_avail_n[2:0];
                  end
          end
      end
   end


   //--------------------------------------
   // Calculate available credits

   // Turn ON detection for bogus 0 when NPH consumed
   // pointer is somewhere between 0 and 127.
   // Chose 64 because it is the middle.
   // Actually, any 0 that occurs when consumed!=0
   // is bogus.  But bogus 0 will not happen until
   // consumed pointer is somewhere in upper half of
   // it's value range.

   assign bogus_0_detect_nph_n = nph_cred_cons>8'h40;
   assign bogus_0_detect_npd_n = npd_cred_cons>12'h400;

   always @ (*) begin
              //----------------------------------------
              //  Detect 'bogus 0' on nph_cred_hip:
              //      - when cred_lim pointer in adaptor
              //        rolls over to 0
              //  Algorithm:
              //      - in normal op, withhold 1 cred
              //        from nph_cred_hip so that nph_cred_hip
              //        should never be 0 (except when cred_cons
              //        pointer rolls over and both pointers are at 0).
              //      - detect bogus 0 when cred_cons is in
              //        upper half of counter, and nph_cred_hip
              //        is 0 (i.e. counters are on different pages).
              //      - when bogus 0 detected, assume credit_limit pointer is
              //        at 0.  Give app (0-consumed) creds until
              //        cred_cons to rolls over to 0.
              //      - when cred_cons==0, then 2 clks later, tx_cred
              //        will be true again.  during the 2 clk cycle latency, HIP  will
              //        still show bogus 0.  so patch will just hold at 0 creds.
              //        functionally, this is okay .. effectively the patch
              //        just 'releases' credits 2 cycles late.
              //        Note:  It is possible at this point for the HIP to
              //               really have 0 creds -- it happens when consumed==0,
              //               and limit==0.  This is okay.  Whether you treat this
              //               as a bogus 0 or not, the credits sent to app is still 0.
              //               Patch considers this a real 0 and not bogus.
              // * NOTE1: tx_cred from HIP is always delayed wrt to
              //          changes in the CONSUMED pointer.  This is true
              //          with or without the patch, and is due
              //          normal ckt latencies.  The user must
              //          always account for these delays when evaluating
              //          the tx_cred or else they can end up working
              //          with OVER-stated credits.
              //          To do this, the user should sample tx_cred when there
              //          are no NP's in flight (i.e. consumed pointer is
              //          quiet). The procedure is:
              //              - latch the tx_cred before sending any NPs.
              //              - consume those creds,
              //              - then stop sending NP's and wait xx cycles
              //                for the HIP to process the last pkt sent
              //              - then latch new tx_cred, repeat.
              //  NOTE2:  Latencies between changes in the LIMIT pointer
              //          and tx_cred are not an issue because this only
              //          translates into a delay in the release of credits
              //          (i.e. tx_cred can only be UNDERstated).

              // cred_lim rollover occured.
              // grant credits up to cred_lim = 8'h0 (allows creds
              // consumed to roll over to next page).
              //-------
              // Header

              if (bogus_0_detect_nph_n & (nph_cred_hip==3'h0)) begin
                  // receiving bogus 0 (assume limit=0).
                  nph_cred_avail_n = (8'hFF - nph_cred_cons) + 8'h1;
                  debug_bogus0_nph = 1'b1;
              end
              else begin
                  // cred_lim & cred_consumed are on same page.
                  // nph_cred_hip is true (after 2 cycles*, but in the
                  // the meantime is showing bogus 0).
                  // Patch waits for more than 1 credit from adaptor.
                  // Then withholds 1 cred.
                  nph_cred_avail_n = (nph_cred_hip > 8'h1) ? (nph_cred_hip - 8'h1) : 8'h0;
                  debug_bogus0_nph = 1'b0;
              end

              //--------
              // Data
              // cred_lim rollover occured
              // grant credits up to cred_lim = 8'h0 (to allow creds
              // consumed to roll over to next page).
              if (bogus_0_detect_npd_n & (npd_cred_hip==3'h0)) begin
                  npd_cred_avail_n = (12'hFFF - npd_cred_cons) + 12'h1;
                  debug_bogus0_npd = 1'b1;
              end
              else begin
                  // cred_lim & cred_consumed are on same page.
                  // npd_cred_hip is true. withhold 1 cred
                  npd_cred_avail_n = (npd_cred_hip > 12'h1) ? (npd_cred_hip - 12'h1) : 12'h0;
                  debug_bogus0_npd = 1'b0;
              end
   end


endmodule

//Legal Notice: (C)2009 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.
// synthesis translate_off

`timescale 1ns / 1ps
// synthesis translate_on
// synthesis verilog_input_version verilog_2001
// turn off superfluous verilog processor warnings
// altera message_level Level1
// altera message_off 10034 10035 10036 10037 10230 10240 10030

//-----------------------------------------------------------------------------
// Title         : altpcie_tl_cfg_pipe
// Project       : PCI Express MegaCore function
//-----------------------------------------------------------------------------
// File          : altpcie_tl_cfg_pipe.v
// Author        : Altera Corporation
//-----------------------------------------------------------------------------
//
//  Description:  This module is to assist timing closure on TL_CFG bus
//-----------------------------------------------------------------------------



module altpcie_tl_cfg_pipe
  (
   input             clk,
   input             srst,
   output reg [ 3:0] o_tl_cfg_add,
   output reg [31:0] o_tl_cfg_ctl,
   output reg        o_tl_cfg_ctl_wr,
   output reg [52:0] o_tl_cfg_sts,
   output reg        o_tl_cfg_sts_wr,
   input  [ 3:0]     i_tl_cfg_add,
   input  [31:0]     i_tl_cfg_ctl,
   input             i_tl_cfg_ctl_wr,
   input  [52:0]     i_tl_cfg_sts,
   input             i_tl_cfg_sts_wr
   );

   reg sts_wr_r,sts_wr_rr;
   reg ctl_wr_r,ctl_wr_rr;

   always @ (posedge clk)
     begin
     if (srst)
       begin
       o_tl_cfg_add <= 4'h0;
       o_tl_cfg_ctl <= {32{1'b0}};
       o_tl_cfg_ctl_wr <= {1{1'b0}};
       o_tl_cfg_sts <= {53{1'b0}};
       o_tl_cfg_sts_wr <= {1{1'b0}};
       end
     else
       begin
       // sts pipeline
       sts_wr_r <= i_tl_cfg_sts_wr;
       sts_wr_rr <= sts_wr_r;
       o_tl_cfg_sts_wr <= sts_wr_rr;
       if (o_tl_cfg_sts_wr != sts_wr_rr)
	 o_tl_cfg_sts <= i_tl_cfg_sts;

       // ctl pipeline
       ctl_wr_r <= i_tl_cfg_ctl_wr;
       ctl_wr_rr <= ctl_wr_r;
       o_tl_cfg_ctl_wr <= ctl_wr_rr;
       if (o_tl_cfg_ctl_wr != ctl_wr_rr)
	 begin
	 o_tl_cfg_add <= i_tl_cfg_add;
	 o_tl_cfg_ctl <= i_tl_cfg_ctl;
	 end
     
       end
     end
endmodule
//Legal Notice: (C)2007 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.


//
// Avalon-MM slave bridge to the DPRIO HIP serial input
//
// Address Translation
//
// ----------------------------------------------------------
//  Addr[15:8] |
// -----------------------------------------------------------
//  0x00       |  Control register
//  0x01       |  HIP DPRIO PCIe config register
//  0x00       |  HIP DPRIO Extended register
//  Other      |  Reserved
//             |
//
// Control Register
// ----------------------------------------------------------
//  Addr[7:0]  |  Data
// -----------------------------------------------------------
//  0x00       |  Data[0]    (R/W): 0 enable dprio
//             |                    1 Disable dprio use csr
//             |                     (--> original configuration)
//             |
//             |  Data[1]    (R/W): RESERVED
//             |  Data[2]    (R/W): Indicate error : Unsupported write address
//             |  Data[3]    (R/W): Indicate error : Unsupported read address
//             |  Data[4]    (R/W): Enable extended dprio access
//             |                    in addition to PCIe address
//             |  Data[15:1] (R/W): RESERVED
//  0x01       |  Data[4:0]  (R/W): Device address
//             |  Data[9:5]  (R/W): port address
//  0x02       |  Data[8:0]  (R/W): bases address
//  0x03       |  Data[15:0] (R/W): when 16'hED10  enable dprio accross all register

// HIP DPRIO Register
// -----------------------------------------------------------
//  Addr[7:0]  |  Data
// -----------------------------------------------------------
//  0x00  0x08 | reserved
//  0x09  0x20 | k_conf
//  0x21  0x2F | k_bar
//  0x30  0x37 | k_cnt
//  0x38  0x3B | k_vc0
//  0x3C  0x3F | k_vc1
//  0x40  0x58 | reserved
//  0x59  0x5B | k_ptr0
//  0x5C  0x5E | k_ptr1
//  0x5F  0xFF | reserved

`timescale 1ns / 1ps

module altpcie_pcie_reconfig_bridge (

  input [  7: 0]     avs_pcie_reconfig_address,
  input              avs_pcie_reconfig_chipselect,
  input              avs_pcie_reconfig_write,
  input [ 15: 0]     avs_pcie_reconfig_writedata,
  output reg         avs_pcie_reconfig_waitrequest,
  input              avs_pcie_reconfig_read,
  output reg [15: 0] avs_pcie_reconfig_readdata,
  output reg         avs_pcie_reconfig_readdatavalid,
  input              avs_pcie_reconfig_clk, // 50 MHz
  input              avs_pcie_reconfig_rstn,

  // DPRIO Interface
   output   reg dpriodisable,
   output   reg dprioin,
   output   reg dprioload,
   output   dpclk,
   input    dprioout

   );

parameter device_address=0;
parameter port_address  =0;
parameter base_address  =0;
parameter implement_address_checking  =1;

localparam IDLE_ST            =0,
           CHECK_ADDR_ST      =1,
           MDIO_START_ST      =2,
           CTRL_WR_ST         =3,
           CTRL_RD_ST         =4,
           ERR_ST             =5,
           MDIO_CLR_ST        =6,
           MDIO_PRE_ST        =7,
           MDIO_FRAME_ST      =8,
           CLEAR_WAITREQ_ST   =9;

localparam  MDIO_ADDR   =2'b00,
            MDIO_WRITE  =2'b01,
            MDIO_READ   =2'b10,
            MDIO_END    =2'b11;

reg [3:0] cstate;
reg [3:0] nstate;
reg [1:0] error_status;

reg  [4:0] hip_dev_addr;
reg  [4:0] hip_port_addr;
reg  [7:0] hip_base_addr;

reg [31:0] shift_dprioin;
reg [15:0] shift_dprioout;
reg [6:0]  count_mdio_st;
reg [1:0]  mdio_cycle;
reg        read_cycle;
reg        write_cycle;
wire       valid_address;
reg        valid_addrreg;
reg        extended_dprio_access;

   assign dpclk         = avs_pcie_reconfig_clk;

   // state machine
   always @*
   case (cstate)
   //TODO : Confirm that Avalon-MM read and write at the same time is illegal
   //TODO : Confirm that read or write, chipselect can not be de-asserted until
   //       waitrequest is de-asserted
      IDLE_ST: begin
         if ((avs_pcie_reconfig_readdatavalid==1'b0)&&(avs_pcie_reconfig_chipselect==1'b1))
            nstate <= CHECK_ADDR_ST;
         else
            nstate <= IDLE_ST;
      end
      CHECK_ADDR_ST:
      begin
         if (valid_address==1'b0)
            nstate <= ERR_ST;
         else if (avs_pcie_reconfig_address[7] == 1'b1)
            nstate <= MDIO_START_ST;
         else if (write_cycle==1'b1)
            nstate <= CTRL_WR_ST;
         else if (read_cycle==1'b1)
            nstate <= CTRL_RD_ST;
         else
            nstate <= IDLE_ST;
      end
      MDIO_START_ST:
         nstate <= MDIO_CLR_ST;
      CTRL_WR_ST:
         nstate <= CLEAR_WAITREQ_ST;
      CTRL_RD_ST:
         nstate <= CLEAR_WAITREQ_ST;
      ERR_ST:
         nstate <= CLEAR_WAITREQ_ST;
      MDIO_CLR_ST:
      //send 16 zero's to clear the MDIO state machine
      //TODO : Check if it's necessary for every read/write transaction or if it's only
      // necessary after the first reset
         if (count_mdio_st==0)  begin
            if (mdio_cycle==MDIO_END)
               nstate <= CLEAR_WAITREQ_ST;
            else
               nstate <= MDIO_PRE_ST;
         end
         else
            nstate <= MDIO_CLR_ST;
      MDIO_PRE_ST:
      // Preamble 32-bit 1's
         if (count_mdio_st==0)
            nstate <= MDIO_FRAME_ST;
         else
            nstate <= MDIO_PRE_ST;
      MDIO_FRAME_ST:
         if (count_mdio_st==0) begin
            if (mdio_cycle==MDIO_END)
               nstate <= MDIO_CLR_ST;
            else
               nstate <= MDIO_PRE_ST;
         end
         else
            nstate <= MDIO_FRAME_ST;
      CLEAR_WAITREQ_ST:
         nstate <= IDLE_ST;
      default:
         nstate <= IDLE_ST;
   endcase

   always @ (negedge avs_pcie_reconfig_rstn or posedge avs_pcie_reconfig_clk) begin
      if (avs_pcie_reconfig_rstn==1'b0)
         cstate <= IDLE_ST;
      else
         cstate <= nstate;
   end

   always @ (negedge avs_pcie_reconfig_rstn or posedge avs_pcie_reconfig_clk) begin
      if (avs_pcie_reconfig_rstn==1'b0)
         mdio_cycle <= MDIO_ADDR;
      else if (cstate==MDIO_START_ST)
         mdio_cycle <= MDIO_ADDR;
      else if ((cstate==MDIO_FRAME_ST) && (count_mdio_st==6'h1F)) begin
         if ((mdio_cycle==MDIO_ADDR) && (write_cycle==1'b1))
            mdio_cycle <= MDIO_WRITE;
         else if ((mdio_cycle==MDIO_ADDR) && (read_cycle==1'b1))
            mdio_cycle <= MDIO_READ;
         else if ((mdio_cycle==MDIO_WRITE) || (mdio_cycle==MDIO_READ))
            mdio_cycle <= MDIO_END;
      end
   end

   always @ (negedge avs_pcie_reconfig_rstn or posedge avs_pcie_reconfig_clk) begin
   //TODO Use multiple counter if speed is an issue
      if (avs_pcie_reconfig_rstn==1'b0)
         count_mdio_st <= 0;
      else if (cstate==MDIO_START_ST)
         count_mdio_st <= 6'hF;
      else if (cstate==MDIO_CLR_ST) begin
         if (count_mdio_st>0)
            count_mdio_st<=count_mdio_st-1;
         else
            count_mdio_st<=6'h1F;
      end
      else if ((cstate==MDIO_PRE_ST)||(cstate==MDIO_FRAME_ST)) begin
         if (count_mdio_st>0)
            count_mdio_st<=count_mdio_st-1;
         else if (mdio_cycle==MDIO_END)
            count_mdio_st <= 6'hF;
         else
            count_mdio_st<=6'h1F;
      end
      else
         count_mdio_st <= 0;
   end

   // MDIO dprioin, dprioload
   always @ (negedge avs_pcie_reconfig_rstn or posedge avs_pcie_reconfig_clk) begin
      if (avs_pcie_reconfig_rstn==1'b0)
         shift_dprioin <= 32'h0;
      else if (cstate==MDIO_PRE_ST) begin
         // ST bits - Start of frame
         shift_dprioin[31:30]<=2'b00;
         // OP bits - Op Codes
         if (mdio_cycle==MDIO_ADDR)
            shift_dprioin[29:28]<=2'b00;
         else if (mdio_cycle == MDIO_WRITE)
            shift_dprioin[29:28]<=2'b01;
         else  // READ
            shift_dprioin[29:28]=2'b11;
         // Port, Device address
         shift_dprioin[27:18] <= {port_address[4:0], device_address[4:0]};
         // TA Bits Turnaround
         // TODO : Check TA bit 0 which supposed to be Z for read?
         shift_dprioin[17:16] <= 2'b10;
         if (mdio_cycle==MDIO_ADDR)
         // 0x80 is the range for vendor specific (altera) registers according to XAUI spec
            shift_dprioin[15:0] = {8'h80,1'b0,avs_pcie_reconfig_address[6:0]};
         else if (mdio_cycle==MDIO_WRITE)
            shift_dprioin[15:0] = avs_pcie_reconfig_writedata[15:0];
         else if (mdio_cycle==MDIO_READ)
            shift_dprioin[15:0] = avs_pcie_reconfig_writedata[15:0];
      end
      else if (cstate==MDIO_FRAME_ST)
         shift_dprioin[31:0] <= {shift_dprioin[30:0],1'b0};
   end

   always @ (negedge avs_pcie_reconfig_rstn or posedge avs_pcie_reconfig_clk) begin
      if (avs_pcie_reconfig_rstn==1'b0) begin
         dprioin     <= 1'b0;
      end
      else if (cstate==MDIO_CLR_ST) begin
         if (count_mdio_st>0)
            dprioin     <= 1'b0;
         else if (mdio_cycle==MDIO_END)
            dprioin     <= 1'b0;
         else
            dprioin     <= 1'b1;
      end
      else if (cstate==MDIO_PRE_ST) begin
         if (count_mdio_st>0)
            dprioin     <= 1'b1;
         else
            dprioin     <= shift_dprioin[31];
      end
      else if (cstate==MDIO_FRAME_ST) begin
      // MDIO : MSB first
         if (count_mdio_st>0)
            dprioin     <= shift_dprioin[30];
         else if (mdio_cycle==MDIO_END)
            dprioin <=1'b0;
         else
            dprioin <=1'b1;
      end
      else
         dprioin     <= 1'b0;
   end

   always @ (negedge avs_pcie_reconfig_rstn or posedge avs_pcie_reconfig_clk) begin
      if (avs_pcie_reconfig_rstn==1'b0)
         shift_dprioout <= 16'h0;
      else
         shift_dprioout[15:0] <= {shift_dprioout[14:0],dprioout};
   end

   // MDIO and status registers  dpriodisable , dprioload
   always @ (negedge avs_pcie_reconfig_rstn or posedge avs_pcie_reconfig_clk) begin
      if (avs_pcie_reconfig_rstn==1'b0) begin
         dpriodisable <= 1'b1;
         dprioload    <= 1'b0;
         extended_dprio_access <=1'b0;
      end
      else if ((cstate==CTRL_WR_ST) &&
               (avs_pcie_reconfig_address[6:0] == 7'h00 )) begin
         dpriodisable <= avs_pcie_reconfig_writedata[0];
         dprioload    <= ~avs_pcie_reconfig_writedata[0];
      end
      else if ((cstate==CTRL_WR_ST) &&
               (avs_pcie_reconfig_address[6:0] == 7'h03 )) begin
         extended_dprio_access <= (avs_pcie_reconfig_writedata==16'hED10)?1'b1:1'b0;
      end
   end

   // Avalon-MM Wait request
   always @ (negedge avs_pcie_reconfig_rstn or posedge avs_pcie_reconfig_clk) begin
      if (avs_pcie_reconfig_rstn==1'b0)
         avs_pcie_reconfig_waitrequest <= 1'b1;
      else if (nstate == CLEAR_WAITREQ_ST)
         avs_pcie_reconfig_waitrequest <= 1'b0;
      else
         avs_pcie_reconfig_waitrequest <= 1'b1;
   end

   // Error Status registers
   always @ (negedge avs_pcie_reconfig_rstn or posedge avs_pcie_reconfig_clk) begin
      if (avs_pcie_reconfig_rstn==1'b0)
         error_status[1:0] <= 2'b00;
      else if (cstate==ERR_ST) begin
         if (write_cycle==1'b1)
            error_status[0] <= 1'b1;
         if (read_cycle==1'b1)
            error_status[1] <= 1'b1;
      end
      else if ((cstate == CTRL_WR_ST) &&
                  (avs_pcie_reconfig_address[6:0] == 7'h00))
         // Clear error status registers
         error_status[1:0] <= avs_pcie_reconfig_writedata[3:2];
      end

   always @ (negedge avs_pcie_reconfig_rstn or posedge avs_pcie_reconfig_clk) begin
      if (avs_pcie_reconfig_rstn==1'b0) begin
         // Default parameter
         hip_dev_addr   <= device_address;
         hip_port_addr  <= port_address;
      end
      else if ((cstate==CTRL_WR_ST) &&
               (avs_pcie_reconfig_address[6:0] == 7'h01 )) begin
         hip_dev_addr   <= avs_pcie_reconfig_writedata[4:0];
         hip_port_addr  <= avs_pcie_reconfig_writedata[9:5];
      end
   end

   always @ (negedge avs_pcie_reconfig_rstn or posedge avs_pcie_reconfig_clk) begin
      if (avs_pcie_reconfig_rstn==1'b0)
         // Default parameter
         hip_base_addr  <= base_address;
      else if ((cstate==CTRL_WR_ST) &&
               (avs_pcie_reconfig_address[6:0] == 7'h02 ))
         hip_base_addr   <= avs_pcie_reconfig_writedata[7:0];
   end

   always @ (posedge avs_pcie_reconfig_clk) begin
      if (cstate==IDLE_ST)
         avs_pcie_reconfig_readdata      <= 16'hFFFF;
      else if (cstate==CTRL_RD_ST)
         case (avs_pcie_reconfig_address[6:0])
            7'h0     : avs_pcie_reconfig_readdata <= {12'h0,error_status[1:0], 1'b0, dpriodisable};
            7'h1     : avs_pcie_reconfig_readdata <= {6'h0,hip_dev_addr[4:0], hip_port_addr[4:0]};
            7'h2     : avs_pcie_reconfig_readdata <= {8'h0,hip_base_addr[7:0]};
            7'h3     : avs_pcie_reconfig_readdata <= 16'hFADE;
            default  : avs_pcie_reconfig_readdata <= 16'hFFFF;
         endcase
      else if ((cstate==MDIO_CLR_ST)&&(count_mdio_st==6'hF))
         avs_pcie_reconfig_readdata  <= shift_dprioout;
   end

   always @ (posedge avs_pcie_reconfig_clk) begin
      if ((cstate==CLEAR_WAITREQ_ST)&&(read_cycle==1'b1))
         avs_pcie_reconfig_readdatavalid <=1'b1;
      else
         avs_pcie_reconfig_readdatavalid <=1'b0;
   end

   always @ (negedge avs_pcie_reconfig_rstn or posedge avs_pcie_reconfig_clk) begin
      if (avs_pcie_reconfig_rstn==1'b0) begin
         read_cycle  <= 1'b0;
         write_cycle <= 1'b0;
      end
      else if ((cstate==IDLE_ST) && (avs_pcie_reconfig_chipselect==1'b1)) begin
         read_cycle  <= avs_pcie_reconfig_read;
         write_cycle <= avs_pcie_reconfig_write;
      end
   end

   assign valid_address = (implement_address_checking==0)?1'b1:valid_addrreg;

   always @ (negedge avs_pcie_reconfig_rstn or posedge avs_pcie_reconfig_clk) begin
      if (avs_pcie_reconfig_rstn==1'b0)
         valid_addrreg  <= 1'b1;
      else if (cstate==IDLE_ST) begin
         if (avs_pcie_reconfig_address[7]==1'b0) begin
         // Control register address space
            if (avs_pcie_reconfig_address[6:0] > 7'h4)
               valid_addrreg <=1'b0;
            else
               valid_addrreg <=1'b1;
         end
         else begin
         // MDIO register HIP address space
            if ((avs_pcie_reconfig_address[6:0] < 7'h9) && (extended_dprio_access==1'b0))
               valid_addrreg <=1'b0;
            else if ((avs_pcie_reconfig_address[6:0] > 7'h5E) && (extended_dprio_access==1'b0))
               valid_addrreg <=1'b0;
            else if ((avs_pcie_reconfig_address[6:0]>7'h40)&&(avs_pcie_reconfig_address[6:0]<7'h59) && (extended_dprio_access==1'b0))
               valid_addrreg <=1'b0;
            else
               valid_addrreg <=1'b1;
         end
      end
   end
endmodule
