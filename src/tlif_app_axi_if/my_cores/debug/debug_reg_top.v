module debug_reg_top 
  (
   /*AUTOARG*/
   // Outputs
   m_axi_awready_user, m_axi_wready_user, m_axi_bresp_user,
   m_axi_bvalid_user, m_axi_arready_user, m_axi_rdata_user,
   m_axi_rresp_user, m_axi_rvalid_user,sft_rst,
   // Inputs
   axi_clk, axi_rst, s_axi_rresp, m_axi_awvalid_user,
   m_axi_awaddr_user, m_axi_wdata_user, m_axi_wvalid_user,
   m_axi_bready_user, m_axi_arvalid_user, m_axi_araddr_user,
   m_axi_rready_user,app_rst
   );

   input                axi_clk;
   input                axi_rst;
   input                app_rst;
   output               sft_rst;

   input   [1:0]        s_axi_rresp; 
 
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

   wire                 axi2ip_wreq;
   wire    [31:0]       axi2ip_wraddr;
   wire    [31:0]       axi2ip_wrdata;

   wire                 sft_rst;

   reg     [7:0]        r_addr;
   reg     [31:0]       r_data;
   reg                  s_rst_reg;
   reg     [31:0]       s_rst_check;


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

sft_rst_out
   sft_rst_out(
    .clk          (axi_clk),
    .rst          (app_rst), 
    .s_rst_reg    (s_rst_reg), 
    .sft_rst_out  (sft_rst) 
   );

   always @(posedge axi_clk) 
     begin
       if (app_rst)
         s_rst_check <= 32'h0;
       else if (sft_rst)
         s_rst_check <= 32'h1;
     end

   always @(posedge axi_clk) 
     begin
       if (axi2ip_wreq && (axi2ip_wraddr[11:0] == 12'h0))
         s_rst_reg <= axi2ip_wrdata[0];
       else 
         s_rst_reg <= 1'h0;
     end

   always @(posedge axi_clk) 
     begin
       if (axi_rst)
         r_addr <= 8'h0;
       else if (m_axi_arvalid_user && m_axi_arready_user)
         r_addr <= m_axi_araddr_user[9:2];
     end

   always @(*) 
     begin
       r_data = 32'h0;
       case (r_addr)
         8'h0:r_data = 32'h0123_4567;
         8'h1:r_data = 32'h89ab_cdef;
         8'h2:r_data[1:0] = s_rst_check;
         8'h3:r_data[1:0] = s_axi_rresp;
       endcase
     end

   assign m_axi_rdata_user = r_data;

endmodule


