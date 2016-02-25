module debug_bram_top 
  (
   /*AUTOARG*/
   // Outputs
   m_axi_awready_user, m_axi_wready_user, m_axi_bresp_user,
   m_axi_bvalid_user, m_axi_arready_user, m_axi_rdata_user,
   m_axi_rresp_user, m_axi_rvalid_user,
   // Inputs
   axi_clk, axi_rst, trn_clk, trn_rst, rx_st_valid0, rx_st_ready0,
   rx_st_sop0, rx_st_eop0, rx_st_be0, rx_st_data0, tx_st_ready0,
   tx_st_data0, tx_st_sop0, tx_st_eop0, tx_st_valid0,
   m_axi_awvalid_user, m_axi_awaddr_user, m_axi_wdata_user,
   m_axi_wvalid_user, m_axi_bready_user, m_axi_arvalid_user,
   m_axi_araddr_user, m_axi_rready_user
   );

   input                axi_clk;
   input                axi_rst;
   input                trn_clk;
   input                trn_rst;

   input                rx_st_valid0; 
   input                rx_st_ready0; 	    
   input                rx_st_sop0;     
   input                rx_st_eop0;       
   input   [7:0]        rx_st_be0;
   input   [63:0]       rx_st_data0;   

   input                tx_st_ready0;  
   input   [63:0]       tx_st_data0;   
   input                tx_st_sop0;    
   input                tx_st_eop0;    
   input                tx_st_valid0; 
 
   input                m_axi_awvalid_user;
   input   [31:0]       m_axi_awaddr_user;
   output               m_axi_awready_user; 
                                                                             
   input   [31:0]       m_axi_wdata_user; 
   input                m_axi_wvalid_user;  
   output               m_axi_wready_user; 
      
   input                m_axi_bready_user;                                              
   output  [1:0]        m_axi_bresp_user;
   output               m_axi_bvalid_user; 

   input                m_axi_arvalid_user;
   input   [31:0]       m_axi_araddr_user;
   output               m_axi_arready_user; 
                                                
   input                m_axi_rready_user;
   output  [31:0]       m_axi_rdata_user;
   output  [1:0]        m_axi_rresp_user;
   output               m_axi_rvalid_user;

   wire                 channel_sel;
   wire    [31:0]       ip2axi_rdata_rx;
   wire    [31:0]       ip2axi_rdata_tx;

   wire                 axi2ip_wreq;
   wire    [31:0]       axi2ip_wraddr;
   wire    [31:0]       axi2ip_wrdata;
   wire                 s_rst;
   reg                  s_rst_reg;
   reg                  s_rst_reg_d1;
   reg                  s_rst_reg_d2;

   axi_mm_if 
        axi_mm_if (

           .ip2axi_aclk          (axi_clk),         
           .ip2axi_aresetn       (!axi_rst),         
           .s_axi_lite_aclk      (axi_clk),         
           .s_axi_lite_aresetn   (!axi_rst), 
                                                                         
           .s_axi_lite_awvalid    (m_axi_awvalid_user),  
           .s_axi_lite_awready    (m_axi_awready_user),  
           .s_axi_lite_awaddr     (m_axi_awaddr_user),  

           .s_axi_lite_wvalid     (m_axi_wvalid_user),  
           .s_axi_lite_wready     (m_axi_wready_user),  
           .s_axi_lite_wdata      (m_axi_wdata_user), 

           .axi2ip_wreq           (axi2ip_wreq),
           .axi2ip_wraddr         (axi2ip_wraddr),
           .axi2ip_wrdata         (axi2ip_wrdata),
 
           .s_axi_lite_bresp      (m_axi_bresp_user),  
           .s_axi_lite_bvalid     (m_axi_bvalid_user),  
           .s_axi_lite_bready     (m_axi_bready_user), 
 
           .s_axi_lite_arvalid    (m_axi_arvalid_user),  
           .s_axi_lite_arready    (m_axi_arready_user),  
           .s_axi_lite_araddr     (m_axi_araddr_user),
  
           .s_axi_lite_rvalid     (m_axi_rvalid_user),  
           .s_axi_lite_rready     (m_axi_rready_user),   
           .s_axi_lite_rresp      (m_axi_rresp_user)
        );

tlp_win_bram
   tlp_win_rx(/*AUTOINST*/
	      // Outputs
	      .ip2axi_rdata		(ip2axi_rdata_rx[31:0]),
              .channel_sel              (channel_sel),
	      // Inputs
	      .axi_clk			(axi_clk),
	      .axi_rst			(axi_rst),
	      .trn_clk			(trn_clk),
	      .trn_rst			(trn_rst),
              .s_rst                    (s_rst), 
	      .st_valid0		(rx_st_valid0),
	      .st_ready0		(rx_st_ready0),
	      .st_sop0			(rx_st_sop0),
	      .st_eop0			(rx_st_eop0),
	      .st_be0			(rx_st_be0[7:0]),
	      .st_data0			(rx_st_data0[63:0]),
	      .m_axi_arvalid_user	(m_axi_arvalid_user),
	      .m_axi_araddr_user	(m_axi_araddr_user[31:0]),
	      .bram_sel			(1'h1));

tlp_win_bram
   tlp_win_tx(/*AUTOINST*/
	      // Outputs
	      .ip2axi_rdata		(ip2axi_rdata_tx[31:0]),
              .channel_sel              (),
	      // Inputs
	      .axi_clk			(axi_clk),
	      .axi_rst			(axi_rst),
	      .trn_clk			(trn_clk),
	      .trn_rst			(trn_rst),
              .s_rst                    (s_rst),	      
	      .st_valid0		(tx_st_valid0),
	      .st_ready0		(tx_st_ready0),
	      .st_sop0			(tx_st_sop0),
	      .st_eop0			(tx_st_eop0),
	      .st_be0			(8'h0),
	      .st_data0			(tx_st_data0[63:0]),
	      .m_axi_arvalid_user	(m_axi_arvalid_user),
	      .m_axi_araddr_user	(m_axi_araddr_user[31:0]),
	      .bram_sel			(1'h0));


   always @(posedge axi_clk) 
     begin
       if (axi2ip_wreq && (axi2ip_wraddr[11:0] == 12'h0))
         s_rst_reg <= axi2ip_wrdata[0];
       else 
         s_rst_reg <= 1'h0;
     end

   always @(posedge axi_clk) 
     begin
       s_rst_reg_d1 <= s_rst_reg;
       s_rst_reg_d2 <= s_rst_reg_d1;
     end

   assign s_rst = s_rst_reg || s_rst_reg_d1 || s_rst_reg_d2;
   assign m_axi_rdata_user = (channel_sel)?ip2axi_rdata_rx:ip2axi_rdata_tx; 


endmodule
