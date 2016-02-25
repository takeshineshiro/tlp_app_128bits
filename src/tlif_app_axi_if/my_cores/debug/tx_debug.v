module tx_debug 

  (
   /*AUTOARG*/
   // Outputs
   wdata_counter, rdata_counter, cdata_counter, rdesc_counter,cdesc_counter,       
   dma_rdesc_counter,dma_cdesc_counter,dma_rdata_counter,dma_cdata_counter,dma_wdata_counter,
   // Inputs
   trn_clk, trn_rst, axi_clk, axi_rst, tx_st_valid0, tx_st_sop0,
   tx_st_data0, rx_st_valid0, rx_st_sop0, rx_st_data0,
   m_axi_sg_arready,m_axi_sg_arvalid,m_axi_sg_rlast,m_axi_sg_rvalid,
   m_axi_sg_rready,m_axi_mm2s_arvalid,m_axi_mm2s_arready,m_axi_mm2s_rvalid,
   m_axi_mm2s_rready,m_axi_mm2s_rlast,m_axi_s2mm_wlast,m_axi_s2mm_wvalid,m_axi_s2mm_wready
   );

 
   input                            trn_clk;
   input                            trn_rst;
   input                            axi_clk;
   input                            axi_rst;

   input                            tx_st_valid0;
   input                            tx_st_sop0;
   input [63:0]                     tx_st_data0;

   input                            rx_st_valid0;
   input                            rx_st_sop0;
   input [63:0]                     rx_st_data0;
   //
   input                            m_axi_sg_arready;
   input                            m_axi_sg_arvalid;

   input                            m_axi_sg_rlast;
   input                            m_axi_sg_rvalid;
   input                            m_axi_sg_rready;
   //
   input                            m_axi_mm2s_arvalid;
   input                            m_axi_mm2s_arready;

   input                            m_axi_mm2s_rvalid;
   input                            m_axi_mm2s_rready;
   input                            m_axi_mm2s_rlast;
   //
   input                            m_axi_s2mm_wlast;     
   input                            m_axi_s2mm_wvalid;       
   input                            m_axi_s2mm_wready;


   output reg [7:0]                 wdata_counter;//dma wdata
   output reg [7:0]                 rdata_counter;//dma rdata
   output reg [7:0]                 cdata_counter;//pcie cdata

   output reg [7:0]                 rdesc_counter;
   output reg [7:0]                 cdesc_counter;
   //
   output reg [7:0]                 dma_rdesc_counter;
   output reg [7:0]                 dma_cdesc_counter;

   output reg [7:0]                 dma_rdata_counter;
   output reg [7:0]                 dma_cdata_counter;

   output reg [7:0]                 dma_wdata_counter;

always @(posedge axi_clk)
  begin
    if (axi_rst)
      begin
        dma_rdesc_counter <= 8'h0;
      end
    else if (m_axi_sg_arready && m_axi_sg_arvalid)
      begin
        dma_rdesc_counter <= dma_rdesc_counter + 1'h1;
      end
  end

always @(posedge axi_clk)
  begin
    if (axi_rst)
      begin
        dma_cdesc_counter <= 8'h0;
      end
    else if (m_axi_sg_rlast && m_axi_sg_rvalid && m_axi_sg_rready)
      begin
        dma_cdesc_counter <= dma_cdesc_counter + 1'h1;
      end
  end

always @(posedge axi_clk)
  begin
    if (axi_rst)
      begin
        dma_rdata_counter <= 8'h0;
      end
    else if (m_axi_mm2s_arvalid && m_axi_mm2s_arvalid)
      begin
        dma_rdata_counter <= dma_rdata_counter + 1'h1;
      end
  end

always @(posedge axi_clk)
  begin
    if (axi_rst)
      begin
        dma_cdata_counter <= 8'h0;
      end
    else if (m_axi_mm2s_rvalid && m_axi_mm2s_rready && m_axi_mm2s_rlast)
      begin
        dma_cdata_counter <= dma_cdata_counter + 1'h1;
      end
  end

always @(posedge axi_clk)
  begin
    if (axi_rst)
      begin
        dma_wdata_counter <= 8'h0;
      end
    else if (m_axi_s2mm_wlast && m_axi_s2mm_wvalid && m_axi_s2mm_wready)
      begin
        dma_wdata_counter <= dma_wdata_counter + 1'h1;
      end
  end

always @(posedge trn_clk)
  begin
    if (trn_rst)
      begin
        wdata_counter <= 8'h0;
      end
    else if (tx_st_valid0 && tx_st_sop0 && (tx_st_data0[31:29] == 3'h2) && (tx_st_data0[28:24] == 5'h0) && (tx_st_data0[7:0] == 8'h20))
      begin
        wdata_counter <= wdata_counter + 1'h1;
      end
  end

always @(posedge trn_clk)
  begin
    if (trn_rst)
      begin
        rdata_counter <= 8'h0;
      end
    else if (tx_st_valid0 && tx_st_sop0 && (tx_st_data0[31:29] == 3'h0) && (tx_st_data0[28:24] == 5'h0) && (tx_st_data0[7:0] == 8'h20))
      begin
        rdata_counter <= rdata_counter + 1'h1;
      end
  end

always @(posedge trn_clk)
  begin
    if (trn_rst)
      begin
        cdata_counter <= 8'h0;
      end
    else if (rx_st_valid0 && rx_st_sop0 && (rx_st_data0[31:29] == 3'h2) && (rx_st_data0[28:24] == 5'ha) && (rx_st_data0[7:0] == 8'h20))
      begin
        cdata_counter <= cdata_counter + 1'h1;
      end
  end

always @(posedge trn_clk)
  begin
    if (trn_rst)
      begin
        rdesc_counter <= 8'h0;
      end
    else if (tx_st_valid0 && tx_st_sop0 && (tx_st_data0[31:29] == 3'h0) && (tx_st_data0[28:24] == 5'h0) && ((tx_st_data0[7:0] == 8'he) || (tx_st_data0[7:0] == 8'h8)))
      begin
        rdesc_counter <= rdesc_counter + 1'h1;
      end
  end

always @(posedge trn_clk)
  begin
    if (trn_rst)
      begin
        cdesc_counter <= 8'h0;
      end
    else if (rx_st_valid0 && rx_st_sop0 && (rx_st_data0[31:29] == 3'h2) && (rx_st_data0[28:24] == 5'ha) && ((rx_st_data0[7:0] == 8'he) || (rx_st_data0[7:0] == 8'h8)))
      begin
        cdesc_counter <= cdesc_counter + 1'h1;
      end
  end

endmodule


