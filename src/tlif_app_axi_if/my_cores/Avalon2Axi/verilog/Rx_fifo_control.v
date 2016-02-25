 module Rx_fifo_control #
   (
     parameter     AXI_DATA_WIDTH = 128,
     parameter     FIFO_DEPTH = 10,
     parameter     FIFO_DATA_WIDTH = 100,
     parameter     BE_WIDTH = AXI_DATA_WIDTH/8
   )

  (/*AUTOARG*/
   // Outputs
   trn_rbar_hit, trn_rsof, trn_reof, trn_rd, trn_rrem, trn_rsrc_rdy,
   rx_st_ready0, data_in_rx, rd_req_rx, wr_req_rx,
   // Inputs
   axi_clk, axi_rst, trn_clk, trn_rst, data_out_rx, trn_rdst_rdy,
   rx_st_sop0, rx_st_bardec0, rx_st_data0, rx_st_be0, rx_st_eop0,
   rx_st_valid0, wrusedw_rx, empty_rx, eof_empty_rx
   );

   input                              axi_clk;
   input                              axi_rst; 
   input                              trn_clk;
   input                              trn_rst; 
   input   [FIFO_DATA_WIDTH-1:0]      data_out_rx;

   input                              trn_rdst_rdy;
   output    [7:0]                    trn_rbar_hit;
   output	                      trn_rsof;
   output 	                      trn_reof;
   output    [AXI_DATA_WIDTH-1:0]     trn_rd;
   output                             trn_rrem;
   output	                      trn_rsrc_rdy;

   input                              rx_st_sop0;
   input   [7:0]                      rx_st_bardec0;  
   input   [AXI_DATA_WIDTH-1:0]       rx_st_data0;    
   input   [BE_WIDTH-1:0]             rx_st_be0;	       
   input                              rx_st_eop0;      
   input                              rx_st_valid0; 
   output                             rx_st_ready0; 

   input  [FIFO_DEPTH-1:0]            wrusedw_rx;
   input                              empty_rx;
   input                              eof_empty_rx;
   output  [FIFO_DATA_WIDTH-1:0]      data_in_rx;
   output                             rd_req_rx;
   output                             wr_req_rx;

   wire                               rx_st_sop_rx;
   wire   [7:0]                       rx_st_bardec_rx;
   wire   [AXI_DATA_WIDTH-1:0]        rx_st_data_rx;  
   wire   [BE_WIDTH-1:0]              rx_st_be_rx;    
   wire                               rx_st_eop_rx;   
   wire                               rx_st_valid_rx; 

   wire                               almost_full_rx;
   wire                               empty;
   wire  [FIFO_DEPTH-1:0]             wrusedw; 
   wire  [FIFO_DATA_WIDTH-1:0]        data_in;
   wire  [FIFO_DATA_WIDTH-1:0]        data_out;
   wire                               rd_req;
   wire                               wr_req;

   wire                               almost_full;
   wire                               packet_sop;
   wire                               packet_eop;

   wire     [7:0]                     trn_rbar_hit_align;
   wire 	                      trn_rsof_align;
   wire  	                      trn_reof_align;
   wire    [AXI_DATA_WIDTH-1:0]       trn_rd_align;
   wire     [BE_WIDTH-1:0]            trn_rrem_align;
   wire 	                      trn_rsrc_rdy_align;
   reg                                dw1_pl_flag;

   localparam  [3:0]  // synopsys enum state_info
     S_IDLE    = 4'h0,
     S_ROUT    = 4'h1,
     S_MB_ROUT = 4'h2,
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
           //else //discard the message and broadcast tlp
           //  begin
           //    state_ns = S_MB_ROUT;   
           //  end               
           S_ROUT: if (packet_eop)
             begin
               state_ns = S_DONE;
             end
           S_MB_ROUT: if (packet_eop)
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

   Avalon_rx_align #(.AXI_DATA_WIDTH (AXI_DATA_WIDTH),
                     .BE_WIDTH       (BE_WIDTH)) 
     Avalon_rx_align(/*AUTOINST*/
		     // Outputs
		     .trn_rbar_hit (trn_rbar_hit_align),
		     .trn_rsof	   (trn_rsof_align),
		     .trn_reof	   (trn_reof_align),
		     .trn_rd	   (trn_rd_align),
		     .trn_rrem	   (trn_rrem_align),
                     .trn_rsrc_rdy (trn_rsrc_rdy_align),
		     // Inputs
		     .clk		(axi_clk),
		     .rst		(axi_rst),
		     .rx_st_bardec_rx	(rx_st_bardec_rx[7:0]),
		     .rx_st_sop_rx	(rx_st_sop_rx),
		     .rx_st_eop_rx	(rx_st_eop_rx),
		     .rx_st_data_rx	(rx_st_data_rx[AXI_DATA_WIDTH-1:0]),
		     .rx_st_be_rx	(rx_st_be_rx[BE_WIDTH-1:0]),
		     .rx_st_valid_rx	(rx_st_valid_rx)); 

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


   always @(posedge axi_clk )
     begin
       if (axi_rst)
	 begin
	   dw1_pl_flag <= 1'h0;
	 end
       else if(trn_rsof)
	 begin
	   dw1_pl_flag <= (trn_rd[9:0] == 10'h1) && (trn_rd[31:24] == 8'h4a);	     
	 end
     end

   assign almost_full_rx = wrusedw_rx[FIFO_DEPTH-1];
   assign rx_st_ready0 = ~almost_full_rx;
   assign wr_req_rx  = rx_st_valid0;
   assign rd_req_rx  = (state == S_ROUT) || (state == S_MB_ROUT);
   assign data_in_rx = {rx_st_sop0,      //81
                        rx_st_eop0,      //80
                        rx_st_be0,       //79:72
                        rx_st_bardec0,   //71:64
                        rx_st_data0};    //63:0

   assign packet_sop = data_out_rx[81] && ~empty_rx && ~eof_empty_rx && ~almost_full;
   assign packet_eop = data_out_rx[80] && rd_req_rx;

   assign rx_st_be_rx  = data_out_rx[79:72];
   assign rx_st_eop_rx = rx_st_valid_rx && data_out_rx[80];  
   assign rx_st_sop_rx = rx_st_valid_rx && data_out_rx[81];
   assign rx_st_valid_rx  = (state == S_ROUT); 
   assign rx_st_data_rx   = data_out_rx[63:0];
   assign rx_st_bardec_rx = data_out_rx[71:64]; 

   assign almost_full = wrusedw[FIFO_DEPTH-1];
   assign wr_req = trn_rsrc_rdy_align; 
   assign rd_req = trn_rdst_rdy && ~empty;
   assign data_in = {trn_rsof_align,     //81
                     trn_reof_align,     //80
                     trn_rbar_hit_align, //79:72
                     trn_rrem_align,     //71:64
                     trn_rd_align};      //63:0

   assign trn_rsrc_rdy = rd_req;
   assign trn_rsof = trn_rsrc_rdy && data_out[81];
   assign trn_reof = trn_rsrc_rdy && data_out[80];
   assign trn_rbar_hit = data_out[79:72];
   assign trn_rd = data_out[63:0];
   assign trn_rrem = trn_reof?!(data_out[71:64] == 8'h0F):1'h1;
   //assign trn_rrem = trn_reof?((data_out[71:64] == 8'hFF) || dw1_pl_flag):1'h1;//3dw header
   //assign trn_rrem = trn_reof?(data_out[71:64] == 8'hFF):1'h1;//4dw header


   /*AUTOASCIIENUM("state", "state_ascii", "S_")*/
   // Beginning of automatic ASCII enum decoding
   reg [31:0]		state_ascii;		// Decode of state
   always @(state) begin
      case ({state})
	S_IDLE:   state_ascii = "idle";
	S_ROUT:   state_ascii = "rout";
	S_MB_ROUT:state_ascii = "mb_rout";
	S_DONE:   state_ascii = "done";
	default:  state_ascii = "%Err";
      endcase
   end
   // End of automatics


endmodule

