module Avalon2Axi #
   (
     parameter     USER_WIDTH_RX  = 22,
     parameter     USER_WIDTH_TX  = 4,
     parameter     AXI_DATA_WIDTH = 128,
     parameter     BE_WIDTH = AXI_DATA_WIDTH/8
   )
  (/*AUTOARG*/
   // Outputs
   rx_st_ready0, tx_st_data0, tx_st_sop0, tx_st_eop0, tx_st_valid0,
   s_axis_rw_tready, s_axis_rr_tready, m_axis_rc_tdata,
   m_axis_rc_tstrb, m_axis_rc_tlast, m_axis_rc_tvalid, m_axis_cw_tdata, 
   m_axis_cw_tstrb, m_axis_cw_tlast,
   m_axis_cw_tvalid, m_axis_cw_tuser, m_axis_cr_tdata,
   m_axis_cr_tstrb, m_axis_cr_tlast, m_axis_cr_tvalid,
   m_axis_cr_tuser, s_axis_cc_tready,
   // Inputs
   trn_clk, trn_rst, axi_clk, axi_rst, rx_st_bardec0, rx_st_data0,
   rx_st_be0, rx_st_sop0, rx_st_eop0, rx_st_valid0, tx_st_ready0,
   s_axis_rw_tdata, s_axis_rw_tstrb, s_axis_rw_tlast,
   s_axis_rw_tvalid, s_axis_rw_tuser, s_axis_rr_tuser,
   s_axis_rr_tdata, s_axis_rr_tstrb, s_axis_rr_tlast,
   s_axis_rr_tvalid, m_axis_rc_tready, m_axis_cw_tready,
   m_axis_cr_tready, s_axis_cc_tdata, s_axis_cc_tstrb,
   s_axis_cc_tlast, s_axis_cc_tvalid, s_axis_cc_tuser
   );

   input                              trn_clk;
   input                              trn_rst;
   input                              axi_clk;
   input                              axi_rst;

   // rx from pcie core
   input   [7:0]                      rx_st_bardec0;  
   input   [AXI_DATA_WIDTH-1:0]       rx_st_data0;    
   input   [BE_WIDTH-1:0]             rx_st_be0;	    
   input                              rx_st_sop0;     
   input                              rx_st_eop0;      
   input                              rx_st_valid0; 
   output                             rx_st_ready0;   
   // tx to pcie core
   input                              tx_st_ready0;  
   output  [AXI_DATA_WIDTH-1:0]       tx_st_data0;   
   output                             tx_st_sop0;    
   output                             tx_st_eop0;    
   output                             tx_st_valid0;  
   //AXIS Write Req from DMA
   input   [AXI_DATA_WIDTH-1:0]       s_axis_rw_tdata;
   input   [BE_WIDTH-1:0]             s_axis_rw_tstrb;
   input                              s_axis_rw_tlast;
   input                              s_axis_rw_tvalid;
   input   [USER_WIDTH_TX-1:0]        s_axis_rw_tuser;
   output                             s_axis_rw_tready;
   //AXIS Read Req  from DMA
   input   [USER_WIDTH_TX-1:0]        s_axis_rr_tuser;
   input   [AXI_DATA_WIDTH-1:0]       s_axis_rr_tdata;
   input   [BE_WIDTH-1:0]             s_axis_rr_tstrb;
   input                              s_axis_rr_tlast;
   input                              s_axis_rr_tvalid;
   output                             s_axis_rr_tready;
   //AXIS Comp of DMA read req to DMA
   input                              m_axis_rc_tready;
   output  [AXI_DATA_WIDTH-1:0]       m_axis_rc_tdata;
   output  [BE_WIDTH-1:0]             m_axis_rc_tstrb;
   output                             m_axis_rc_tlast;
   output                             m_axis_rc_tvalid;
   //AXIS Write req from host(Completer)
   input                              m_axis_cw_tready;
   output  [AXI_DATA_WIDTH-1:0]       m_axis_cw_tdata;
   output  [BE_WIDTH-1:0]             m_axis_cw_tstrb;
   output                             m_axis_cw_tlast;
   output                             m_axis_cw_tvalid;
   output  [USER_WIDTH_RX-1:0]        m_axis_cw_tuser;
   //AXIS Read req from host(Completer)
   input                              m_axis_cr_tready; 
   output  [AXI_DATA_WIDTH-1:0]       m_axis_cr_tdata;
   output  [BE_WIDTH-1:0]             m_axis_cr_tstrb;
   output                             m_axis_cr_tlast;
   output                             m_axis_cr_tvalid;
   output  [USER_WIDTH_RX-1:0]        m_axis_cr_tuser;
   //AXIS Comp of host read req to host(Completer)
   input   [AXI_DATA_WIDTH-1:0]       s_axis_cc_tdata;
   input   [BE_WIDTH-1:0]             s_axis_cc_tstrb;  
   input                              s_axis_cc_tlast;        
   input                              s_axis_cc_tvalid;       
   input   [USER_WIDTH_TX-1:0]        s_axis_cc_tuser;
   output                             s_axis_cc_tready;   

  /****************************Avalon_rx********************************/
    Avalon_rx # (.AXI_DATA_WIDTH        (AXI_DATA_WIDTH),
	        .USER_WIDTH_RX		(USER_WIDTH_RX))
      Avalon_rx(/*AUTOINST*/
		// Outputs
		.rx_st_ready0		(rx_st_ready0),
		.m_axis_rc_tdata	(m_axis_rc_tdata[AXI_DATA_WIDTH-1:0]),
		.m_axis_rc_tstrb	(m_axis_rc_tstrb[BE_WIDTH-1:0]),
		.m_axis_rc_tlast	(m_axis_rc_tlast),
		.m_axis_rc_tvalid	(m_axis_rc_tvalid),
		.m_axis_cw_tdata	(m_axis_cw_tdata[AXI_DATA_WIDTH-1:0]),
		.m_axis_cw_tstrb	(m_axis_cw_tstrb[BE_WIDTH-1:0]),
		.m_axis_cw_tlast	(m_axis_cw_tlast),
		.m_axis_cw_tvalid	(m_axis_cw_tvalid),
		.m_axis_cw_tuser	(m_axis_cw_tuser[USER_WIDTH_RX-1:0]),
		.m_axis_cr_tdata	(m_axis_cr_tdata[AXI_DATA_WIDTH-1:0]),
		.m_axis_cr_tstrb	(m_axis_cr_tstrb[BE_WIDTH-1:0]),
		.m_axis_cr_tlast	(m_axis_cr_tlast),
		.m_axis_cr_tvalid	(m_axis_cr_tvalid),
		.m_axis_cr_tuser	(m_axis_cr_tuser[USER_WIDTH_RX-1:0]),
		// Inputs
		.axi_clk		(axi_clk),
		.axi_rst		(axi_rst),
		.trn_clk		(trn_clk),
		.trn_rst		(trn_rst),
		.rx_st_bardec0		(rx_st_bardec0[7:0]),
		.rx_st_data0		(rx_st_data0[AXI_DATA_WIDTH-1:0]),
		.rx_st_be0		(rx_st_be0[BE_WIDTH-1:0]),
		.rx_st_sop0		(rx_st_sop0),
		.rx_st_eop0		(rx_st_eop0),
		.rx_st_valid0		(rx_st_valid0),
		.m_axis_rc_tready	(m_axis_rc_tready),
		.m_axis_cw_tready	(m_axis_cw_tready),
		.m_axis_cr_tready	(m_axis_cr_tready));
  /****************************Avalon_tx********************************/
   Avalon_tx # (.AXI_DATA_WIDTH		(AXI_DATA_WIDTH),
	        .USER_WIDTH_TX		(USER_WIDTH_TX))
      Avalon_tx(/*AUTOINST*/
		// Outputs
		.tx_st_data0		(tx_st_data0[AXI_DATA_WIDTH-1:0]),
		.tx_st_sop0		(tx_st_sop0),
		.tx_st_eop0		(tx_st_eop0),
		.tx_st_valid0		(tx_st_valid0),
		.s_axis_rw_tready	(s_axis_rw_tready),
		.s_axis_rr_tready	(s_axis_rr_tready),
		.s_axis_cc_tready	(s_axis_cc_tready),
		// Inputs
		.trn_clk		(trn_clk),
		.trn_rst		(trn_rst),
		.axi_clk		(axi_clk),
		.axi_rst		(axi_rst),
		.tx_st_ready0		(tx_st_ready0),
		.s_axis_rw_tdata	(s_axis_rw_tdata[AXI_DATA_WIDTH-1:0]),
		.s_axis_rw_tstrb	(s_axis_rw_tstrb[BE_WIDTH-1:0]),
		.s_axis_rw_tlast	(s_axis_rw_tlast),
		.s_axis_rw_tvalid	(s_axis_rw_tvalid),
		.s_axis_rw_tuser	(s_axis_rw_tuser[USER_WIDTH_TX-1:0]),
		.s_axis_rr_tuser	(s_axis_rr_tuser[USER_WIDTH_TX-1:0]),
		.s_axis_rr_tdata	(s_axis_rr_tdata[AXI_DATA_WIDTH-1:0]),
		.s_axis_rr_tstrb	(s_axis_rr_tstrb[BE_WIDTH-1:0]),
		.s_axis_rr_tlast	(s_axis_rr_tlast),
		.s_axis_rr_tvalid	(s_axis_rr_tvalid),
		.s_axis_cc_tdata	(s_axis_cc_tdata[AXI_DATA_WIDTH-1:0]),
		.s_axis_cc_tstrb	(s_axis_cc_tstrb[BE_WIDTH-1:0]),
		.s_axis_cc_tlast	(s_axis_cc_tlast),
		.s_axis_cc_tvalid	(s_axis_cc_tvalid),
		.s_axis_cc_tuser	(s_axis_cc_tuser[USER_WIDTH_TX-1:0]));


endmodule


