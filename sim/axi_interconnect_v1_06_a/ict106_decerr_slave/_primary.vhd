library verilog;
use verilog.vl_types.all;
entity ict106_decerr_slave is
    generic(
        C_AXI_ID_WIDTH  : integer := 1;
        C_AXI_DATA_WIDTH: integer := 32;
        C_AXI_BUSER_WIDTH: integer := 1;
        C_AXI_RUSER_WIDTH: integer := 1
    );
    port(
        S_AXI_ACLK      : in     vl_logic;
        S_AXI_ARESET    : in     vl_logic;
        S_AXI_AWID      : in     vl_logic_vector;
        S_AXI_AWVALID   : in     vl_logic;
        S_AXI_AWREADY   : out    vl_logic;
        S_AXI_WLAST     : in     vl_logic;
        S_AXI_WVALID    : in     vl_logic;
        S_AXI_WREADY    : out    vl_logic;
        S_AXI_BID       : out    vl_logic_vector;
        S_AXI_BRESP     : out    vl_logic_vector(1 downto 0);
        S_AXI_BUSER     : out    vl_logic_vector;
        S_AXI_BVALID    : out    vl_logic;
        S_AXI_BREADY    : in     vl_logic;
        S_AXI_ARID      : in     vl_logic_vector;
        S_AXI_ARLEN     : in     vl_logic_vector(7 downto 0);
        S_AXI_ARVALID   : in     vl_logic;
        S_AXI_ARREADY   : out    vl_logic;
        S_AXI_RID       : out    vl_logic_vector;
        S_AXI_RDATA     : out    vl_logic_vector;
        S_AXI_RRESP     : out    vl_logic_vector(1 downto 0);
        S_AXI_RUSER     : out    vl_logic_vector;
        S_AXI_RLAST     : out    vl_logic;
        S_AXI_RVALID    : out    vl_logic;
        S_AXI_RREADY    : in     vl_logic
    );
end ict106_decerr_slave;
