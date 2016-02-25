library verilog;
use verilog.vl_types.all;
entity ict106_mux_enc is
    generic(
        C_FAMILY        : string  := "rtl";
        C_RATIO         : integer := 4;
        C_SEL_WIDTH     : integer := 2;
        C_DATA_WIDTH    : integer := 1
    );
    port(
        S               : in     vl_logic_vector;
        A               : in     vl_logic_vector;
        O               : out    vl_logic_vector;
        OE              : in     vl_logic
    );
end ict106_mux_enc;
