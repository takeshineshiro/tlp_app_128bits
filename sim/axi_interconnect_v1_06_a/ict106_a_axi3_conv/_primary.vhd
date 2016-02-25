library verilog;
use verilog.vl_types.all;
entity ict106_a_axi3_conv is
    generic(
        C_FAMILY        : string  := "none";
        C_AXI_ID_WIDTH  : integer := 1;
        C_AXI_ADDR_WIDTH: integer := 32;
        C_AXI_DATA_WIDTH: integer := 32;
        C_AXI_SUPPORTS_USER_SIGNALS: integer := 0;
        C_AXI_AUSER_WIDTH: integer := 1;
        C_AXI_CHANNEL   : integer := 0;
        C_SUPPORT_SPLITTING: integer := 1;
        C_SUPPORT_BURSTS: integer := 1;
        C_SINGLE_THREAD : integer := 1
    );
    port(
        ACLK            : in     vl_logic;
        ARESET          : in     vl_logic;
        cmd_valid       : out    vl_logic;
        cmd_split       : out    vl_logic;
        cmd_id          : out    vl_logic_vector;
        cmd_length      : out    vl_logic_vector(3 downto 0);
        cmd_ready       : in     vl_logic;
        cmd_b_valid     : out    vl_logic;
        cmd_b_split     : out    vl_logic;
        cmd_b_repeat    : out    vl_logic_vector(3 downto 0);
        cmd_b_ready     : in     vl_logic;
        S_AXI_AID       : in     vl_logic_vector;
        S_AXI_AADDR     : in     vl_logic_vector;
        S_AXI_ALEN      : in     vl_logic_vector(7 downto 0);
        S_AXI_ASIZE     : in     vl_logic_vector(2 downto 0);
        S_AXI_ABURST    : in     vl_logic_vector(1 downto 0);
        S_AXI_ALOCK     : in     vl_logic_vector(1 downto 0);
        S_AXI_ACACHE    : in     vl_logic_vector(3 downto 0);
        S_AXI_APROT     : in     vl_logic_vector(2 downto 0);
        S_AXI_AQOS      : in     vl_logic_vector(3 downto 0);
        S_AXI_AUSER     : in     vl_logic_vector;
        S_AXI_AVALID    : in     vl_logic;
        S_AXI_AREADY    : out    vl_logic;
        M_AXI_AID       : out    vl_logic_vector;
        M_AXI_AADDR     : out    vl_logic_vector;
        M_AXI_ALEN      : out    vl_logic_vector(7 downto 0);
        M_AXI_ASIZE     : out    vl_logic_vector(2 downto 0);
        M_AXI_ABURST    : out    vl_logic_vector(1 downto 0);
        M_AXI_ALOCK     : out    vl_logic_vector(1 downto 0);
        M_AXI_ACACHE    : out    vl_logic_vector(3 downto 0);
        M_AXI_APROT     : out    vl_logic_vector(2 downto 0);
        M_AXI_AREGION   : out    vl_logic_vector(3 downto 0);
        M_AXI_AQOS      : out    vl_logic_vector(3 downto 0);
        M_AXI_AUSER     : out    vl_logic_vector;
        M_AXI_AVALID    : out    vl_logic;
        M_AXI_AREADY    : in     vl_logic
    );
end ict106_a_axi3_conv;
