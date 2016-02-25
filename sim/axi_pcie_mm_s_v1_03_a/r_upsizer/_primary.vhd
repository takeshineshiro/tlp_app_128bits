library verilog;
use verilog.vl_types.all;
entity r_upsizer is
    generic(
        C_FAMILY        : string  := "rtl";
        C_AXI_ID_WIDTH  : integer := 4;
        C_S_AXI_DATA_WIDTH: integer := 32;
        C_M_AXI_DATA_WIDTH: integer := 64;
        C_S_AXI_REGISTER: integer := 0;
        C_AXI_SUPPORTS_USER_SIGNALS: integer := 0;
        C_AXI_RUSER_WIDTH: integer := 1;
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
        S_AXI_RID       : out    vl_logic_vector;
        S_AXI_RDATA     : out    vl_logic_vector;
        S_AXI_RRESP     : out    vl_logic_vector(1 downto 0);
        S_AXI_RLAST     : out    vl_logic;
        S_AXI_RUSER     : out    vl_logic_vector;
        S_AXI_RVALID    : out    vl_logic;
        S_AXI_RREADY    : in     vl_logic;
        M_AXI_RID       : in     vl_logic_vector;
        M_AXI_RDATA     : in     vl_logic_vector;
        M_AXI_RRESP     : in     vl_logic_vector(1 downto 0);
        M_AXI_RLAST     : in     vl_logic;
        M_AXI_RUSER     : in     vl_logic_vector;
        M_AXI_RVALID    : in     vl_logic;
        M_AXI_RREADY    : out    vl_logic
    );
end r_upsizer;
