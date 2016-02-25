library verilog;
use verilog.vl_types.all;
entity ict106_splitter is
    generic(
        C_NUM_M         : integer := 2
    );
    port(
        ACLK            : in     vl_logic;
        ARESET          : in     vl_logic;
        S_VALID         : in     vl_logic;
        S_READY         : out    vl_logic;
        M_VALID         : out    vl_logic_vector;
        M_READY         : in     vl_logic_vector
    );
end ict106_splitter;
