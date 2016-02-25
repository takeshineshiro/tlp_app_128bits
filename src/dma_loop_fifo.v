module dma_loop_fifo 
  (
   /*AUTOARG*/
   // Outputs
   m_axis_mm2s_tready, s_axis_s2mm_tdata, s_axis_s2mm_tkeep,
   s_axis_s2mm_tvalid, s_axis_s2mm_tlast,
   // Inputs
   axi_clk, axi_rst, m_axis_mm2s_tdata, m_axis_mm2s_tkeep,
   m_axis_mm2s_tvalid, m_axis_mm2s_tlast, s_axis_s2mm_tready
   );
   parameter  AXI_DATA_WIDTH  = 64;
   localparam BE_WIDTH        = AXI_DATA_WIDTH/8;
   localparam FIFO_DATA_WIDTH = AXI_DATA_WIDTH+BE_WIDTH+1 ;


   input                            axi_clk;
   input                            axi_rst;

   input   [AXI_DATA_WIDTH-1:0]     m_axis_mm2s_tdata;               
   input   [BE_WIDTH-1:0]           m_axis_mm2s_tkeep;               
   input                            m_axis_mm2s_tvalid;   
   input                            m_axis_mm2s_tlast;             
   output                           m_axis_mm2s_tready;                      
 
   input                            s_axis_s2mm_tready;       
   output  [AXI_DATA_WIDTH-1:0]     s_axis_s2mm_tdata;           
   output  [BE_WIDTH-1:0]           s_axis_s2mm_tkeep;         
   output                           s_axis_s2mm_tvalid;        
   output                           s_axis_s2mm_tlast;            

   wire                               almost_full_rx;
   wire                               empty;
   wire  [9:0]                        usedw; 
   wire  [FIFO_DATA_WIDTH-1:0]        data_in;
   wire  [FIFO_DATA_WIDTH-1:0]        data_out;
   wire                               rd_req;
   wire                               wr_req;

   assign almost_full_rx = usedw[9] && usedw[8];
   assign m_axis_mm2s_tready = ~almost_full_rx;
   assign wr_req = m_axis_mm2s_tvalid && m_axis_mm2s_tready;
   assign data_in[72] = m_axis_mm2s_tlast;
   assign data_in[71:64] = m_axis_mm2s_tkeep;
   assign data_in[63:0] = m_axis_mm2s_tdata;

   assign rd_req = !empty && s_axis_s2mm_tready;
   assign s_axis_s2mm_tdata = data_out[63:0];
   assign s_axis_s2mm_tkeep = data_out[71:64];
   assign s_axis_s2mm_tlast = data_out[72];
   assign s_axis_s2mm_tvalid = rd_req;


   fifo  #(.DATA_W      (FIFO_DATA_WIDTH), 
           .DEPTH_W     (10))
     fifo
              (.aclr            (axi_rst),
	       .sclr            (axi_rst),
               .clock           (axi_clk),
	       .wrreq           (wr_req),
	       .data            (data_in),
               .usedw           (usedw),
	       .rdreq           (rd_req),

	       .q               (data_out),
	       .empty           (empty)); 

endmodule


