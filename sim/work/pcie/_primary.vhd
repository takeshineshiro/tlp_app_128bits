library verilog;
use verilog.vl_types.all;
entity pcie is
    generic(
        PCIE_VENDOR_ID  : integer := 4466;
        PCIE_DEVICE_ID  : integer := 4;
        PCIE_VEVISION_ID: integer := 1
    );
    port(
        app_int_sts     : in     vl_logic;
        app_msi_num     : in     vl_logic_vector(4 downto 0);
        app_msi_req     : in     vl_logic;
        app_msi_tc      : in     vl_logic_vector(2 downto 0);
        busy_altgxb_reconfig: in     vl_logic;
        cal_blk_clk     : in     vl_logic;
        cpl_err         : in     vl_logic_vector(6 downto 0);
        cpl_pending     : in     vl_logic;
        crst            : in     vl_logic;
        fixedclk_serdes : in     vl_logic;
        gxb_powerdown   : in     vl_logic;
        hpg_ctrler      : in     vl_logic_vector(4 downto 0);
        lmi_addr        : in     vl_logic_vector(11 downto 0);
        lmi_din         : in     vl_logic_vector(31 downto 0);
        lmi_rden        : in     vl_logic;
        lmi_wren        : in     vl_logic;
        npor            : in     vl_logic;
        pclk_in         : in     vl_logic;
        pex_msi_num     : in     vl_logic_vector(4 downto 0);
        phystatus_ext   : in     vl_logic;
        pipe_mode       : in     vl_logic;
        pld_clk         : in     vl_logic;
        pll_powerdown   : in     vl_logic;
        pm_auxpwr       : in     vl_logic;
        pm_data         : in     vl_logic_vector(9 downto 0);
        pm_event        : in     vl_logic;
        pme_to_cr       : in     vl_logic;
        reconfig_clk    : in     vl_logic;
        reconfig_togxb  : in     vl_logic_vector(3 downto 0);
        refclk          : in     vl_logic;
        rx_in0          : in     vl_logic;
        rx_in1          : in     vl_logic;
        rx_in2          : in     vl_logic;
        rx_in3          : in     vl_logic;
        rx_in4          : in     vl_logic;
        rx_in5          : in     vl_logic;
        rx_in6          : in     vl_logic;
        rx_in7          : in     vl_logic;
        rx_st_mask0     : in     vl_logic;
        rx_st_ready0    : in     vl_logic;
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
        test_in         : in     vl_logic_vector(39 downto 0);
        tx_st_data0     : in     vl_logic_vector(63 downto 0);
        tx_st_eop0      : in     vl_logic;
        tx_st_err0      : in     vl_logic;
        tx_st_sop0      : in     vl_logic;
        tx_st_valid0    : in     vl_logic;
        app_int_ack     : out    vl_logic;
        app_msi_ack     : out    vl_logic;
        clk250_out      : out    vl_logic;
        clk500_out      : out    vl_logic;
        core_clk_out    : out    vl_logic;
        derr_cor_ext_rcv0: out    vl_logic;
        derr_cor_ext_rpl: out    vl_logic;
        derr_rpl        : out    vl_logic;
        dlup_exit       : out    vl_logic;
        hotrst_exit     : out    vl_logic;
        ko_cpl_spc_vc0  : out    vl_logic_vector(19 downto 0);
        l2_exit         : out    vl_logic;
        lane_act        : out    vl_logic_vector(3 downto 0);
        lmi_ack         : out    vl_logic;
        lmi_dout        : out    vl_logic_vector(31 downto 0);
        ltssm           : out    vl_logic_vector(4 downto 0);
        npd_alloc_1cred_vc0: out    vl_logic;
        npd_cred_vio_vc0: out    vl_logic;
        nph_alloc_1cred_vc0: out    vl_logic;
        nph_cred_vio_vc0: out    vl_logic;
        pme_to_sr       : out    vl_logic;
        powerdown_ext   : out    vl_logic_vector(1 downto 0);
        r2c_err0        : out    vl_logic;
        rate_ext        : out    vl_logic;
        rc_pll_locked   : out    vl_logic;
        rc_rx_digitalreset: out    vl_logic;
        reconfig_fromgxb: out    vl_logic_vector(33 downto 0);
        reset_status    : out    vl_logic;
        rx_fifo_empty0  : out    vl_logic;
        rx_fifo_full0   : out    vl_logic;
        rx_st_bardec0   : out    vl_logic_vector(7 downto 0);
        rx_st_be0       : out    vl_logic_vector(7 downto 0);
        rx_st_data0     : out    vl_logic_vector(63 downto 0);
        rx_st_eop0      : out    vl_logic;
        rx_st_err0      : out    vl_logic;
        rx_st_sop0      : out    vl_logic;
        rx_st_valid0    : out    vl_logic;
        rxpolarity0_ext : out    vl_logic;
        rxpolarity1_ext : out    vl_logic;
        rxpolarity2_ext : out    vl_logic;
        rxpolarity3_ext : out    vl_logic;
        rxpolarity4_ext : out    vl_logic;
        rxpolarity5_ext : out    vl_logic;
        rxpolarity6_ext : out    vl_logic;
        rxpolarity7_ext : out    vl_logic;
        suc_spd_neg     : out    vl_logic;
        test_out        : out    vl_logic_vector(8 downto 0);
        tl_cfg_add      : out    vl_logic_vector(3 downto 0);
        tl_cfg_ctl      : out    vl_logic_vector(31 downto 0);
        tl_cfg_ctl_wr   : out    vl_logic;
        tl_cfg_sts      : out    vl_logic_vector(52 downto 0);
        tl_cfg_sts_wr   : out    vl_logic;
        tx_cred0        : out    vl_logic_vector(35 downto 0);
        tx_fifo_empty0  : out    vl_logic;
        tx_fifo_full0   : out    vl_logic;
        tx_fifo_rdptr0  : out    vl_logic_vector(3 downto 0);
        tx_fifo_wrptr0  : out    vl_logic_vector(3 downto 0);
        tx_out0         : out    vl_logic;
        tx_out1         : out    vl_logic;
        tx_out2         : out    vl_logic;
        tx_out3         : out    vl_logic;
        tx_out4         : out    vl_logic;
        tx_out5         : out    vl_logic;
        tx_out6         : out    vl_logic;
        tx_out7         : out    vl_logic;
        tx_st_ready0    : out    vl_logic;
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
        txdetectrx_ext  : out    vl_logic;
        txelecidle0_ext : out    vl_logic;
        txelecidle1_ext : out    vl_logic;
        txelecidle2_ext : out    vl_logic;
        txelecidle3_ext : out    vl_logic;
        txelecidle4_ext : out    vl_logic;
        txelecidle5_ext : out    vl_logic;
        txelecidle6_ext : out    vl_logic;
        txelecidle7_ext : out    vl_logic
    );
end pcie;
