
module Avalon_tx_align#
   (
     parameter     AXI_DATA_WIDTH = 128,
     parameter     BE_WIDTH = AXI_DATA_WIDTH/8
   )
  (
   /*AUTOARG*/
   // Outputs
   tx_st_valid_align, tx_st_sop_align, tx_st_eop_align,
   tx_st_data_align,
   // Inputs
   axi_clk, axi_rst, tx_st_valid, tx_st_sop, tx_st_eop,
   tx_st_data, tx_st_be
   );

   input                            axi_clk;
   input                            axi_rst;

   input                            tx_st_valid;
   input                            tx_st_sop;
   input                            tx_st_eop;
   input    [AXI_DATA_WIDTH-1:0]    tx_st_data;
   input    [BE_WIDTH-1:0]          tx_st_be;

   output                           tx_st_sop_align;
   output   [AXI_DATA_WIDTH-1:0]    tx_st_data_align;
   output                           tx_st_valid_align;
   output                           tx_st_eop_align;

   wire   [2:0]                     fmt;
   wire   [4:0]                     type; 
   wire                             header_3dw_align_trig;

   reg                              eop_be_flag;
   reg                              eop_be_flag_d;
   reg                              header_3dw_align;
   reg                              tx_st_sop_d;
   reg                              tx_st_eop_d;
   reg    [AXI_DATA_WIDTH-1:0]      tx_st_data_d;
   reg    [BE_WIDTH-1:0]            tx_st_be_d;
   reg    [AXI_DATA_WIDTH-1:0]      tx_st_data_align;
   reg                              tx_st_eop_align_sig;
   reg                              tx_st_valid_d;

   always @(posedge axi_clk)
     begin
       tx_st_sop_d   <= tx_st_sop;
       tx_st_eop_d   <= tx_st_eop;
       tx_st_data_d  <= tx_st_data;
       tx_st_be_d    <= tx_st_be;
       tx_st_valid_d <= tx_st_valid;
     end

   always @(posedge axi_clk)
     begin
       eop_be_flag <= (tx_st_eop && (tx_st_be == 8'hff) &&
		       (header_3dw_align_trig || header_3dw_align));
     end

   always @(posedge axi_clk)
     begin
       eop_be_flag_d  <= eop_be_flag;
     end

   always @(posedge axi_clk)
     begin
       if (header_3dw_align_trig)
         begin
           header_3dw_align <= 1'h1;
         end
       else if (tx_st_eop_d || axi_rst)
         begin
           header_3dw_align <= 1'h0;
         end
      end

   always @(posedge axi_clk)
     begin
       if (header_3dw_align_trig)
         begin
           tx_st_data_align  <= {{32{1'h0}},tx_st_data[31:0]};
         end
       else if (header_3dw_align )
         begin
           tx_st_data_align  <= {tx_st_data[31:0],tx_st_data_d[63:32]};
         end
       else  
         begin
           tx_st_data_align  <= tx_st_data;
         end
     end 

   assign fmt  = tx_st_data_d[31:29];
   assign type = tx_st_data_d[28:24]; 
   assign header_3dw_align_trig = tx_st_sop_d && (fmt == 3'h2) && (tx_st_data[2] == 1'h0); 
   assign tx_st_sop_align = tx_st_sop_d;
   assign tx_st_eop_align = (eop_be_flag || eop_be_flag_d) ? 
				eop_be_flag_d : tx_st_eop_d;
   assign tx_st_valid_align = tx_st_valid_d || eop_be_flag_d;

endmodule



