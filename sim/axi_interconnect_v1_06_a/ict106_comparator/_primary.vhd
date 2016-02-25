library verilog;
use verilog.vl_types.all;
entity ict106_comparator is
    generic(
        C_FAMILY        : string  := "virtex6";
        C_DATA_WIDTH    : integer := 4
    );
    port(
        CIN             : in     vl_logic;
        A               : in     vl_logic_vector;
        B               : in     vl_logic_vector;
        COUT            : out    vl_logic
    );
end ict106_comparator;
