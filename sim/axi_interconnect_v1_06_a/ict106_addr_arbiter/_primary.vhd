library verilog;
use verilog.vl_types.all;
entity ict106_addr_arbiter is
    generic(
        C_MAX_S         : integer := 16;
        C_FAMILY        : string  := "none";
        C_NUM_S         : integer := 1;
        C_NUM_S_LOG     : integer := 1;
        C_NUM_M         : integer := 1;
        C_MESG_WIDTH    : integer := 1
    );
    port(
        ACLK            : in     vl_logic;
        ARESET          : in     vl_logic;
        S_MESG          : in     vl_logic_vector;
        S_TARGET_HOT    : in     vl_logic_vector;
        S_VALID         : in     vl_logic_vector;
        S_VALID_QUAL    : in     vl_logic_vector;
        S_READY         : out    vl_logic_vector;
        M_MESG          : out    vl_logic_vector;
        M_TARGET_HOT    : out    vl_logic_vector;
        M_GRANT_ENC     : out    vl_logic_vector;
        M_VALID         : out    vl_logic;
        M_READY         : in     vl_logic;
        ISSUING_LIMIT   : in     vl_logic_vector
    );
end ict106_addr_arbiter;
