library verilog;
use verilog.vl_types.all;
entity ict106_axic_sync_clock_converter is
    generic(
        C_FAMILY        : string  := "virtex6";
        C_PAYLOAD_WIDTH : integer := 32;
        C_S_ACLK_RATIO  : integer := 1;
        C_M_ACLK_RATIO  : integer := 1;
        C_MODE          : integer := 0
    );
    port(
        SAMPLE_CYCLE_EARLY: in     vl_logic;
        SAMPLE_CYCLE    : in     vl_logic;
        S_ACLK          : in     vl_logic;
        S_ARESET        : in     vl_logic;
        S_PAYLOAD       : in     vl_logic_vector;
        S_VALID         : in     vl_logic;
        S_READY         : out    vl_logic;
        M_ACLK          : in     vl_logic;
        M_ARESET        : in     vl_logic;
        M_PAYLOAD       : out    vl_logic_vector;
        M_VALID         : out    vl_logic;
        M_READY         : in     vl_logic
    );
end ict106_axic_sync_clock_converter;
