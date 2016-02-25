module Avalon_rx #
   (
     parameter     USER_WIDTH_RX  = 22,
     parameter     AXI_DATA_WIDTH = 128,
     parameter     BE_WIDTH = AXI_DATA_WIDTH/8
   )
  (
   /*AUTOARG*/
   // Outputs
   rx_st_ready0, m_axis_rc_tdata, m_axis_rc_tstrb, m_axis_rc_tlast,
   m_axis_rc_tvalid, m_axis_cw_tdata,
   m_axis_cw_tstrb, m_axis_cw_tlast, m_axis_cw_tvalid,
   m_axis_cw_tuser, m_axis_cr_tdata, m_axis_cr_tstrb, m_axis_cr_tlast,
   m_axis_cr_tvalid, m_axis_cr_tuser,
   // Inputs
   trn_clk, trn_rst, axi_clk, axi_rst, rx_st_bardec0, rx_st_data0,
   rx_st_be0, rx_st_sop0, rx_st_eop0, rx_st_valid0, m_axis_rc_tready,
   m_axis_cw_tready, m_axis_cr_tready
   );

   localparam FIFO_DATA_WIDTH = AXI_DATA_WIDTH+BE_WIDTH+8+2;
   localparam FIFO_DEPTH = 10;

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
  /***************************wire***********************************/ 
   //Avalon_rx_fifo
   wire  [FIFO_DEPTH-1:0]             wrusedw_rx;
   wire                               wr_req_rx;
   wire                               empty_rx;
   wire                               rd_req_rx;
   wire  [FIFO_DATA_WIDTH-1:0]     data_in_rx;
   wire  [FIFO_DATA_WIDTH-1:0]     data_out_rx;
   wire                               eof_empty_rx;
   wire                               rx_eop_wrin;
   wire                               rx_eop_rdout;

   wire    [7:0]                      trn_rbar_hit;
   wire	                              trn_rsof;
   wire 	                      trn_reof;
   wire    [AXI_DATA_WIDTH-1:0]       trn_rd;
   wire                               trn_rrem;
   wire	                              trn_rsrc_rdy;
   wire                               trn_rdst_rdy;
   
   assign rx_eop_wrin = rx_st_eop0 && rx_st_valid0;
   assign rx_eop_rdout = data_out_rx[FIFO_DATA_WIDTH-2] && rd_req_rx;
  /***************************rx_fifo***********************************/ 
   asyn_fifo #(.DATA_W      (FIFO_DATA_WIDTH),
               .DEPTH_W     (FIFO_DEPTH))
     Avalon_rx_fifo
              (//write from pcie
               .aclr              (trn_rst),
               .wrclk             (trn_clk),
	       .data              (data_in_rx),
	       .wrreq             (wr_req_rx),
	       .wrfull            (),
	       .wrusedw           (wrusedw_rx),
               //read from device
               .rdclk             (axi_clk),
	       .rdreq             (rd_req_rx),
	       .q                 (data_out_rx),
	       .rdempty           (empty_rx)
                );
  
  asyn_fifo #(.DATA_W   (1), 
              .DEPTH_W  (10))
     rx_eop_control_fifo
              (.aclr              (trn_rst),
               .wrclk             (trn_clk),
	       .data              (1'h1),
	       .wrreq             (rx_eop_wrin),

               .rdclk             (axi_clk),
	       .rdreq             (rx_eop_rdout),
	       .rdempty           (eof_empty_rx)
               );

  /****************************Rx_fifo_control ************************************/ 
Rx_fifo_control # (/*AUTOINSTPARAM*/
		   // Parameters
		   .AXI_DATA_WIDTH	(AXI_DATA_WIDTH),
		   .FIFO_DATA_WIDTH	(FIFO_DATA_WIDTH),
                   .FIFO_DEPTH          (FIFO_DEPTH),
		   .BE_WIDTH		(BE_WIDTH))
  Rx_fifo_control (/*AUTOINST*/
		   // Outputs
		   .rx_st_ready0	(rx_st_ready0),
		   .wr_req_rx		(wr_req_rx),
		   .rd_req_rx		(rd_req_rx),
		   .data_in_rx		(data_in_rx[FIFO_DATA_WIDTH-1:0]),
		   .trn_rsrc_rdy	(trn_rsrc_rdy),
		   .trn_rbar_hit	(trn_rbar_hit),
		   .trn_rsof		(trn_rsof),
		   .trn_reof		(trn_reof),
		   .trn_rd		(trn_rd),
		   .trn_rrem		(trn_rrem),

		   // Inputs
		   .axi_clk		(axi_clk),
		   .axi_rst		(axi_rst),
		   .trn_clk		(trn_clk),
		   .trn_rst		(trn_rst),
		   .trn_rdst_rdy	(trn_rdst_rdy),
		   .data_out_rx		(data_out_rx[FIFO_DATA_WIDTH-1:0]),
		   .rx_st_sop0		(rx_st_sop0),
		   .rx_st_bardec0	(rx_st_bardec0[7:0]),
		   .rx_st_data0		(rx_st_data0[AXI_DATA_WIDTH-1:0]),
		   .rx_st_be0		(rx_st_be0[BE_WIDTH-1:0]),
		   .rx_st_eop0		(rx_st_eop0),
		   .rx_st_valid0	(rx_st_valid0),
		   .wrusedw_rx		(wrusedw_rx[FIFO_DEPTH-1:0]),
                   .eof_empty_rx        (eof_empty_rx),
		   .empty_rx		(empty_rx));

   axi_enhanced_rx #(
                   .C_DATA_WIDTH        (AXI_DATA_WIDTH),          
                   .C_FAMILY            ("X7"),            
                   .C_RX_REALIGN        ("FALSE"),        
                   .C_RX_PRESERVE_ORDER ("FALSE"), 
                   .C_ROOT_PORT         ("FALSE"),        
                   .TCQ                 (0)) 

          axi_enhanced_rx(/*AUTOINST*/
			  // Outputs
			  .m_axis_cr_tdata	(m_axis_cr_tdata),
			  .m_axis_cr_tvalid	(m_axis_cr_tvalid),
			  .m_axis_cr_tstrb	(m_axis_cr_tstrb),
			  .m_axis_cr_tlast	(m_axis_cr_tlast),
			  .m_axis_cr_tuser	(m_axis_cr_tuser),
			  .m_axis_cw_tdata	(m_axis_cw_tdata),
			  .m_axis_cw_tvalid	(m_axis_cw_tvalid),
			  .m_axis_cw_tstrb	(m_axis_cw_tstrb),
			  .m_axis_cw_tlast	(m_axis_cw_tlast),
			  .m_axis_cw_tuser	(m_axis_cw_tuser),
			  .m_axis_rc_tdata	(m_axis_rc_tdata),
			  .m_axis_rc_tvalid	(m_axis_rc_tvalid),
			  .m_axis_rc_tstrb	(m_axis_rc_tstrb),
			  .m_axis_rc_tlast	(m_axis_rc_tlast),
			  .trn_rdst_rdy		(trn_rdst_rdy),
			  // Inputs
			  .m_axis_cr_tready	(m_axis_cr_tready),
			  .m_axis_cw_tready	(m_axis_cw_tready),
			  .m_axis_rc_tready	(m_axis_rc_tready),
			  .m_axis_cfg_tready	(1'h0),
			  .msi_address		(64'h0),
			  .rx_np_req		(1'h0),
			  .cfg_req		(1'h0),
			  .trn_rd		(trn_rd),
			  .trn_rsof		(trn_rsof),
			  .trn_reof		(trn_reof),
			  .trn_rsrc_rdy		(trn_rsrc_rdy),
			  .trn_rsrc_dsc		(1'h0),
			  .trn_rrem		(trn_rrem),
			  .trn_rerrfwd		(1'h0),
			  .trn_rbar_hit		(trn_rbar_hit),
			  .trn_recrc_err	(1'h0),
			  .trn_lnk_up		(1'h1),
			  .com_iclk		(axi_clk),
			  .com_sysrst		(axi_rst));


endmodule


