library verilog;
use verilog.vl_types.all;
entity ict106_mux is
    generic(
        C_FAMILY        : string  := "rtl";
        C_SEL_WIDTH     : integer := 4;
        C_DATA_WIDTH    : integer := 2
    );
    port(
        S               : in     vl_logic_vector;
        A               : in     vl_logic_vector;
        O               : out    vl_logic_vector
    );
end ict106_mux;
