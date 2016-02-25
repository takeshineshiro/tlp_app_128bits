
module signaltap (
	clk,
	data,
        dout);

        parameter DATA_W = 256;
	parameter DATA_W_CNT = 9; // log2(DATA_W) + 1 {129~256 -> 9}
	parameter DEPTH_W = 10;
	localparam DEPTH = (1 << DEPTH_W);
	input	clk;
	input	[DATA_W-1:0]  data;
	output  dout;

	sld_signaltap	sld_signaltap_component (
				.acq_clk (clk),
				.acq_data_in (data),
				.acq_trigger_in (data),
			        .trigger_out (dout));
	defparam
		sld_signaltap_component.SLD_ADVANCED_TRIGGER_ENTITY = "basic,1,",
		sld_signaltap_component.SLD_DATA_BITS = DATA_W,
		sld_signaltap_component.SLD_DATA_BIT_CNTR_BITS = DATA_W_CNT,
		sld_signaltap_component.SLD_ENABLE_ADVANCED_TRIGGER = 0,
		sld_signaltap_component.SLD_MEM_ADDRESS_BITS = DEPTH_W,
		sld_signaltap_component.SLD_NODE_INFO = 1076736,		
		sld_signaltap_component.SLD_RAM_BLOCK_TYPE = "Auto",
		sld_signaltap_component.SLD_SAMPLE_DEPTH = DEPTH,
		sld_signaltap_component.SLD_STORAGE_QUALIFIER_GAP_RECORD = 0,
		sld_signaltap_component.SLD_STORAGE_QUALIFIER_MODE = "OFF",
		sld_signaltap_component.SLD_TRIGGER_BITS = DATA_W,
		sld_signaltap_component.SLD_TRIGGER_IN_ENABLED = 0,
		sld_signaltap_component.SLD_TRIGGER_LEVEL = 1,
		sld_signaltap_component.SLD_TRIGGER_LEVEL_PIPELINE = 1;


endmodule

