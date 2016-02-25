library verilog;
use verilog.vl_types.all;
entity comparator_sel_static is
    generic(
        C_FAMILY        : string  := "virtex6";
        C_VALUE         : integer := 0;
        C_DATA_WIDTH    : integer := 4
    );
    port(
        CIN             : in     vl_logic;
        S               : in     vl_logic;
        A               : in     vl_logic_vector;
        B               : in     vl_logic_vector;
        COUT            : out    vl_logic
    );
end comparator_sel_static;
