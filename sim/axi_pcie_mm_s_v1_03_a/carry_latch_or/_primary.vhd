library verilog;
use verilog.vl_types.all;
entity carry_latch_or is
    generic(
        C_FAMILY        : string  := "virtex6"
    );
    port(
        CIN             : in     vl_logic;
        I               : in     vl_logic;
        O               : out    vl_logic
    );
end carry_latch_or;
