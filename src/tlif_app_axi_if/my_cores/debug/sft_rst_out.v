module sft_rst_out 

  (
   /*AUTOARG*/
   // Outputs
   sft_rst_out,
   // Inputs
   clk, rst, s_rst_reg
   );
   input       clk;
   input       rst;
   input       s_rst_reg;
   output      sft_rst_out;

   reg   [5:0] counter;

   localparam  [3:0]  // synopsys enum state_info
     S_IDLE    = 4'h0,
     S_COUNT   = 4'h1,
     S_DONE    = 4'h2;


   reg    [3:0]  // synopsys enum state_info 
               state, state_ns;
   always @(posedge clk )
     begin
       if (rst)
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
           S_IDLE: if (s_rst_reg)
             begin
               state_ns = S_COUNT;                    
             end
           S_COUNT: if (counter == 6'h20)
             begin
               state_ns = S_IDLE;                    
             end
           default:
             begin
               state_ns = S_IDLE;
             end
           endcase
      end

always @(posedge clk)
  begin
    if (state == S_COUNT)
      begin
        counter <= counter + 1'h1;
      end
    else 
      begin
        counter <= 6'h0;
      end
  end

assign sft_rst_out = (state == S_COUNT);

   /*AUTOASCIIENUM("state", "state_ascii", "S_")*/
   // Beginning of automatic ASCII enum decoding
   reg [39:0]		state_ascii;		// Decode of state
   always @(state) begin
      case ({state})
	S_IDLE:   state_ascii = "idle ";
	S_COUNT:  state_ascii = "count";
	S_DONE:   state_ascii = "done ";
	default:  state_ascii = "%Erro";
      endcase
   end
   // End of automatics

endmodule


