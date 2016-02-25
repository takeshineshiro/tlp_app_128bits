module axi_dcr_align #
   (
     parameter     AXI_DATA_WIDTH = 128,
     parameter     AXI_ADDR_WIDTH = 32,
     parameter     AXI_ID_WIDTH = 8,
     parameter     BE_WIDTH = AXI_DATA_WIDTH/8,
     parameter     C_S_AXI_LITE_ADDR_WIDTH = 32, 
     parameter     C_S_AXI_LITE_DATA_WIDTH = 32
   )
  (
   /*AUTOARG*/
   // Outputs
   m_axi_awready_tlp, m_axi_wready_tlp, m_axi_bresp_tlp,
   m_axi_bvalid_tlp, m_axi_arready_tlp, m_axi_rlast_tlp,
   m_axi_rdata_tlp, m_axi_rresp_tlp, m_axi_rvalid_tlp,
   m_axi_awvalid_axidma, m_axi_awaddr_axidma, m_axi_wdata_axidma,
   m_axi_wvalid_axidma, m_axi_bready_axidma, m_axi_arvalid_axidma,
   m_axi_araddr_axidma, m_axi_rready_axidma,
   // Inputs
   axi_clk, axi_rst, m_axi_awvalid_tlp, m_axi_awaddr_tlp,
   m_axi_wdata_tlp, m_axi_wvalid_tlp, m_axi_wstrb_tlp,
   m_axi_bready_tlp, m_axi_arvalid_tlp, m_axi_araddr_tlp,
   m_axi_rready_tlp, m_axi_awready_axidma, m_axi_wready_axidma,
   m_axi_bresp_axidma, m_axi_bvalid_axidma, m_axi_arready_axidma,
   m_axi_rdata_axidma, m_axi_rresp_axidma, m_axi_rvalid_axidma
   );

   input                           axi_clk;
   input                           axi_rst;
 
      //AXI Slave Write Address Channe
   input                            m_axi_awvalid_tlp;
   input  [AXI_ADDR_WIDTH-1:0]      m_axi_awaddr_tlp;
   output                           m_axi_awready_tlp;
      //AXI Slave Write Data Channel
   output                           m_axi_wready_tlp;
   input  [AXI_DATA_WIDTH-1:0]      m_axi_wdata_tlp;
   input                            m_axi_wvalid_tlp;
   input  [BE_WIDTH-1:0]            m_axi_wstrb_tlp;
      //AXI Slave Write Response Channel
   output [1:0]                     m_axi_bresp_tlp;
   output                           m_axi_bvalid_tlp;
   input                            m_axi_bready_tlp;
      // AXI Slave Read Address Channel
   output                           m_axi_arready_tlp;
   input                            m_axi_arvalid_tlp;
   input  [AXI_ADDR_WIDTH-1:0]      m_axi_araddr_tlp;
      //AXI Slave Read Data Channel
   output                           m_axi_rlast_tlp;
   output [AXI_DATA_WIDTH-1:0]      m_axi_rdata_tlp;
   output [1:0]                     m_axi_rresp_tlp;
   output                           m_axi_rvalid_tlp;
   input                            m_axi_rready_tlp;

      //axi_lite
   output                                 m_axi_awvalid_axidma;
   output  [C_S_AXI_LITE_ADDR_WIDTH-1:0]  m_axi_awaddr_axidma;
   input                                  m_axi_awready_axidma;                                                                              
     //AXI Lite Write Data Channel  
   input                                  m_axi_wready_axidma;                             
   output  [C_S_AXI_LITE_DATA_WIDTH-1:0]  m_axi_wdata_axidma; 
   output                                 m_axi_wvalid_axidma;      
      //AXI Lite Write Response Channel                                               
   input   [1:0]                          m_axi_bresp_axidma;
   input                                  m_axi_bvalid_axidma;
   output                                 m_axi_bready_axidma ;                                                                                   
     //AXI Lite Read Address Channel 
   input                                  m_axi_arready_axidma;                                                 
   output                                 m_axi_arvalid_axidma;
   output  [C_S_AXI_LITE_ADDR_WIDTH-1 :0] m_axi_araddr_axidma;
     //AXI Lite Read data Channel
   input   [C_S_AXI_LITE_DATA_WIDTH-1:0]  m_axi_rdata_axidma;
   input   [1:0]                          m_axi_rresp_axidma;
   input                                  m_axi_rvalid_axidma;
   output                                 m_axi_rready_axidma;

   reg [C_S_AXI_LITE_ADDR_WIDTH-1:0]   araddr_d;
   always @(posedge axi_clk)
     begin
       if (m_axi_arready_axidma)
         begin
           araddr_d <= m_axi_araddr_tlp;
         end
     end 

   assign m_axi_awvalid_axidma = m_axi_awvalid_tlp;
   assign m_axi_awaddr_axidma  = m_axi_awaddr_tlp;
   assign m_axi_awready_tlp    = m_axi_awready_axidma;

   assign m_axi_wvalid_axidma = m_axi_wvalid_tlp;
   assign m_axi_wready_tlp    = m_axi_wready_axidma; 
   assign m_axi_wdata_axidma = (m_axi_wstrb_tlp == 8'hf0)?m_axi_wdata_tlp[63:32]:m_axi_wdata_tlp[31:0];
   assign m_axi_bresp_tlp  = m_axi_bresp_axidma;
   assign m_axi_bvalid_tlp = m_axi_bvalid_axidma;  
   assign m_axi_bready_axidma = m_axi_bready_tlp;

   assign m_axi_araddr_axidma  = m_axi_araddr_tlp;
   assign m_axi_arvalid_axidma = m_axi_arvalid_tlp;  
   assign m_axi_arready_tlp = m_axi_arready_axidma;  

   assign m_axi_rvalid_tlp = m_axi_rvalid_axidma;
   assign m_axi_rresp_tlp  = m_axi_rresp_axidma;
   assign m_axi_rlast_tlp  = m_axi_rvalid_axidma && m_axi_rready_tlp; 
   assign m_axi_rready_axidma = m_axi_rready_tlp;
   assign m_axi_rdata_tlp = (araddr_d[2])?{{m_axi_rdata_axidma[31:0]},32'h0}:{32'h0,{m_axi_rdata_axidma[31:0]}};

endmodule


