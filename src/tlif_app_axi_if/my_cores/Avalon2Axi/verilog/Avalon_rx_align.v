
module Avalon_rx_align#
   (
     parameter     AXI_DATA_WIDTH = 128,
     parameter     BE_WIDTH = AXI_DATA_WIDTH/8
   )
  (
   /*AUTOARG*/
   // Outputs
   trn_rbar_hit, trn_rsof, trn_reof, trn_rd, trn_rrem, trn_rsrc_rdy,
   // Inputs
   clk, rst, rx_st_bardec_rx, rx_st_sop_rx, rx_st_eop_rx,
   rx_st_data_rx, rx_st_be_rx, rx_st_valid_rx
   );

   input                          clk;
   input                          rst;

   input  [7:0] 	          rx_st_bardec_rx;//from pcie core
   input                          rx_st_sop_rx;
   input                          rx_st_eop_rx;
   input  [AXI_DATA_WIDTH-1:0]    rx_st_data_rx;
   input  [BE_WIDTH-1:0]          rx_st_be_rx;
   input                          rx_st_valid_rx;

   output reg   [7:0]             trn_rbar_hit;
   output reg	                  trn_rsof;//to conv_axi_rx
   output reg 	                  trn_reof;
   output reg    [AXI_DATA_WIDTH-1:0] trn_rd;
   output reg    [BE_WIDTH-1:0]   trn_rrem;
   output reg	                  trn_rsrc_rdy;
 
   wire 		      non_aligned;
   wire 		      non_aligned_trig;
   wire                       eop_be_ff_d;
   wire                       eop_be_0f;



   reg  [AXI_DATA_WIDTH-1:0]  rx_st_data_rx_d;
   reg  [BE_WIDTH-1:0] 	      rx_st_be_rx_d;
   reg  	              rx_st_sop_rx_d;
   reg  	              rx_st_eop_rx_d;
   reg  	              rx_st_valid_rx_d;
   reg  [7:0]                 rx_st_bardec_rx_d;
   reg 		              non_aligned_d;
   reg                        eop_be_0f_d; 


 
   always @(posedge clk)
     begin
       rx_st_data_rx_d   <= rx_st_data_rx;
       rx_st_be_rx_d     <= rx_st_be_rx;
       rx_st_sop_rx_d    <= rx_st_sop_rx;
       rx_st_eop_rx_d    <= rx_st_eop_rx;
       rx_st_valid_rx_d  <= rx_st_valid_rx;
       rx_st_bardec_rx_d <= rx_st_bardec_rx;
       eop_be_0f_d       <= eop_be_0f;
     end

   always @(posedge clk)
     begin
       trn_rsof     <= rx_st_sop_rx_d;
       trn_rsrc_rdy <= rx_st_valid_rx_d && ~eop_be_0f_d; 
       trn_rbar_hit <= 8'h01;
     //trn_rbar_hit <= rx_st_bardec_rx_d;
     end

   always @(posedge clk)
     begin
       if (eop_be_ff_d)
         begin
           trn_rrem <= 8'h0f;
         end
       else if (non_aligned)
         begin
           trn_rrem <= {rx_st_be_rx[3:0],rx_st_be_rx_d[3:0]};
         end
       else
         begin
           trn_rrem <= rx_st_be_rx_d;
         end
     end

   always @(posedge clk)
     begin
       if (eop_be_0f)
         begin
           trn_reof <= eop_be_0f;
         end
       else
         begin
           trn_reof <= rx_st_eop_rx_d;
         end
     end

   always @(posedge clk)
     begin
	if(non_aligned_trig)
	  begin
	     non_aligned_d <= 1'h1;
	  end
	else if((rx_st_valid_rx_d && rx_st_eop_rx_d) || rst)
	  begin
	     non_aligned_d <= 1'h0;
	  end
     end 

   always @(posedge clk)
     begin
       if (non_aligned_trig)
         begin
           trn_rd <= {rx_st_data_rx[31:0],rx_st_data_rx_d[31:0]};
         end
       else if (non_aligned_d)
         begin
           trn_rd <= {rx_st_data_rx[31:0],rx_st_data_rx_d[63:32]};
         end
       else
         begin
           trn_rd <= rx_st_data_rx_d;
         end
     end

   assign non_aligned_trig = (rx_st_be_rx_d == 8'h0f) && rx_st_valid_rx_d && ~rx_st_eop_rx_d;
   assign non_aligned = non_aligned_d || non_aligned_trig;
   assign eop_be_ff_d = (rx_st_be_rx_d == 8'hff) && rx_st_eop_rx_d && non_aligned; 
   assign eop_be_0f = (rx_st_be_rx == 8'h0f) && rx_st_eop_rx && non_aligned;

endmodule

