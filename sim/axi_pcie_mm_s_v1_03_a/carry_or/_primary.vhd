library verilog;
use verilog.vl_types.all;
entity carry_or is
    generic(
        C_FAMILY        : string  := "virtex6"
    );
    port(
        CIN             : in     vl_logic;
        S               : in     vl_logic;
        COUT            : out    vl_logic
    );
end carry_or;
