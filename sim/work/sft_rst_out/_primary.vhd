library verilog;
use verilog.vl_types.all;
entity sft_rst_out is
    port(
        sft_rst_out     : out    vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        s_rst_reg       : in     vl_logic
    );
end sft_rst_out;
