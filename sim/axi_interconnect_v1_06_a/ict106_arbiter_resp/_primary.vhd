library verilog;
use verilog.vl_types.all;
entity ict106_arbiter_resp is
    generic(
        C_FAMILY        : string  := "none";
        C_NUM_S         : integer := 4;
        C_NUM_S_LOG     : integer := 2;
        C_GRANT_ENC     : integer := 0;
        C_GRANT_HOT     : integer := 1
    );
    port(
        ACLK            : in     vl_logic;
        ARESET          : in     vl_logic;
        S_VALID         : in     vl_logic_vector;
        S_READY         : out    vl_logic_vector;
        M_GRANT_ENC     : out    vl_logic_vector;
        M_GRANT_HOT     : out    vl_logic_vector;
        M_VALID         : out    vl_logic;
        M_READY         : in     vl_logic
    );
end ict106_arbiter_resp;
