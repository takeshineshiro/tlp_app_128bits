library verilog;
use verilog.vl_types.all;
entity ict106_axic_sample_cycle_ratio is
    generic(
        C_RATIO         : integer := 2
    );
    port(
        SLOW_ACLK       : in     vl_logic;
        FAST_ACLK       : in     vl_logic;
        SAMPLE_CYCLE_EARLY: out    vl_logic;
        SAMPLE_CYCLE    : out    vl_logic
    );
end ict106_axic_sample_cycle_ratio;
