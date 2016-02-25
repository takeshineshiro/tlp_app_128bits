// -- (c) Copyright 1995 - 2011 Xilinx, Inc. All rights reserved.
// --
// -- This file contains confidential and proprietary information
// -- of Xilinx, Inc. and is protected under U.S. and 
// -- international copyright and other intellectual property
// -- laws.
// --
// -- DISCLAIMER
// -- This disclaimer is not a license and does not grant any
// -- rights to the materials distributed herewith. Except as
// -- otherwise provided in a valid license issued to you by
// -- Xilinx, and to the maximum extent permitted by applicable
// -- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// -- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// -- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// -- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// -- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// -- (2) Xilinx shall not be liable (whether in contract or tort,
// -- including negligence, or under any other theory of
// -- liability) for any loss or damage of any kind or nature
// -- related to, arising under or in connection with these
// -- materials, including for any direct, or any indirect,
// -- special, incidental, or consequential loss or damage
// -- (including loss of data, profits, goodwill, or any type of
// -- loss or damage suffered as a result of any action brought
// -- by a third party) even if such damage or loss was
// -- reasonably foreseeable or Xilinx had been advised of the
// -- possibility of the same.
// --
// -- CRITICAL APPLICATIONS
// -- Xilinx products are not designed or intended to be fail-
// -- safe, or for use in any application requiring fail-safe
// -- performance, such as life-support or safety devices or
// -- systems, Class III medical devices, nuclear facilities,
// -- applications related to the deployment of airbags, or any
// -- other applications that could lead to death, personal
// -- injury, or severe property or environmental damage
// -- (individually and collectively, "Critical
// -- Applications"). Customer assumes the sole risk and
// -- liability of any use of Xilinx products in Critical
// -- Applications, subject only to applicable laws and
// -- regulations governing limitations on product liability.
// --
// -- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// -- PART OF THIS FILE AT ALL TIMES.
//-----------------------------------------------------------------------

// The synthesis directives "translate_off/translate_on" specified below are
// supported by Xilinx, Mentor Graphics and Synplicity synthesis
// tools. Ensure they are correct for your synthesis tool(s).

// You must compile the fifo_generator wrapper file when simulating
// the core. When compiling the wrapper file, be sure to
// reference the XilinxCoreLib Verilog simulation library. For detailed
// instructions, please refer to the "CORE Generator Help".

`timescale 1ps/1ps

module ict106_fifo_gen #(
parameter C_FAMILY          = "virtex6",
parameter integer C_COMMON_CLOCK    = 1,
parameter integer C_FIFO_DEPTH_LOG  = 5,
parameter integer C_FIFO_WIDTH      = 64,
parameter C_FIFO_TYPE       = "lut"
)(
  clk,
  rst,
  wr_clk,
  wr_en,
  wr_ready,
  wr_data,
  rd_clk,
  rd_en,
  rd_valid,
  rd_data);


input clk;
input wr_clk;
input rd_clk;
input rst;
input [C_FIFO_WIDTH-1 : 0] wr_data;
input wr_en;
input rd_en;
output [C_FIFO_WIDTH-1 : 0] rd_data;
output wr_ready;
output rd_valid;

wire  full;
wire  empty;
wire  rd_valid = ~empty;
wire  wr_ready = ~full;

wire  rdclk;
wire  wrclk;

generate

if (C_COMMON_CLOCK == 1) begin : gen_sync_clk
      	assign rdclk = clk;
      	assign wrclk = clk;
end
else begin : gen_async_clk
      	assign rdclk = rd_clk;
      	assign wrclk = wr_clk;
end

	alt_fifo_gen #(
		.DEVICE_FAMILY		("Stratix IV"),
                .C_FIFO_DEPTH_LOG	(C_FIFO_DEPTH_LOG),
		.C_FIFO_WIDTH		(C_FIFO_WIDTH))
	Inst_alt_fifo_gen (
		.aclr		(rst),
		.data		(wr_data),
		.rdclk		(rdclk),
		.rdreq		(rd_en),
		.wrclk		(wrclk),
		.wrreq		(wr_en),
		.q		(rd_data),
		.rdempty	(empty),
		.wrfull		(full));

endgenerate

endmodule

