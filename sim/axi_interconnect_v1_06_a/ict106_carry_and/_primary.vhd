library verilog;
use verilog.vl_types.all;
entity ict106_carry_and is
    generic(
        C_FAMILY        : string  := "virtex6"
    );
    port(
        CIN             : in     vl_logic;
        S               : in     vl_logic;
        COUT            : out    vl_logic
    );
end ict106_carry_and;
