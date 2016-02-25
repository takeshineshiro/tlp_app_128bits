
module Tx_fifo_control #
   (
     parameter     AXI_DATA_WIDTH = 128,
     parameter     FIFO_DEPTH = 10,
     parameter     TX_FIFO_DATA_WIDTH = 100,
     parameter     FIFO_DATA_WIDTH = 100,
     parameter     BE_WIDTH = AXI_DATA_WIDTH/8
   )
  (/*AUTOARG*/
   // Outputs
   trn_tdst_rdy, tx_st_data0, tx_st_sop0, tx_st_eop0, tx_st_valid0,
   data_in_tx, wr_req_tx, rd_req_tx,
   // Inputs
   axi_clk, axi_rst, trn_clk, trn_rst, wrusedw_tx, empty_tx,tx_st_ready0,
   data_out_tx, trn_tsof, trn_teof, trn_td, trn_trem, trn_tsrc_rdy,
   trn_tsrc_dsc
   );

   input                              axi_clk;
   input                              axi_rst; 
   input                              trn_clk;
   input                              trn_rst; 

   input    [FIFO_DEPTH-1:0]          wrusedw_tx; 
   input                              empty_tx;   
   input    [TX_FIFO_DATA_WIDTH-1:0]  data_out_tx;

   input	                      trn_tsof;
   input 	                      trn_teof;
   input    [AXI_DATA_WIDTH-1:0]      trn_td;
   input                              trn_trem;
   input	                      trn_tsrc_rdy;
   input                              trn_tsrc_dsc;
   output                             trn_tdst_rdy;
 
   input                              tx_st_ready0;
   output   [AXI_DATA_WIDTH-1:0]      tx_st_data0;   
   output                             tx_st_sop0;    
   output                             tx_st_eop0;    
   output                             tx_st_valid0;  

   output   [TX_FIFO_DATA_WIDTH-1:0]  data_in_tx;
   output                             wr_req_tx;
   output                             rd_req_tx; 
 
   wire  [AXI_DATA_WIDTH-1:0]         tx_st_data;   
   wire                               tx_st_sop;    
   wire                               tx_st_eop; 
   wire  [BE_WIDTH:0]                 tx_st_be;      
   wire                               tx_st_valid; 
   
   wire  [AXI_DATA_WIDTH-1:0]         tx_st_data_align;   
   wire                               tx_st_sop_align;    
   wire                               tx_st_eop_align;    
   wire                               tx_st_valid_align;  

   wire                               eof_empty_tx;
   wire                               almost_full_tx;
   wire                               eof_in_tx;
   wire                               eof_out_tx;

   wire                               almost_full;
   wire                               empty;
   wire  [FIFO_DEPTH-1:0]             wrusedw; 
   wire  [FIFO_DATA_WIDTH-1:0]        data_in;
   wire  [FIFO_DATA_WIDTH-1:0]        data_out;
   wire                               rd_req;
   wire                               wr_req;
   wire                               eop_in;
   wire                               eop_out; 
   wire  [7:0]                        trn_tstrb;
   wire                               packet_sop;
   wire                               packet_eop;
   reg   [9:0]                        eop_counter;
/*************************keep be aligned tlp contionos********************************/
   fifo  #(.DATA_W      (FIFO_DATA_WIDTH),
           .DEPTH_W     (FIFO_DEPTH))
     fifo
              (.aclr            (axi_rst),
	       .sclr            (axi_rst),
               .clock           (axi_clk),
	       .wrreq           (wr_req),
	       .data            (data_in),
               .usedw           (wrusedw),
	       .rdreq           (rd_req),

	       .q               (data_out),
	       .empty           (empty)); 
/*************************Avalon_tx_align********************************/
   Avalon_tx_align #(/*AUTOINSTPARAM*/
		     // Parameters
		     .AXI_DATA_WIDTH	(AXI_DATA_WIDTH),
		     .BE_WIDTH		(BE_WIDTH))
     Avalon_tx_align(/*AUTOINST*/
		     // Outputs
		     .tx_st_sop_align	(tx_st_sop_align),
		     .tx_st_data_align	(tx_st_data_align[AXI_DATA_WIDTH-1:0]),
		     .tx_st_valid_align	(tx_st_valid_align),
		     .tx_st_eop_align	(tx_st_eop_align),
		     // Inputs
		     .axi_clk		(axi_clk),
		     .axi_rst		(axi_rst),
		     .tx_st_valid	(tx_st_valid),
		     .tx_st_sop		(tx_st_sop),
		     .tx_st_eop		(tx_st_eop),
		     .tx_st_data	(tx_st_data[AXI_DATA_WIDTH-1:0]),
		     .tx_st_be		(tx_st_be[BE_WIDTH-1:0]));

/*************************tx_eop_control_fifo********************************/
  asyn_fifo #(.DATA_W   (1), 
               .DEPTH_W  (10))//keep tx tlp continous
     tx_eop_control_fifo
              (.aclr              (axi_rst),
               .wrclk             (axi_clk),
	       .data              (1'h1),
	       .wrreq             (eof_in_tx),

               .rdclk             (trn_clk),
	       .rdreq             (eof_out_tx),
	       .rdempty           (eof_empty_tx)
               );
//////////////////////////////////////////////////////////////////////////////

   localparam  [3:0]  // synopsys enum state_info
     S_IDLE    = 4'h0,
     S_ROUT    = 4'h2,
     S_DONE    = 4'h3;

   reg    [3:0]  // synopsys enum state_info 
               state, state_ns;

   always @(posedge axi_clk )
     begin
       if (axi_rst)
	 begin
	   state <= S_IDLE;
	 end
       else
	 begin
	   state <= state_ns;	     
	 end
     end

   always @(*)
     begin
       state_ns = state;	     
         case(state)
           S_IDLE: if (packet_sop)
             begin
               state_ns = S_ROUT;                    
             end
           S_ROUT: if (packet_eop)
             begin
               state_ns = S_DONE;
             end
           S_DONE:
             begin
               state_ns = S_IDLE;
             end
           default:
             begin
               state_ns = S_IDLE;
             end
           endcase
      end

   always @(posedge axi_clk)
     begin
       if (axi_rst)
         begin
           eop_counter <= 8'h0;
         end
       else if (eop_in && ~eop_out)
         begin
           eop_counter <= eop_counter+1'h1;
         end
       else if (~eop_in && eop_out)
         begin
           eop_counter <= eop_counter-1'h1;
         end
    end


   assign packet_sop = data_out[73] && ~empty && (eop_counter != 10'h0) && ~almost_full_tx;
   assign packet_eop = data_out[72];
   assign eop_in  = data_in[72] && wr_req;
   assign eop_out = data_out[72] && rd_req;

   assign almost_full = wrusedw[FIFO_DEPTH-1];
   assign trn_tdst_rdy = ~almost_full;
   assign wr_req = trn_tsrc_rdy; 
   assign rd_req = (state == S_ROUT);


   assign trn_tstrb = (trn_trem)?8'hff:8'h0f;
   assign data_in = {trn_tsof,      //73
                     trn_teof,      //72
                     trn_tstrb,     //71:64
                     trn_td};       //63:0

   assign tx_st_sop  = tx_st_valid && data_out[73];   
   assign tx_st_eop  = tx_st_valid && data_out[72];    
   assign tx_st_be   = data_out[71:64]; 
   assign tx_st_data[31:0] = data_out[31:0]; 
   assign tx_st_data[35:32] = (tx_st_sop && ((data_out[31:24] == 8'h40)||(data_out[31:24] == 8'h60)))?
                              {data_out[32],data_out[33],data_out[34],data_out[35]}:data_out[35:32]; //first dw be align 
   assign tx_st_data[39:36] = (tx_st_sop && ((data_out[31:24] == 8'h40)||(data_out[31:24] == 8'h60)))?
                              {data_out[36],data_out[37],data_out[38],data_out[39]}:data_out[39:36];//last dw be align 
   assign tx_st_data[63:40] = data_out[63:40];   
   assign tx_st_valid = rd_req; 

   assign eof_in_tx   = data_in_tx[AXI_DATA_WIDTH] && wr_req_tx;
   assign eof_out_tx  = data_out_tx[AXI_DATA_WIDTH] && rd_req_tx;
   assign almost_full_tx = wrusedw_tx[FIFO_DEPTH-1];
   assign wr_req_tx  = tx_st_valid_align;
   assign rd_req_tx  = ~(eof_empty_tx || empty_tx) && tx_st_ready0;
   assign data_in_tx = {tx_st_sop_align,     //65
                        tx_st_eop_align,     //64
                        tx_st_data_align};   //63:0

   assign tx_st_data0  = data_out_tx[63:0]; 
   assign tx_st_valid0 = rd_req_tx;       
   assign tx_st_eop0   = tx_st_valid0 && data_out_tx[64];   
   assign tx_st_sop0   = tx_st_valid0 && data_out_tx[65];
 
endmodule
