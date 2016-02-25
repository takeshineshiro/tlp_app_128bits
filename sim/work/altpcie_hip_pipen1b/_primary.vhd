library verilog;
use verilog.vl_types.all;
entity altpcie_hip_pipen1b is
    generic(
        pcie_qsys       : integer := 0;
        CB_A2P_ADDR_MAP_FIXED_TABLE_0_LOW: integer := 0;
        CB_A2P_ADDR_MAP_FIXED_TABLE_0_HIGH: integer := 0;
        CB_A2P_ADDR_MAP_FIXED_TABLE_1_LOW: integer := 0;
        CB_A2P_ADDR_MAP_FIXED_TABLE_1_HIGH: integer := 0;
        CB_A2P_ADDR_MAP_FIXED_TABLE_2_LOW: integer := 0;
        CB_A2P_ADDR_MAP_FIXED_TABLE_2_HIGH: integer := 0;
        CB_A2P_ADDR_MAP_FIXED_TABLE_3_LOW: integer := 0;
        CB_A2P_ADDR_MAP_FIXED_TABLE_3_HIGH: integer := 0;
        CB_A2P_ADDR_MAP_FIXED_TABLE_4_LOW: integer := 0;
        CB_A2P_ADDR_MAP_FIXED_TABLE_4_HIGH: integer := 0;
        CB_A2P_ADDR_MAP_FIXED_TABLE_5_LOW: integer := 0;
        CB_A2P_ADDR_MAP_FIXED_TABLE_5_HIGH: integer := 0;
        CB_A2P_ADDR_MAP_FIXED_TABLE_6_LOW: integer := 0;
        CB_A2P_ADDR_MAP_FIXED_TABLE_6_HIGH: integer := 0;
        CB_A2P_ADDR_MAP_FIXED_TABLE_7_LOW: integer := 0;
        CB_A2P_ADDR_MAP_FIXED_TABLE_7_HIGH: integer := 0;
        CB_A2P_ADDR_MAP_FIXED_TABLE_8_LOW: integer := 0;
        CB_A2P_ADDR_MAP_FIXED_TABLE_8_HIGH: integer := 0;
        CB_A2P_ADDR_MAP_FIXED_TABLE_9_LOW: integer := 0;
        CB_A2P_ADDR_MAP_FIXED_TABLE_9_HIGH: integer := 0;
        CB_A2P_ADDR_MAP_FIXED_TABLE_10_LOW: integer := 0;
        CB_A2P_ADDR_MAP_FIXED_TABLE_10_HIGH: integer := 0;
        CB_A2P_ADDR_MAP_FIXED_TABLE_11_LOW: integer := 0;
        CB_A2P_ADDR_MAP_FIXED_TABLE_11_HIGH: integer := 0;
        CB_A2P_ADDR_MAP_FIXED_TABLE_12_LOW: integer := 0;
        CB_A2P_ADDR_MAP_FIXED_TABLE_12_HIGH: integer := 0;
        CB_A2P_ADDR_MAP_FIXED_TABLE_13_LOW: integer := 0;
        CB_A2P_ADDR_MAP_FIXED_TABLE_13_HIGH: integer := 0;
        CB_A2P_ADDR_MAP_FIXED_TABLE_14_LOW: integer := 0;
        CB_A2P_ADDR_MAP_FIXED_TABLE_14_HIGH: integer := 0;
        CB_A2P_ADDR_MAP_FIXED_TABLE_15_LOW: integer := 0;
        CB_A2P_ADDR_MAP_FIXED_TABLE_15_HIGH: integer := 0;
        CB_P2A_AVALON_ADDR_B0: integer := -2147483648;
        CB_P2A_AVALON_ADDR_B5: integer := 0;
        CG_NO_CPL_REORDERING: integer := 0;
        enable_gen2_core: string  := "true";
        use_crc_forwarding: string  := "false";
        enable_function_msi_support: string  := "true";
        flow_control_timeout_count: integer := 200;
        CG_IMPL_CRA_AV_SLAVE_PORT: integer := 1;
        CG_ENABLE_A2P_INTERRUPT: integer := 0;
        vc0_clk_enable  : string  := "true";
        RH_NUM          : integer := 7;
        CB_P2A_AVALON_ADDR_B3: integer := 0;
        INTENDED_DEVICE_FAMILY: string  := "Stratix IV GX";
        RX_BUF          : integer := 10;
        l0_exit_latency_sameclock: integer := 0;
        enable_hip_x1_loopback: string  := "false";
        enable_ecrc_gen : string  := "false";
        vc1_rx_flow_ctrl_posted_data: integer := 360;
        l01_entry_latency: integer := 31;
        msix_pba_bir    : integer := 0;
        vc1_rx_flow_ctrl_posted_header: integer := 50;
        ei_delay_powerdown_count: integer := 10;
        TL_SELECTION    : integer := 6;
        bar0_prefetchable: string  := "true";
        bar4_size_mask  : integer := 0;
        enable_coreclk_out_half_rate: string  := "false";
        maximum_current : integer := 0;
        p_pcie_use_pcie_reconfig: string  := "0";
        class_code      : integer := 16711680;
        bridge_port_vga_enable: string  := "false";
        ssvid           : integer := 0;
        enable_adapter_half_rate_mode: string  := "false";
        bar1_64bit_mem_space: string  := "false";
        subsystem_vendor_id: integer := 4466;
        sameclock_nfts_count: integer := 0;
        msix_table_offset: integer := 0;
        l0_exit_latency_diffclock: integer := 0;
        eie_before_nfts_count: integer := 4;
        CB_P2A_AVALON_ADDR_B4: integer := 0;
        retry_buffer_memory_settings: integer := 0;
        bar0_size_mask  : integer := 0;
        surprise_down_error_support: string  := "false";
        vc0_rx_buffer_memory_settings: integer := 0;
        credit_buffer_allocation_aux: string  := "BALANCED";
        enable_rx0buf_ecc: string  := "true";
        bar3_size_mask  : integer := 0;
        enable_rx_reordering: string  := "true";
        bar4_io_space   : string  := "false";
        CG_COMMON_CLOCK_MODE: integer := 0;
        extend_tag_field: string  := "false";
        core_clk_divider: integer := 0;
        G_TAG_NUM0      : integer := 32;
        enable_retrybuf_x8_clk_stealing: integer := 0;
        flow_control_update_count: integer := 30;
        rx_ptr1_posted_dpram_max: integer := 0;
        rx_ptr0_posted_dpram_min: integer := 0;
        pme_state_enable: integer := 0;
        port_link_number: integer := 1;
        vc0_rx_flow_ctrl_posted_header: integer := 50;
        ssid            : integer := 0;
        endpoint_l1_latency: integer := 0;
        rx_ptr0_nonposted_dpram_min: integer := 0;
        l1_exit_latency_diffclock: integer := 0;
        retry_buffer_last_active_address: integer := 2047;
        CB_P2A_AVALON_ADDR_B1: integer := 0;
        bar_io_window_size: string  := "32BIT";
        CB_A2P_ADDR_MAP_PASS_THRU_BITS: integer := 20;
        rx_ptr1_posted_dpram_min: integer := 0;
        CB_A2P_ADDR_MAP_IS_FIXED: integer := 0;
        rx_ptr1_nonposted_dpram_max: integer := 0;
        bar5_io_space   : string  := "false";
        gen2_sameclock_nfts_count: integer := 255;
        max_payload_size: integer := 512;
        gen2_diffclock_nfts_count: integer := 255;
        vc_arbitration  : integer := 1;
        disable_snoop_packet: integer := 0;
        vc0_rx_flow_ctrl_posted_data: integer := 360;
        AST_LITE        : integer := 0;
        CB_A2P_ADDR_MAP_NUM_ENTRIES: integer := 2;
        vc1_rx_flow_ctrl_compl_data: integer := 448;
        expansion_base_address_register: integer := 0;
        msi_function_count: integer := 4;
        vc0_rx_flow_ctrl_compl_data: integer := 448;
        single_rx_detect: integer := 0;
        CB_P2A_AVALON_ADDR_B2: integer := -2147483648;
        slot_number     : integer := 0;
        enable_rx_buffer_checking: string  := "true";
        deemphasis_enable: string  := "false";
        bar5_prefetchable: string  := "false";
        device_number   : integer := 0;
        msix_pba_offset : integer := 0;
        gen2_lane_rate_mode: string  := "true";
        subsystem_device_id: integer := 1;
        bypass_cdc      : string  := "false";
        tx_cdc_full_value: integer := 2;
        bar_prefetchable: integer := 32;
        enable_retrybuf_ecc: string  := "true";
        fc_init_timer   : integer := 1024;
        base_address    : integer := 0;
        register_pipe_signals: string  := "false";
        core_clk_source : string  := "PLL_FIXED_CLK";
        no_command_completed: string  := "true";
        msix_table_size : integer := 0;
        bar3_prefetchable: string  := "false";
        enable_msi_64bit_addressing: string  := "true";
        port_address    : integer := 0;
        enable_rx1buf_x8_clk_stealing: integer := 0;
        bar0_io_space   : string  := "false";
        vc1_rx_flow_ctrl_nonposted_header: integer := 54;
        bar2_size_mask  : integer := 0;
        slot_power_limit: integer := 0;
        enable_function_msix_support: string  := "true";
        bar3_io_space   : string  := "false";
        bar0_64bit_mem_space: string  := "true";
        millisecond_cycle_count: integer := 0;
        enable_msi_masking: string  := "false";
        endpoint_l0_latency: integer := 0;
        bar4_prefetchable: string  := "false";
        lpm_type        : string  := "stratixiv_hssi_pcie_hip";
        diffclock_nfts_count: integer := 0;
        indicator       : integer := 0;
        bar1_io_space   : string  := "false";
        enable_l1_aspm  : string  := "false";
        vc1_rx_flow_ctrl_nonposted_data: integer := 0;
        vc1_rx_flow_ctrl_compl_header: integer := 112;
        low_priority_vc : integer := 0;
        l1_exit_latency_sameclock: integer := 0;
        bar1_size_mask  : integer := 0;
        vc0_rx_flow_ctrl_nonposted_header: integer := 54;
        lane_mask       : integer := 240;
        bar2_io_space   : string  := "false";
        enable_ch0_pclk_out: string  := "true";
        CB_A2P_ADDR_MAP_FIXED_TABLE: vl_logic_vector(0 to 1023) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        enable_ecrc_check: string  := "false";
        rx_ptr0_posted_dpram_max: integer := 0;
        bar1_prefetchable: string  := "false";
        p_pcie_hip_type : string  := "0";
        bar2_64bit_mem_space: string  := "false";
        vc0_rx_flow_ctrl_nonposted_data: integer := 0;
        bar5_size_mask  : integer := 0;
        disable_link_x2_support: string  := "false";
        bridge_port_ssid_support: string  := "false";
        enable_rx0buf_x8_clk_stealing: integer := 0;
        dll_active_report_support: string  := "false";
        CB_PCIE_MODE    : integer := 0;
        vendor_id       : integer := 4466;
        msix_table_bir  : integer := 0;
        slot_power_scale: integer := 0;
        device_address  : integer := 0;
        bar3_64bit_mem_space: string  := "false";
        CG_AVALON_S_ADDR_WIDTH: integer := 21;
        advanced_errors : string  := "false";
        enable_rx1buf_ecc: string  := "true";
        vc1_rx_buffer_memory_settings: integer := 0;
        bypass_tl       : string  := "false";
        vc_enable       : integer := 0;
        completion_timeout: string  := "NONE";
        hot_plug_support: integer := 0;
        disable_cdc_clk_ppm: string  := "false";
        no_soft_reset   : string  := "false";
        enable_slot_register: string  := "false";
        rx_ptr0_nonposted_dpram_max: integer := 0;
        bar5_64bit_mem_space: string  := "false";
        vc0_rx_flow_ctrl_compl_header: integer := 112;
        revision_id     : integer := 1;
        pcie_mode       : string  := "EP_NATIVE";
        max_link_width  : integer := 4;
        rx_ptr1_nonposted_dpram_min: integer := 0;
        device_id       : integer := 1;
        bar4_64bit_mem_space: string  := "false";
        enable_completion_timeout_disable: string  := "false";
        skp_os_schedule_count: integer := 0;
        vc1_clk_enable  : string  := "false";
        bar2_prefetchable: string  := "false";
        RXM_DATA_WIDTH  : integer := 64;
        RXM_BEN_WIDTH   : integer := 8;
        CG_RXM_IRQ_NUM  : integer := 1;
        CG_IRQ_BIT_ENA  : integer := 65535
    );
    port(
        CraIrq_o        : out    vl_logic;
        CraReadData_o   : out    vl_logic_vector(31 downto 0);
        CraWaitRequest_o: out    vl_logic;
        RxmAddress_o    : out    vl_logic_vector(31 downto 0);
        RxmBurstCount_o : out    vl_logic_vector;
        RxmByteEnable_o : out    vl_logic_vector;
        RxmRead_o       : out    vl_logic;
        RxmWriteData_o  : out    vl_logic_vector;
        RxmWrite_o      : out    vl_logic;
        TxsReadDataValid_o: out    vl_logic;
        TxsReadData_o   : out    vl_logic_vector(63 downto 0);
        TxsWaitRequest_o: out    vl_logic;
        app_int_ack     : out    vl_logic;
        app_msi_ack     : out    vl_logic;
        avs_pcie_reconfig_readdata: out    vl_logic_vector(15 downto 0);
        avs_pcie_reconfig_readdatavalid: out    vl_logic;
        avs_pcie_reconfig_waitrequest: out    vl_logic;
        core_clk_out    : out    vl_logic;
        derr_cor_ext_rcv0: out    vl_logic;
        derr_cor_ext_rcv1: out    vl_logic;
        derr_cor_ext_rpl: out    vl_logic;
        derr_rpl        : out    vl_logic;
        dl_ltssm        : out    vl_logic_vector(4 downto 0);
        dlup_exit       : out    vl_logic;
        eidle_infer_sel : out    vl_logic_vector(23 downto 0);
        ev_128ns        : out    vl_logic;
        ev_1us          : out    vl_logic;
        hip_extraclkout : out    vl_logic_vector(1 downto 0);
        hotrst_exit     : out    vl_logic;
        int_status      : out    vl_logic_vector(3 downto 0);
        l2_exit         : out    vl_logic;
        lane_act        : out    vl_logic_vector(3 downto 0);
        lmi_ack         : out    vl_logic;
        lmi_dout        : out    vl_logic_vector(31 downto 0);
        npd_alloc_1cred_vc0: out    vl_logic;
        npd_alloc_1cred_vc1: out    vl_logic;
        npd_cred_vio_vc0: out    vl_logic;
        npd_cred_vio_vc1: out    vl_logic;
        nph_alloc_1cred_vc0: out    vl_logic;
        nph_alloc_1cred_vc1: out    vl_logic;
        nph_cred_vio_vc0: out    vl_logic;
        nph_cred_vio_vc1: out    vl_logic;
        pme_to_sr       : out    vl_logic;
        powerdown0_ext  : out    vl_logic_vector(1 downto 0);
        powerdown1_ext  : out    vl_logic_vector(1 downto 0);
        powerdown2_ext  : out    vl_logic_vector(1 downto 0);
        powerdown3_ext  : out    vl_logic_vector(1 downto 0);
        powerdown4_ext  : out    vl_logic_vector(1 downto 0);
        powerdown5_ext  : out    vl_logic_vector(1 downto 0);
        powerdown6_ext  : out    vl_logic_vector(1 downto 0);
        powerdown7_ext  : out    vl_logic_vector(1 downto 0);
        r2c_err0        : out    vl_logic;
        r2c_err1        : out    vl_logic;
        rate_ext        : out    vl_logic;
        rc_gxb_powerdown: out    vl_logic;
        rc_rx_analogreset: out    vl_logic;
        rc_rx_digitalreset: out    vl_logic;
        rc_tx_digitalreset: out    vl_logic;
        reset_status    : out    vl_logic;
        rx_fifo_empty0  : out    vl_logic;
        rx_fifo_empty1  : out    vl_logic;
        rx_fifo_full0   : out    vl_logic;
        rx_fifo_full1   : out    vl_logic;
        rx_st_bardec0   : out    vl_logic_vector(7 downto 0);
        rx_st_bardec1   : out    vl_logic_vector(7 downto 0);
        rx_st_be0       : out    vl_logic_vector(7 downto 0);
        rx_st_be0_p1    : out    vl_logic_vector(7 downto 0);
        rx_st_be1       : out    vl_logic_vector(7 downto 0);
        rx_st_be1_p1    : out    vl_logic_vector(7 downto 0);
        rx_st_data0     : out    vl_logic_vector(63 downto 0);
        rx_st_data0_p1  : out    vl_logic_vector(63 downto 0);
        rx_st_data1     : out    vl_logic_vector(63 downto 0);
        rx_st_data1_p1  : out    vl_logic_vector(63 downto 0);
        rx_st_eop0      : out    vl_logic;
        rx_st_eop0_p1   : out    vl_logic;
        rx_st_eop1      : out    vl_logic;
        rx_st_eop1_p1   : out    vl_logic;
        rx_st_err0      : out    vl_logic;
        rx_st_err1      : out    vl_logic;
        rx_st_sop0      : out    vl_logic;
        rx_st_sop0_p1   : out    vl_logic;
        rx_st_sop1      : out    vl_logic;
        rx_st_sop1_p1   : out    vl_logic;
        rx_st_valid0    : out    vl_logic;
        rx_st_valid1    : out    vl_logic;
        rxpolarity0_ext : out    vl_logic;
        rxpolarity1_ext : out    vl_logic;
        rxpolarity2_ext : out    vl_logic;
        rxpolarity3_ext : out    vl_logic;
        rxpolarity4_ext : out    vl_logic;
        rxpolarity5_ext : out    vl_logic;
        rxpolarity6_ext : out    vl_logic;
        rxpolarity7_ext : out    vl_logic;
        serr_out        : out    vl_logic;
        suc_spd_neg     : out    vl_logic;
        swdn_wake       : out    vl_logic;
        swup_hotrst     : out    vl_logic;
        test_out        : out    vl_logic_vector(63 downto 0);
        tl_cfg_add      : out    vl_logic_vector(3 downto 0);
        tl_cfg_ctl      : out    vl_logic_vector(31 downto 0);
        tl_cfg_ctl_wr   : out    vl_logic;
        tl_cfg_sts      : out    vl_logic_vector(52 downto 0);
        tl_cfg_sts_wr   : out    vl_logic;
        tlbp_dl_ack_phypm: out    vl_logic_vector(1 downto 0);
        tlbp_dl_ack_requpfc: out    vl_logic;
        tlbp_dl_ack_sndupfc: out    vl_logic;
        tlbp_dl_current_deemp: out    vl_logic;
        tlbp_dl_currentspeed: out    vl_logic_vector(1 downto 0);
        tlbp_dl_dll_req : out    vl_logic;
        tlbp_dl_err_dll : out    vl_logic_vector(4 downto 0);
        tlbp_dl_errphy  : out    vl_logic;
        tlbp_dl_link_autobdw_status: out    vl_logic;
        tlbp_dl_link_bdwmng_status: out    vl_logic;
        tlbp_dl_rpbuf_emp: out    vl_logic;
        tlbp_dl_rst_enter_comp_bit: out    vl_logic;
        tlbp_dl_rst_tx_margin_field: out    vl_logic;
        tlbp_dl_rx_typ_pm: out    vl_logic_vector(2 downto 0);
        tlbp_dl_rx_valpm: out    vl_logic;
        tlbp_dl_tx_ackpm: out    vl_logic;
        tlbp_dl_up      : out    vl_logic;
        tlbp_dl_vc_status: out    vl_logic_vector(7 downto 0);
        tlbp_link_up    : out    vl_logic;
        tx_cred0        : out    vl_logic_vector(35 downto 0);
        tx_cred1        : out    vl_logic_vector(35 downto 0);
        tx_deemph       : out    vl_logic_vector(7 downto 0);
        tx_fifo_empty0  : out    vl_logic;
        tx_fifo_empty1  : out    vl_logic;
        tx_fifo_full0   : out    vl_logic;
        tx_fifo_full1   : out    vl_logic;
        tx_fifo_rdptr0  : out    vl_logic_vector(3 downto 0);
        tx_fifo_rdptr1  : out    vl_logic_vector(3 downto 0);
        tx_fifo_wrptr0  : out    vl_logic_vector(3 downto 0);
        tx_fifo_wrptr1  : out    vl_logic_vector(3 downto 0);
        tx_margin       : out    vl_logic_vector(23 downto 0);
        tx_st_ready0    : out    vl_logic;
        tx_st_ready1    : out    vl_logic;
        txcompl0_ext    : out    vl_logic;
        txcompl1_ext    : out    vl_logic;
        txcompl2_ext    : out    vl_logic;
        txcompl3_ext    : out    vl_logic;
        txcompl4_ext    : out    vl_logic;
        txcompl5_ext    : out    vl_logic;
        txcompl6_ext    : out    vl_logic;
        txcompl7_ext    : out    vl_logic;
        txdata0_ext     : out    vl_logic_vector(7 downto 0);
        txdata1_ext     : out    vl_logic_vector(7 downto 0);
        txdata2_ext     : out    vl_logic_vector(7 downto 0);
        txdata3_ext     : out    vl_logic_vector(7 downto 0);
        txdata4_ext     : out    vl_logic_vector(7 downto 0);
        txdata5_ext     : out    vl_logic_vector(7 downto 0);
        txdata6_ext     : out    vl_logic_vector(7 downto 0);
        txdata7_ext     : out    vl_logic_vector(7 downto 0);
        txdatak0_ext    : out    vl_logic;
        txdatak1_ext    : out    vl_logic;
        txdatak2_ext    : out    vl_logic;
        txdatak3_ext    : out    vl_logic;
        txdatak4_ext    : out    vl_logic;
        txdatak5_ext    : out    vl_logic;
        txdatak6_ext    : out    vl_logic;
        txdatak7_ext    : out    vl_logic;
        txdetectrx0_ext : out    vl_logic;
        txdetectrx1_ext : out    vl_logic;
        txdetectrx2_ext : out    vl_logic;
        txdetectrx3_ext : out    vl_logic;
        txdetectrx4_ext : out    vl_logic;
        txdetectrx5_ext : out    vl_logic;
        txdetectrx6_ext : out    vl_logic;
        txdetectrx7_ext : out    vl_logic;
        txelecidle0_ext : out    vl_logic;
        txelecidle1_ext : out    vl_logic;
        txelecidle2_ext : out    vl_logic;
        txelecidle3_ext : out    vl_logic;
        txelecidle4_ext : out    vl_logic;
        txelecidle5_ext : out    vl_logic;
        txelecidle6_ext : out    vl_logic;
        txelecidle7_ext : out    vl_logic;
        use_pcie_reconfig: out    vl_logic;
        wake_oen        : out    vl_logic;
        AvlClk_i        : in     vl_logic;
        CraAddress_i    : in     vl_logic_vector(11 downto 0);
        CraByteEnable_i : in     vl_logic_vector(3 downto 0);
        CraChipSelect_i : in     vl_logic;
        CraRead         : in     vl_logic;
        CraWrite        : in     vl_logic;
        CraWriteData_i  : in     vl_logic_vector(31 downto 0);
        Rstn_i          : in     vl_logic;
        RxmIrqNum_i     : in     vl_logic_vector(5 downto 0);
        RxmIrq_i        : in     vl_logic_vector;
        RxmReadDataValid_i: in     vl_logic;
        RxmReadData_i   : in     vl_logic_vector;
        RxmWaitRequest_i: in     vl_logic;
        TxsAddress_i    : in     vl_logic_vector;
        TxsBurstCount_i : in     vl_logic_vector;
        TxsByteEnable_i : in     vl_logic_vector(7 downto 0);
        TxsChipSelect_i : in     vl_logic;
        TxsRead_i       : in     vl_logic;
        TxsWriteData_i  : in     vl_logic_vector(63 downto 0);
        TxsWrite_i      : in     vl_logic;
        aer_msi_num     : in     vl_logic_vector(4 downto 0);
        app_int_sts     : in     vl_logic;
        app_msi_num     : in     vl_logic_vector(4 downto 0);
        app_msi_req     : in     vl_logic;
        app_msi_tc      : in     vl_logic_vector(2 downto 0);
        avs_pcie_reconfig_address: in     vl_logic_vector(7 downto 0);
        avs_pcie_reconfig_chipselect: in     vl_logic;
        avs_pcie_reconfig_clk: in     vl_logic;
        avs_pcie_reconfig_read: in     vl_logic;
        avs_pcie_reconfig_rstn: in     vl_logic;
        avs_pcie_reconfig_write: in     vl_logic;
        avs_pcie_reconfig_writedata: in     vl_logic_vector(15 downto 0);
        core_clk_in     : in     vl_logic;
        cpl_err         : in     vl_logic_vector(6 downto 0);
        cpl_pending     : in     vl_logic;
        crst            : in     vl_logic;
        dbg_pipex1_rx   : in     vl_logic_vector(14 downto 0);
        hpg_ctrler      : in     vl_logic_vector(4 downto 0);
        lmi_addr        : in     vl_logic_vector(11 downto 0);
        lmi_din         : in     vl_logic_vector(31 downto 0);
        lmi_rden        : in     vl_logic;
        lmi_wren        : in     vl_logic;
        mode            : in     vl_logic_vector(1 downto 0);
        npor            : in     vl_logic;
        pclk_central    : in     vl_logic;
        pclk_ch0        : in     vl_logic;
        pex_msi_num     : in     vl_logic_vector(4 downto 0);
        phystatus0_ext  : in     vl_logic;
        phystatus1_ext  : in     vl_logic;
        phystatus2_ext  : in     vl_logic;
        phystatus3_ext  : in     vl_logic;
        phystatus4_ext  : in     vl_logic;
        phystatus5_ext  : in     vl_logic;
        phystatus6_ext  : in     vl_logic;
        phystatus7_ext  : in     vl_logic;
        pld_clk         : in     vl_logic;
        pll_fixed_clk   : in     vl_logic;
        pm_auxpwr       : in     vl_logic;
        pm_data         : in     vl_logic_vector(9 downto 0);
        pm_event        : in     vl_logic;
        pme_to_cr       : in     vl_logic;
        rc_areset       : in     vl_logic;
        rc_inclk_eq_125mhz: in     vl_logic;
        rc_pll_locked   : in     vl_logic;
        rc_rx_pll_locked_one: in     vl_logic;
        rx_st_mask0     : in     vl_logic;
        rx_st_mask1     : in     vl_logic;
        rx_st_ready0    : in     vl_logic;
        rx_st_ready1    : in     vl_logic;
        rxdata0_ext     : in     vl_logic_vector(7 downto 0);
        rxdata1_ext     : in     vl_logic_vector(7 downto 0);
        rxdata2_ext     : in     vl_logic_vector(7 downto 0);
        rxdata3_ext     : in     vl_logic_vector(7 downto 0);
        rxdata4_ext     : in     vl_logic_vector(7 downto 0);
        rxdata5_ext     : in     vl_logic_vector(7 downto 0);
        rxdata6_ext     : in     vl_logic_vector(7 downto 0);
        rxdata7_ext     : in     vl_logic_vector(7 downto 0);
        rxdatak0_ext    : in     vl_logic;
        rxdatak1_ext    : in     vl_logic;
        rxdatak2_ext    : in     vl_logic;
        rxdatak3_ext    : in     vl_logic;
        rxdatak4_ext    : in     vl_logic;
        rxdatak5_ext    : in     vl_logic;
        rxdatak6_ext    : in     vl_logic;
        rxdatak7_ext    : in     vl_logic;
        rxelecidle0_ext : in     vl_logic;
        rxelecidle1_ext : in     vl_logic;
        rxelecidle2_ext : in     vl_logic;
        rxelecidle3_ext : in     vl_logic;
        rxelecidle4_ext : in     vl_logic;
        rxelecidle5_ext : in     vl_logic;
        rxelecidle6_ext : in     vl_logic;
        rxelecidle7_ext : in     vl_logic;
        rxstatus0_ext   : in     vl_logic_vector(2 downto 0);
        rxstatus1_ext   : in     vl_logic_vector(2 downto 0);
        rxstatus2_ext   : in     vl_logic_vector(2 downto 0);
        rxstatus3_ext   : in     vl_logic_vector(2 downto 0);
        rxstatus4_ext   : in     vl_logic_vector(2 downto 0);
        rxstatus5_ext   : in     vl_logic_vector(2 downto 0);
        rxstatus6_ext   : in     vl_logic_vector(2 downto 0);
        rxstatus7_ext   : in     vl_logic_vector(2 downto 0);
        rxvalid0_ext    : in     vl_logic;
        rxvalid1_ext    : in     vl_logic;
        rxvalid2_ext    : in     vl_logic;
        rxvalid3_ext    : in     vl_logic;
        rxvalid4_ext    : in     vl_logic;
        rxvalid5_ext    : in     vl_logic;
        rxvalid6_ext    : in     vl_logic;
        rxvalid7_ext    : in     vl_logic;
        srst            : in     vl_logic;
        swdn_in         : in     vl_logic_vector(2 downto 0);
        swup_in         : in     vl_logic_vector(6 downto 0);
        test_in         : in     vl_logic_vector(39 downto 0);
        tl_slotclk_cfg  : in     vl_logic;
        tlbp_dl_aspm_cr0: in     vl_logic;
        tlbp_dl_comclk_reg: in     vl_logic;
        tlbp_dl_ctrl_link2: in     vl_logic_vector(12 downto 0);
        tlbp_dl_data_upfc: in     vl_logic_vector(11 downto 0);
        tlbp_dl_hdr_upfc: in     vl_logic_vector(7 downto 0);
        tlbp_dl_inh_dllp: in     vl_logic;
        tlbp_dl_maxpload_dcr: in     vl_logic_vector(2 downto 0);
        tlbp_dl_req_phycfg: in     vl_logic_vector(3 downto 0);
        tlbp_dl_req_phypm: in     vl_logic_vector(3 downto 0);
        tlbp_dl_req_upfc: in     vl_logic;
        tlbp_dl_req_wake: in     vl_logic;
        tlbp_dl_rx_ecrcchk: in     vl_logic;
        tlbp_dl_snd_upfc: in     vl_logic;
        tlbp_dl_tx_reqpm: in     vl_logic;
        tlbp_dl_tx_typpm: in     vl_logic_vector(2 downto 0);
        tlbp_dl_txcfg_extsy: in     vl_logic;
        tlbp_dl_typ_upfc: in     vl_logic_vector(1 downto 0);
        tlbp_dl_vc_ctrl : in     vl_logic_vector(7 downto 0);
        tlbp_dl_vcid_map: in     vl_logic_vector(23 downto 0);
        tlbp_dl_vcid_upfc: in     vl_logic_vector(2 downto 0);
        tx_st_data0     : in     vl_logic_vector(63 downto 0);
        tx_st_data0_p1  : in     vl_logic_vector(63 downto 0);
        tx_st_data1     : in     vl_logic_vector(63 downto 0);
        tx_st_data1_p1  : in     vl_logic_vector(63 downto 0);
        tx_st_eop0      : in     vl_logic;
        tx_st_eop0_p1   : in     vl_logic;
        tx_st_eop1      : in     vl_logic;
        tx_st_eop1_p1   : in     vl_logic;
        tx_st_err0      : in     vl_logic;
        tx_st_err1      : in     vl_logic;
        tx_st_sop0      : in     vl_logic;
        tx_st_sop0_p1   : in     vl_logic;
        tx_st_sop1      : in     vl_logic;
        tx_st_sop1_p1   : in     vl_logic;
        tx_st_valid0    : in     vl_logic;
        tx_st_valid1    : in     vl_logic
    );
end altpcie_hip_pipen1b;
