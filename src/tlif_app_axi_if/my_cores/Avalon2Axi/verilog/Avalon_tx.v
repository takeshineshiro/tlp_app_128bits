module Avalon_tx #
   (
     parameter     USER_WIDTH_TX = 4,
     parameter     AXI_DATA_WIDTH = 128,
     parameter     BE_WIDTH = AXI_DATA_WIDTH/8
   )
  (
   /*AUTOARG*/
   // Outputs
   tx_st_data0, tx_st_sop0, tx_st_eop0, tx_st_valid0,
   s_axis_rw_tready, s_axis_rr_tready, s_axis_cc_tready,
   // Inputs
   trn_clk, trn_rst, axi_clk, axi_rst, tx_st_ready0, s_axis_rw_tdata,
   s_axis_rw_tstrb, s_axis_rw_tlast, s_axis_rw_tvalid,
   s_axis_rw_tuser, s_axis_rr_tuser, s_axis_rr_tdata, s_axis_rr_tstrb,
   s_axis_rr_tlast, s_axis_rr_tvalid, s_axis_cc_tdata,
   s_axis_cc_tstrb, s_axis_cc_tlast, s_axis_cc_tvalid,
   s_axis_cc_tuser
   );

   localparam FIFO_DATA_WIDTH = AXI_DATA_WIDTH+BE_WIDTH+2 ;
   localparam TX_FIFO_DATA_WIDTH = AXI_DATA_WIDTH+2;
   localparam FIFO_DEPTH = 10;

   input                            trn_clk;
   input                            trn_rst;
   input                            axi_clk;
   input                            axi_rst;
   // tx to pcie core
   input                            tx_st_ready0;  
   output  [AXI_DATA_WIDTH-1:0]     tx_st_data0;   
   output                           tx_st_sop0;    
   output                           tx_st_eop0;    
   output                           tx_st_valid0;  
    //AXIS Write Req from DMA
   input   [AXI_DATA_WIDTH-1:0]     s_axis_rw_tdata;
   input   [BE_WIDTH-1:0]           s_axis_rw_tstrb;
   input                            s_axis_rw_tlast;
   input                            s_axis_rw_tvalid;
   input   [USER_WIDTH_TX-1:0]      s_axis_rw_tuser;
   output                           s_axis_rw_tready;
   //AXIS Read Req  from DMA
   input   [USER_WIDTH_TX-1:0]      s_axis_rr_tuser;
   input   [AXI_DATA_WIDTH-1:0]     s_axis_rr_tdata;
   input   [BE_WIDTH-1:0]           s_axis_rr_tstrb;
   input                            s_axis_rr_tlast;
   input                            s_axis_rr_tvalid;
   output                           s_axis_rr_tready;
   //AXIS Comp of host read req to host(Completer)
   input   [AXI_DATA_WIDTH-1:0]     s_axis_cc_tdata;
   input   [BE_WIDTH-1:0]           s_axis_cc_tstrb;  
   input                            s_axis_cc_tlast;        
   input                            s_axis_cc_tvalid;       
   input   [USER_WIDTH_TX-1:0]      s_axis_cc_tuser;
   output                           s_axis_cc_tready;  
  //Avalon_tx_fifo wire
   wire      [FIFO_DATA_WIDTH-1:0]  data_in_tx;
   wire                             wr_req_tx;
   wire                             rd_req_tx;
   wire    [FIFO_DATA_WIDTH-1:0]    data_out_tx;
   wire                             empty_tx; 
   wire     [FIFO_DEPTH-1:0]        wrusedw_tx; 
   wire     [FIFO_DEPTH-1:0]        rdusedw_tx; 

   wire                             trn_tdst_rdy;
   wire	                            trn_tsof;
   wire 	                    trn_teof;
   wire    [AXI_DATA_WIDTH-1:0]     trn_td;
   wire                             trn_trem;
   wire	                            trn_tsrc_rdy;
   wire                             trn_tsrc_dsc;

///////////////////////////////////////////////////////////////////////////////////
axi_enhanced_tx #( .C_DATA_WIDTH        (AXI_DATA_WIDTH),            
                   .C_FAMILY            ("X7"),             
                   .C_ROOT_PORT         ("FALSE"),        
                   .TCQ                 (0)) 
   axi_enhanced_tx(/*AUTOINST*/
		   // Outputs
		   .s_axis_rr_tready	(s_axis_rr_tready),
		   .s_axis_rw_tready	(s_axis_rw_tready),
		   .s_axis_cc_tready	(s_axis_cc_tready),
		   .trn_td		(trn_td[AXI_DATA_WIDTH-1:0]),
		   .trn_tsof		(trn_tsof),
		   .trn_teof		(trn_teof),
		   .trn_tsrc_rdy	(trn_tsrc_rdy),
		   .trn_tsrc_dsc	(trn_tsrc_dsc),
		   .trn_trem		(trn_trem),
		   .trn_terrfwd		(),
		   .trn_tstr		(),
		   .trn_tecrc_gen	(),
		   // Inputs
		   .s_axis_rr_tdata	(s_axis_rr_tdata[AXI_DATA_WIDTH-1:0]),
		   .s_axis_rr_tvalid	(s_axis_rr_tvalid),
		   .s_axis_rr_tstrb	(s_axis_rr_tstrb[BE_WIDTH-1:0]),
		   .s_axis_rr_tlast	(s_axis_rr_tlast),
		   .s_axis_rr_tuser	(s_axis_rr_tuser[3:0]),
		   .s_axis_rw_tdata	(s_axis_rw_tdata[AXI_DATA_WIDTH-1:0]),
		   .s_axis_rw_tvalid	(s_axis_rw_tvalid),
		   .s_axis_rw_tstrb	(s_axis_rw_tstrb[BE_WIDTH-1:0]),
		   .s_axis_rw_tlast	(s_axis_rw_tlast),
		   .s_axis_rw_tuser	(s_axis_rw_tuser[3:0]),
		   .s_axis_cc_tdata	(s_axis_cc_tdata[AXI_DATA_WIDTH-1:0]),
		   .s_axis_cc_tvalid	(s_axis_cc_tvalid),
		   .s_axis_cc_tstrb	(s_axis_cc_tstrb[BE_WIDTH-1:0]),
		   .s_axis_cc_tlast	(s_axis_cc_tlast),
		   .s_axis_cc_tuser	(s_axis_cc_tuser[3:0]),

		   .s_axis_cfg_tdata	(64'h0),
		   .s_axis_cfg_tvalid	(1'h0),
		   .s_axis_cfg_tstrb	(8'h0),
		   .s_axis_cfg_tlast	(1'h0),
		   .s_axis_cfg_tuser	(22'h0),
                   .cfg_req             (1'h0),

		   .trn_tdst_rdy	(trn_tdst_rdy),
		   .trn_lnk_up		(1'h1),
		   .com_iclk		(axi_clk),
		   .com_sysrst		(axi_rst));
/********************************tx_fifo_control_fsm**********************************/ 
   Tx_fifo_control # (.AXI_DATA_WIDTH	  (AXI_DATA_WIDTH),
		      .TX_FIFO_DATA_WIDTH (TX_FIFO_DATA_WIDTH),
		      .FIFO_DATA_WIDTH	  (FIFO_DATA_WIDTH),
                      .FIFO_DEPTH         (FIFO_DEPTH),
		      .BE_WIDTH		  (BE_WIDTH))
     Tx_fifo_control(/*AUTOINST*/
		     // Outputs
                     .trn_tdst_rdy      (trn_tdst_rdy),
		     .wr_req_tx		(wr_req_tx),
		     .rd_req_tx		(rd_req_tx),
		     .data_in_tx	(data_in_tx[FIFO_DATA_WIDTH-1:0]),
		     .tx_st_data0	(tx_st_data0),
		     .tx_st_sop0	(tx_st_sop0),
		     .tx_st_eop0	(tx_st_eop0),
		     .tx_st_valid0	(tx_st_valid0),                
		     // Inputs
		     .axi_clk		(axi_clk),
		     .axi_rst		(axi_rst),
		     .trn_clk		(trn_clk),
		     .trn_rst		(trn_rst),
		     .trn_tsof		(trn_tsof),
		     .trn_teof		(trn_teof),
		     .trn_td		(trn_td),
		     .trn_trem		(trn_trem),
		     .trn_tsrc_rdy  	(trn_tsrc_rdy),
		     .trn_tsrc_dsc      (trn_tsrc_dsc),
		     .data_out_tx  	(data_out_tx[FIFO_DATA_WIDTH-1:0]),
		     .empty_tx		(empty_tx),
                     .tx_st_ready0      (tx_st_ready0),
		     .wrusedw_tx	(wrusedw_tx[FIFO_DEPTH-1:0]));


/********************************avalon_st_tx_fifo******************************/    
   asyn_fifo #(.DATA_W   (FIFO_DATA_WIDTH), 
               .DEPTH_W  (FIFO_DEPTH))
     Avalon_tx_fifo
               (/*AUTOINST*/
	        // Outputs
	       .rdempty           (empty_tx),
	       .rdusedw           (rdusedw_tx),
               .wrusedw           (wrusedw_tx), 
	       .q                 (data_out_tx), 
	       // Inputs 
               .aclr              (axi_rst),
               .wrclk             (axi_clk),
               .rdclk             (trn_clk),
	       .data              (data_in_tx),
	       .wrreq             (wr_req_tx),
	       .rdreq             (rd_req_tx)
               );

endmodule


