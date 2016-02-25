library verilog;
use verilog.vl_types.all;
entity ict106_r_axi3_conv is
    generic(
        C_FAMILY        : string  := "none";
        C_AXI_ID_WIDTH  : integer := 1;
        C_AXI_ADDR_WIDTH: integer := 32;
        C_AXI_DATA_WIDTH: integer := 32;
        C_AXI_SUPPORTS_USER_SIGNALS: integer := 0;
        C_AXI_RUSER_WIDTH: integer := 1;
        C_SUPPORT_SPLITTING: integer := 1;
        C_SUPPORT_BURSTS: integer := 1
    );
    port(
        ACLK            : in     vl_logic;
        ARESET          : in     vl_logic;
        cmd_valid       : in     vl_logic;
        cmd_split       : in     vl_logic;
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
end ict106_r_axi3_conv;
