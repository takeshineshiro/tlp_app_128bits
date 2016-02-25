library verilog;
use verilog.vl_types.all;
entity ict106_b_downsizer is
    generic(
        C_FAMILY        : string  := "none";
        C_AXI_ID_WIDTH  : integer := 4;
        C_AXI_SUPPORTS_USER_SIGNALS: integer := 0;
        C_AXI_BUSER_WIDTH: integer := 1
    );
    port(
        ARESET          : in     vl_logic;
        ACLK            : in     vl_logic;
        cmd_valid       : in     vl_logic;
        cmd_split       : in     vl_logic;
        cmd_repeat      : in     vl_logic_vector(3 downto 0);
        cmd_ready       : out    vl_logic;
        S_AXI_BID       : out    vl_logic_vector;
        S_AXI_BRESP     : out    vl_logic_vector(1 downto 0);
        S_AXI_BUSER     : out    vl_logic_vector;
        S_AXI_BVALID    : out    vl_logic;
        S_AXI_BREADY    : in     vl_logic;
        M_AXI_BID       : in     vl_logic_vector;
        M_AXI_BRESP     : in     vl_logic_vector(1 downto 0);
        M_AXI_BUSER     : in     vl_logic_vector;
        M_AXI_BVALID    : in     vl_logic;
        M_AXI_BREADY    : out    vl_logic
    );
end ict106_b_downsizer;
