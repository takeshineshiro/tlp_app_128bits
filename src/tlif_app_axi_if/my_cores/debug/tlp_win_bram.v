module tlp_win_bram 
  (
   /*AUTOARG*/
   // Outputs
   ip2axi_rdata,channel_sel,
   // Inputs
   axi_clk, axi_rst, trn_clk, trn_rst, s_rst, st_valid0, st_ready0, st_sop0,
   st_eop0, st_be0, st_data0, m_axi_arvalid_user, m_axi_araddr_user,
   bram_sel
   );

   input                  axi_clk;
   input                  axi_rst;

   input                  s_rst;

   input                  trn_clk;
   input                  trn_rst;
   input                  st_valid0; 
   input                  st_ready0; 	    
   input                  st_sop0;     
   input                  st_eop0;       
   input   [7:0]          st_be0;
   input   [63:0]         st_data0;   
                                                                 
   input                  m_axi_arvalid_user;
   input   [31 :0]        m_axi_araddr_user;
   input                  bram_sel;
   output reg [31:0]      ip2axi_rdata;
   output reg             channel_sel;

   wire    [95:0]         r_data;
   wire    [1:0]          r_sel;
   wire    [95:0]         w_data;
   wire                   wr_in;
   reg     [29:0]         r_addr;
   reg     [11:0]         w_addr;


   block_ram #
       (
         .DATA_W   (96), 
         .DEPTH_W  (12),
         .BE_BIT   (8),        
         .BE_TYPE  (0) 
       )
       bram   (
            .clock_a     (trn_clk), 
            .data_a      (w_data),                    
            .wren_a      (wr_in),                       
            .address_a   (w_addr),                           
                
            .clock_b     (axi_clk),  
            .address_b   (r_addr[11:0]),//                     
            .rden_b      (1'h1),                                        
            .q_b         (r_data)                    
	      );

    always @(*) 
      begin
        ip2axi_rdata = 32'h0; 
        case(r_sel)
          2'h0:begin
             ip2axi_rdata = 32'h12345678;
          end
          2'h1:begin
             ip2axi_rdata = r_data[95:64];
          end
          2'h2:begin
             ip2axi_rdata = r_data[63:32];
          end
          2'h3:begin
             ip2axi_rdata = r_data[31:0];
          end
         endcase
       end       

     always @(posedge trn_clk)
       begin
         if (s_rst)//
           begin
             w_addr <= 12'h0;
           end 
         else if (wr_in && (w_addr != 12'hfff))
           begin
             w_addr <= w_addr+1'h1;
           end      
       end

      always @(posedge axi_clk)
        begin
          if (axi_rst)
            r_addr <= 30'h0;
          else if (m_axi_arvalid_user)
            r_addr[11:0] <= m_axi_araddr_user[13:2];
        end

      always @(posedge axi_clk)
        begin
          if (axi_rst)
            channel_sel <= 1'h0;
          else if (m_axi_arvalid_user)
            channel_sel <= m_axi_araddr_user[18];//;
        end

   assign r_sel = r_addr[15:14];//
   assign wr_in = st_valid0;

   assign w_data[95:32] = st_data0[63:0];
   assign w_data[31:24] = st_be0[7:0];
   assign w_data[23]    = st_sop0;
   assign w_data[22]    = st_eop0;
   assign w_data[21]    = st_ready0;
   assign w_data[20:13] = {8{1'h0}};
   assign w_data[12]    = bram_sel;
   assign w_data[11:0]  = w_addr;

endmodule


