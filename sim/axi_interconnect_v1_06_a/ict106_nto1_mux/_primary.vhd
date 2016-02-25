library verilog;
use verilog.vl_types.all;
entity ict106_nto1_mux is
    generic(
        C_RATIO         : integer := 1;
        C_SEL_WIDTH     : integer := 1;
        C_DATAOUT_WIDTH : integer := 1;
        C_ONEHOT        : integer := 0
    );
    port(
        SEL_ONEHOT      : in     vl_logic_vector;
        SEL             : in     vl_logic_vector;
        \IN\            : in     vl_logic_vector;
        \OUT\           : out    vl_logic_vector
    );
end ict106_nto1_mux;
