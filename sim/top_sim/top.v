
`define LANX8 1

`ifdef LANX8
 `define LANX4 1
`endif

`timescale 1ns / 1ps

module top 
  (
   pcie_rstn,
   refclk,
   free_100MHz,
   core_clk_out,

   linkdown,
   fan_con,
   pci_exp_rxp,
   pci_exp_txp,

   test_in,
   test_out_icm,

   phystatus_ext,
   powerdown_ext,
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
   txdetectrx_ext
   );

   parameter  AXI_DATA_WIDTH  = 64;
   parameter  AXI_ADDR_WIDTH  = 32; 
   parameter  USER_WIDTH_RX   = 22;
   parameter  USER_WIDTH_TX   = 4;
   parameter  AXI_ID_WIDTH    = 4;
   parameter  BE_WIDTH        = AXI_DATA_WIDTH/8;    
   parameter  C_PIPE_MODE     = 0;
`ifdef LANX8
   parameter  C_NO_OF_LANES   = 8;
`else
   parameter  C_NO_OF_LANES   = 4;
`endif

   input                  pcie_rstn;
   input                  refclk;
   input                  free_100MHz;
   output                 core_clk_out;

   output 		  linkdown;
   output                 fan_con;
 
   input [ 39: 0] 	  test_in;
   output [  8: 0] 	  test_out_icm;

   input 		  phystatus_ext;
   output [  1: 0] 	  powerdown_ext;
   output 		  rate_ext;
   input 		  pclk_in;
   output 		  clk250_out;
   output 		  clk500_out;

   input [7: 0] 	  rxdata0_ext;
   input 		  rxdatak0_ext;
   input 		  rxelecidle0_ext;
   output 		  rxpolarity0_ext;
   input [ 2: 0] 	  rxstatus0_ext;
   input 		  rxvalid0_ext;

   output 		  txcompl0_ext;
   output [7: 0] 	  txdata0_ext;
   output 		  txdatak0_ext;
   output 		  txelecidle0_ext;

`ifdef LANX4
   input [7: 0] 	  rxdata1_ext;
   input 		  rxdatak1_ext;
   input 		  rxelecidle1_ext;
   output 		  rxpolarity1_ext;
   input [2: 0] 	  rxstatus1_ext;
   input 		  rxvalid1_ext;
   output 		  txcompl1_ext;
   output [7: 0] 	  txdata1_ext;
   output 		  txdatak1_ext;
   output 		  txelecidle1_ext;

   input [7: 0] 	  rxdata2_ext;
   input 		  rxdatak2_ext;
   input 		  rxelecidle2_ext;
   output 		  rxpolarity2_ext;
   input [ 2: 0] 	  rxstatus2_ext;
   input 		  rxvalid2_ext;
   output 		  txcompl2_ext;
   output [7: 0] 	  txdata2_ext;
   output 		  txdatak2_ext;
   output 		  txelecidle2_ext;

   input [7: 0] 	  rxdata3_ext;
   input 		  rxdatak3_ext;
   input 		  rxelecidle3_ext;
   output 		  rxpolarity3_ext;
   input [ 2: 0] 	  rxstatus3_ext;
   input 		  rxvalid3_ext;
   output 		  txcompl3_ext;
   output [7: 0] 	  txdata3_ext;
   output 		  txdatak3_ext;
   output 		  txelecidle3_ext;
`endif

`ifdef LANX8
   input [7: 0] 	  rxdata4_ext;
   input 		  rxdatak4_ext;
   input 		  rxelecidle4_ext;
   output 		  rxpolarity4_ext;
   input [ 2: 0] 	  rxstatus4_ext;
   input 		  rxvalid4_ext;
   output 		  txcompl4_ext;
   output [7: 0] 	  txdata4_ext;
   output 		  txdatak4_ext;
   output 		  txelecidle4_ext;

   input [7: 0] 	  rxdata5_ext;
   input 		  rxdatak5_ext;
   input 		  rxelecidle5_ext;
   output 		  rxpolarity5_ext;
   input [ 2: 0] 	  rxstatus5_ext;
   input 		  rxvalid5_ext;
   output 		  txcompl5_ext;
   output [7: 0] 	  txdata5_ext;
   output 		  txdatak5_ext;
   output 		  txelecidle5_ext;

   input [7: 0] 	  rxdata6_ext;
   input 		  rxdatak6_ext;
   input 		  rxelecidle6_ext;
   output 		  rxpolarity6_ext;
   input [ 2: 0] 	  rxstatus6_ext;
   input 		  rxvalid6_ext;
   output 		  txcompl6_ext;
   output [7: 0] 	  txdata6_ext;
   output 		  txdatak6_ext;
   output 		  txelecidle6_ext;

   input [7: 0] 	  rxdata7_ext;
   input 		  rxdatak7_ext;
   input 		  rxelecidle7_ext;
   output 		  rxpolarity7_ext;
   input [ 2: 0] 	  rxstatus7_ext;
   input 		  rxvalid7_ext;
   output 		  txcompl7_ext;
   output [7: 0] 	  txdata7_ext;
   output 		  txdatak7_ext;
   output 		  txelecidle7_ext;
`endif
   output 		  txdetectrx_ext;

   input  [C_NO_OF_LANES-1:0]   pci_exp_rxp;
   output [C_NO_OF_LANES-1:0]   pci_exp_txp;

   wire  		              INTX_MSI_Request;
   wire 		              pipe_mode;
   wire 		              app_rst;
/****************************************************/
   //RX
   wire  [AXI_DATA_WIDTH-1:0]         axis_rc_tdata;
   wire  [BE_WIDTH-1:0]               axis_rc_tstrb;
   wire                               axis_rc_tlast;
   wire                               axis_rc_tvalid;
   wire                               axis_rc_tready;

   wire  [AXI_DATA_WIDTH-1:0]         axis_cw_tdata;
   wire  [BE_WIDTH-1:0]               axis_cw_tstrb;
   wire                               axis_cw_tlast;
   wire                               axis_cw_tvalid;
   wire  [USER_WIDTH_RX-1:0]          axis_cw_tuser;
   wire                               axis_cw_tready;

   wire  [AXI_DATA_WIDTH-1:0]         axis_cr_tdata;
   wire  [BE_WIDTH-1:0]               axis_cr_tstrb;
   wire                               axis_cr_tlast;
   wire                               axis_cr_tvalid;
   wire  [USER_WIDTH_RX-1:0]          axis_cr_tuser;
   wire                               axis_cr_tready;
   //TX
   wire  [AXI_DATA_WIDTH-1:0]         axis_cc_tdata;
   wire  [BE_WIDTH-1:0]               axis_cc_tstrb;  
   wire                               axis_cc_tlast;        
   wire                               axis_cc_tvalid;       
   wire  [USER_WIDTH_RX-1:0]          axis_cc_tuser;
   wire                               axis_cc_tready; 

   wire  [AXI_DATA_WIDTH-1:0]         axis_rw_tdata;
   wire  [BE_WIDTH-1:0]               axis_rw_tstrb;
   wire                               axis_rw_tlast;
   wire                               axis_rw_tvalid;
   wire                               axis_rw_tready;

   wire  [AXI_ID_WIDTH-1:0]           axis_rr_tid;
   wire  [AXI_DATA_WIDTH-1:0]         axis_rr_tdata;
   wire  [BE_WIDTH-1:0]               axis_rr_tstrb;
   wire                               axis_rr_tlast;
   wire                               axis_rr_tvalid;
   wire                               axis_rr_tready;
   
   //AXI Slave Write Address Channel
   wire  [AXI_ID_WIDTH-1:0]           tlp2dma_axi_awid; 
   wire  [AXI_ADDR_WIDTH-1:0]         tlp2dma_axi_awaddr;           
   wire  [3:0]                        tlp2dma_axi_awregion;          
   wire  [7:0]                        tlp2dma_axi_awlen;             
   wire  [2:0]                        tlp2dma_axi_awsize;           
   wire  [1:0]                        tlp2dma_axi_awburst;        
   wire                               tlp2dma_axi_awvalid;
   wire                               tlp2dma_axi_awready;
   wire  [3:0]                        tlp2dma_axi_awcache;
   // AXI Slave Write Data Channel
   wire  [AXI_DATA_WIDTH-1:0]         tlp2dma_axi_wdata;            
   wire  [BE_WIDTH-1:0]               tlp2dma_axi_wstrb;             
   wire                               tlp2dma_axi_wlast;             
   wire                               tlp2dma_axi_wvalid;            
   wire                               tlp2dma_axi_wready;            
   //AXI Slave Write Response Channel
   wire  [AXI_ID_WIDTH-1:0]           tlp2dma_axi_bid;              
   wire  [1:0]                        tlp2dma_axi_bresp;        
   wire                               tlp2dma_axi_bvalid;            
   wire                               tlp2dma_axi_bready;  
   //AXI Slave read Address Channel         
   wire  [AXI_ID_WIDTH-1:0]           tlp2dma_axi_arid; 
   wire  [AXI_ADDR_WIDTH-1:0]         tlp2dma_axi_araddr;           
   wire  [3:0]                        tlp2dma_axi_arregion;          
   wire  [7:0]                        tlp2dma_axi_arlen;             
   wire  [2:0]                        tlp2dma_axi_arsize;           
   wire  [1:0]                        tlp2dma_axi_arburst;        
   wire                               tlp2dma_axi_arvalid;
   wire  [2:0]                        tlp2dma_axi_arprot;
   wire                               tlp2dma_axi_arready;
   // read Data Channel
   wire   [AXI_DATA_WIDTH-1:0]        tlp2dma_axi_rdata; 
   wire   [AXI_ID_WIDTH-1:0]          tlp2dma_axi_rid;   
   wire   [1:0]                       tlp2dma_axi_rresp;             
   wire                               tlp2dma_axi_rlast;             
   wire                               tlp2dma_axi_rvalid;            
   wire                               tlp2dma_axi_rready;  
   //AXI Slave Write Address Channel
   wire  [AXI_ID_WIDTH-1:0]           dma2tlp_axi_awid; 
   wire  [AXI_ADDR_WIDTH-1:0]         dma2tlp_axi_awaddr;           
   wire  [3:0]                        dma2tlp_axi_awregion;          
   wire  [7:0]                        dma2tlp_axi_awlen;             
   wire  [2:0]                        dma2tlp_axi_awsize;           
   wire  [1:0]                        dma2tlp_axi_awburst;        
   wire                               dma2tlp_axi_awvalid;
   wire                               dma2tlp_axi_awready;
   wire  [3:0]                        dma2tlp_axi_awcache;
   // AXI Slave Write Data Channel
   wire  [AXI_DATA_WIDTH-1:0]         dma2tlp_axi_wdata;  
   wire  [BE_WIDTH-1:0]               dma2tlp_axi_wstrb;             
   wire                               dma2tlp_axi_wlast;             
   wire                               dma2tlp_axi_wvalid;            
   wire                               dma2tlp_axi_wready;            
   //AXI Slave Write Response Channel
   wire  [AXI_ID_WIDTH-1:0]           dma2tlp_axi_bid;              
   wire  [1:0]                        dma2tlp_axi_bresp;        
   wire                               dma2tlp_axi_bvalid;            
   wire                               dma2tlp_axi_bready;  
   //AXI Slave read Address Channel   
   wire  [AXI_ID_WIDTH-1:0]           dma2tlp_axi_arid; 
   wire  [AXI_ADDR_WIDTH-1:0]         dma2tlp_axi_araddr;           
   wire  [3:0]                        dma2tlp_axi_arregion;          
   wire  [7:0]                        dma2tlp_axi_arlen;             
   wire  [2:0]                        dma2tlp_axi_arsize;           
   wire  [1:0]                        dma2tlp_axi_arburst;        
   wire                               dma2tlp_axi_arvalid;
   wire                               dma2tlp_axi_arready;
   wire  [2:0]                        dma2tlp_axi_arprot;
   // read Data Channel
   wire  [AXI_DATA_WIDTH-1:0]         dma2tlp_axi_rdata; 
   wire  [AXI_ID_WIDTH-1:0]           dma2tlp_axi_rid;   
   wire  [1:0]                        dma2tlp_axi_rresp;             
   wire                               dma2tlp_axi_rlast;             
   wire                               dma2tlp_axi_rvalid;            
   wire                               dma2tlp_axi_rready; 
   //
   wire                               m_axi_awvalid_axidma;
   wire  [31:0]                       m_axi_awaddr_axidma;
   wire                               m_axi_awready_axidma;                                                                              
   wire                               m_axi_wready_axidma;                             
   wire  [31:0]                       m_axi_wdata_axidma; 
   wire                               m_axi_wvalid_axidma;                                               
   wire  [1:0]                        m_axi_bresp_axidma;
   wire                               m_axi_bvalid_axidma;
   wire                               m_axi_bready_axidma ;                                                                                   
     //AXI Lite Read Address Channel 
   wire                               m_axi_arready_axidma;                                                 
   wire                               m_axi_arvalid_axidma;
   wire  [31 :0]                      m_axi_araddr_axidma;
     //AXI Lite Read data Channel
   wire  [31:0]                       m_axi_rdata_axidma;
   wire  [1:0]                        m_axi_rresp_axidma;
   wire                               m_axi_rvalid_axidma;
   wire                               m_axi_rready_axidma;
/****************************************************/
   wire    [AXI_ADDR_WIDTH-1:0]       axi_sg_awaddr;                                                 
   wire    [7:0]                      axi_sg_awlen  ;              
   wire    [2:0]                      axi_sg_awsize ;              
   wire    [1:0]                      axi_sg_awburst;              
   wire    [2:0]                      axi_sg_awprot ;              
   wire    [3:0]                      axi_sg_awcache;              
   wire    [3:0]                      axi_sg_awuser ;              
   wire                               axi_sg_awvalid;
   wire                               axi_sg_awready;
       //Scatter Gather Write Data Chael                                              
   wire     [31:0]                    axi_sg_wdata;                                                                               
   wire     [3:0]                     axi_sg_wstrb;                                                                                
   wire                               axi_sg_wlast;
   wire                               axi_sg_wvalid;
   wire                               axi_sg_wready;
        // Scatter Gather Write Respon Channel                                           
   wire     [1:0]                     axi_sg_bresp;             
   wire                               axi_sg_bvalid;            
   wire                               axi_sg_bready;             
        // Scatter Gather Read Address hannel                                            
   wire     [AXI_ADDR_WIDTH-1:0]      axi_sg_araddr;                                                                              
   wire     [7:0]                     axi_sg_arlen  ;             
   wire     [2:0]                     axi_sg_arsize ;             
   wire     [1:0]                     axi_sg_arburst;             
   wire     [2:0]                     axi_sg_arprot ;             
   wire     [3:0]                     axi_sg_arcache;             
   wire     [3:0]                     axi_sg_aruser ;              
   wire                               axi_sg_arvalid;
   wire                               axi_sg_arready;
        // Memory Map to Stream Scatte Gather Read Data Channel                          
   wire     [31:0]                    axi_sg_rdata;                                
   wire     [1:0]                     axi_sg_rresp;      
   wire                               axi_sg_rlast;
   wire                               axi_sg_rvalid;
   wire                               axi_sg_rready;
        // Memory Map To Stream Read Aress Channel                                       
   wire     [AXI_ADDR_WIDTH-1:0]      axi_mm2s_araddr;                                                                        
   wire     [7:0]                     axi_mm2s_arlen  ;             
   wire     [2:0]                     axi_mm2s_arsize ;              
   wire     [1:0]                     axi_mm2s_arburst;              
   wire     [2:0]                     axi_mm2s_arprot ;             
   wire     [3:0]                     axi_mm2s_arcache;             
   wire     [3:0]                     axi_mm2s_aruser ;             
   wire                               axi_mm2s_arvalid;
   wire                               axi_mm2s_arready;
       // Memory Map  to Stream Read Da Channel                                         
   wire     [AXI_DATA_WIDTH-1:0]      axi_mm2s_rdata;                                                                                 
   wire     [1:0]                     axi_mm2s_rresp;          
   wire                               axi_mm2s_rlast;
   wire                               axi_mm2s_rvalid;
   wire                               axi_mm2s_rready;
        //Memory Map to Stream Stream terface                                         
   wire     [AXI_DATA_WIDTH-1:0]      axis_mm2s_tdata;                                                                                 
   wire     [AXI_DATA_WIDTH/8-1:0]    axis_mm2s_tkeep;                                                                          
   wire                               axis_mm2s_tvalid;
   wire                               axis_mm2s_tready;
   wire                               axis_mm2s_tlast;
   wire     [3:0]                     axis_mm2s_tuser;             
   wire     [4:0]                     axis_mm2s_tid;             
   wire     [4:0]                     axis_mm2s_tdest;             
        // Memory Map to Stream ControStream Interface                                   
   wire     [31:0]                    axis_mm2s_cntrl_tdata;      
   wire     [3:0]                     axis_mm2s_cntrl_tkeep;  
   wire                               axis_mm2s_cntrl_tvalid;
   wire                               axis_mm2s_cntrl_tready;
   wire                               axis_mm2s_cntrl_tlast;             
        // Stream to Memory Map Write dress Channel                                     
   wire     [7:0]                     axi_s2mm_awlen  ;             
   wire     [2:0]                     axi_s2mm_awsize ;             
   wire     [1:0]                     axi_s2mm_awburst;             
   wire     [2:0]                     axi_s2mm_awprot ;             
   wire     [3:0]                     axi_s2mm_awcache;             
   wire     [3:0]                     axi_s2mm_awuser ;             
   wire                               axi_s2mm_awvalid;
   wire                               axi_s2mm_awready;
   wire     [AXI_ADDR_WIDTH-1:0]      axi_s2mm_awaddr;
        // Stream to Memory Map Write ta Channel                                         
   wire     [AXI_DATA_WIDTH-1:0]      axi_s2mm_wdata;                                                                                    
   wire     [AXI_DATA_WIDTH/8-1:0]    axi_s2mm_wstrb;                                                                               
   wire                               axi_s2mm_wlast;           
   wire                               axi_s2mm_wvalid;
   wire                               axi_s2mm_wready;
        // Stream to Memory Map Write sponse Channel                                     
   wire     [1:0]                     axi_s2mm_bresp;            
   wire                               axi_s2mm_bvalid;
   wire                               axi_s2mm_bready;
       // Stream to Memory Map Steam Ierface                                           
   wire     [AXI_DATA_WIDTH-1:0]      axis_s2mm_tdata;                                                                                
   wire     [AXI_DATA_WIDTH/8-1:0]    axis_s2mm_tkeep;                                                                          
   wire                               axis_s2mm_tvalid;
   wire                               axis_s2mm_tready;
   wire                               axis_s2mm_tlast;
   wire     [3:0]                     axis_s2mm_tuser;            
   wire     [4:0]                     axis_s2mm_tid;           
   wire     [4:0]                     axis_s2mm_tdest;     
        // Stream to Memory Map Statusteam Interface                                   
   wire     [31:0]                    axis_s2mm_sts_tdata;                                                                              
   wire     [3:0]                     axis_s2mm_sts_tkeep;                                                                         
   wire                               axis_s2mm_sts_tvalid;
   wire                               axis_s2mm_sts_tready;
   wire                               axis_s2mm_sts_tlast;
       // MM2S and S2MM Channel Interrupts                                               
   wire                               mm2s_introut;
   wire                               s2mm_introut;
   wire     [31:0]                    axi_dma_tstvec;
      //axi_dma_data      
   wire     [AXI_DATA_WIDTH-1:0]      m_mm2s_tdata;     
   wire     [BE_WIDTH-1:0]            m_mm2s_tkeep;       
   wire                               m_mm2s_tvalid;       
   wire                               m_mm2s_tready;    
   wire                               m_mm2s_tlast; 
   wire     [AXI_DATA_WIDTH-1:0]      s_s2mm_tdata;     
   wire     [BE_WIDTH-1:0]            s_s2mm_tkeep;       
   wire                               s_s2mm_tvalid;       
   wire                               s_s2mm_tready;    
   wire                               s_s2mm_tlast; 
   wire     [3:0]                     m_mm2s_tuser;   
   wire     [4:0]                     m_mm2s_tid;   
   wire     [4:0]                     m_mm2s_tdest; 
   wire                               m_axi_awvalid_user;
   wire  [31:0]                       m_axi_awaddr_user;
   wire                               m_axi_awready_user;                                                                              
     //AXI Lite Write Data Channel user                            
   wire  [31:0]                       m_axi_wdata_user; 
   wire                               m_axi_wvalid_user;  
   wire                               m_axi_wready_user;       
      //AXI Lite Write Response Channel user  
   wire                               m_axi_bready_user;                                              
   wire [1:0]                         m_axi_bresp_user;
   wire                               m_axi_bvalid_user; 
                                                                                
     //AXI Lite Read Address Channel user 
   wire                               m_axi_arvalid_user;
   wire  [31 :0]                      m_axi_araddr_user;
   wire                               m_axi_arready_user;                                                 
     //AXI Lite Read data Channel user
   wire                               m_axi_rready_user;
   wire [31:0]                        m_axi_rdata_user;
   wire [1:0]                         m_axi_rresp_user;
   wire                               m_axi_rvalid_user;
   wire                               axi_aresetn_out;
   wire                               axi_aclk_out;

   wire [127:0]                       axi4lite_0_M_ARADDR;
   wire [7:0]                         axi4lite_0_M_ARBURST;
   wire [15:0]                        axi4lite_0_M_ARCACHE;
   wire [3:0]                         axi4lite_0_M_ARESETN;
   wire [3:0]                         axi4lite_0_M_ARID;
   wire [31:0]                        axi4lite_0_M_ARLEN;
   wire [7:0]                         axi4lite_0_M_ARLOCK;
   wire [11:0]                        axi4lite_0_M_ARPROT;
   wire [3:0]                         axi4lite_0_M_ARREADY;
   wire [11:0]                        axi4lite_0_M_ARSIZE;
   wire [3:0]                         axi4lite_0_M_ARVALID;
   wire [127:0]                       axi4lite_0_M_AWADDR;
   wire [7:0]                         axi4lite_0_M_AWBURST;
   wire [15:0]                        axi4lite_0_M_AWCACHE;
   wire [3:0]                         axi4lite_0_M_AWID;
   wire [31:0]                        axi4lite_0_M_AWLEN;
   wire [7:0]                         axi4lite_0_M_AWLOCK;
   wire [11:0]                        axi4lite_0_M_AWPROT;
   wire [3:0]                         axi4lite_0_M_AWREADY;
   wire [11:0]                        axi4lite_0_M_AWSIZE;
   wire [3:0]                         axi4lite_0_M_AWVALID;
   wire [3:0]                         axi4lite_0_M_BID;
   wire [3:0]                         axi4lite_0_M_BREADY;
   wire [7:0]                         axi4lite_0_M_BRESP;
   wire [3:0]                         axi4lite_0_M_BVALID;
   wire [255:0]                       axi4lite_0_M_RDATA;
   wire [3:0]                         axi4lite_0_M_RID;
   wire [3:0]                         axi4lite_0_M_RLAST;
   wire [3:0]                         axi4lite_0_M_RREADY;
   wire [7:0]                         axi4lite_0_M_RRESP;
   wire [3:0]                         axi4lite_0_M_RVALID;
   wire [255:0]                       axi4lite_0_M_WDATA;
   wire [3:0]                         axi4lite_0_M_WLAST;
   wire [3:0]                         axi4lite_0_M_WREADY;
   wire [31:0]                        axi4lite_0_M_WSTRB;
   wire [3:0]                         axi4lite_0_M_WVALID;
   wire [31:0]                        axi4lite_0_S_ARADDR;
   wire [1:0]                         axi4lite_0_S_ARBURST;
   wire [3:0]                         axi4lite_0_S_ARCACHE;
   wire [0:0]                         axi4lite_0_S_ARESETN;
   wire [7:0]                         axi4lite_0_S_ARLEN;
   wire [1:0]                         axi4lite_0_S_ARLOCK;
   wire [2:0]                         axi4lite_0_S_ARPROT;
   wire [0:0]                         axi4lite_0_S_ARREADY;
   wire [2:0]                         axi4lite_0_S_ARSIZE;
   wire [0:0]                         axi4lite_0_S_ARVALID;
   wire [31:0]                        axi4lite_0_S_AWADDR;
   wire [1:0]                         axi4lite_0_S_AWBURST;
   wire [3:0]                         axi4lite_0_S_AWCACHE;
   wire [7:0]                         axi4lite_0_S_AWLEN;
   wire [1:0]                         axi4lite_0_S_AWLOCK;
   wire [2:0]                         axi4lite_0_S_AWPROT;
   wire [0:0]                         axi4lite_0_S_AWREADY;
   wire [2:0]                         axi4lite_0_S_AWSIZE;
   wire [0:0]                         axi4lite_0_S_AWVALID;
   wire [0:0]                         axi4lite_0_S_BREADY;
   wire [1:0]                         axi4lite_0_S_BRESP;
   wire [0:0]                         axi4lite_0_S_BVALID;
   wire [63:0]                        axi4lite_0_S_RDATA;
   wire [0:0]                         axi4lite_0_S_RLAST;
   wire [0:0]                         axi4lite_0_S_RREADY;
   wire [1:0]                         axi4lite_0_S_RRESP;
   wire [0:0]                         axi4lite_0_S_RVALID;
   wire [63:0]                        axi4lite_0_S_WDATA;
   wire [0:0]                         axi4lite_0_S_WLAST;
   wire [0:0]                         axi4lite_0_S_WREADY;
   wire [7:0]                         axi4lite_0_S_WSTRB;
   wire [0:0]                         axi4lite_0_S_WVALID;
   wire                               net_gnd0;
   wire [0:0]                         net_gnd1;
   wire [1:0]                         net_gnd2;
   wire [2:0]                         net_gnd3;
   wire [3:0]                         net_gnd4;
   wire [4:0]                         net_gnd5;
   wire [5:0]                         net_gnd6;
   wire [11:0]                        net_gnd12;
   wire [31:0]                        net_gnd32;

system_axi4lite
  system_axi4lite(/*AUTOINST*/
      .INTERCONNECT_ACLK (axi_aclk_out),
      .INTERCONNECT_ARESETN ( axi_aresetn_out),
      .S_AXI_ACLK ( axi_aclk_out),
      .S_AXI_AWID ( net_gnd1[0:0] ),
      .S_AXI_AWADDR ( axi4lite_0_S_AWADDR),
      .S_AXI_AWLEN ( axi4lite_0_S_AWLEN ),
      .S_AXI_AWSIZE ( axi4lite_0_S_AWSIZE ),
      .S_AXI_AWBURST ( axi4lite_0_S_AWBURST ),
      .S_AXI_AWLOCK ( axi4lite_0_S_AWLOCK ),
      .S_AXI_AWCACHE ( axi4lite_0_S_AWCACHE ),
      .S_AXI_AWPROT ( axi4lite_0_S_AWPROT ),
      .S_AXI_AWQOS ( net_gnd4 ),
      .S_AXI_AWUSER ( net_gnd1[0:0] ),
      .S_AXI_AWVALID ( axi4lite_0_S_AWVALID[0:0] ),
      .S_AXI_AWREADY ( axi4lite_0_S_AWREADY[0:0] ),
      .S_AXI_WID ( net_gnd1[0:0] ),
      .S_AXI_WDATA ( axi4lite_0_S_WDATA ),
      .S_AXI_WSTRB ( axi4lite_0_S_WSTRB ),
      .S_AXI_WLAST ( axi4lite_0_S_WLAST[0:0] ),
      .S_AXI_WUSER ( net_gnd1[0:0] ),
      .S_AXI_WVALID ( axi4lite_0_S_WVALID[0:0] ),
      .S_AXI_WREADY ( axi4lite_0_S_WREADY[0:0] ),
      .S_AXI_BID (  ),
      .S_AXI_BRESP ( axi4lite_0_S_BRESP ),
      .S_AXI_BUSER (  ),
      .S_AXI_BVALID ( axi4lite_0_S_BVALID[0:0] ),
      .S_AXI_BREADY ( axi4lite_0_S_BREADY[0:0] ),
      .S_AXI_ARID ( net_gnd1[0:0] ),
      .S_AXI_ARADDR ( axi4lite_0_S_ARADDR),
      .S_AXI_ARLEN ( axi4lite_0_S_ARLEN ),
      .S_AXI_ARSIZE ( axi4lite_0_S_ARSIZE ),
      .S_AXI_ARBURST ( axi4lite_0_S_ARBURST ),
      .S_AXI_ARLOCK ( axi4lite_0_S_ARLOCK ),
      .S_AXI_ARCACHE ( axi4lite_0_S_ARCACHE ),
      .S_AXI_ARPROT ( axi4lite_0_S_ARPROT ),
      .S_AXI_ARQOS ( net_gnd4 ),
      .S_AXI_ARUSER ( net_gnd1[0:0] ),
      .S_AXI_ARVALID ( axi4lite_0_S_ARVALID[0:0] ),
      .S_AXI_ARREADY ( axi4lite_0_S_ARREADY[0:0] ),
      .S_AXI_RID (  ),
      .S_AXI_RDATA ( axi4lite_0_S_RDATA ),
      .S_AXI_RRESP ( axi4lite_0_S_RRESP ),
      .S_AXI_RLAST ( axi4lite_0_S_RLAST[0:0] ),
      .S_AXI_RUSER (  ),
      .S_AXI_RVALID ( axi4lite_0_S_RVALID[0:0] ),
      .S_AXI_RREADY ( axi4lite_0_S_RREADY[0:0] ),
      .M_AXI_ACLK ({axi_aclk_out,axi_aclk_out,axi_aclk_out,axi_aclk_out}),
      .M_AXI_AWID ( axi4lite_0_M_AWID ),
      .M_AXI_AWADDR ( axi4lite_0_M_AWADDR ),
      .M_AXI_AWLEN ( axi4lite_0_M_AWLEN ),
      .M_AXI_AWSIZE ( axi4lite_0_M_AWSIZE ),
      .M_AXI_AWBURST ( axi4lite_0_M_AWBURST ),
      .M_AXI_AWLOCK ( axi4lite_0_M_AWLOCK ),
      .M_AXI_AWCACHE ( axi4lite_0_M_AWCACHE ),
      .M_AXI_AWPROT ( axi4lite_0_M_AWPROT ),
      .M_AXI_AWREGION (  ),
      .M_AXI_AWQOS (  ),
      .M_AXI_AWUSER (  ),
      .M_AXI_AWVALID ( axi4lite_0_M_AWVALID ),
      .M_AXI_AWREADY ( axi4lite_0_M_AWREADY ),
      .M_AXI_WID (  ),
      .M_AXI_WDATA ( axi4lite_0_M_WDATA ),
      .M_AXI_WSTRB ( axi4lite_0_M_WSTRB ),
      .M_AXI_WLAST ( axi4lite_0_M_WLAST ),
      .M_AXI_WUSER (  ),
      .M_AXI_WVALID ( axi4lite_0_M_WVALID ),
      .M_AXI_WREADY ( axi4lite_0_M_WREADY ),
      .M_AXI_BID ( axi4lite_0_M_BID ),
      .M_AXI_BRESP ( axi4lite_0_M_BRESP ),
      .M_AXI_BUSER ( net_gnd4 ),
      .M_AXI_BVALID ( axi4lite_0_M_BVALID ),
      .M_AXI_BREADY ( axi4lite_0_M_BREADY ),
      .M_AXI_ARID ( axi4lite_0_M_ARID ),
      .M_AXI_ARADDR ( axi4lite_0_M_ARADDR ),
      .M_AXI_ARLEN ( axi4lite_0_M_ARLEN ),
      .M_AXI_ARSIZE ( axi4lite_0_M_ARSIZE ),
      .M_AXI_ARBURST ( axi4lite_0_M_ARBURST ),
      .M_AXI_ARLOCK ( axi4lite_0_M_ARLOCK ),
      .M_AXI_ARCACHE ( axi4lite_0_M_ARCACHE ),
      .M_AXI_ARPROT ( axi4lite_0_M_ARPROT ),
      .M_AXI_ARREGION (  ),
      .M_AXI_ARQOS (  ),
      .M_AXI_ARUSER (  ),
      .M_AXI_ARVALID ( axi4lite_0_M_ARVALID ),
      .M_AXI_ARREADY ( axi4lite_0_M_ARREADY ),
      .M_AXI_RID ( axi4lite_0_M_RID ),
      .M_AXI_RDATA ( axi4lite_0_M_RDATA ),
      .M_AXI_RRESP ( axi4lite_0_M_RRESP ),
      .M_AXI_RLAST ( axi4lite_0_M_RVALID & axi4lite_0_M_RREADY),
      .M_AXI_RUSER ( net_gnd4 ),
      .M_AXI_RVALID ( axi4lite_0_M_RVALID ),
      .M_AXI_RREADY ( axi4lite_0_M_RREADY ),
      .S_AXI_CTRL_AWADDR ( net_gnd32 ),
      .S_AXI_CTRL_AWVALID ( net_gnd0 ),
      .S_AXI_CTRL_AWREADY (  ),
      .S_AXI_CTRL_WDATA ( net_gnd32 ),
      .S_AXI_CTRL_WVALID ( net_gnd0 ),
      .S_AXI_CTRL_WREADY (  ),
      .S_AXI_CTRL_BRESP (  ),
      .S_AXI_CTRL_BVALID (  ),
      .S_AXI_CTRL_BREADY ( net_gnd0 ),
      .S_AXI_CTRL_ARADDR ( net_gnd32 ),
      .S_AXI_CTRL_ARVALID ( net_gnd0 ),
      .S_AXI_CTRL_ARREADY (  ),
      .S_AXI_CTRL_RDATA (  ),
      .S_AXI_CTRL_RRESP (  ),
      .S_AXI_CTRL_RVALID (  ),
      .S_AXI_CTRL_RREADY ( net_gnd0 ),
      .INTERCONNECT_ARESET_OUT_N (  ),
      .DEBUG_AW_TRANS_SEQ (  ),
      .DEBUG_AW_ARB_GRANT (  ),
      .DEBUG_AR_TRANS_SEQ (  ),
      .DEBUG_AR_ARB_GRANT (  ),
      .DEBUG_AW_TRANS_QUAL (  ),
      .DEBUG_AW_ACCEPT_CNT (  ),
      .DEBUG_AW_ACTIVE_THREAD (  ),
      .DEBUG_AW_ACTIVE_TARGET (  ),
      .DEBUG_AW_ACTIVE_REGION (  ),
      .DEBUG_AW_ERROR (  ),
      .DEBUG_AW_TARGET (  ),
      .DEBUG_AR_TRANS_QUAL (  ),
      .DEBUG_AR_ACCEPT_CNT (  ),
      .DEBUG_AR_ACTIVE_THREAD (  ),
      .DEBUG_AR_ACTIVE_TARGET (  ),
      .DEBUG_AR_ACTIVE_REGION (  ),
      .DEBUG_AR_ERROR (  ),
      .DEBUG_AR_TARGET (  ),
      .DEBUG_B_TRANS_SEQ (  ),
      .DEBUG_R_BEAT_CNT (  ),
      .DEBUG_R_TRANS_SEQ (  ),
      .DEBUG_AW_ISSUING_CNT (  ),
      .DEBUG_AR_ISSUING_CNT (  ),
      .DEBUG_W_BEAT_CNT (  ),
      .DEBUG_W_TRANS_SEQ (  ),
      .DEBUG_BID_TARGET (  ),
      .DEBUG_BID_ERROR (  ),
      .DEBUG_RID_TARGET (  ),
      .DEBUG_RID_ERROR (  ),
      .DEBUG_SR_SC_ARADDR (  ),
      .DEBUG_SR_SC_ARADDRCONTROL (  ),
      .DEBUG_SR_SC_AWADDR (  ),
      .DEBUG_SR_SC_AWADDRCONTROL (  ),
      .DEBUG_SR_SC_BRESP (  ),
      .DEBUG_SR_SC_RDATA (  ),
      .DEBUG_SR_SC_RDATACONTROL (  ),
      .DEBUG_SR_SC_WDATA (  ),
      .DEBUG_SR_SC_WDATACONTROL (  ),
      .DEBUG_SC_SF_ARADDR (  ),
      .DEBUG_SC_SF_ARADDRCONTROL (  ),
      .DEBUG_SC_SF_AWADDR (  ),
      .DEBUG_SC_SF_AWADDRCONTROL (  ),
      .DEBUG_SC_SF_BRESP (  ),
      .DEBUG_SC_SF_RDATA (  ),
      .DEBUG_SC_SF_RDATACONTROL (  ),
      .DEBUG_SC_SF_WDATA (  ),
      .DEBUG_SC_SF_WDATACONTROL (  ),
      .DEBUG_SF_CB_ARADDR (  ),
      .DEBUG_SF_CB_ARADDRCONTROL (  ),
      .DEBUG_SF_CB_AWADDR (  ),
      .DEBUG_SF_CB_AWADDRCONTROL (  ),
      .DEBUG_SF_CB_BRESP (  ),
      .DEBUG_SF_CB_RDATA (  ),
      .DEBUG_SF_CB_RDATACONTROL (  ),
      .DEBUG_SF_CB_WDATA (  ),
      .DEBUG_SF_CB_WDATACONTROL (  ),
      .DEBUG_CB_MF_ARADDR (  ),
      .DEBUG_CB_MF_ARADDRCONTROL (  ),
      .DEBUG_CB_MF_AWADDR (  ),
      .DEBUG_CB_MF_AWADDRCONTROL (  ),
      .DEBUG_CB_MF_BRESP (  ),
      .DEBUG_CB_MF_RDATA (  ),
      .DEBUG_CB_MF_RDATACONTROL (  ),
      .DEBUG_CB_MF_WDATA (  ),
      .DEBUG_CB_MF_WDATACONTROL (  ),
      .DEBUG_MF_MC_ARADDR (  ),
      .DEBUG_MF_MC_ARADDRCONTROL (  ),
      .DEBUG_MF_MC_AWADDR (  ),
      .DEBUG_MF_MC_AWADDRCONTROL (  ),
      .DEBUG_MF_MC_BRESP (  ),
      .DEBUG_MF_MC_RDATA (  ),
      .DEBUG_MF_MC_RDATACONTROL (  ),
      .DEBUG_MF_MC_WDATA (  ),
      .DEBUG_MF_MC_WDATACONTROL (  ),
      .DEBUG_MC_MP_ARADDR (  ),
      .DEBUG_MC_MP_ARADDRCONTROL (  ),
      .DEBUG_MC_MP_AWADDR (  ),
      .DEBUG_MC_MP_AWADDRCONTROL (  ),
      .DEBUG_MC_MP_BRESP (  ),
      .DEBUG_MC_MP_RDATA (  ),
      .DEBUG_MC_MP_RDATACONTROL (  ),
      .DEBUG_MC_MP_WDATA (  ),
      .DEBUG_MC_MP_WDATACONTROL (  ),
      .DEBUG_MP_MR_ARADDR (  ),
      .DEBUG_MP_MR_ARADDRCONTROL (  ),
      .DEBUG_MP_MR_AWADDR (  ),
      .DEBUG_MP_MR_AWADDRCONTROL (  ),
      .DEBUG_MP_MR_BRESP (  ),
      .DEBUG_MP_MR_RDATA (  ),
      .DEBUG_MP_MR_RDATACONTROL (  ),
      .DEBUG_MP_MR_WDATA (  ),
      .DEBUG_MP_MR_WDATACONTROL (  )
    );

/****************************************************/
 axi_pcie # (
             .PCIE_BRAM_DEBUG_EN        (0),   
	     .C_NO_OF_LANES		(C_NO_OF_LANES),
	     .C_S_AXI_DATA_WIDTH	(AXI_DATA_WIDTH),
	     .C_M_AXI_ADDR_WIDTH	(AXI_ADDR_WIDTH),
	     .C_M_AXI_DATA_WIDTH	(AXI_DATA_WIDTH),
	     .C_COMP_TIMEOUT		(0),
	     .C_S_AXI_SUPPORTS_NARROW_BURST(0),
	     .C_INCLUDE_BAROFFSET_REG	(0),
	     .C_AXIBAR_NUM		(1),
	     .C_PCIEBAR_NUM		(2),
	     .C_PCIEBAR_AS		(0),
	     .C_PCIEBAR_LEN_0		(16),
	     .C_PCIEBAR2AXIBAR_0	(32'h00000000),
	     .C_PCIEBAR_LEN_1		(16),
	     .C_PCIEBAR2AXIBAR_1	(32'h00800000),
	     .C_PIPE_MODE		(C_PIPE_MODE))
    axi_pcie(
	     .linkdown			(linkdown),
	     .clk_50M_out		(clk_50M_out),
	     .free_100MHz		(free_100MHz),
	     .pcie_rstn			(pcie_rstn),
	     .INTX_MSI_Request		(INTX_MSI_Request),
	     .REFCLK			(refclk),
	     .axi_aresetn_out		(axi_aresetn_out),
	     .axi_aclk_out		(axi_aclk_out),
	     .axi_aresetn		(axi_aresetn_out),
	     .axi_aclk			(axi_aclk_out),
	     // Outputs
	     .pci_exp_txp		(pci_exp_txp[C_NO_OF_LANES-1:0]),
	     .pci_exp_txn		(),
	     .axi_ctl_aclk_out		(),
	     .mmcm_lock			(),
	     .interrupt_out		(),
	     .INTX_MSI_Grant		(),
	     .MSI_enable		(),
	     .MSI_Vector_Width		(),
	     .s_axi_ctl_awready		(),
	     .s_axi_ctl_wready		(),
	     .s_axi_ctl_bresp		(),
	     .s_axi_ctl_bvalid		(),
	     .s_axi_ctl_arready		(),
	     .s_axi_ctl_rdata		(),
	     .s_axi_ctl_rresp		(),
	     .s_axi_ctl_rvalid		(),
             .m_axi_awaddr ( axi4lite_0_S_AWADDR ),
             .m_axi_awlen ( axi4lite_0_S_AWLEN ),
             .m_axi_awsize ( axi4lite_0_S_AWSIZE ),
             .m_axi_awburst ( axi4lite_0_S_AWBURST ),
             .m_axi_awprot ( axi4lite_0_S_AWPROT ),
             .m_axi_awvalid ( axi4lite_0_S_AWVALID[0] ),
             .m_axi_awready ( axi4lite_0_S_AWREADY[0] ),
             .m_axi_awlock ( axi4lite_0_S_AWLOCK[0] ),
             .m_axi_awcache ( axi4lite_0_S_AWCACHE ),
             .m_axi_wdata ( axi4lite_0_S_WDATA ),
             .m_axi_wstrb ( axi4lite_0_S_WSTRB ),
             .m_axi_wlast ( axi4lite_0_S_WLAST[0] ),
             .m_axi_wvalid ( axi4lite_0_S_WVALID[0] ),
             .m_axi_wready ( axi4lite_0_S_WREADY[0] ),
             .m_axi_bresp ( axi4lite_0_S_BRESP ),
             .m_axi_bvalid ( axi4lite_0_S_BVALID[0] ),
             .m_axi_bready ( axi4lite_0_S_BREADY[0] ),
             .m_axi_araddr ( axi4lite_0_S_ARADDR ),
             .m_axi_arlen ( axi4lite_0_S_ARLEN ),
             .m_axi_arsize ( axi4lite_0_S_ARSIZE ),
             .m_axi_arburst ( axi4lite_0_S_ARBURST ),
             .m_axi_arprot ( axi4lite_0_S_ARPROT ),
             .m_axi_arvalid ( axi4lite_0_S_ARVALID[0] ),
             .m_axi_arready ( axi4lite_0_S_ARREADY[0] ),
             .m_axi_arlock ( axi4lite_0_S_ARLOCK[0] ),
             .m_axi_arcache ( axi4lite_0_S_ARCACHE ),
             .m_axi_rdata ( axi4lite_0_S_RDATA ),
             .m_axi_rresp ( axi4lite_0_S_RRESP ),
             .m_axi_rlast ( axi4lite_0_S_RLAST[0] ),
             .m_axi_rvalid ( axi4lite_0_S_RVALID[0] ),
             .m_axi_rready ( axi4lite_0_S_RREADY[0] ),
	     // Inputs
	     .pci_exp_rxp		(pci_exp_rxp[C_NO_OF_LANES-1:0]),
	     .pci_exp_rxn		(),
	     .axi_ctl_aclk		(),
	     .MSI_Vector_Num		(),
	     .s_axi_ctl_awaddr		(),
	     .s_axi_ctl_awvalid		(),
	     .s_axi_ctl_wdata		(),
	     .s_axi_ctl_wstrb		(),
	     .s_axi_ctl_wvalid		(),
	     .s_axi_ctl_bready		(),
	     .s_axi_ctl_araddr		(),
	     .s_axi_ctl_arvalid		(),
	     .s_axi_ctl_rready		(),
             //AXI Slave Write Address(dma write to host)
             .s_axi_awid             (dma2tlp_axi_awid), 
             .s_axi_awaddr           (dma2tlp_axi_awaddr),  
             .s_axi_awlen            (dma2tlp_axi_awlen), 
             .s_axi_awsize           (dma2tlp_axi_awsize), 
             .s_axi_awburst          (dma2tlp_axi_awburst), 
             .s_axi_awvalid          (dma2tlp_axi_awvalid), 
             .s_axi_awready          (tlp2dma_axi_awready),
             .s_axi_awregion         (dma2tlp_axi_awregion),
              //AXI Slave Write Data (dma write to host) 
             .s_axi_wdata            (dma2tlp_axi_wdata), 
             .s_axi_wstrb            (dma2tlp_axi_wstrb), 
             .s_axi_wlast            (dma2tlp_axi_wlast), 
             .s_axi_wvalid           (dma2tlp_axi_wvalid), 
             .s_axi_wready           (tlp2dma_axi_wready),
              //AXI Slave Write Response ( host to Response dma)
             .s_axi_bid              (tlp2dma_axi_bid), 
             .s_axi_bresp            (tlp2dma_axi_bresp),  
             .s_axi_bvalid           (tlp2dma_axi_bvalid),  
             .s_axi_bready           (dma2tlp_axi_bready),  
              // AXI Slave Read Address (dma read addr from host)
             .s_axi_arid             (dma2tlp_axi_arid),
             .s_axi_araddr           (dma2tlp_axi_araddr), 
             .s_axi_arregion         (4'h0),  
             .s_axi_arlen            (dma2tlp_axi_arlen),  
             .s_axi_arsize           (dma2tlp_axi_arsize),  
             .s_axi_arburst          (dma2tlp_axi_arburst),  
             .s_axi_arvalid          (dma2tlp_axi_arvalid),  
             .s_axi_arready          (tlp2dma_axi_arready), 
              // AXI Slave Read Data Channel (dma read data from host)
             .s_axi_rid              (tlp2dma_axi_rid),   
             .s_axi_rdata            (tlp2dma_axi_rdata),   
             .s_axi_rresp            (tlp2dma_axi_rresp),    
             .s_axi_rlast            (tlp2dma_axi_rlast),    
             .s_axi_rvalid           (tlp2dma_axi_rvalid),    
             .s_axi_rready           (dma2tlp_axi_rready) ,
//////////////////////////////sim//////////////////////////
       `ifdef LANX8     
	     .core_clk_out		(core_clk_out),
	     .app_rst			(app_rst),
	     .test_out_icm		(test_out_icm[8:0]),
	     .powerdown_ext		(powerdown_ext[1:0]),
	     .rate_ext			(rate_ext),
	     .clk250_out		(clk250_out),
	     .clk500_out		(clk500_out),
	     .rxpolarity0_ext		(rxpolarity0_ext),
	     .txcompl0_ext		(txcompl0_ext),
	     .txdata0_ext		(txdata0_ext[7:0]),
	     .txdatak0_ext		(txdatak0_ext),
	     .txelecidle0_ext		(txelecidle0_ext),
	     .rxpolarity1_ext		(rxpolarity1_ext),
	     .txcompl1_ext		(txcompl1_ext),
	     .txdata1_ext		(txdata1_ext[7:0]),
	     .txdatak1_ext		(txdatak1_ext),
	     .txelecidle1_ext		(txelecidle1_ext),
	     .rxpolarity2_ext		(rxpolarity2_ext),
	     .txcompl2_ext		(txcompl2_ext),
	     .txdata2_ext		(txdata2_ext[7:0]),
	     .txdatak2_ext		(txdatak2_ext),
	     .txelecidle2_ext		(txelecidle2_ext),
	     .rxpolarity3_ext		(rxpolarity3_ext),
	     .txcompl3_ext		(txcompl3_ext),
	     .txdata3_ext		(txdata3_ext[7:0]),
	     .txdatak3_ext		(txdatak3_ext),
	     .txelecidle3_ext		(txelecidle3_ext),
	     .rxpolarity4_ext		(rxpolarity4_ext),
	     .txcompl4_ext		(txcompl4_ext),
	     .txdata4_ext		(txdata4_ext[7:0]),
	     .txdatak4_ext		(txdatak4_ext),
	     .txelecidle4_ext		(txelecidle4_ext),
	     .rxpolarity5_ext		(rxpolarity5_ext),
	     .txcompl5_ext		(txcompl5_ext),
	     .txdata5_ext		(txdata5_ext[7:0]),
	     .txdatak5_ext		(txdatak5_ext),
	     .txelecidle5_ext		(txelecidle5_ext),
	     .rxpolarity6_ext		(rxpolarity6_ext),
	     .txcompl6_ext		(txcompl6_ext),
	     .txdata6_ext		(txdata6_ext[7:0]),
	     .txdatak6_ext		(txdatak6_ext),
	     .txelecidle6_ext		(txelecidle6_ext),
	     .rxpolarity7_ext		(rxpolarity7_ext),
	     .txcompl7_ext		(txcompl7_ext),
	     .txdata7_ext		(txdata7_ext[7:0]),
	     .txdatak7_ext		(txdatak7_ext),
	     .txelecidle7_ext		(txelecidle7_ext),
	     .txdetectrx_ext		(txdetectrx_ext),
	     .test_in			(test_in[39:0]),
	     .phystatus_ext		(phystatus_ext),
	     .pclk_in			(pclk_in),
	     .rxdata0_ext		(rxdata0_ext[7:0]),
	     .rxdatak0_ext		(rxdatak0_ext),
	     .rxelecidle0_ext		(rxelecidle0_ext),
	     .rxstatus0_ext		(rxstatus0_ext[2:0]),
	     .rxvalid0_ext		(rxvalid0_ext),
	     .rxdata1_ext		(rxdata1_ext[7:0]),
	     .rxdatak1_ext		(rxdatak1_ext),
	     .rxelecidle1_ext		(rxelecidle1_ext),
	     .rxstatus1_ext		(rxstatus1_ext[2:0]),
	     .rxvalid1_ext		(rxvalid1_ext),
	     .rxdata2_ext		(rxdata2_ext[7:0]),
	     .rxdatak2_ext		(rxdatak2_ext),
	     .rxelecidle2_ext		(rxelecidle2_ext),
	     .rxstatus2_ext		(rxstatus2_ext[2:0]),
	     .rxvalid2_ext		(rxvalid2_ext),
	     .rxdata3_ext		(rxdata3_ext[7:0]),
	     .rxdatak3_ext		(rxdatak3_ext),
	     .rxelecidle3_ext		(rxelecidle3_ext),
	     .rxstatus3_ext		(rxstatus3_ext[2:0]),
	     .rxvalid3_ext		(rxvalid3_ext),
	     .rxdata4_ext		(rxdata4_ext[7:0]),
	     .rxdatak4_ext		(rxdatak4_ext),
	     .rxelecidle4_ext		(rxelecidle4_ext),
	     .rxstatus4_ext		(rxstatus4_ext[2:0]),
	     .rxvalid4_ext		(rxvalid4_ext),
	     .rxdata5_ext		(rxdata5_ext[7:0]),
	     .rxdatak5_ext		(rxdatak5_ext),
	     .rxelecidle5_ext		(rxelecidle5_ext),
	     .rxstatus5_ext		(rxstatus5_ext[2:0]),
	     .rxvalid5_ext		(rxvalid5_ext),
	     .rxdata6_ext		(rxdata6_ext[7:0]),
	     .rxdatak6_ext		(rxdatak6_ext),
	     .rxelecidle6_ext		(rxelecidle6_ext),
	     .rxstatus6_ext		(rxstatus6_ext[2:0]),
	     .rxvalid6_ext		(rxvalid6_ext),
	     .rxdata7_ext		(rxdata7_ext[7:0]),
	     .rxdatak7_ext		(rxdatak7_ext),
	     .rxelecidle7_ext		(rxelecidle7_ext),
	     .rxstatus7_ext		(rxstatus7_ext[2:0]),
	     .rxvalid7_ext		(rxvalid7_ext),
      `endif
//////////////////////////////////////////////////////////////
	     .m_axi_awready_user	(axi4lite_0_M_AWREADY[1] ),
	     .m_axi_wready_user		(axi4lite_0_M_WREADY[1]),
	     .m_axi_bresp_user		(axi4lite_0_M_BRESP[3:2]),
	     .m_axi_bvalid_user		(axi4lite_0_M_BVALID[1]),
	     .m_axi_arready_user	(axi4lite_0_M_ARREADY[1]),
	     .m_axi_rdata_user		(axi4lite_0_M_RDATA[95:64]),
	     .m_axi_rresp_user		(axi4lite_0_M_RRESP[3:2]),
	     .m_axi_rvalid_user		(axi4lite_0_M_RVALID[1]),
	     .m_axi_awvalid_user	( axi4lite_0_M_AWVALID[1]),
	     .m_axi_awaddr_user		(axi4lite_0_M_AWADDR[63:32]),
	     .m_axi_wdata_user		(axi4lite_0_M_WDATA[95:64]),
	     .m_axi_wvalid_user		(axi4lite_0_M_WVALID[1]),
	     .m_axi_bready_user		(axi4lite_0_M_BREADY[1]),
	     .m_axi_arvalid_user	(axi4lite_0_M_ARVALID[1]),
	     .m_axi_araddr_user		(axi4lite_0_M_ARADDR[63:32]),
	     .m_axi_rready_user		(axi4lite_0_M_RREADY[1])
             );
   

/****************************************************/
   axi_dma#
     (
       .C_S_AXI_LITE_ADDR_WIDTH         (32), //Address width of the AXI Lite Interface
       .C_S_AXI_LITE_DATA_WIDTH         (32), //Data width of the AXI Lite Interface
       .C_DLYTMR_RESOLUTION             (125), //Interrupt Delay Timer resolution in usec
       .C_PRMRY_IS_ACLK_ASYNC           (0), //Primary MM2S/S2MM sync/async mode
       .C_S_AXI_LITE_ACLK_FREQ_HZ       (200000000), //AXI Lite clock frequency in hertz
       .C_M_AXI_MM2S_ACLK_FREQ_HZ       (200000000), //AXI MM2S clock frequency in hertz
       .C_M_AXI_S2MM_ACLK_FREQ_HZ       (200000000), //AXI S2MM clock frequency in hertz
       .C_M_AXI_SG_ACLK_FREQ_HZ         (200000000), //Scatter Gather clock frequency in hertz
       /*----Scatter Gather Parameters----*/
       .C_INCLUDE_SG                    (1), //Include or Exclude the Scatter Gather Engine
       .C_SG_INCLUDE_DESC_QUEUE         (1), //Include or Exclude Scatter Gather Descriptor Queuing
       .C_SG_INCLUDE_STSCNTRL_STRM      (1), //Include or Exclude AXI Status and AXI Control Streams
       .C_SG_USE_STSAPP_LENGTH          (0), //Enable or Disable use of Status Stream Rx Length.  Only valid
       .C_SG_LENGTH_WIDTH               (14), //Descriptor Buffer Length, Transferred Bytes, and Status Stream
       .C_M_AXI_SG_ADDR_WIDTH           (32), //Master AXI Memory Map Address Width for Scatter Gather R/W Port
       .C_M_AXI_SG_DATA_WIDTH           (32), //Master AXI Memory Map Data Width for Scatter Gather R/W Port
       .C_M_AXIS_MM2S_CNTRL_TDATA_WIDTH (32), //Master AXI Control Stream Data Width
       .C_S_AXIS_S2MM_STS_TDATA_WIDTH   (32), //Slave AXI Status Stream Data Width
       /*--Memory Map to Stream (MM2S) Parameters --*/
       .C_INCLUDE_MM2S                  (1),  //Include or exclude MM2S primary data path
       .C_INCLUDE_MM2S_SF               (1), //This parameter specifies the inclusion/omission
       .C_INCLUDE_MM2S_DRE              (1), //Include or exclude MM2S data realignment engine (DRE)
       .C_MM2S_BURST_SIZE               (64), //Maximum burst size per burst request on MM2S Read Port
       .C_M_AXI_MM2S_ADDR_WIDTH         (AXI_ADDR_WIDTH ), //Master AXI Memory Map Address Width for MM2S Read Port
       .C_M_AXI_MM2S_DATA_WIDTH         (AXI_DATA_WIDTH ), //Master AXI Memory Map Data Width for MM2S Read Port
       .C_M_AXIS_MM2S_TDATA_WIDTH       (AXI_DATA_WIDTH ), //Master AXI Stream Data Width for MM2S Channel
       /*--Stream to Memory Map (S2MM) Parameters--*/
       .C_INCLUDE_S2MM                  (1), //Include or exclude S2MM primary data path
       .C_INCLUDE_S2MM_SF               (1), //This parameter specifies the inclusion/omission of 
       .C_INCLUDE_S2MM_DRE              (1), //Include or exclude S2MM data realignment engine (DRE)
       .C_S2MM_BURST_SIZE               (64), //Maximum burst size per burst request on S2MM Write Port
       .C_M_AXI_S2MM_ADDR_WIDTH         (AXI_ADDR_WIDTH ), //Master AXI Memory Map Address Width for S2MM Write Port
       .C_M_AXI_S2MM_DATA_WIDTH         (AXI_DATA_WIDTH ), //Master AXI Memory Map Data Width for MM2SS2MMWrite Port
       .C_S_AXIS_S2MM_TDATA_WIDTH       (AXI_DATA_WIDTH ), //Slave AXI Stream Data Width for S2MM Channel
       .C_ENABLE_MULTI_CHANNEL          (0), //Enable CACHE support, primarily for MCDMA
       .C_NUM_S2MM_CHANNELS             (1), //Number of S2MM channels, primarily for MCDMA
       .C_NUM_MM2S_CHANNELS             (1), //Number of MM2S channels, primarily for MCDMA
       .C_FAMILY                        ("virtex6"), //Target FPGA Device Family
       .C_INSTANCE                      ("axi_dma")
    )
    axi_dma (
        .s_axi_lite_aclk           (axi_aclk_out),              
        .m_axi_sg_aclk             (axi_aclk_out),              
        .m_axi_mm2s_aclk           (axi_aclk_out),             
        .m_axi_s2mm_aclk           (axi_aclk_out),             
        .axi_resetn                (axi_aresetn_out),             
        /*------AXI Lite Control Interface--*/ 
        .s_axi_lite_awvalid        (axi4lite_0_M_AWVALID[0] ),
        .s_axi_lite_awready        (axi4lite_0_M_AWREADY[0] ),
        .s_axi_lite_awaddr         (axi4lite_0_M_AWADDR[31:0] ),
        .s_axi_lite_wvalid         (axi4lite_0_M_WVALID[0] ),
        .s_axi_lite_wready         (axi4lite_0_M_WREADY[0] ),
        .s_axi_lite_wdata          (axi4lite_0_M_WDATA[31:0] ),
        .s_axi_lite_bresp          (axi4lite_0_M_BRESP[1:0] ),
        .s_axi_lite_bvalid         (axi4lite_0_M_BVALID[0] ),
        .s_axi_lite_bready         (axi4lite_0_M_BREADY[0] ),
        .s_axi_lite_arvalid        (axi4lite_0_M_ARVALID[0] ),
        .s_axi_lite_arready        (axi4lite_0_M_ARREADY[0] ),
        .s_axi_lite_araddr         (axi4lite_0_M_ARADDR[31:0] ),
        .s_axi_lite_rvalid         (axi4lite_0_M_RVALID[0] ),
        .s_axi_lite_rready         (axi4lite_0_M_RREADY[0] ),
        .s_axi_lite_rdata          (axi4lite_0_M_RDATA[31:0] ),
        .s_axi_lite_rresp          (axi4lite_0_M_RRESP[1:0] ), 
        /*-----AXI Scatter Gather Interface-- -*/           
        .m_axi_sg_awaddr           (axi_sg_awaddr ),         
        .m_axi_sg_awlen            (axi_sg_awlen  ),        
        .m_axi_sg_awsize           (axi_sg_awsize ),        
        .m_axi_sg_awburst          (axi_sg_awburst),        
        .m_axi_sg_awprot           (axi_sg_awprot ),        
        .m_axi_sg_awcache          (axi_sg_awcache),        
        .m_axi_sg_awuser           (axi_sg_awuser ),        
        .m_axi_sg_awvalid          (axi_sg_awvalid),        
        .m_axi_sg_awready          (axi_sg_awready),        
        .m_axi_sg_wdata            (axi_sg_wdata ),         
        .m_axi_sg_wstrb            (axi_sg_wstrb ),        
        .m_axi_sg_wlast            (axi_sg_wlast ),        
        .m_axi_sg_wvalid           (axi_sg_wvalid),        
        .m_axi_sg_wready           (axi_sg_wready),         
        .m_axi_sg_bresp            (axi_sg_bresp ),               
        .m_axi_sg_bvalid           (axi_sg_bvalid),         
        .m_axi_sg_bready           (axi_sg_bready),         
        .m_axi_sg_araddr           (axi_sg_araddr ),        
        .m_axi_sg_arlen            (axi_sg_arlen  ),        
        .m_axi_sg_arsize           (axi_sg_arsize ),        
        .m_axi_sg_arburst          (axi_sg_arburst),        
        .m_axi_sg_arprot           (axi_sg_arprot ),        
        .m_axi_sg_arcache          (axi_sg_arcache),        
        .m_axi_sg_aruser           (axi_sg_aruser ),        
        .m_axi_sg_arvalid          (axi_sg_arvalid),        
        .m_axi_sg_arready          (axi_sg_arready),        
        .m_axi_sg_rdata            (axi_sg_rdata ),         
        .m_axi_sg_rresp            (axi_sg_rresp ),         
        .m_axi_sg_rlast            (axi_sg_rlast ),         
        .m_axi_sg_rvalid           (axi_sg_rvalid),         
        .m_axi_sg_rready           (axi_sg_rready),
        /*-------Stream to Memory Map(S2MM)----*/                     
        .m_axi_s2mm_awaddr         (axi_s2mm_awaddr ),            
        .m_axi_s2mm_awlen          (axi_s2mm_awlen  ),        
        .m_axi_s2mm_awsize         (axi_s2mm_awsize ),        
        .m_axi_s2mm_awburst        (axi_s2mm_awburst),        
        .m_axi_s2mm_awprot         (axi_s2mm_awprot ),        
        .m_axi_s2mm_awcache        (axi_s2mm_awcache),        
        .m_axi_s2mm_awuser         (axi_s2mm_awuser ),        
        .m_axi_s2mm_awvalid        (axi_s2mm_awvalid),        
        .m_axi_s2mm_awready        (axi_s2mm_awready),      
        .m_axi_s2mm_wdata          (axi_s2mm_wdata ),           
        .m_axi_s2mm_wstrb          (axi_s2mm_wstrb ),       
        .m_axi_s2mm_wlast          (axi_s2mm_wlast ),       
        .m_axi_s2mm_wvalid         (axi_s2mm_wvalid),       
        .m_axi_s2mm_wready         (axi_s2mm_wready),       
        .m_axi_s2mm_bresp          (axi_s2mm_bresp ),               
        .m_axi_s2mm_bvalid         (axi_s2mm_bvalid),       
        .m_axi_s2mm_bready         (axi_s2mm_bready),       
        /*-------Memory Map to Stream (MM2S)----*/                        
        .m_axi_mm2s_araddr         (axi_mm2s_araddr ),            
        .m_axi_mm2s_arlen          (axi_mm2s_arlen  ),        
        .m_axi_mm2s_arsize         (axi_mm2s_arsize ),        
        .m_axi_mm2s_arburst        (axi_mm2s_arburst),        
        .m_axi_mm2s_arprot         (axi_mm2s_arprot ),        
        .m_axi_mm2s_arcache        (axi_mm2s_arcache),        
        .m_axi_mm2s_aruser         (axi_mm2s_aruser ),        
        .m_axi_mm2s_arvalid        (axi_mm2s_arvalid),       
        .m_axi_mm2s_arready        (axi_mm2s_arready),                   
        .m_axi_mm2s_rdata          (axi_mm2s_rdata ),                
        .m_axi_mm2s_rresp          (axi_mm2s_rresp ),         
        .m_axi_mm2s_rlast          (axi_mm2s_rlast ),        
        .m_axi_mm2s_rvalid         (axi_mm2s_rvalid),        
        .m_axi_mm2s_rready         (axi_mm2s_rready), 
         /*---Memory Map to Stream (MM2S) Stream Interface--*/                
        .mm2s_prmry_reset_out_n    (),        
        .m_axis_mm2s_tdata         (m_mm2s_tdata),        
        .m_axis_mm2s_tkeep         (m_mm2s_tkeep),        
        .m_axis_mm2s_tvalid        (m_mm2s_tvalid),        
        .m_axis_mm2s_tready        (m_mm2s_tready),               
        .m_axis_mm2s_tlast         (m_mm2s_tlast),        
        .m_axis_mm2s_tuser         (),        
        .m_axis_mm2s_tid           (),        
        .m_axis_mm2s_tdest         (), 
        /*--Stream to Memory Map (S2MM) Steam Interface--*/             
        .s2mm_prmry_reset_out_n    (),        
        .s_axis_s2mm_tdata         (s_s2mm_tdata),       
        .s_axis_s2mm_tkeep         (s_s2mm_tkeep),    
        .s_axis_s2mm_tvalid        (s_s2mm_tvalid),   
        .s_axis_s2mm_tready        (s_s2mm_tready),
        .s_axis_s2mm_tlast         (s_s2mm_tlast),      
        .s_axis_s2mm_tuser         (),    
        .s_axis_s2mm_tid           (),    
        .s_axis_s2mm_tdest         (),        
        .mm2s_cntrl_reset_out_n    (),        
        .m_axis_mm2s_cntrl_tdata   (axis_mm2s_cntrl_tdata),        
        .m_axis_mm2s_cntrl_tkeep   (axis_mm2s_cntrl_tkeep),        
        .m_axis_mm2s_cntrl_tvalid  (axis_mm2s_cntrl_tvalid),        
        .m_axis_mm2s_cntrl_tready  (axis_mm2s_cntrl_tready),          
        .m_axis_mm2s_cntrl_tlast   (axis_mm2s_cntrl_tlast),      
        .s2mm_sts_reset_out_n      (),        
        .s_axis_s2mm_sts_tdata     (axis_mm2s_cntrl_tdata),    
        .s_axis_s2mm_sts_tkeep     (axis_mm2s_cntrl_tkeep),    
        .s_axis_s2mm_sts_tvalid    (axis_mm2s_cntrl_tvalid),    
        .s_axis_s2mm_sts_tready    (axis_mm2s_cntrl_tready),   
        .s_axis_s2mm_sts_tlast     (axis_mm2s_cntrl_tlast),  
        /*--MM2S and S2MM Channel Interrupts--*/                 
        .mm2s_introut              (mm2s_introut),        
        .s2mm_introut              (s2mm_introut),        
        .axi_dma_tstvec            ()                
        );

dma_loop_fifo
  dma_loop_fifo(
	      // Outputs
	      .m_axis_mm2s_tready	(m_mm2s_tready),
	      .s_axis_s2mm_tdata	(s_s2mm_tdata[AXI_DATA_WIDTH-1:0]),
	      .s_axis_s2mm_tkeep	(s_s2mm_tkeep),
	      .s_axis_s2mm_tvalid	(s_s2mm_tvalid),
	      .s_axis_s2mm_tlast	(s_s2mm_tlast),
	      // Inputs 
	      .axi_clk			(axi_aclk_out),
	      .axi_rst			(!axi_aresetn_out),
	      .m_axis_mm2s_tdata	(m_mm2s_tdata[AXI_DATA_WIDTH-1:0]),
	      .m_axis_mm2s_tkeep	(m_mm2s_tkeep[BE_WIDTH-1:0]),
	      .m_axis_mm2s_tvalid	(m_mm2s_tvalid),
	      .m_axis_mm2s_tlast	(m_mm2s_tlast),
	      .s_axis_s2mm_tready	(s_s2mm_tready)
	       );


/****************************************************/
axi_interconnect_v1_06_a # (
  .C_FAMILY                        ("virtex6"), 
  .C_NUM_SLAVE_PORTS               (2), 
  .C_THREAD_ID_WIDTH               (0), 
  .C_THREAD_ID_PORT_WIDTH          (1), 
  .C_AXI_ADDR_WIDTH                (AXI_ADDR_WIDTH), 
  .C_S00_AXI_DATA_WIDTH            (32 ), //axi_sg_wdata
  .C_S01_AXI_DATA_WIDTH            (AXI_DATA_WIDTH ), 
  .C_M00_AXI_DATA_WIDTH            (AXI_DATA_WIDTH ), 
  .C_INTERCONNECT_DATA_WIDTH       (AXI_DATA_WIDTH ), 
  .C_S00_AXI_ACLK_RATIO            ("1:1"), 
  .C_S01_AXI_ACLK_RATIO            ("1:1"),
  .C_S00_AXI_IS_ACLK_ASYNC         (1'b0),
  .C_S01_AXI_IS_ACLK_ASYNC         (1'b0),
  .C_M00_AXI_ACLK_RATIO            ("1:1"), 
  .C_M00_AXI_IS_ACLK_ASYNC         (1'b0),
  .C_S00_AXI_READ_WRITE_SUPPORT    ("READ/WRITE"), 
  .C_S01_AXI_READ_WRITE_SUPPORT    ("READ/WRITE"),
  .C_S00_AXI_WRITE_ACCEPTANCE      (16),
  .C_S01_AXI_WRITE_ACCEPTANCE      (16),
  .C_S00_AXI_READ_ACCEPTANCE       (16),
  .C_S01_AXI_READ_ACCEPTANCE       (16),
  .C_M00_AXI_WRITE_ISSUING         (16),
  .C_M00_AXI_READ_ISSUING          (16),
  .C_S00_AXI_ARB_PRIORITY          (0),
  .C_S01_AXI_ARB_PRIORITY          (0),
  .C_S00_AXI_WRITE_FIFO_DEPTH      (512),
  .C_S01_AXI_WRITE_FIFO_DEPTH      (512),
  .C_S00_AXI_READ_FIFO_DEPTH       (512),
  .C_S01_AXI_READ_FIFO_DEPTH       (512),
  .C_M00_AXI_WRITE_FIFO_DEPTH      (512),
  .C_M00_AXI_READ_FIFO_DEPTH       (512),
  .C_S00_AXI_WRITE_FIFO_DELAY      (1'b0),
  .C_S01_AXI_WRITE_FIFO_DELAY      (1'b0),
  .C_S00_AXI_READ_FIFO_DELAY       (1'b0),
  .C_S01_AXI_READ_FIFO_DELAY       (1'b0),
  .C_M00_AXI_WRITE_FIFO_DELAY      (1'b0),
  .C_M00_AXI_READ_FIFO_DELAY       (1'b0),
  .C_S00_AXI_REGISTER              (1'b1),
  .C_S01_AXI_REGISTER              (1'b1),
  .C_M00_AXI_REGISTER              (1'b1)
   )   axi_interconnect
   (
   .INTERCONNECT_ACLK              (axi_aclk_out),                                                         
   .INTERCONNECT_ARESETN           (axi_aresetn_out), 
                                                         
   .S00_AXI_ARESET_OUT_N           (),                               
   .S00_AXI_ACLK                   (axi_aclk_out),          
                      
   .S00_AXI_AWID                   (8'h0),               
   .S00_AXI_AWLOCK                 (),                
   .S00_AXI_AWBURST                (axi_sg_awburst),                                            
   .S00_AXI_AWCACHE                (axi_sg_awcache),                              
   .S00_AXI_AWADDR                 (axi_sg_awaddr),                           
   .S00_AXI_AWLEN                  (axi_sg_awlen),                          
   .S00_AXI_AWSIZE                 (axi_sg_awsize),                    
   .S00_AXI_AWPROT                 (axi_sg_awprot),                                              
   .S00_AXI_AWVALID                (axi_sg_awvalid),                         
   .S00_AXI_AWREADY                (axi_sg_awready), 
                         
   .S00_AXI_WDATA                  (axi_sg_wdata),                       
   .S00_AXI_WSTRB                  (axi_sg_wstrb),                       
   .S00_AXI_WLAST                  (axi_sg_wlast),                                                               
   .S00_AXI_WVALID                 (axi_sg_wvalid),                        
   .S00_AXI_WREADY                 (axi_sg_wready),  
                       
   .S00_AXI_BID                    (),                  
   .S00_AXI_BRESP                  (axi_sg_bresp),                    
   .S00_AXI_BVALID                 (axi_sg_bvalid),                     
   .S00_AXI_BREADY                 (axi_sg_bready),  
                        
   .S00_AXI_ARID                   (8'h0),            
   .S00_AXI_ARLOCK                 (),                
   .S00_AXI_ARQOS                  (),                                        
   .S00_AXI_ARADDR                 (axi_sg_araddr),                         
   .S00_AXI_ARLEN                  (axi_sg_arlen),                         
   .S00_AXI_ARSIZE                 (axi_sg_arsize),                         
   .S00_AXI_ARBURST                (axi_sg_arburst),                                         
   .S00_AXI_ARCACHE                (axi_sg_arcache),                         
   .S00_AXI_ARPROT                 (axi_sg_arprot),                                            
   .S00_AXI_ARVALID                (axi_sg_arvalid),                        
   .S00_AXI_ARREADY                (axi_sg_arready), 
                         
   .S00_AXI_RID                    (),                  
   .S00_AXI_RDATA                  (axi_sg_rdata),                    
   .S00_AXI_RRESP                  (axi_sg_rresp),                    
   .S00_AXI_RLAST                  (axi_sg_rlast),                    
   .S00_AXI_RVALID                 (axi_sg_rvalid),                     
   .S00_AXI_RREADY                 (axi_sg_rready),  
                 
   .S01_AXI_ARESET_OUT_N           (),                               
   .S01_AXI_ACLK                   (axi_aclk_out),           
                                                        
   .S01_AXI_AWID                   (8'h0),                    
   .S01_AXI_AWLOCK                 (),                    
   .S01_AXI_AWQOS                  (),                   
   .S01_AXI_AWCACHE                (axi_s2mm_awcache),            
   .S01_AXI_AWPROT                 (axi_s2mm_awprot),            
   .S01_AXI_AWADDR                 (axi_s2mm_awaddr),            
   .S01_AXI_AWLEN                  (axi_s2mm_awlen),            
   .S01_AXI_AWSIZE                 (axi_s2mm_awsize),            
   .S01_AXI_AWBURST                (axi_s2mm_awburst),                        
   .S01_AXI_AWVALID                (axi_s2mm_awvalid),            
   .S01_AXI_AWREADY                (axi_s2mm_awready),          
                                                        
   .S01_AXI_WDATA                  (axi_s2mm_wdata),            
   .S01_AXI_WSTRB                  (axi_s2mm_wstrb),             
   .S01_AXI_WLAST                  (axi_s2mm_wlast),             
   .S01_AXI_WVALID                 (axi_s2mm_wvalid),             
   .S01_AXI_WREADY                 (axi_s2mm_wready),           
                                                        
   .S01_AXI_BID                    (),                      
   .S01_AXI_BRESP                  (axi_s2mm_bresp),                        
   .S01_AXI_BVALID                 (axi_s2mm_bvalid),                         
   .S01_AXI_BREADY                 (axi_s2mm_bready),   
                                                        
   .S01_AXI_ARID                   (8'h0),               
   .S01_AXI_ARLOCK                 (),                   
   .S01_AXI_ARQOS                  (),                   
   .S01_AXI_ARCACHE                (axi_mm2s_arcache),             
   .S01_AXI_ARPROT                 (axi_mm2s_arprot),                           
   .S01_AXI_ARADDR                 (axi_mm2s_araddr),             
   .S01_AXI_ARLEN                  (axi_mm2s_arlen),             
   .S01_AXI_ARSIZE                 (axi_mm2s_arsize),             
   .S01_AXI_ARBURST                (axi_mm2s_arburst),                      
   .S01_AXI_ARVALID                (axi_mm2s_arvalid),             
   .S01_AXI_ARREADY                (axi_mm2s_arready),  
                                                         
   .S01_AXI_RID                    (),                          
   .S01_AXI_RDATA                  (axi_mm2s_rdata),                            
   .S01_AXI_RRESP                  (axi_mm2s_rresp),                            
   .S01_AXI_RLAST                  (axi_mm2s_rlast),                            
   .S01_AXI_RVALID                 (axi_mm2s_rvalid),                             
   .S01_AXI_RREADY                 (axi_mm2s_rready),            
                                                                                   
   .M00_AXI_ARESET_OUT_N           (),                               
   .M00_AXI_ACLK                   (axi_aclk_out),  
                     
   .M00_AXI_AWID                   (dma2tlp_axi_awid),                       
   .M00_AXI_AWADDR                 (dma2tlp_axi_awaddr),                         
   .M00_AXI_AWLEN                  (dma2tlp_axi_awlen),                        
   .M00_AXI_AWSIZE                 (dma2tlp_axi_awsize),                         
   .M00_AXI_AWBURST                (dma2tlp_axi_awburst),                                              
   .M00_AXI_AWVALID                (dma2tlp_axi_awvalid),                          
   .M00_AXI_AWREADY                (tlp2dma_axi_awready), 
   .M00_AXI_AWLOCK                 (),                         
   .M00_AXI_AWCACHE                (),                          
   .M00_AXI_AWPROT                 (),                         
   .M00_AXI_AWQOS                  (),    
                         
   .M00_AXI_WDATA                  (dma2tlp_axi_wdata),                      
   .M00_AXI_WSTRB                  (dma2tlp_axi_wstrb),                        
   .M00_AXI_WLAST                  (dma2tlp_axi_wlast),                        
   .M00_AXI_WVALID                 (dma2tlp_axi_wvalid),                         
   .M00_AXI_WREADY                 (tlp2dma_axi_wready),  
                        
   .M00_AXI_BID                    (tlp2dma_axi_bid),                      
   .M00_AXI_BRESP                  (tlp2dma_axi_bresp),                       
   .M00_AXI_BVALID                 (tlp2dma_axi_bvalid),                                                                  
   .M00_AXI_BREADY                 (dma2tlp_axi_bready), 
                      
   .M00_AXI_ARID                   (dma2tlp_axi_arid),                       
   .M00_AXI_ARADDR                 (dma2tlp_axi_araddr),                         
   .M00_AXI_ARLEN                  (dma2tlp_axi_arlen),                        
   .M00_AXI_ARSIZE                 (dma2tlp_axi_arsize),                         
   .M00_AXI_ARBURST                (dma2tlp_axi_arburst),                                                
   .M00_AXI_ARVALID                (dma2tlp_axi_arvalid),                          
   .M00_AXI_ARREADY                (tlp2dma_axi_arready), 
   .M00_AXI_ARLOCK                 (),                         
   .M00_AXI_ARCACHE                (),                          
   .M00_AXI_ARPROT                 (),                         
   .M00_AXI_ARQOS                  (),   
                         
   .M00_AXI_RID                    (tlp2dma_axi_rid),                        
   .M00_AXI_RDATA                  (tlp2dma_axi_rdata),                    
   .M00_AXI_RRESP                  (tlp2dma_axi_rresp),                         
   .M00_AXI_RLAST                  (tlp2dma_axi_rlast),                         
   .M00_AXI_RVALID                 (tlp2dma_axi_rvalid),                         
   .M00_AXI_RREADY                 (dma2tlp_axi_rready)                        
   );   
/****************************************************/

  assign fan_con = 1'h1;
  assign INTX_MSI_Request = s2mm_introut || mm2s_introut;
  assign net_gnd0 = 1'b0;
  assign net_gnd1[0:0] = 1'b0;
  assign net_gnd12[11:0] = 12'b000000000000;
  assign net_gnd2[1:0] = 2'b00;
  assign net_gnd3[2:0] = 3'b000;
  assign net_gnd32[31:0] = 32'b00000000000000000000000000000000;
  assign net_gnd4[3:0] = 4'b0000;
  assign net_gnd5[4:0] = 5'b00000;
  assign net_gnd6[5:0] = 6'b000000;

endmodule

