library verilog;
use verilog.vl_types.all;
entity ict106_w_downsizer is
    generic(
        C_FAMILY        : string  := "none";
        C_AXI_ID_WIDTH  : integer := 4;
        C_S_AXI_DATA_WIDTH: integer := 64;
        C_M_AXI_DATA_WIDTH: integer := 32;
        C_AXI_SUPPORTS_USER_SIGNALS: integer := 0;
        C_AXI_WUSER_WIDTH: integer := 1;
        C_SUPPORT_SPLITTING: integer := 1;
        C_SUPPORT_BURSTS: integer := 1;
        C_SINGLE_THREAD : integer := 1;
        C_S_AXI_BYTES_LOG: integer := 3;
        C_M_AXI_BYTES_LOG: integer := 2;
        C_RATIO_LOG     : integer := 1
    );
    port(
        ARESET          : in     vl_logic;
        ACLK            : in     vl_logic;
        cmd_valid       : in     vl_logic;
        cmd_mirror      : in     vl_logic;
        cmd_fix         : in     vl_logic;
        cmd_first_word  : in     vl_logic_vector;
        cmd_offset      : in     vl_logic_vector;
        cmd_mask        : in     vl_logic_vector;
        cmd_step        : in     vl_logic_vector;
        cmd_size        : in     vl_logic_vector(2 downto 0);
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
end ict106_w_downsizer;
