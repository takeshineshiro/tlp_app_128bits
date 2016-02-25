library verilog;
use verilog.vl_types.all;
entity ict106_addr_arbiter_sasd is
    generic(
        C_MAX_S         : integer := 16;
        C_FAMILY        : string  := "none";
        C_NUM_S         : integer := 1;
        C_NUM_S_LOG     : integer := 1;
        C_AMESG_WIDTH   : integer := 1;
        C_GRANT_ENC     : integer := 0
    );
    port(
        ACLK            : in     vl_logic;
        ARESET          : in     vl_logic;
        S_AWMESG        : in     vl_logic_vector;
        S_ARMESG        : in     vl_logic_vector;
        S_AWVALID       : in     vl_logic_vector;
        S_AWREADY       : out    vl_logic_vector;
        S_ARVALID       : in     vl_logic_vector;
        S_ARREADY       : out    vl_logic_vector;
        M_AMESG         : out    vl_logic_vector;
        M_GRANT_ENC     : out    vl_logic_vector;
        M_GRANT_HOT     : out    vl_logic_vector;
        M_GRANT_RNW     : out    vl_logic;
        M_GRANT_ANY     : out    vl_logic;
        M_AWVALID       : out    vl_logic;
        M_AWREADY       : in     vl_logic;
        M_ARVALID       : out    vl_logic;
        M_ARREADY       : in     vl_logic
    );
end ict106_addr_arbiter_sasd;
