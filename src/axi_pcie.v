
module axi_pcie (/*AUTOARG*/
   // Outputs
   linkdown, clk_50M_out, pll_locked, axi_aclk_out, axi_aresetn_out,
   pci_exp_txp, pci_exp_txn, axi_ctl_aclk_out, mmcm_lock,
   interrupt_out, INTX_MSI_Grant, MSI_enable, MSI_Vector_Width,
   s_axi_ctl_awready, s_axi_ctl_wready, s_axi_ctl_bresp,
   s_axi_ctl_bvalid, s_axi_ctl_arready, s_axi_ctl_rdata,
   s_axi_ctl_rresp, s_axi_ctl_rvalid, s_axi_awready, s_axi_wready,
   s_axi_bid, s_axi_bresp, s_axi_bvalid, s_axi_arready, s_axi_rdata,
   s_axi_rid, s_axi_rresp, s_axi_rlast, s_axi_rvalid, m_axi_awaddr,
   m_axi_awregion, m_axi_awlen, m_axi_awsize, m_axi_awburst,
   m_axi_awvalid, m_axi_awcache, m_axi_awlock, m_axi_awprot,
   m_axi_arlock, m_axi_arcache, m_axi_wdata, m_axi_wstrb, m_axi_wlast,
   m_axi_wvalid, m_axi_bready, m_axi_arid, m_axi_araddr,
   m_axi_arregion, m_axi_arlen, m_axi_arsize, m_axi_arburst,
   m_axi_arvalid, m_axi_arprot, m_axi_rready, m_axi_awready_user,
   m_axi_wready_user, m_axi_bresp_user, m_axi_bvalid_user,
   m_axi_arready_user, m_axi_rdata_user, m_axi_rresp_user,
   m_axi_rvalid_user, core_clk_out, app_rst, test_out_icm,
   powerdown_ext, rate_ext, clk250_out, clk500_out, rxpolarity0_ext,
   txcompl0_ext, txdata0_ext, txdatak0_ext, txelecidle0_ext,
   rxpolarity1_ext, txcompl1_ext, txdata1_ext, txdatak1_ext,
   txelecidle1_ext, rxpolarity2_ext, txcompl2_ext, txdata2_ext,
   txdatak2_ext, txelecidle2_ext, rxpolarity3_ext, txcompl3_ext,
   txdata3_ext, txdatak3_ext, txelecidle3_ext, rxpolarity4_ext,
   txcompl4_ext, txdata4_ext, txdatak4_ext, txelecidle4_ext,
   rxpolarity5_ext, txcompl5_ext, txdata5_ext, txdatak5_ext,
   txelecidle5_ext, rxpolarity6_ext, txcompl6_ext, txdata6_ext,
   txdatak6_ext, txelecidle6_ext, rxpolarity7_ext, txcompl7_ext,
   txdata7_ext, txdatak7_ext, txelecidle7_ext, txdetectrx_ext,
   // Inputs
   free_100MHz, pcie_rstn, axi_aclk, axi_aresetn, INTX_MSI_Request,
   REFCLK, pci_exp_rxp, pci_exp_rxn, axi_ctl_aclk, MSI_Vector_Num,
   s_axi_ctl_awaddr, s_axi_ctl_awvalid, s_axi_ctl_wdata,
   s_axi_ctl_wstrb, s_axi_ctl_wvalid, s_axi_ctl_bready,
   s_axi_ctl_araddr, s_axi_ctl_arvalid, s_axi_ctl_rready, s_axi_awid,
   s_axi_awaddr, s_axi_awregion, s_axi_awlen, s_axi_awsize,
   s_axi_awburst, s_axi_awvalid, s_axi_wdata, s_axi_wstrb,
   s_axi_wlast, s_axi_wvalid, s_axi_bready, s_axi_arid, s_axi_araddr,
   s_axi_arregion, s_axi_arlen, s_axi_arsize, s_axi_arburst,
   s_axi_arvalid, s_axi_rready, m_axi_awready, m_axi_wready,
   m_axi_bresp, m_axi_bvalid, m_axi_arready, m_axi_rdata, m_axi_rid,
   m_axi_rresp, m_axi_rlast, m_axi_rvalid, m_axi_awvalid_user,
   m_axi_awaddr_user, m_axi_wdata_user, m_axi_wvalid_user,
   m_axi_bready_user, m_axi_arvalid_user, m_axi_araddr_user,
   m_axi_rready_user, test_in, phystatus_ext, pclk_in, rxdata0_ext,
   rxdatak0_ext, rxelecidle0_ext, rxstatus0_ext, rxvalid0_ext,
   rxdata1_ext, rxdatak1_ext, rxelecidle1_ext, rxstatus1_ext,
   rxvalid1_ext, rxdata2_ext, rxdatak2_ext, rxelecidle2_ext,
   rxstatus2_ext, rxvalid2_ext, rxdata3_ext, rxdatak3_ext,
   rxelecidle3_ext, rxstatus3_ext, rxvalid3_ext, rxdata4_ext,
   rxdatak4_ext, rxelecidle4_ext, rxstatus4_ext, rxvalid4_ext,
   rxdata5_ext, rxdatak5_ext, rxelecidle5_ext, rxstatus5_ext,
   rxvalid5_ext, rxdata6_ext, rxdatak6_ext, rxelecidle6_ext,
   rxstatus6_ext, rxvalid6_ext, rxdata7_ext, rxdatak7_ext,
   rxelecidle7_ext, rxstatus7_ext, rxvalid7_ext
   );

/*********************************************************************************/
   parameter  C_INSTANCE                    = "AXI_PCIe";
   parameter  C_MAX_LINK_SPEED              = 0;
   parameter  C_PCIE_USE_MODE               = "1.0";

   parameter  C_DEVICE_ID                   = 4;
   parameter  C_VENDOR_ID                   = 4466;
   parameter  C_REV_ID                      = 1;

   parameter  C_SUBSYSTEM_ID                = 0;
   parameter  C_SUBSYSTEM_VENDOR_ID         = 0;
   parameter  C_CLASS_CODE                  = 0;

   parameter  C_REF_CLK_FREQ                = 0;
   parameter  C_PCIE_CAP_SLOT_IMPLEMENTED   = 0;
   parameter  C_NUM_MSI_REQ                 = 0;
   parameter  C_INTERRUPT_PIN               = 0;
   parameter  C_BASEADDR                    = 32'hFFFF_FFFF;
   parameter  C_HIGHADDR                    = 32'h0;

   parameter  C_NO_OF_LANES                 = 4; 
   parameter  C_FAMILY		            = "virtex6";       
   parameter  C_S_AXI_ID_WIDTH              = 4;               
   parameter  C_S_AXI_ADDR_WIDTH            = 32;                     
   parameter  C_S_AXI_DATA_WIDTH            = 32;                     
   parameter  C_M_AXI_ADDR_WIDTH            = 32;                     
   parameter  C_M_AXI_DATA_WIDTH            = 32;                      
   parameter  C_COMP_TIMEOUT                = 0;                       
   parameter  C_INCLUDE_RC                  = 0;                         
   parameter  C_S_AXI_SUPPORTS_NARROW_BURST = 1;                        
   parameter  C_INCLUDE_BAROFFSET_REG       = 1;                                    
   parameter  C_AXIBAR_NUM                  = 6;                      
   parameter  C_AXIBAR2PCIEBAR_0            = 32'h0;                  
   parameter  C_AXIBAR2PCIEBAR_1            = 32'h0;                    
   parameter  C_AXIBAR2PCIEBAR_2            = 32'h0;                          
   parameter  C_AXIBAR2PCIEBAR_3            = 32'h0;                    
   parameter  C_AXIBAR2PCIEBAR_4            = 32'h0;                          
   parameter  C_AXIBAR2PCIEBAR_5            = 32'h0;                           
   parameter  C_AXIBAR_AS_0                 = 0;                                
   parameter  C_AXIBAR_AS_1                 = 0;                           
   parameter  C_AXIBAR_AS_2                 = 0;                         
   parameter  C_AXIBAR_AS_3                 = 0;                             
   parameter  C_AXIBAR_AS_4                 = 0;                              
   parameter  C_AXIBAR_AS_5                 = 0;                               
   parameter  C_AXIBAR_0                    = 32'hffffffff;                                
   parameter  C_AXIBAR_HIGHADDR_0           = 32'h0;                                 
   parameter  C_AXIBAR_1                    = 32'hffffffff;                                     
   parameter  C_AXIBAR_HIGHADDR_1           = 32'h0;                                       
   parameter  C_AXIBAR_2                    = 32'hffffffff;                              
   parameter  C_AXIBAR_HIGHADDR_2           = 32'h0;                                  
   parameter  C_AXIBAR_3                    = 32'hffffffff;                             
   parameter  C_AXIBAR_HIGHADDR_3           = 32'h0;                         
   parameter  C_AXIBAR_4                    = 32'hffffffff;                         
   parameter  C_AXIBAR_HIGHADDR_4           = 32'h0;                             
   parameter  C_AXIBAR_5                    = 32'hffffffff;                               
   parameter  C_AXIBAR_HIGHADDR_5           = 32'h0;                               
   parameter  C_PCIEBAR_NUM                 = 3;                                 
   parameter  C_PCIEBAR_AS                  = 1;                                
   parameter  C_PCIEBAR_LEN_0               = 16;                                      
   parameter  C_PCIEBAR2AXIBAR_0            = 32'h0;                                    
   parameter  C_PCIEBAR_LEN_1               = 16;                                 
   parameter  C_PCIEBAR2AXIBAR_1            = 32'h0;                                   
   parameter  C_PCIEBAR_LEN_2               = 16;                              
   parameter  C_PCIEBAR2AXIBAR_2            = 32'h0;

   parameter  C_PIPE_MODE                   = 0;
   parameter  PCIE_BRAM_DEBUG_EN            = 0; 
   localparam  DEBUG_REG_EN                 = (PCIE_BRAM_DEBUG_EN == 1)?0:1;    
   localparam  C_INT_NUM                    = 1;                                     
   localparam  C_AXIREAD_NUM                = (C_S_AXI_DATA_WIDTH == 128)?4:8;  
   localparam  C_S_AXIS_USER_WIDTH          = 22;  
   localparam  AXI_DATA_WIDTH               = C_M_AXI_DATA_WIDTH;                         
   localparam  AXI_ADDR_WIDTH               = C_M_AXI_ADDR_WIDTH;                        
   localparam  USER_WIDTH_RX                = C_S_AXIS_USER_WIDTH;                            
   localparam  USER_WIDTH_TX                = 4;                          
   localparam  AXI_ID_WIDTH                 = C_S_AXI_ID_WIDTH;                                                   
   localparam  C_TEST                       = 40'hA8;                   
   localparam  MSI_EN                       = 0;
   localparam  BE_WIDTH                     = AXI_DATA_WIDTH/8;    
/*********************************************************************************/
   //the difference signal
   input                         free_100MHz;//
   input                         pcie_rstn;
   output 		         linkdown;
   output                        clk_50M_out;
   output                        pll_locked;

   //the same signal
   output                        axi_aclk_out;
   output                        axi_aresetn_out;
   input                         axi_aclk;
   input                         axi_aresetn;
   input                         INTX_MSI_Request;
   input                         REFCLK;
   input  [C_NO_OF_LANES-1:0]    pci_exp_rxp;
   output [C_NO_OF_LANES-1:0]    pci_exp_txp;
   //no use signal
   output [C_NO_OF_LANES-1:0]    pci_exp_txn;
   input  [C_NO_OF_LANES-1:0]    pci_exp_rxn;
   input                         axi_ctl_aclk;
   input                         MSI_Vector_Num;
   output                        axi_ctl_aclk_out;
   output                        mmcm_lock;
   output                        interrupt_out;
   output                        INTX_MSI_Grant;
   output                        MSI_enable;
   output                        MSI_Vector_Width;
   input  [31:0]                 s_axi_ctl_awaddr ;
   input                         s_axi_ctl_awvalid;
   output                        s_axi_ctl_awready;
   input  [31:0]                 s_axi_ctl_wdata  ;
   input  [3:0]                  s_axi_ctl_wstrb  ;
   input                         s_axi_ctl_wvalid ;
   output                        s_axi_ctl_wready ;
   output [1:0]                  s_axi_ctl_bresp  ;
   output                        s_axi_ctl_bvalid ;
   input                         s_axi_ctl_bready ;
   input  [31:0]                 s_axi_ctl_araddr ;
   input                         s_axi_ctl_arvalid;
   output                        s_axi_ctl_arready;
   output [31:0]                 s_axi_ctl_rdata  ;
   output [1:0]                  s_axi_ctl_rresp  ;
   output                        s_axi_ctl_rvalid ;
   input                         s_axi_ctl_rready ;
/****************axi_mm_master (dma as master read data and dsc) *******************/
   input  [AXI_ID_WIDTH-1:0]     s_axi_awid; 
   input  [AXI_ADDR_WIDTH-1:0]   s_axi_awaddr;           
   input  [3:0]                  s_axi_awregion;          
   input  [7:0]                  s_axi_awlen;             
   input  [2:0]                  s_axi_awsize;           
   input  [1:0]                  s_axi_awburst;        
   input                         s_axi_awvalid;
   output                        s_axi_awready;

   input  [AXI_DATA_WIDTH-1:0]   s_axi_wdata;            
   input  [BE_WIDTH-1:0]         s_axi_wstrb;             
   input                         s_axi_wlast;             
   input                         s_axi_wvalid;            
   output                        s_axi_wready;            

   input                         s_axi_bready;  
   output  [AXI_ID_WIDTH-1:0]    s_axi_bid;              
   output  [1:0]                 s_axi_bresp;        
   output                        s_axi_bvalid;            
     
   input  [AXI_ID_WIDTH-1:0]     s_axi_arid; 
   input  [AXI_ADDR_WIDTH-1:0]   s_axi_araddr;           
   input  [3:0]                  s_axi_arregion;          
   input  [7:0]                  s_axi_arlen;             
   input  [2:0]                  s_axi_arsize;           
   input  [1:0]                  s_axi_arburst;        
   input                         s_axi_arvalid;
   output                        s_axi_arready;

   input                         s_axi_rready;  
   output   [AXI_DATA_WIDTH-1:0] s_axi_rdata;            
   output   [AXI_ID_WIDTH-1:0]   s_axi_rid;   
   output   [1:0]                s_axi_rresp;             
   output                        s_axi_rlast;             
   output                        s_axi_rvalid; 
/**************axi_mm_slave (host as master read and write reg) ****************/           
   input                         m_axi_awready;
   output  [AXI_ADDR_WIDTH-1:0]  m_axi_awaddr;           
   output  [3:0]                 m_axi_awregion;          
   output  [7:0]                 m_axi_awlen;             
   output  [2:0]                 m_axi_awsize;           
   output  [1:0]                 m_axi_awburst;        
   output                        m_axi_awvalid;
   output  [3:0]                 m_axi_awcache;
   output                        m_axi_awlock;

   output  [2:0]                 m_axi_awprot;            
   output                        m_axi_arlock;       
   output  [3:0]                 m_axi_arcache;      

   input                         m_axi_wready;            
   output  [AXI_DATA_WIDTH-1:0]  m_axi_wdata;  
   output  [BE_WIDTH-1:0]        m_axi_wstrb;             
   output                        m_axi_wlast;             
   output                        m_axi_wvalid;            
               
   input  [1:0]                  m_axi_bresp;        
   input                         m_axi_bvalid;            
   output                        m_axi_bready;  
  
   input                         m_axi_arready;
   output  [AXI_ID_WIDTH-1:0]    m_axi_arid; 
   output  [AXI_ADDR_WIDTH-1:0]  m_axi_araddr;           
   output  [3:0]                 m_axi_arregion;          
   output  [7:0]                 m_axi_arlen;             
   output  [2:0]                 m_axi_arsize;           
   output  [1:0]                 m_axi_arburst;        
   output                        m_axi_arvalid;
   output  [2:0]                 m_axi_arprot;

   input  [AXI_DATA_WIDTH-1:0]   m_axi_rdata; 
   input  [AXI_ID_WIDTH-1:0]     m_axi_rid;   
   input  [1:0]                  m_axi_rresp;             
   input                         m_axi_rlast;             
   input                         m_axi_rvalid;            
   output                        m_axi_rready;
/********************************pcie_debug*************************************/
   input                         m_axi_awvalid_user;
   input   [31:0]                m_axi_awaddr_user;
   output                        m_axi_awready_user; 
                                                                             
   input   [31:0]                m_axi_wdata_user; 
   input                         m_axi_wvalid_user;  
   output                        m_axi_wready_user; 
      
   input                         m_axi_bready_user;                                              
   output  [1:0]                 m_axi_bresp_user;
   output                        m_axi_bvalid_user; 

   input                         m_axi_arvalid_user;
   input   [31:0]                m_axi_araddr_user;
   output                        m_axi_arready_user; 
                                                
   input                         m_axi_rready_user;
   output  [31:0]                m_axi_rdata_user;
   output  [1:0]                 m_axi_rresp_user;
   output                        m_axi_rvalid_user;
/********************************pcie_sim*************************************/
   output                        core_clk_out;
   output 		         app_rst;  
   input  [ 39: 0] 	         test_in;
   output [  8: 0] 	         test_out_icm;
   input 		         phystatus_ext;
   output [  1: 0] 	         powerdown_ext;
   output 		         rate_ext;
   input 		         pclk_in;
   output 		         clk250_out;
   output 		         clk500_out;
   input  [7: 0] 	         rxdata0_ext;
   input 		         rxdatak0_ext;
   input 		         rxelecidle0_ext;
   output 		         rxpolarity0_ext;
   input  [ 2: 0] 	         rxstatus0_ext;
   input 		         rxvalid0_ext;
   output 		         txcompl0_ext;
   output [7: 0] 	         txdata0_ext;
   output 		         txdatak0_ext;
   output 		         txelecidle0_ext;
   input  [7: 0] 	         rxdata1_ext;
   input 		         rxdatak1_ext;
   input 		         rxelecidle1_ext;
   output 		         rxpolarity1_ext;
   input  [2: 0] 	         rxstatus1_ext;
   input 		         rxvalid1_ext;
   output 		         txcompl1_ext;
   output [7: 0] 	         txdata1_ext;
   output 		         txdatak1_ext;
   output 		         txelecidle1_ext;
   input  [7: 0] 	         rxdata2_ext;
   input 		         rxdatak2_ext;
   input 		         rxelecidle2_ext;
   output 		         rxpolarity2_ext;
   input  [ 2: 0] 	         rxstatus2_ext;
   input 		         rxvalid2_ext;
   output 		         txcompl2_ext;
   output [7: 0] 	         txdata2_ext;
   output 		         txdatak2_ext;
   output 		         txelecidle2_ext;
   input  [7: 0] 	         rxdata3_ext;
   input 		         rxdatak3_ext;
   input 		         rxelecidle3_ext;
   output 		         rxpolarity3_ext;
   input  [ 2: 0] 	         rxstatus3_ext;
   input 		         rxvalid3_ext;
   output 		         txcompl3_ext;
   output [7: 0] 	         txdata3_ext;
   output 		         txdatak3_ext;
   output 		         txelecidle3_ext;
   input  [7: 0] 	         rxdata4_ext;
   input 		         rxdatak4_ext;
   input 		         rxelecidle4_ext;
   output 		         rxpolarity4_ext;
   input  [ 2: 0] 	         rxstatus4_ext;
   input 		         rxvalid4_ext;
   output 		         txcompl4_ext;
   output [7: 0] 	         txdata4_ext;
   output 		         txdatak4_ext;
   output 		         txelecidle4_ext;
   input  [7: 0] 	         rxdata5_ext;
   input 		         rxdatak5_ext;
   input 		         rxelecidle5_ext;
   output 		         rxpolarity5_ext;
   input  [ 2: 0] 	         rxstatus5_ext;
   input 		         rxvalid5_ext;
   output 		         txcompl5_ext;
   output [7: 0] 	         txdata5_ext;
   output 		         txdatak5_ext;
   output 		         txelecidle5_ext;
   input  [7: 0] 	         rxdata6_ext;
   input 		         rxdatak6_ext;
   input 		         rxelecidle6_ext;
   output 		         rxpolarity6_ext;
   input  [ 2: 0] 	         rxstatus6_ext;
   input 		         rxvalid6_ext;
   output 		         txcompl6_ext;
   output [7: 0] 	         txdata6_ext;
   output 		         txdatak6_ext;
   output 		         txelecidle6_ext;
   input  [7: 0] 	         rxdata7_ext;
   input 		         rxdatak7_ext;
   input 		         rxelecidle7_ext;
   output 		         rxpolarity7_ext;
   input  [ 2: 0] 	         rxstatus7_ext;
   input 		         rxvalid7_ext;
   output 		         txcompl7_ext;
   output [7: 0] 	         txdata7_ext;
   output 		         txdatak7_ext;
   output 		         txelecidle7_ext;
   output 		         txdetectrx_ext;
 /**************************************************************************/
   wire 		         cfg_interrupt_rdy_n;
   wire 		         cfg_interrupt_n;
   wire 		         cfg_interrupt_assert_n;
   wire [7:0] 		         cfg_interrupt_di;
   wire [12:0] 		         completerid;
   wire 		         app_int_ack;
   wire 		         app_int_sts;
   wire 		         app_msi_ack;
   wire [4:0] 		         app_msi_num;
   wire 		         app_msi_req;
   wire [2:0] 		         app_msi_tc;
   wire [4:0] 		         pex_msi_num;
   wire [7:0] 		         rx_st_bardec0;
   wire [7:0] 		         rx_st_be0;
   wire [63:0] 		         rx_st_data0;
   wire 		         rx_st_eop0;
   wire 		         rx_st_sop0;
   wire 		         rx_st_ready0;
   wire 		         rx_st_valid0;
   wire [63:0] 		         tx_st_data0;
   wire 		         tx_st_eop0;
   wire 		         tx_st_sop0;
   wire 		         tx_st_ready0;
   wire 		         tx_st_valid0;
   wire 		         pipe_mode;
   wire 		         core_clk_out;
   wire [3:0] 		         lane_act;
   wire [39:0] 		         test;
   wire 		         sys_clk;
   wire 		         trn_clk;
   wire 		         trn_rst;
   wire [2:0] 		         maxpayloadsize;
   wire [2:0] 		         maxreadrequestsize;
   wire [6: 0] 		         cpl_err;
   wire 		         cpl_pending;
   wire 		         dma_0_interrupt;
   wire 		         dma_1_interrupt;
   wire [15:0]                   cfg_devcsr;
 /**************************************************************************/
   wire  [AXI_DATA_WIDTH-1:0]    axis_rc_tdata;
   wire  [BE_WIDTH-1:0]          axis_rc_tstrb;
   wire                          axis_rc_tlast;
   wire                          axis_rc_tvalid;
   wire                          axis_rc_tready;

   wire  [AXI_DATA_WIDTH-1:0]    axis_cw_tdata;
   wire  [BE_WIDTH-1:0]          axis_cw_tstrb;
   wire                          axis_cw_tlast;
   wire                          axis_cw_tvalid;
   wire  [USER_WIDTH_RX-1:0]     axis_cw_tuser;
   wire                          axis_cw_tready;

   wire  [AXI_DATA_WIDTH-1:0]    axis_cr_tdata;
   wire  [BE_WIDTH-1:0]          axis_cr_tstrb;
   wire                          axis_cr_tlast;
   wire                          axis_cr_tvalid;
   wire  [USER_WIDTH_RX-1:0]     axis_cr_tuser;
   wire                          axis_cr_tready;

   wire  [AXI_DATA_WIDTH-1:0]    axis_cc_tdata;
   wire  [BE_WIDTH-1:0]          axis_cc_tstrb;  
   wire                          axis_cc_tlast;        
   wire                          axis_cc_tvalid;       
   wire  [USER_WIDTH_RX-1:0]     axis_cc_tuser;
   wire                          axis_cc_tready; 

   wire  [AXI_DATA_WIDTH-1:0]    axis_rw_tdata;
   wire  [BE_WIDTH-1:0]          axis_rw_tstrb;
   wire                          axis_rw_tlast;
   wire                          axis_rw_tvalid;
   wire                          axis_rw_tready;

   wire  [AXI_ID_WIDTH-1:0]      axis_rr_tid;
   wire  [AXI_DATA_WIDTH-1:0]    axis_rr_tdata;
   wire  [BE_WIDTH-1:0]          axis_rr_tstrb;
   wire                          axis_rr_tlast;
   wire                          axis_rr_tvalid;
   wire                          axis_rr_tready;

   wire [AXI_DATA_WIDTH-1:0]     s_axi_wdata_conv;
   wire [BE_WIDTH-1:0]           s_axi_wstrb_conv;

   wire [AXI_DATA_WIDTH-1:0]     s_axi_rdata_conv;

   wire [AXI_DATA_WIDTH-1:0]     m_axi_wdata_conv;
   wire [BE_WIDTH-1:0]           m_axi_wstrb_conv;

   wire [AXI_DATA_WIDTH-1:0]     m_axi_rdata_conv;


   wire                          reconfig_clk;
   wire                          fixedclk_serdes;
   wire                          reconfig_clk_locked;
   wire                          sft_rst;

 pll 
   reconfig_pll
     (
      .c0 	(reconfig_clk),    // 50MHz
      .c1 	(fixedclk_serdes), // 125MHz
      .c2       (sys_clk),         
      .inclk0 	(free_100MHz),
      .locked 	(reconfig_clk_locked)
      );

   int_del #
     (
      .C_INT_NUM		(C_INT_NUM),
      .MSI_EN			(MSI_EN))
    int_del
     (
      .clk 			(trn_clk),
      .rst 			(trn_rst),
      // Outputs
      .cfg_interrupt_n		(cfg_interrupt_n),
      .cfg_interrupt_assert_n	(cfg_interrupt_assert_n),
      .cfg_interrupt_di		(cfg_interrupt_di[7:0]),
      // Inputs
      .msi_request		(INTX_MSI_Request),
      .cfg_interrupt_rdy_n	(cfg_interrupt_rdy_n));


generate if  (C_NO_OF_LANES == 8)
    begin
  pcie_top #
     (
       .PCIE_VENDOR_ID         (C_VENDOR_ID), 
       .PCIE_DEVICE_ID         (C_DEVICE_ID),
       .PCIE_VEVISION_ID       (C_REV_ID)
    )pcie_top
     (
      .pcie_rstn	(pcie_rstn),
      .refclk		(REFCLK),
      .app_rst		(app_rst),
      .core_clk_out 	(core_clk_out),
      .rx_in0 		(pci_exp_rxp[0]),
      .rx_in1 		(pci_exp_rxp[1]),
      .rx_in2 		(pci_exp_rxp[2]),
      .rx_in3 		(pci_exp_rxp[3]),
      .rx_in4           (pci_exp_rxp[4]),
      .rx_in5           (pci_exp_rxp[5]),
      .rx_in6           (pci_exp_rxp[6]),
      .rx_in7           (pci_exp_rxp[7]),

      .tx_out0 		(pci_exp_txp[0]),
      .tx_out1 		(pci_exp_txp[1]),
      .tx_out2 		(pci_exp_txp[2]),
      .tx_out3 		(pci_exp_txp[3]),
      .tx_out4          (pci_exp_txp[4]),
      .tx_out5          (pci_exp_txp[5]),
      .tx_out6          (pci_exp_txp[6]),
      .tx_out7          (pci_exp_txp[7]),      
      .app_int_ack 	(app_int_ack),
      .app_int_sts 	(app_int_sts),
      .app_msi_ack 	(app_msi_ack),
      .app_msi_num 	(app_msi_num),
      .app_msi_req 	(app_msi_req),
      .app_msi_tc 	(app_msi_tc),
      .pex_msi_num 	(pex_msi_num),
      .rx_fifo_empty0 	(),
      .rx_fifo_full0 	(),
      .rx_st_err0 	(),
      .rx_st_bardec0 	(rx_st_bardec0),
      .rx_st_data0 	(rx_st_data0),
      .rx_st_be0	(rx_st_be0),
      .rx_st_sop0 	(rx_st_sop0),
      .rx_st_eop0 	(rx_st_eop0),
      .rx_st_ready0 	(rx_st_ready0),
      .rx_st_valid0 	(rx_st_valid0),
      .tx_cred0 	(),
      .tx_fifo_empty0	(),
      .tx_fifo_full0 	(),
      .tx_fifo_rdptr0 	(),
      .tx_fifo_wrptr0 	(),
      .tx_st_data0 	(tx_st_data0),
      .tx_st_sop0 	(tx_st_sop0),
      .tx_st_eop0 	(tx_st_eop0),
      .tx_st_ready0 	(tx_st_ready0),
      .tx_st_valid0 	(tx_st_valid0),
      .linkdown 	(linkdown),      
      .maxpayloadsize 	(maxpayloadsize),
      .maxreadrequestsize (maxreadrequestsize),
      .completerid 	(completerid),
      .gen2_led 	(),
      .cpl_err_in 	(cpl_err),
      .cpl_pending 	(cpl_pending),
      .reconfig_clk_locked 	(reconfig_clk_locked),
      .reconfig_clk 		(reconfig_clk),
      .fixedclk_serdes 		(fixedclk_serdes),
      .test_in		(test),
      .test_out 	(test_out_icm),	  
      .lane_act 	(lane_act),
      .pipe_mode 	(pipe_mode),      
      .powerdown_ext	(powerdown_ext),
      .phystatus_ext 	(phystatus_ext),      
      .rate_ext 	(rate_ext),
      .pclk_in 		(pclk_in),
      .clk250_out 	(clk250_out),
      .clk500_out 	(clk500_out),
      .rxdata0_ext 	(rxdata0_ext),
      .rxdatak0_ext 	(rxdatak0_ext),
      .rxelecidle0_ext 	(rxelecidle0_ext),
      .rxpolarity0_ext 	(rxpolarity0_ext),
      .rxstatus0_ext 	(rxstatus0_ext),
      .rxvalid0_ext 	(rxvalid0_ext),
      .txcompl0_ext 	(txcompl0_ext),
      .txdata0_ext 	(txdata0_ext),
      .txdatak0_ext 	(txdatak0_ext),
      .txelecidle0_ext 	(txelecidle0_ext),
      .rxdata1_ext 	(rxdata1_ext),
      .rxdatak1_ext 	(rxdatak1_ext),
      .rxelecidle1_ext 	(rxelecidle1_ext),
      .rxpolarity1_ext 	(rxpolarity1_ext),
      .rxstatus1_ext 	(rxstatus1_ext),
      .rxvalid1_ext 	(rxvalid1_ext),
      .txcompl1_ext 	(txcompl1_ext),
      .txdata1_ext 	(txdata1_ext),
      .txdatak1_ext 	(txdatak1_ext),
      .txelecidle1_ext 	(txelecidle1_ext),
      .rxdata2_ext 	(rxdata2_ext),
      .rxdatak2_ext 	(rxdatak2_ext),
      .rxelecidle2_ext 	(rxelecidle2_ext),
      .rxpolarity2_ext 	(rxpolarity2_ext),
      .rxstatus2_ext 	(rxstatus2_ext),
      .rxvalid2_ext 	(rxvalid2_ext),
      .txcompl2_ext 	(txcompl2_ext),
      .txdata2_ext 	(txdata2_ext),
      .txdatak2_ext 	(txdatak2_ext),
      .txelecidle2_ext 	(txelecidle2_ext),
      .rxdata3_ext 	(rxdata3_ext),
      .rxdatak3_ext 	(rxdatak3_ext),
      .rxelecidle3_ext 	(rxelecidle3_ext),
      .rxpolarity3_ext 	(rxpolarity3_ext),
      .rxstatus3_ext 	(rxstatus3_ext),
      .rxvalid3_ext 	(rxvalid3_ext),
      .txcompl3_ext 	(txcompl3_ext),
      .txdata3_ext 	(txdata3_ext),
      .txdatak3_ext 	(txdatak3_ext),
      .txelecidle3_ext 	(txelecidle3_ext),
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
      .txdetectrx_ext 	(txdetectrx_ext),
      .cfg_devcsr     (cfg_devcsr)
      );
  end
endgenerate

generate if  (C_NO_OF_LANES == 4)
    begin
   pcie_top #
     (
       .PCIE_VENDOR_ID         (C_VENDOR_ID), 
       .PCIE_DEVICE_ID         (C_DEVICE_ID),
       .PCIE_VEVISION_ID       (C_REV_ID)
    )pcie_top
     (
      .pcie_rstn	(pcie_rstn),
      .refclk		(REFCLK),
      .app_rst		(app_rst),
      .core_clk_out 	(core_clk_out),
      .rx_in0 		(pci_exp_rxp[0]),
      .rx_in1 		(pci_exp_rxp[1]),
      .rx_in2 		(pci_exp_rxp[2]),
      .rx_in3 		(pci_exp_rxp[3]),
      .tx_out0 		(pci_exp_txp[0]),
      .tx_out1 		(pci_exp_txp[1]),
      .tx_out2 		(pci_exp_txp[2]),
      .tx_out3 		(pci_exp_txp[3]),
      .app_int_ack 	(app_int_ack),
      .app_int_sts 	(app_int_sts),
      .app_msi_ack 	(app_msi_ack),
      .app_msi_num 	(app_msi_num),
      .app_msi_req 	(app_msi_req),
      .app_msi_tc 	(app_msi_tc),
      .pex_msi_num 	(pex_msi_num),
      .rx_fifo_empty0 	(),
      .rx_fifo_full0 	(),
      .rx_st_err0 	(),
      .rx_st_bardec0 	(rx_st_bardec0),
      .rx_st_data0 	(rx_st_data0),
      .rx_st_be0	(rx_st_be0),
      .rx_st_sop0 	(rx_st_sop0),
      .rx_st_eop0 	(rx_st_eop0),
      .rx_st_ready0 	(rx_st_ready0),
      .rx_st_valid0 	(rx_st_valid0),
      .tx_cred0 	(),
      .tx_fifo_empty0	(),
      .tx_fifo_full0 	(),
      .tx_fifo_rdptr0 	(),
      .tx_fifo_wrptr0 	(),
      .tx_st_data0 	(tx_st_data0),
      .tx_st_sop0 	(tx_st_sop0),
      .tx_st_eop0 	(tx_st_eop0),
      .tx_st_ready0 	(tx_st_ready0),
      .tx_st_valid0 	(tx_st_valid0),
      .linkdown 	(linkdown),      
      .maxpayloadsize 	(maxpayloadsize),
      .maxreadrequestsize (maxreadrequestsize),
      .completerid 	(completerid),
      .gen2_led 	(),
      .cpl_err_in 	(cpl_err),
      .cpl_pending 	(cpl_pending),
      .reconfig_clk_locked 	(reconfig_clk_locked),
      .reconfig_clk 		(reconfig_clk),
      .fixedclk_serdes 		(fixedclk_serdes),
      .test_in		(test),
      .test_out 	(test_out_icm),	  
      .lane_act 	(lane_act),
      .pipe_mode 	(pipe_mode),      
      .powerdown_ext	(powerdown_ext),
      .phystatus_ext 	(phystatus_ext),      
      .rate_ext 	(rate_ext),
      .pclk_in 		(pclk_in),
      .clk250_out 	(clk250_out),
      .clk500_out 	(clk500_out),
      .rxdata0_ext 	(rxdata0_ext),
      .rxdatak0_ext 	(rxdatak0_ext),
      .rxelecidle0_ext 	(rxelecidle0_ext),
      .rxpolarity0_ext 	(rxpolarity0_ext),
      .rxstatus0_ext 	(rxstatus0_ext),
      .rxvalid0_ext 	(rxvalid0_ext),
      .txcompl0_ext 	(txcompl0_ext),
      .txdata0_ext 	(txdata0_ext),
      .txdatak0_ext 	(txdatak0_ext),
      .txelecidle0_ext 	(txelecidle0_ext),
      .rxdata1_ext 	(rxdata1_ext),
      .rxdatak1_ext 	(rxdatak1_ext),
      .rxelecidle1_ext 	(rxelecidle1_ext),
      .rxpolarity1_ext 	(rxpolarity1_ext),
      .rxstatus1_ext 	(rxstatus1_ext),
      .rxvalid1_ext 	(rxvalid1_ext),
      .txcompl1_ext 	(txcompl1_ext),
      .txdata1_ext 	(txdata1_ext),
      .txdatak1_ext 	(txdatak1_ext),
      .txelecidle1_ext 	(txelecidle1_ext),
      .rxdata2_ext 	(rxdata2_ext),
      .rxdatak2_ext 	(rxdatak2_ext),
      .rxelecidle2_ext 	(rxelecidle2_ext),
      .rxpolarity2_ext 	(rxpolarity2_ext),
      .rxstatus2_ext 	(rxstatus2_ext),
      .rxvalid2_ext 	(rxvalid2_ext),
      .txcompl2_ext 	(txcompl2_ext),
      .txdata2_ext 	(txdata2_ext),
      .txdatak2_ext 	(txdatak2_ext),
      .txelecidle2_ext 	(txelecidle2_ext),
      .rxdata3_ext 	(rxdata3_ext),
      .rxdatak3_ext 	(rxdatak3_ext),
      .rxelecidle3_ext 	(rxelecidle3_ext),
      .rxpolarity3_ext 	(rxpolarity3_ext),
      .rxstatus3_ext 	(rxstatus3_ext),
      .rxvalid3_ext 	(rxvalid3_ext),
      .txcompl3_ext 	(txcompl3_ext),
      .txdata3_ext 	(txdata3_ext),
      .txdatak3_ext 	(txdatak3_ext),
      .txelecidle3_ext 	(txelecidle3_ext),
      .txdetectrx_ext 	(txdetectrx_ext),
      .cfg_devcsr       (cfg_devcsr)
      );

  end
endgenerate

 Avalon2Axi #(        
      .AXI_DATA_WIDTH        (AXI_DATA_WIDTH),
      .USER_WIDTH_TX         (USER_WIDTH_TX),
      .USER_WIDTH_RX         (USER_WIDTH_RX))
   Avalon2Axi(
      .trn_clk(trn_clk),
      .trn_rst(trn_rst),
      .axi_clk(axi_aclk),
      .axi_rst(!axi_aresetn),
       //input from pcie core
      .rx_st_bardec0            (rx_st_bardec0), 
      .rx_st_data0              (rx_st_data0),   
      .rx_st_be0                (rx_st_be0),    
      .rx_st_sop0               (rx_st_sop0),
      .rx_st_eop0               (rx_st_eop0), 
      .rx_st_ready0             (rx_st_ready0),
      .rx_st_valid0             (rx_st_valid0),
        //output to tlp
      .m_axis_rc_tready	        (axis_rc_tready),//input
      .m_axis_rc_tdata		(axis_rc_tdata[AXI_DATA_WIDTH-1:0]),
      .m_axis_rc_tstrb		(axis_rc_tstrb[BE_WIDTH-1:0]),
      .m_axis_rc_tlast		(axis_rc_tlast),
      .m_axis_rc_tvalid	        (axis_rc_tvalid),

      .m_axis_cw_tready	        (axis_cw_tready),//input 
      .m_axis_cw_tdata		(axis_cw_tdata[AXI_DATA_WIDTH-1:0]),
      .m_axis_cw_tstrb		(axis_cw_tstrb[BE_WIDTH-1:0]),
      .m_axis_cw_tlast		(axis_cw_tlast),
      .m_axis_cw_tvalid	        (axis_cw_tvalid),
      .m_axis_cw_tuser		(axis_cw_tuser),

      .m_axis_cr_tready	        (axis_cr_tready), //input
      .m_axis_cr_tdata		(axis_cr_tdata[AXI_DATA_WIDTH-1:0]),
      .m_axis_cr_tstrb		(axis_cr_tstrb[BE_WIDTH-1:0]),
      .m_axis_cr_tlast		(axis_cr_tlast),
      .m_axis_cr_tvalid	        (axis_cr_tvalid),
      .m_axis_cr_tuser		(axis_cr_tuser),           
       /////////////////////////////////////////////////////
       //input from tlp
      .s_axis_rw_tready		(axis_rw_tready),//output
      .s_axis_rw_tdata		(axis_rw_tdata[AXI_DATA_WIDTH-1:0]),
      .s_axis_rw_tstrb		(axis_rw_tstrb[BE_WIDTH-1:0]),
      .s_axis_rw_tlast		(axis_rw_tlast),
      .s_axis_rw_tvalid		(axis_rw_tvalid),
      .s_axis_rw_tuser		(4'h0),

      .s_axis_rr_tready		(axis_rr_tready),//output
      .s_axis_rr_tdata		(axis_rr_tdata[AXI_DATA_WIDTH-1:0]),
      .s_axis_rr_tstrb		(axis_rr_tstrb[BE_WIDTH-1:0]),
      .s_axis_rr_tlast		(axis_rr_tlast),
      .s_axis_rr_tvalid		(axis_rr_tvalid),
      .s_axis_rr_tuser		(4'h0),

      .s_axis_cc_tready		(axis_cc_tready),//output
      .s_axis_cc_tdata		(axis_cc_tdata[AXI_DATA_WIDTH-1:0]),
      .s_axis_cc_tstrb		(axis_cc_tstrb[BE_WIDTH-1:0]),
      .s_axis_cc_tlast		(axis_cc_tlast),
      .s_axis_cc_tvalid		(axis_cc_tvalid),
      .s_axis_cc_tuser		(axis_cc_tuser),
       //output to pcie core
      .tx_st_data0 	        (tx_st_data0),
      .tx_st_sop0 	        (tx_st_sop0),
      .tx_st_eop0               (tx_st_eop0),
      .tx_st_ready0 	        (tx_st_ready0),
      .tx_st_valid0 	        (tx_st_valid0)
  ); 



 axi_pcie_mm_s #
     (
      .C_FAMILY		              (C_FAMILY), 
      .C_S_AXI_ID_WIDTH               (C_S_AXI_ID_WIDTH),
      .C_S_AXI_ADDR_WIDTH             (C_S_AXI_ADDR_WIDTH),  
      .C_S_AXI_DATA_WIDTH             (C_S_AXI_DATA_WIDTH),
      .C_M_AXI_ADDR_WIDTH             (C_M_AXI_ADDR_WIDTH),
      .C_M_AXI_DATA_WIDTH             (C_M_AXI_DATA_WIDTH),
      .C_S_AXIS_USER_WIDTH            (C_S_AXIS_USER_WIDTH),
      .C_S_AXIS_DATA_WIDTH            (C_M_AXI_DATA_WIDTH),
      .C_M_AXIS_DATA_WIDTH            (C_M_AXI_DATA_WIDTH),
      .C_COMP_TIMEOUT                 (C_COMP_TIMEOUT),//0 = 50 uS ,1 = 50 mS 
      .C_INCLUDE_RC                   (C_INCLUDE_RC),//0 = Endpoint ,1 = Root Port 
      .C_S_AXI_SUPPORTS_NARROW_BURST  (C_S_AXI_SUPPORTS_NARROW_BURST),//0=not support,1=support
      .C_INCLUDE_BAROFFSET_REG        (C_INCLUDE_BAROFFSET_REG),//0 = exclude 1 = include 
      .C_AXIREAD_NUM                  (C_AXIREAD_NUM),
      .C_AXIBAR_NUM                   (C_AXIBAR_NUM),//1-6,3=bar0.bar1.bar2
      .C_AXIBAR2PCIEBAR_0             (C_AXIBAR2PCIEBAR_0),
      .C_AXIBAR2PCIEBAR_1             (C_AXIBAR2PCIEBAR_1),
      .C_AXIBAR2PCIEBAR_2             (C_AXIBAR2PCIEBAR_2),
      .C_AXIBAR2PCIEBAR_3             (C_AXIBAR2PCIEBAR_3),
      .C_AXIBAR2PCIEBAR_4             (C_AXIBAR2PCIEBAR_4),
      .C_AXIBAR2PCIEBAR_5             (C_AXIBAR2PCIEBAR_5),
      .C_AXIBAR_AS_0                  (C_AXIBAR_AS_0),//0 = 32 bit ;1 = 64 bit 
      .C_AXIBAR_AS_1                  (C_AXIBAR_AS_1),
      .C_AXIBAR_AS_2                  (C_AXIBAR_AS_2),
      .C_AXIBAR_AS_3                  (C_AXIBAR_AS_3),
      .C_AXIBAR_AS_4                  (C_AXIBAR_AS_4),
      .C_AXIBAR_AS_5                  (C_AXIBAR_AS_5),
      .C_AXIBAR_0                     (C_AXIBAR_0),
      .C_AXIBAR_HIGHADDR_0            (C_AXIBAR_HIGHADDR_0),
      .C_AXIBAR_1                     (C_AXIBAR_1),
      .C_AXIBAR_HIGHADDR_1            (C_AXIBAR_HIGHADDR_1),
      .C_AXIBAR_2                     (C_AXIBAR_2),
      .C_AXIBAR_HIGHADDR_2            (C_AXIBAR_HIGHADDR_2),
      .C_AXIBAR_3                     (C_AXIBAR_3),
      .C_AXIBAR_HIGHADDR_3            (C_AXIBAR_HIGHADDR_3),
      .C_AXIBAR_4                     (C_AXIBAR_4),
      .C_AXIBAR_HIGHADDR_4            (C_AXIBAR_HIGHADDR_4),
      .C_AXIBAR_5                     (C_AXIBAR_5),
      .C_AXIBAR_HIGHADDR_5            (C_AXIBAR_HIGHADDR_5),
      .C_PCIEBAR_NUM                  (C_PCIEBAR_NUM),//bar0.bar1.bar2
      .C_PCIEBAR_AS                   (C_PCIEBAR_AS),//0=32bit,1=64bit
      .C_PCIEBAR_LEN_0                (C_PCIEBAR_LEN_0),
      .C_PCIEBAR2AXIBAR_0             (C_PCIEBAR2AXIBAR_0),
      .C_PCIEBAR_LEN_1                (C_PCIEBAR_LEN_1),
      .C_PCIEBAR2AXIBAR_1             (C_PCIEBAR2AXIBAR_1),
      .C_PCIEBAR_LEN_2                (C_PCIEBAR_LEN_2),
      .C_PCIEBAR2AXIBAR_2             (C_PCIEBAR2AXIBAR_2))
     axi_pcie_mm_s   
     (
         .axi_aclk               (axi_aclk),
         .reset                  (axi_aresetn),  
          //INC->TLP (dma as master)            
         .s_axi_awid             (s_axi_awid), 
         .s_axi_awaddr           (s_axi_awaddr),  
         .s_axi_awlen            (s_axi_awlen), 
         .s_axi_awsize           (s_axi_awsize), 
         .s_axi_awburst          (s_axi_awburst), 
         .s_axi_awvalid          (s_axi_awvalid), 
         .s_axi_awready          (s_axi_awready),
         .s_axi_awregion         (s_axi_awregion),

         .s_axi_wdata            (s_axi_wdata_conv), 
         .s_axi_wstrb            (s_axi_wstrb_conv), 
         .s_axi_wlast            (s_axi_wlast), 
         .s_axi_wvalid           (s_axi_wvalid), 
         .s_axi_wready           (s_axi_wready),

         .s_axi_bid              (s_axi_bid), 
         .s_axi_bresp            (s_axi_bresp),  
         .s_axi_bvalid           (s_axi_bvalid),  
         .s_axi_bready           (s_axi_bready),  

         .s_axi_arid             (s_axi_arid),
         .s_axi_araddr           (s_axi_araddr), 
         .s_axi_arregion         (4'h0),  
         .s_axi_arlen            (s_axi_arlen),  
         .s_axi_arsize           (s_axi_arsize),  
         .s_axi_arburst          (s_axi_arburst),  
         .s_axi_arvalid          (s_axi_arvalid),  
         .s_axi_arready          (s_axi_arready), 

         .s_axi_rid              (s_axi_rid),   
         .s_axi_rdata            (s_axi_rdata_conv),   
         .s_axi_rresp            (s_axi_rresp),    
         .s_axi_rlast            (s_axi_rlast),    
         .s_axi_rvalid           (s_axi_rvalid),    
         .s_axi_rready           (s_axi_rready),  
          //TLP->INC (host as master)   
         .m_axi_awaddr           (m_axi_awaddr),  
         .m_axi_awlen            (m_axi_awlen),  
         .m_axi_awsize           (m_axi_awsize),  
         .m_axi_awburst          (m_axi_awburst),   
         .m_axi_awvalid          (m_axi_awvalid),  
         .m_axi_awready          (m_axi_awready),  
         .m_axi_awlock           (m_axi_awlock),  
         .m_axi_awcache          (m_axi_awcache),  
         .m_axi_awprot           (m_axi_awprot), 

         .m_axi_wdata            (m_axi_wdata_conv),  
         .m_axi_wstrb            (m_axi_wstrb_conv),  
         .m_axi_wlast            (m_axi_wlast),  
         .m_axi_wvalid           (m_axi_wvalid),  
         .m_axi_wready           (m_axi_wready),  

         .m_axi_bresp            (m_axi_bresp),  
         .m_axi_bvalid           (m_axi_bvalid), 
         .m_axi_bready           (m_axi_bready),  

         .m_axi_araddr           (m_axi_araddr),  
         .m_axi_arlen            (m_axi_arlen),  
         .m_axi_arsize           (m_axi_arsize),  
         .m_axi_arburst          (m_axi_arburst),  
         .m_axi_arprot           (m_axi_arprot),  
         .m_axi_arvalid          (m_axi_arvalid),  
         .m_axi_arready          (m_axi_arready),  
         .m_axi_arlock           (m_axi_arlock),  
         .m_axi_arcache          (m_axi_arcache ),  
 
         .m_axi_rdata            (m_axi_rdata_conv),  
         .m_axi_rresp            (m_axi_rresp),  
         .m_axi_rlast            (m_axi_rlast),  
         .m_axi_rvalid           (m_axi_rvalid),  
         .m_axi_rready           (m_axi_rready),  

         .s_axis_rc_tdata        (axis_rc_tdata),  
         .s_axis_rc_tstrb        (axis_rc_tstrb),  
         .s_axis_rc_tlast        (axis_rc_tlast),  
         .s_axis_rc_tvalid       (axis_rc_tvalid),  
         .s_axis_rc_tready       (axis_rc_tready),  

         .s_axis_cw_tdata        (axis_cw_tdata), 
         .s_axis_cw_tstrb        (axis_cw_tstrb), 
         .s_axis_cw_tlast        (axis_cw_tlast), 
         .s_axis_cw_tvalid       (axis_cw_tvalid), 
         .s_axis_cw_tready       (axis_cw_tready), 
         .s_axis_cw_tuser        (axis_cw_tuser ),      

         .s_axis_cr_tdata        (axis_cr_tdata),  
         .s_axis_cr_tstrb        (axis_cr_tstrb),  
         .s_axis_cr_tlast        (axis_cr_tlast),  
         .s_axis_cr_tvalid       (axis_cr_tvalid),  
         .s_axis_cr_tready       (axis_cr_tready),  
         .s_axis_cr_tuser        (axis_cr_tuser),  

         .m_axis_cc_tdata        (axis_cc_tdata), 
         .m_axis_cc_tstrb        (axis_cc_tstrb), 
         .m_axis_cc_tlast        (axis_cc_tlast), 
         .m_axis_cc_tvalid       (axis_cc_tvalid), 
         .m_axis_cc_tready       (axis_cc_tready), 
         .m_axis_cc_tuser        (axis_cc_tuser),

         .m_axis_rw_tdata        (axis_rw_tdata),  
         .m_axis_rw_tstrb        (axis_rw_tstrb),  
         .m_axis_rw_tlast        (axis_rw_tlast),  
         .m_axis_rw_tvalid       (axis_rw_tvalid),  
         .m_axis_rw_tready       (axis_rw_tready),  

         .m_axis_rr_tdata        (axis_rr_tdata), 
         .m_axis_rr_tstrb        (axis_rr_tstrb),  
         .m_axis_rr_tlast        (axis_rr_tlast),  
         .m_axis_rr_tvalid       (axis_rr_tvalid),  
         .m_axis_rr_tready       (axis_rr_tready), 
         .m_axis_rr_tid          (),  

         .blk_lnk_up             (!linkdown),          
         .blk_bus_number         (completerid[12:5]),  
         .blk_device_number      (completerid[4:0]),   
         .blk_function_number    (3'h0),               
         .blk_dcontrol           (cfg_devcsr[15:0]),   
         .blk_command            (16'h04),             
         .blk_lstatus            (16'h0),               
         .RP_bridge_en           (1'h0),               
         .np_cpl_pending         ()       
       );

generate if  (DEBUG_REG_EN == 1)
  begin
  debug_reg_top
    debug_reg_top(/*AUTOINST*/
	      // Outputs
	      .m_axi_awready_user	(m_axi_awready_user),
	      .m_axi_wready_user	(m_axi_wready_user),
	      .m_axi_bresp_user		(m_axi_bresp_user[1:0]),
	      .m_axi_bvalid_user	(m_axi_bvalid_user),
	      .m_axi_arready_user	(m_axi_arready_user),
	      .m_axi_rdata_user		(m_axi_rdata_user[31:0]),
	      .m_axi_rresp_user		(m_axi_rresp_user[1:0]),
	      .m_axi_rvalid_user	(m_axi_rvalid_user),
              .sft_rst                  (sft_rst),
	      // Inputs
	      .axi_clk			(axi_aclk),
              .app_rst                  (app_rst),
	      .axi_rst			(!axi_aresetn),
	      .s_axi_rresp		(s_axi_rresp[1:0]),
	      .m_axi_awvalid_user	(m_axi_awvalid_user),
	      .m_axi_awaddr_user	(m_axi_awaddr_user[31:0]),
	      .m_axi_wdata_user		(m_axi_wdata_user[31:0]),
	      .m_axi_wvalid_user	(m_axi_wvalid_user),
	      .m_axi_bready_user	(m_axi_bready_user),
	      .m_axi_arvalid_user	(m_axi_arvalid_user),
	      .m_axi_araddr_user	(m_axi_araddr_user[31:0]),
	      .m_axi_rready_user	(m_axi_rready_user));

     end
   endgenerate

generate if  (PCIE_BRAM_DEBUG_EN == 1)
  begin
  debug_bram_top
    debug_bram_top(
	     // Outputs
	     .m_axi_awready_user	(m_axi_awready_user),
	     .m_axi_wready_user		(m_axi_wready_user),
	     .m_axi_bresp_user		(m_axi_bresp_user),
	     .m_axi_bvalid_user		(m_axi_bvalid_user),
	     .m_axi_arready_user	(m_axi_arready_user),
	     .m_axi_rdata_user		(m_axi_rdata_user),
	     .m_axi_rresp_user		(m_axi_rresp_user),
	     .m_axi_rvalid_user		(m_axi_rvalid_user),
	     // Inputs
             .trn_clk                   (trn_clk),
             .trn_rst                   (trn_rst),
             .axi_clk                   (axi_aclk),
             .axi_rst                   (!axi_aresetn),

             .rx_st_data0 	        (rx_st_data0),
             .rx_st_be0	                (rx_st_be0),
             .rx_st_sop0 	        (rx_st_sop0),
             .rx_st_eop0 	        (rx_st_eop0),
             .rx_st_ready0 	        (rx_st_ready0),
             .rx_st_valid0 	        (rx_st_valid0),
             .tx_st_data0 	        (tx_st_data0),
             .tx_st_sop0 	        (tx_st_sop0),
             .tx_st_eop0 	        (tx_st_eop0),
             .tx_st_ready0 	        (tx_st_ready0),
             .tx_st_valid0 	        (tx_st_valid0),

	     .m_axi_awvalid_user	(m_axi_awvalid_user),
	     .m_axi_awaddr_user		(m_axi_awaddr_user),
	     .m_axi_wdata_user		(m_axi_wdata_user),
	     .m_axi_wvalid_user		(m_axi_wvalid_user),
	     .m_axi_bready_user		(m_axi_bready_user),
	     .m_axi_arvalid_user	(m_axi_arvalid_user),
	     .m_axi_araddr_user		(m_axi_araddr_user),
	     .m_axi_rready_user		(m_axi_rready_user));

     end
   endgenerate


   assign test = C_PIPE_MODE ? test_in : C_TEST;
   assign pipe_mode = C_PIPE_MODE;
   assign cpl_err = 7'h0;
   assign cpl_pending = 1'h0;
   assign cfg_interrupt_rdy_n = !app_int_ack;
   assign app_int_sts = !cfg_interrupt_assert_n;

   assign axi_aclk_out = sys_clk;
   assign axi_aresetn_out = !app_rst && !sft_rst;
   assign trn_clk = core_clk_out;
   assign trn_rst = app_rst || sft_rst;
   assign clk_50M_out = reconfig_clk;
   assign pll_locked = reconfig_clk_locked;

   assign s_axi_wstrb_conv = {{s_axi_wstrb[4],s_axi_wstrb[5],s_axi_wstrb[6],s_axi_wstrb[7]},
                              {s_axi_wstrb[0],s_axi_wstrb[1],s_axi_wstrb[2],s_axi_wstrb[3]}};
   assign s_axi_wdata_conv = {{s_axi_wdata[39:32],s_axi_wdata[47:40],s_axi_wdata[55:48],s_axi_wdata[63:56]},
                              {s_axi_wdata[7:0],s_axi_wdata[15:8],s_axi_wdata[23:16],s_axi_wdata[31:24]}};

   assign s_axi_rdata      = {{s_axi_rdata_conv[39:32],s_axi_rdata_conv[47:40],s_axi_rdata_conv[55:48],s_axi_rdata_conv[63:56]},
                              {s_axi_rdata_conv[7:0],s_axi_rdata_conv[15:8],s_axi_rdata_conv[23:16],s_axi_rdata_conv[31:24]}};

   assign m_axi_wstrb      = {{m_axi_wstrb_conv[4],m_axi_wstrb_conv[5],m_axi_wstrb_conv[6],m_axi_wstrb_conv[7]},
                              {m_axi_wstrb_conv[0],m_axi_wstrb_conv[1],m_axi_wstrb_conv[2],m_axi_wstrb_conv[3]}};
   assign m_axi_wdata      = {{m_axi_wdata_conv[39:32],m_axi_wdata_conv[47:40],m_axi_wdata_conv[55:48],m_axi_wdata_conv[63:56]},
                              {m_axi_wdata_conv[7:0],m_axi_wdata_conv[15:8],m_axi_wdata_conv[23:16],m_axi_wdata_conv[31:24]}};


   assign m_axi_rdata_conv = {{m_axi_rdata[39:32],m_axi_rdata[47:40],m_axi_rdata[55:48],m_axi_rdata[63:56]},
                              {m_axi_rdata[7:0],m_axi_rdata[15:8],m_axi_rdata[23:16],m_axi_rdata[31:24]}};
/*************************************************************************/


endmodule

// Local Variables:
// verilog-library-directories:("." "./lis_dma/verilog/" "./tlif_app/verilog/" "./conv/verilog" "./lis_crossbar/verilog" "./util_leds/verilog" "./dcr_mux/verilog" "./axi_dma/verilog")
// verilog-library-files:(".")
// verilog-library-extensions:(".v" ".h")
// End:
