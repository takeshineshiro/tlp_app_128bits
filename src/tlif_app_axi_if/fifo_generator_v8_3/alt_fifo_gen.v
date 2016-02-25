// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on

module alt_fifo_gen #(
parameter         DEVICE_FAMILY     = "Stratix IV",
parameter integer C_FIFO_DEPTH_LOG  = 9,
parameter integer C_FIFO_WIDTH      = 256
)(
	aclr,
	data,
	rdclk,
	rdreq,
	wrclk,
	wrreq,
	q,
	rdempty,
	wrfull);

	input	  aclr;
	input	[C_FIFO_WIDTH-1:0]  data;
	input	  rdclk;
	input	  rdreq;
	input	  wrclk;
	input	  wrreq;
	output	[C_FIFO_WIDTH-1:0]  q;
	output	  rdempty;
	output	  wrfull;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	  aclr;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

        localparam 	lpm_numwords             = (1<<C_FIFO_DEPTH_LOG);

	wire  sub_wire0;
	wire [C_FIFO_WIDTH-1:0] sub_wire1;
	wire  sub_wire2;
	wire  wrfull = sub_wire0;
	wire [C_FIFO_WIDTH-1:0] q = sub_wire1[C_FIFO_WIDTH-1:0];
	wire  rdempty = sub_wire2;

	dcfifo	dcfifo_component (
				.rdclk (rdclk),
				.wrclk (wrclk),
				.wrreq (wrreq),
				.aclr (aclr),
				.data (data),
				.rdreq (rdreq),
				.wrfull (sub_wire0),
				.q (sub_wire1),
				.rdempty (sub_wire2),
				.rdfull (),
				.rdusedw (),
				.wrempty (),
				.wrusedw ());
	defparam
		dcfifo_component.intended_device_family = DEVICE_FAMILY,
		dcfifo_component.lpm_numwords = lpm_numwords,
		dcfifo_component.lpm_showahead = "ON",
		dcfifo_component.lpm_type = "dcfifo",
		dcfifo_component.lpm_width = C_FIFO_WIDTH,
		dcfifo_component.lpm_widthu = C_FIFO_DEPTH_LOG,
		dcfifo_component.overflow_checking = "ON",
		dcfifo_component.rdsync_delaypipe = 4,
		dcfifo_component.underflow_checking = "ON",
		dcfifo_component.use_eab = "ON",
		dcfifo_component.write_aclr_synch = "OFF",
		dcfifo_component.wrsync_delaypipe = 4;


endmodule
