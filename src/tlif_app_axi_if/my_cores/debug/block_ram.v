// megafunction wizard: %RAM: 2-PORT%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: altsyncram 

// ============================================================
// File Name: block_ram.v
// Megafunction Name(s):
// 			altsyncram
//
// Simulation Library Files(s):
// 			altera_mf
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 11.0 Build 208 07/03/2011 SP 1 SJ Full Version
// ************************************************************


//Copyright (C) 1991-2011 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, Altera MegaCore Function License 
//Agreement, or other applicable license agreement, including, 
//without limitation, that your use is for the sole purpose of 
//programming logic devices manufactured by Altera and sold by 
//Altera or its authorized distributors.  Please refer to the 
//applicable agreement for further details.


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module block_ram (
	address_a,
	address_b,
	byteena_a,
	clock_a,
	clock_b,
	data_a,
	data_b,
	rden_a,
	rden_b,
	wren_a,
	wren_b,
	q_a,
	q_b);

        parameter DATA_W = 36;
        parameter DEPTH_W  = 9;
        parameter BE_BIT  = 8;       
        parameter BE_TYPE  = 0; //0:no byteena;
                             //1:have byteena;
    
	input	[DATA_W/BE_BIT-1:0]  byteena_a;
	input	[DEPTH_W-1:0]  address_a;
	input	[DEPTH_W-1:0]  address_b;
	input	  clock_a;
	input	  clock_b;
	input	[DATA_W-1:0]  data_a;
	input	[DATA_W-1:0]  data_b;
	input	  rden_a;
	input	  rden_b;
	input	  wren_a;
	input	  wren_b;
	output	[DATA_W-1:0]  q_a;
	output	[DATA_W-1:0]  q_b;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1	[DATA_W/BE_BIT-1:0]  byteena_a;

	tri1	  clock_a;
	tri1	  rden_a;
	tri1	  rden_b;
	tri0	  wren_a;
	tri0	  wren_b;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire [DATA_W-1:0] sub_wire0;
	wire [DATA_W-1:0] sub_wire1;
	wire [DATA_W-1:0] q_a = sub_wire0[DATA_W-1:0];
	wire [DATA_W-1:0] q_b = sub_wire1[DATA_W-1:0];

  generate
  if(BE_TYPE == 1) begin : have_byteena
	altsyncram	altsyncram_component (
				.byteena_a (byteena_a),
				.clock0 (clock_a),
				.wren_a (wren_a),
				.clock1 (clock_b),
				.rden_a (rden_a),
				.wren_b (wren_b),
				.address_a (address_a),
				.data_a (data_a),
				.rden_b (rden_b),
				.address_b (address_b),
				.data_b (data_b),
				.q_a (sub_wire0),
				.q_b (sub_wire1),
				.aclr0 (1'b0),
				.aclr1 (1'b0),
				.addressstall_a (1'b0),
				.addressstall_b (1'b0),
				.byteena_b (1'b1),
				.clocken0 (1'b1),
				.clocken1 (1'b1),
				.clocken2 (1'b1),
				.clocken3 (1'b1),
				.eccstatus ());
	defparam
		altsyncram_component.address_reg_b = "CLOCK1",
		//altsyncram_component.byte_size = 8,
		altsyncram_component.clock_enable_input_a = "BYPASS",
		altsyncram_component.clock_enable_input_b = "BYPASS",
		altsyncram_component.clock_enable_output_a = "BYPASS",
		altsyncram_component.clock_enable_output_b = "BYPASS",
		altsyncram_component.indata_reg_b = "CLOCK1",
		altsyncram_component.intended_device_family = "Stratix IV",
		altsyncram_component.lpm_type = "altsyncram",
                altsyncram_component.numwords_a = (1<<DEPTH_W),
                altsyncram_component.numwords_b = (1<<DEPTH_W),
		altsyncram_component.operation_mode = "BIDIR_DUAL_PORT",
		altsyncram_component.outdata_aclr_a = "NONE",
		altsyncram_component.outdata_aclr_b = "NONE",
                altsyncram_component.outdata_reg_a = "UNREGISTERED",
                altsyncram_component.outdata_reg_b = "UNREGISTERED",
                altsyncram_component.power_up_uninitialized = "FALSE",
                altsyncram_component.read_during_write_mode_port_a = "OLD_DATA",
                altsyncram_component.read_during_write_mode_port_b = "OLD_DATA",
                altsyncram_component.widthad_a = DEPTH_W,
                altsyncram_component.widthad_b = DEPTH_W,
                altsyncram_component.width_a = DATA_W,
                altsyncram_component.width_b = DATA_W,
		altsyncram_component.width_byteena_a = DATA_W/BE_BIT,
		altsyncram_component.width_byteena_b = 1,
		altsyncram_component.wrcontrol_wraddress_reg_b = "CLOCK1";
     end
    endgenerate

 generate
  if(BE_TYPE == 0) begin : no_byteena
   altsyncram	altsyncram_component (
				      .wren_a (wren_a),
				      .clock0 (clock_a),
				      .wren_b (wren_b),
				      .clock1 (clock_b),
				      .address_a (address_a),
				      .address_b (address_b),
				      .rden_a (rden_a),
				      .rden_b (rden_b),
				      .data_a (data_a),
				      .data_b (data_b),
				      .q_a (sub_wire0),
				      .q_b (sub_wire1),
				      .aclr0 (1'b0),
				      .aclr1 (1'b0),
				      .addressstall_a (1'b0),
				      .addressstall_b (1'b0),
				      .byteena_a (1'b1),
				      .byteena_b (1'b1),
				      .clocken0 (1'b1),
				      .clocken1 (1'b1),
				      .clocken2 (1'b1),
				      .clocken3 (1'b1),
				      .eccstatus ());
   defparam
     altsyncram_component.address_reg_b = "CLOCK1",
     altsyncram_component.clock_enable_input_a = "BYPASS",
     altsyncram_component.clock_enable_input_b = "BYPASS",
     altsyncram_component.clock_enable_output_a = "BYPASS",
     altsyncram_component.clock_enable_output_b = "BYPASS",
     altsyncram_component.indata_reg_b = "CLOCK1",
     altsyncram_component.intended_device_family = "Stratix IV",
     altsyncram_component.lpm_type = "altsyncram",
     altsyncram_component.numwords_a = (1<<DEPTH_W),
     altsyncram_component.numwords_b = (1<<DEPTH_W),
     altsyncram_component.operation_mode = "BIDIR_DUAL_PORT",
     altsyncram_component.outdata_aclr_a = "NONE",
     altsyncram_component.outdata_aclr_b = "NONE",
     altsyncram_component.outdata_reg_a = "UNREGISTERED",
     altsyncram_component.outdata_reg_b = "UNREGISTERED",
     altsyncram_component.power_up_uninitialized = "FALSE",
     altsyncram_component.read_during_write_mode_port_a = "OLD_DATA",
     altsyncram_component.read_during_write_mode_port_b = "OLD_DATA",
     altsyncram_component.widthad_a = DEPTH_W,
     altsyncram_component.widthad_b = DEPTH_W,
     altsyncram_component.width_a = DATA_W,
     altsyncram_component.width_b = DATA_W,
     altsyncram_component.width_byteena_a = 1,
     altsyncram_component.width_byteena_b = 1,
     altsyncram_component.wrcontrol_wraddress_reg_b = "CLOCK1";

     end
    endgenerate
endmodule

