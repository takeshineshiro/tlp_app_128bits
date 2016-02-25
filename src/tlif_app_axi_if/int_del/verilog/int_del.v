module int_del #
  (
   parameter C_INT_NUM = 2,
   parameter MSI_EN = 1
   )
   (
    /*AUTOARG*/
   // Outputs
   cfg_interrupt_n, cfg_interrupt_assert_n, cfg_interrupt_di,
   // Inputs
   clk, rst, msi_request, cfg_interrupt_rdy_n
   );

   input clk;
   input rst;

   input [C_INT_NUM-1:0] msi_request;
   input 		 cfg_interrupt_rdy_n;
   output 		 cfg_interrupt_n;
   output 		 cfg_interrupt_assert_n;
   output [7:0] 	 cfg_interrupt_di;

   reg 			 interrupt_n;
   reg 			 interrupt_assert_n;
   reg [7:0] 		 interrupt_di;
   reg [3:0] 		 state, state_n;
   wire [7:0] 		 int_req;
   reg [C_INT_NUM-1:0] 	 int_idle;
   reg [2:0] 		 msi_request_sync;
   wire                  int_req_valid;

   localparam IDLE = 4'b0001;
   localparam ARB  = 4'b0010;
   localparam SENT = 4'b0100;
   localparam RDY  = 4'b1000;

   function  [C_INT_NUM-1:0] gen_idle;
      input [C_INT_NUM-1:0] old_idle;
      input [C_INT_NUM-1:0] pre_int;
      integer 		    i;
      begin
	 gen_idle = old_idle;
	 for (i=0;i<C_INT_NUM;i=i+1)
	   begin
	      if(~old_idle[i])
		begin
		   gen_idle[i] = ~pre_int[i];
		end
	   end
      end
   endfunction

   generate
      if(MSI_EN) begin : msi_interrupt

	 assign int_req = msi_request & int_idle;
	 assign int_req_valid = | int_req;

	 always@(posedge clk)
	   begin
	      if(rst) 
		begin
		   state <= IDLE;
		end
	      else
		begin
		   state <= state_n;
		end
	   end

	 always@(*)
	   begin
	      case(state)
		IDLE : state_n = (int_req_valid) ? SENT : state;
		SENT : state_n = RDY;
		RDY  : state_n = (~cfg_interrupt_rdy_n) ? IDLE : state;
		default : state_n = state;
	      endcase
	   end

	 assign cfg_interrupt_n = (state != RDY);
	 assign cfg_interrupt_assert_n = 1'h0;
	 assign cfg_interrupt_di = interrupt_di;

	 always@(posedge clk)
	   begin
	      if(state == SENT) 
		begin
		   case(int_req)
		     'bXXXXXXX1 : interrupt_di <= 8'h0;
		     'bXXXXXX10 : interrupt_di <= 8'h1;
		     'bXXXXX100 : interrupt_di <= 8'h2;
		     'bXXXX1000 : interrupt_di <= 8'h3;
		     'bXXX10000 : interrupt_di <= 8'h4;
		     'bXX100000 : interrupt_di <= 8'h5;
		     'bX1000000 : interrupt_di <= 8'h6;
		     'b10000000 : interrupt_di <= 8'h7;
		     default : interrupt_di <= 8'h0;
		   endcase
		end
	   end

	 always@(posedge clk)
	   begin
              if(rst)
		begin
		   int_idle <= {C_INT_NUM{1'h1}};
		end
	      else if(state == RDY)
		begin
		   int_idle[interrupt_di] <= 1'h0;
		end	 
	      else
		begin
		   int_idle <= gen_idle(int_idle,msi_request);
		end
	   end

      end
      else begin : inta_interrupt
	 // INTA interrupt
	 always@(posedge clk)
	   begin
	      if(rst) 
		begin
		   msi_request_sync <= 0;
		end
	      else if(cfg_interrupt_n == 1)
		begin
		   msi_request_sync <= {msi_request_sync[1:0],{| msi_request}};
		end
	   end

	 always@(posedge clk)
	   begin
	      if(rst) 
		begin
		   interrupt_n <= 1;
		   interrupt_assert_n <= 1;
		end
	      else
		begin
		   if((~(msi_request_sync[2] ^ interrupt_assert_n)) && interrupt_n) 
		     begin
			interrupt_n   <= 0;
			interrupt_assert_n   <= ~interrupt_assert_n;
		     end
		   else if(~cfg_interrupt_rdy_n) 
		     begin
			interrupt_n   <= 1;
		     end
		end
	   end

	 assign cfg_interrupt_n = interrupt_n;
	 assign cfg_interrupt_assert_n = interrupt_assert_n;
	 assign cfg_interrupt_di = 8'h0;

      end
   endgenerate


endmodule
