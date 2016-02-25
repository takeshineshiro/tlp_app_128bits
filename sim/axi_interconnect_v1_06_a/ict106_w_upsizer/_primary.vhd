library verilog;
use verilog.vl_types.all;
entity ict106_w_upsizer is
    generic(
        C_FAMILY        : string  := "rtl";
        C_S_AXI_DATA_WIDTH: integer := 32;
        C_M_AXI_DATA_WIDTH: integer := 64;
        C_M_AXI_REGISTER: integer := 0;
        C_AXI_SUPPORTS_USER_SIGNALS: integer := 0;
        C_AXI_WUSER_WIDTH: integer := 1;
        C_PACKING_LEVEL : integer := 1;
        C_SUPPORT_BURSTS: integer := 1;
        C_S_AXI_BYTES_LOG: integer := 3;
        C_M_AXI_BYTES_LOG: integer := 3;
        C_RATIO         : integer := 2;
        C_RATIO_LOG     : integer := 1
    );
    port(
        ARESET          : in     vl_logic;
        ACLK            : in     vl_logic;
        cmd_valid       : in     vl_logic;
        cmd_fix         : in     vl_logic;
        cmd_modified    : in     vl_logic;
        cmd_complete_wrap: in     vl_logic;
        cmd_packed_wrap : in     vl_logic;
        cmd_first_word  : in     vl_logic_vector;
        cmd_next_word   : in     vl_logic_vector;
        cmd_last_word   : in     vl_logic_vector;
        cmd_offset      : in     vl_logic_vector;
        cmd_mask        : in     vl_logic_vector;
        cmd_step        : in     vl_logic_vector;
        cmd_length      : in     vl_logic_vector(7 downto 0);
        cmd_ready       : out    vl_logic;
        S_AXI_WDATA     : in     vl_logic_vector;
        S_AXI_WSTRB     : in     vl_logic_vector;
        S_AXI_WLAST     : in     vl_logic;
        S_AXI_WUSER     : in     vl_logic_vector;
        S_AXI_WVALID    : in     vl_logic;
        S_AXI_WREADY    : out    vl_logic;
        M_AXI_WDATA     : out    vl_logic_vector;
        M_AXI_WSTRB     : out    vl_logic_vector;
        M_AXI_WLAST     : out    vl_logic;
        M_AXI_WUSER     : out    vl_logic_vector;
        M_AXI_WVALID    : out    vl_logic;
        M_AXI_WREADY    : in     vl_logic
    );
end ict106_w_upsizer;
