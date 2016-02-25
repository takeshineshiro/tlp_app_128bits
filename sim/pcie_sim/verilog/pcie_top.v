
`define LANX8 1

`ifdef LANX8
`define LANX4 1
`endif

module pcie_top 
  (
   pcie_rstn,
   refclk,
   app_rst,
   core_clk_out,

   rx_in0,   
   tx_out0,

`ifdef LANX4
   rx_in1,
   rx_in2,
   rx_in3,
   tx_out1,
   tx_out2,
   tx_out3,
`endif

`ifdef LANX8
   rx_in4,
   rx_in5,
   rx_in6,
   rx_in7,
   tx_out4,
   tx_out5,
   tx_out6,
   tx_out7,
`endif

   // interrupt
   app_int_ack,
   app_int_sts,
   app_msi_ack,
   app_msi_num,
   app_msi_req,
   app_msi_tc,
   pex_msi_num,

   // rx channel
   rx_fifo_empty0,
   rx_fifo_full0,
   rx_st_err0,
   rx_st_bardec0,
   rx_st_data0,
   rx_st_be0,
   rx_st_sop0,
   rx_st_eop0,
   rx_st_ready0,
   rx_st_valid0,

   // tx channel
   tx_cred0,
   tx_fifo_empty0,
   tx_fifo_full0,
   tx_fifo_rdptr0,
   tx_fifo_wrptr0,
   tx_st_data0,
   tx_st_sop0,
   tx_st_eop0,
   tx_st_ready0,
   tx_st_valid0,

   linkdown,
   gen2_led,
   maxpayloadsize,
   maxreadrequestsize,
   completerid,

   cpl_pending,
   cpl_err_in,

   reconfig_clk_locked,
   reconfig_clk,
   fixedclk_serdes,

   test_in,
   test_out,
   lane_act,

   // sim only
   pipe_mode,
   powerdown_ext,
   phystatus_ext,
   rate_ext,
   pclk_in,
   clk250_out,
   clk500_out,
   rxdata0_ext,
   rxdatak0_ext,
   rxelecidle0_ext,
   rxpolarity0_ext,
   rxstatus0_ext,
   rxvalid0_ext,
   txcompl0_ext,
   txdata0_ext,
   txdatak0_ext,
   txelecidle0_ext,

`ifdef LANX4
   rxdata1_ext,
   rxdatak1_ext,
   rxelecidle1_ext,
   rxpolarity1_ext,
   rxstatus1_ext,
   rxvalid1_ext,
   txcompl1_ext,
   txdata1_ext,
   txdatak1_ext,
   txelecidle1_ext,

   rxdata2_ext,
   rxdatak2_ext,
   rxelecidle2_ext,
   rxpolarity2_ext,
   rxstatus2_ext,
   rxvalid2_ext,
   txcompl2_ext,
   txdata2_ext,
   txdatak2_ext,
   txelecidle2_ext,

   rxdata3_ext,
   rxdatak3_ext,
   rxelecidle3_ext,
   rxpolarity3_ext,
   rxstatus3_ext,
   rxvalid3_ext,
   txcompl3_ext,
   txdata3_ext,
   txdatak3_ext,
   txelecidle3_ext,
`endif

`ifdef LANX8
   rxdata4_ext,
   rxdatak4_ext,
   rxelecidle4_ext,
   rxpolarity4_ext,
   rxstatus4_ext,
   rxvalid4_ext,
   txcompl4_ext,
   txdata4_ext,
   txdatak4_ext,
   txelecidle4_ext,

   rxdata5_ext,
   rxdatak5_ext,
   rxelecidle5_ext,
   rxpolarity5_ext,
   rxstatus5_ext,
   rxvalid5_ext,
   txcompl5_ext,
   txdata5_ext,
   txdatak5_ext,
   txelecidle5_ext,

   rxdata6_ext,
   rxdatak6_ext,
   rxelecidle6_ext,
   rxpolarity6_ext,
   rxstatus6_ext,
   rxvalid6_ext,
   txcompl6_ext,
   txdata6_ext,
   txdatak6_ext,
   txelecidle6_ext,

   rxdata7_ext,
   rxdatak7_ext,
   rxelecidle7_ext,
   rxpolarity7_ext,
   rxstatus7_ext,
   rxvalid7_ext,
   txcompl7_ext,
   txdata7_ext,
   txdatak7_ext,
   txelecidle7_ext,
`endif

   txdetectrx_ext,
   cfg_devcsr
   );

  parameter  PCIE_VENDOR_ID   = 4466;
  parameter  PCIE_DEVICE_ID   = 4; 
  parameter  PCIE_VEVISION_ID = 1; 

   input            pcie_rstn;
   input            refclk;
   output 	    app_rst;
   output 	    core_clk_out;


   input            rx_in0;
   output           tx_out0;
`ifdef LANX4
   input            rx_in1;
   input            rx_in2;
   input            rx_in3;
   output           tx_out1;
   output           tx_out2;
   output           tx_out3;
`endif

`ifdef LANX8
   input            rx_in4;
   input            rx_in5;
   input            rx_in6;
   input            rx_in7;
   output           tx_out4;
   output           tx_out5;
   output           tx_out6;
   output           tx_out7;
`endif

   output [ 35: 0]  tx_cred0;  
   output           tx_fifo_empty0;
   output           tx_fifo_full0;
   output [  3: 0]  tx_fifo_rdptr0;
   output [  3: 0]  tx_fifo_wrptr0;
   input [ 63: 0]   tx_st_data0;
   input            tx_st_sop0;
   input            tx_st_eop0;
   input            tx_st_valid0;
   output           tx_st_ready0;

   output           rx_fifo_empty0;
   output           rx_fifo_full0;
   output           rx_st_err0;
   output [  7: 0]  rx_st_bardec0;
   output [ 63: 0]  rx_st_data0;
   output [  7: 0]  rx_st_be0;
   output           rx_st_sop0;
   output           rx_st_eop0;
   input            rx_st_ready0;
   output           rx_st_valid0;

   input            app_int_sts;
   output           app_int_ack;
   output           app_msi_ack;
   input [  4: 0]   app_msi_num;
   input            app_msi_req;
   input [  2: 0]   app_msi_tc;
   input [  4: 0]   pex_msi_num;

   output           linkdown;
   output           gen2_led;
   output [2:0]     maxpayloadsize;
   output [2:0]     maxreadrequestsize;
   output [12:0]    completerid;

   input [6:0] 	    cpl_err_in;
   input 	    cpl_pending;

   input 	    reconfig_clk;
   input 	    reconfig_clk_locked;
   input 	    fixedclk_serdes;

   input [ 39: 0]   test_in;
   output [  8: 0]  test_out;
   output [  3: 0]  lane_act;

   input            pipe_mode;
   input            phystatus_ext;
   output [  1: 0]  powerdown_ext;
   output           rate_ext;
   input            pclk_in;
   output           clk250_out;
   output           clk500_out;

   input [7: 0]     rxdata0_ext;
   input 	    rxdatak0_ext;
   input 	    rxelecidle0_ext;
   output 	    rxpolarity0_ext;
   input [ 2: 0]    rxstatus0_ext;
   input 	    rxvalid0_ext;

   output           txcompl0_ext;
   output [7: 0]    txdata0_ext;
   output           txdatak0_ext;
   output 	    txelecidle0_ext;

`ifdef LANX4
   input [7: 0]     rxdata1_ext;
   input 	    rxdatak1_ext;
   input 	    rxelecidle1_ext;
   output 	    rxpolarity1_ext;
   input [ 2: 0]    rxstatus1_ext;
   input 	    rxvalid1_ext;
   output           txcompl1_ext;
   output [7: 0]    txdata1_ext;
   output           txdatak1_ext;
   output 	    txelecidle1_ext;

   input [7: 0]     rxdata2_ext;
   input 	    rxdatak2_ext;
   input 	    rxelecidle2_ext;
   output 	    rxpolarity2_ext;
   input [ 2: 0]    rxstatus2_ext;
   input 	    rxvalid2_ext;
   output           txcompl2_ext;
   output [7: 0]    txdata2_ext;
   output           txdatak2_ext;
   output 	    txelecidle2_ext;

   input [7: 0]     rxdata3_ext;
   input 	    rxdatak3_ext;
   input 	    rxelecidle3_ext;
   output 	    rxpolarity3_ext;
   input [ 2: 0]    rxstatus3_ext;
   input 	    rxvalid3_ext;
   output           txcompl3_ext;
   output [7: 0]    txdata3_ext;
   output           txdatak3_ext;
   output 	    txelecidle3_ext;
`endif

`ifdef LANX8
   input [7: 0]     rxdata4_ext;
   input 	    rxdatak4_ext;
   input 	    rxelecidle4_ext;
   output 	    rxpolarity4_ext;
   input [ 2: 0]    rxstatus4_ext;
   input 	    rxvalid4_ext;
   output           txcompl4_ext;
   output [7: 0]    txdata4_ext;
   output           txdatak4_ext;
   output 	    txelecidle4_ext;

   input [7: 0]     rxdata5_ext;
   input 	    rxdatak5_ext;
   input 	    rxelecidle5_ext;
   output 	    rxpolarity5_ext;
   input [ 2: 0]    rxstatus5_ext;
   input 	    rxvalid5_ext;
   output           txcompl5_ext;
   output [7: 0]    txdata5_ext;
   output           txdatak5_ext;
   output 	    txelecidle5_ext;

   input [7: 0]     rxdata6_ext;
   input 	    rxdatak6_ext;
   input 	    rxelecidle6_ext;
   output 	    rxpolarity6_ext;
   input [ 2: 0]    rxstatus6_ext;
   input 	    rxvalid6_ext;
   output           txcompl6_ext;
   output [7: 0]    txdata6_ext;
   output           txdatak6_ext;
   output 	    txelecidle6_ext;

   input [7: 0]     rxdata7_ext;
   input 	    rxdatak7_ext;
   input 	    rxelecidle7_ext;
   output 	    rxpolarity7_ext;
   input [ 2: 0]    rxstatus7_ext;
   input 	    rxvalid7_ext;
   output           txcompl7_ext;
   output [7: 0]    txdata7_ext;
   output           txdatak7_ext;
   output 	    txelecidle7_ext;
`endif

   output           txdetectrx_ext;
   output [ 31: 0]  cfg_devcsr;

   wire             pld_clk;
   wire [ 12: 0]    cfg_busdev;

   wire [ 19: 0]    cfg_io_bas;
   wire [ 31: 0]    cfg_linkcsr;
   wire [ 15: 0]    cfg_msicsr;
   wire [ 11: 0]    cfg_np_bas;
   wire [ 43: 0]    cfg_pr_bas;
   wire [ 31: 0]    cfg_prmcsr;
   wire             clk250_out;
   wire             clk500_out;
   wire             core_clk_out;
   wire [  6: 0]    cpl_err;

   wire [  4: 0]    dl_ltssm;
   wire [127: 0]    err_desc;
   wire [  3: 0]    lane_act;
   wire             lmi_ack;
   wire [ 11: 0]    lmi_addr;
   wire [ 31: 0]    lmi_din;
   wire [ 31: 0]    lmi_dout;
   wire             lmi_rden;
   wire             lmi_wren;
   wire             pme_to_sr;
   wire [  1: 0]    powerdown_ext;
   wire             rc_pll_locked;

   wire             srstn;
   wire [  3: 0]    tl_cfg_add;
   wire [ 31: 0]    tl_cfg_ctl;
   wire             tl_cfg_ctl_wr;
   wire [ 52: 0]    tl_cfg_sts;
   wire             tl_cfg_sts_wr;
   wire 	    cpl_pending;
   wire [  6: 0]    cpl_err_in;


   wire             crst;
   wire             data_valid;
   wire             dlup_exit;
   wire             hotrst_exit;
   wire             l2_exit;
   wire             npor;
   wire             npor_serdes_pll_locked;
   wire             offset_cancellation_reset;
   wire             pll_powerdown;
   wire [ 33: 0]    reconfig_fromgxb;
   wire [  3: 0]    reconfig_togxb;
   wire [  3: 0]    rx_eqctrl_out;
   wire [  2: 0]    rx_eqdcgain_out;
   wire             srst;
   wire [  4: 0]    tx_preemp_0t_out;
   wire [  4: 0]    tx_preemp_1t_out;
   wire [  4: 0]    tx_preemp_2t_out;
   wire [  2: 0]    tx_vodctrl_out;
   wire             busy_altgxb_reconfig;
   wire             busy_altgxb_reconfig_altr;


   assign app_rst = srst;
   assign pld_clk = core_clk_out;
   assign maxpayloadsize = cfg_devcsr[7:5];
   assign maxreadrequestsize = cfg_devcsr[14:12];
   assign linkdown = (dl_ltssm != 5'hf);
   assign completerid = cfg_busdev;
   assign gen2_led = cfg_linkcsr[17];
   assign test_out = {lane_act,dl_ltssm}; 


   assign offset_cancellation_reset = ~reconfig_clk_locked;
   assign reconfig_fromgxb[33 : 17] = 0;
   assign busy_altgxb_reconfig_altr = (pipe_mode)? 1'h0 : busy_altgxb_reconfig;
   assign pll_powerdown = ~npor;
   assign npor_serdes_pll_locked = pcie_rstn & rc_pll_locked;
   assign npor = pcie_rstn;

   pcie #
     (
       .PCIE_VENDOR_ID         (PCIE_VENDOR_ID), 
       .PCIE_DEVICE_ID         (PCIE_DEVICE_ID),
       .PCIE_VEVISION_ID       (PCIE_VEVISION_ID)
    ) epmap
     (
      // clk rst
      .core_clk_out (core_clk_out),
      .refclk (refclk),
      .pld_clk (pld_clk),
      .crst (crst),
      .npor (npor),
      .srst (srst),
      .ltssm (dl_ltssm),
      .l2_exit (l2_exit),
      .hotrst_exit (hotrst_exit),
      .dlup_exit (dlup_exit),
      .rc_pll_locked (rc_pll_locked),

      // config
      .tl_cfg_add (tl_cfg_add),
      .tl_cfg_ctl (tl_cfg_ctl),
      .tl_cfg_ctl_wr (tl_cfg_ctl_wr),
      .tl_cfg_sts (tl_cfg_sts),
      .tl_cfg_sts_wr (tl_cfg_sts_wr),
      .hpg_ctrler (5'h0),

      // reconfig
      .reconfig_fromgxb (reconfig_fromgxb[16 : 0]),
      .reconfig_togxb (reconfig_togxb),
      .reconfig_clk (reconfig_clk),
      .cal_blk_clk (reconfig_clk),
      .fixedclk_serdes (fixedclk_serdes),
      .busy_altgxb_reconfig (busy_altgxb_reconfig_altr),
      .gxb_powerdown (pll_powerdown),
      .pll_powerdown (pll_powerdown),


      // power
      .pme_to_cr (pme_to_sr),
      .pme_to_sr (pme_to_sr),
      .pm_event (1'b0),
      .pm_data (10'h0),
      .pm_auxpwr (1'b0),

      // lmi
      .lmi_ack (lmi_ack),
      .lmi_addr (lmi_addr),
      .lmi_din (lmi_din),
      .lmi_dout (lmi_dout),
      .lmi_rden (lmi_rden),
      .lmi_wren (lmi_wren),

      // serial 
      .rx_in0 (rx_in0),
      .tx_out0 (tx_out0),

`ifdef LANX4
      .rx_in1 (rx_in1),
      .rx_in2 (rx_in2),
      .rx_in3 (rx_in3),
      .tx_out1 (tx_out1),
      .tx_out2 (tx_out2),
      .tx_out3 (tx_out3),
`endif

`ifdef LANX8
      .rx_in4 (rx_in4),
      .rx_in5 (rx_in5),
      .rx_in6 (rx_in6),
      .rx_in7 (rx_in7),
      .tx_out4 (tx_out4),
      .tx_out5 (tx_out5),
      .tx_out6 (tx_out6),
      .tx_out7 (tx_out7),      
`endif
      // completion
      .cpl_err (cpl_err),
      .cpl_pending (cpl_pending),

      // interrupt
      .app_int_ack (app_int_ack),
      .app_int_sts (app_int_sts),
      .app_msi_ack (app_msi_ack),
      .app_msi_num (app_msi_num),
      .app_msi_req (app_msi_req),
      .app_msi_tc (app_msi_tc),
      .pex_msi_num (pex_msi_num),

      // rx channel
      .rx_fifo_empty0 (rx_fifo_empty0),
      .rx_fifo_full0 (rx_fifo_full0),
      .rx_st_err0 (rx_st_err0),
      .rx_st_mask0 (1'h0),
      .rx_st_bardec0 (rx_st_bardec0),
      .rx_st_data0 (rx_st_data0),
      .rx_st_be0 (rx_st_be0),
      .rx_st_sop0 (rx_st_sop0),
      .rx_st_eop0 (rx_st_eop0),
      .rx_st_ready0 (rx_st_ready0),
      .rx_st_valid0 (rx_st_valid0),

      // tx channel
      .tx_cred0 (tx_cred0),
      .tx_fifo_empty0 (tx_fifo_empty0),
      .tx_fifo_full0 (tx_fifo_full0),
      .tx_fifo_rdptr0 (tx_fifo_rdptr0),
      .tx_fifo_wrptr0 (tx_fifo_wrptr0),
      .tx_st_err0 (1'h0),
      .tx_st_data0 (tx_st_data0),
      .tx_st_sop0 (tx_st_sop0),
      .tx_st_eop0 (tx_st_eop0),
      .tx_st_ready0 (tx_st_ready0),
      .tx_st_valid0 (tx_st_valid0),

      // test
      .test_in (test_in),
      .lane_act (lane_act),

      // sim only
      .pipe_mode (pipe_mode),      
      .powerdown_ext (powerdown_ext),
      .phystatus_ext (phystatus_ext),      
      .rate_ext (rate_ext),
      .pclk_in (pclk_in),
      .clk250_out (clk250_out),
      .clk500_out (clk500_out),
      .rxdata0_ext (rxdata0_ext),
      .rxdatak0_ext (rxdatak0_ext),
      .rxelecidle0_ext (rxelecidle0_ext),
      .rxpolarity0_ext (rxpolarity0_ext),
      .rxstatus0_ext (rxstatus0_ext),
      .rxvalid0_ext (rxvalid0_ext),
      .txcompl0_ext (txcompl0_ext),
      .txdata0_ext (txdata0_ext),
      .txdatak0_ext (txdatak0_ext),
      .txelecidle0_ext (txelecidle0_ext),

`ifdef LANX4
      .rxdata1_ext (rxdata1_ext),
      .rxdatak1_ext (rxdatak1_ext),
      .rxelecidle1_ext (rxelecidle1_ext),
      .rxpolarity1_ext (rxpolarity1_ext),
      .rxstatus1_ext (rxstatus1_ext),
      .rxvalid1_ext (rxvalid1_ext),
      .txcompl1_ext (txcompl1_ext),
      .txdata1_ext (txdata1_ext),
      .txdatak1_ext (txdatak1_ext),
      .txelecidle1_ext (txelecidle1_ext),

      .rxdata2_ext (rxdata2_ext),
      .rxdatak2_ext (rxdatak2_ext),
      .rxelecidle2_ext (rxelecidle2_ext),
      .rxpolarity2_ext (rxpolarity2_ext),
      .rxstatus2_ext (rxstatus2_ext),
      .rxvalid2_ext (rxvalid2_ext),
      .txcompl2_ext (txcompl2_ext),
      .txdata2_ext (txdata2_ext),
      .txdatak2_ext (txdatak2_ext),
      .txelecidle2_ext (txelecidle2_ext),

      .rxdata3_ext (rxdata3_ext),
      .rxdatak3_ext (rxdatak3_ext),
      .rxelecidle3_ext (rxelecidle3_ext),
      .rxpolarity3_ext (rxpolarity3_ext),
      .rxstatus3_ext (rxstatus3_ext),
      .rxvalid3_ext (rxvalid3_ext),
      .txcompl3_ext (txcompl3_ext),
      .txdata3_ext (txdata3_ext),
      .txdatak3_ext (txdatak3_ext),
      .txelecidle3_ext (txelecidle3_ext),
`endif

`ifdef LANX8
      .rxdata4_ext (rxdata4_ext),
      .rxdatak4_ext (rxdatak4_ext),
      .rxelecidle4_ext (rxelecidle4_ext),
      .rxpolarity4_ext (rxpolarity4_ext),
      .rxstatus4_ext (rxstatus4_ext),
      .rxvalid4_ext (rxvalid4_ext),
      .txcompl4_ext (txcompl4_ext),
      .txdata4_ext (txdata4_ext),
      .txdatak4_ext (txdatak4_ext),
      .txelecidle4_ext (txelecidle4_ext),

      .rxdata5_ext (rxdata5_ext),
      .rxdatak5_ext (rxdatak5_ext),
      .rxelecidle5_ext (rxelecidle5_ext),
      .rxpolarity5_ext (rxpolarity5_ext),
      .rxstatus5_ext (rxstatus5_ext),
      .rxvalid5_ext (rxvalid5_ext),
      .txcompl5_ext (txcompl5_ext),
      .txdata5_ext (txdata5_ext),
      .txdatak5_ext (txdatak5_ext),
      .txelecidle5_ext (txelecidle5_ext),

      .rxdata6_ext (rxdata6_ext),
      .rxdatak6_ext (rxdatak6_ext),
      .rxelecidle6_ext (rxelecidle6_ext),
      .rxpolarity6_ext (rxpolarity6_ext),
      .rxstatus6_ext (rxstatus6_ext),
      .rxvalid6_ext (rxvalid6_ext),
      .txcompl6_ext (txcompl6_ext),
      .txdata6_ext (txdata6_ext),
      .txdatak6_ext (txdatak6_ext),
      .txelecidle6_ext (txelecidle6_ext),

      .rxdata7_ext (rxdata7_ext),
      .rxdatak7_ext (rxdatak7_ext),
      .rxelecidle7_ext (rxelecidle7_ext),
      .rxpolarity7_ext (rxpolarity7_ext),
      .rxstatus7_ext (rxstatus7_ext),
      .rxvalid7_ext (rxvalid7_ext),
      .txcompl7_ext (txcompl7_ext),
      .txdata7_ext (txdata7_ext),
      .txdatak7_ext (txdatak7_ext),
      .txelecidle7_ext (txelecidle7_ext),
`endif
      .txdetectrx_ext (txdetectrx_ext)
      );


   altpcie_reconfig_4sgx reconfig
     (
      .busy (busy_altgxb_reconfig),
      .data_valid (data_valid),
      .logical_channel_address (3'b000),
      .offset_cancellation_reset (offset_cancellation_reset),
      .read (1'b0),
      .reconfig_clk (reconfig_clk),
      .reconfig_fromgxb (reconfig_fromgxb),
      .reconfig_togxb (reconfig_togxb),
      .rx_eqctrl (4'b0000),
      .rx_eqctrl_out (rx_eqctrl_out),
      .rx_eqdcgain (3'b000),
      .rx_eqdcgain_out (rx_eqdcgain_out),
      .tx_preemp_0t (5'b00000),
      .tx_preemp_0t_out (tx_preemp_0t_out),
      .tx_preemp_1t (5'b00000),
      .tx_preemp_1t_out (tx_preemp_1t_out),
      .tx_preemp_2t (5'b00000),
      .tx_preemp_2t_out (tx_preemp_2t_out),
      .tx_vodctrl (3'b000),
      .tx_vodctrl_out (tx_vodctrl_out),
      .write_all (1'b0)
      );


   pcie_rs_hip rs_hip
     (
      .app_rstn (srstn),
      .crst (crst),
      .dlup_exit (dlup_exit),
      .hotrst_exit (hotrst_exit),
      .l2_exit (l2_exit),
      .ltssm (dl_ltssm),
      .npor (npor_serdes_pll_locked),
      .pld_clk (pld_clk),
      .srst (srst),
      .test_sim (test_in[0])
      );

   altpcierd_tl_cfg_sample cfgbus
     (
      .cfg_busdev (cfg_busdev),
      .cfg_devcsr (cfg_devcsr),
      .cfg_io_bas (cfg_io_bas),
      .cfg_linkcsr (cfg_linkcsr),
      .cfg_msicsr (cfg_msicsr),
      .cfg_np_bas (cfg_np_bas),
      .cfg_pr_bas (cfg_pr_bas),
      .cfg_prmcsr (cfg_prmcsr),
      .cfg_tcvcmap (),
      .pld_clk (pld_clk),
      .rstn (srstn),
      .tl_cfg_add (tl_cfg_add),
      .tl_cfg_ctl (tl_cfg_ctl),
      .tl_cfg_ctl_wr (tl_cfg_ctl_wr),
      .tl_cfg_sts (tl_cfg_sts),
      .tl_cfg_sts_wr (tl_cfg_sts_wr)
      );


   altpcierd_cplerr_lmi lmi_blk
     (
      .clk_in (pld_clk),
      .cpl_err_in (cpl_err_in),
      .cpl_err_out (cpl_err),
      .cplerr_lmi_busy (),
      .err_desc (err_desc),
      .lmi_ack (lmi_ack),
      .lmi_addr (lmi_addr),
      .lmi_din (lmi_din),
      .lmi_rden (lmi_rden),
      .lmi_wren (lmi_wren),
      .rstn (srstn)
      );

endmodule

