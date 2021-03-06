library verilog;
use verilog.vl_types.all;
entity ict106_axi_crossbar is
    generic(
        C_MAX_S         : integer := 16;
        C_MAX_M         : integer := 16;
        C_NUM_ADDR_RANGES: integer := 16;
        C_FAMILY        : string  := "rtl";
        C_NUM_SLAVE_SLOTS: integer := 1;
        C_NUM_MASTER_SLOTS: integer := 1;
        C_AXI_ID_WIDTH  : integer := 1;
        C_AXI_ADDR_WIDTH: integer := 32;
        C_INTERCONNECT_DATA_WIDTH: integer := 32;
        C_AXI_DATA_MAX_WIDTH: integer := 32;
        C_AXI_SUPPORTS_USER_SIGNALS: integer := 0;
        C_AXI_AWUSER_WIDTH: integer := 1;
        C_AXI_ARUSER_WIDTH: integer := 1;
        C_AXI_WUSER_WIDTH: integer := 1;
        C_AXI_RUSER_WIDTH: integer := 1;
        C_AXI_BUSER_WIDTH: integer := 1;
        C_INTERCONNECT_R_REGISTER: integer := 0;
        C_USE_CTRL_PORT : integer := 0;
        C_USE_INTERRUPT : integer := 1;
        C_RANGE_CHECK   : integer := 2;
        C_ADDR_DECODE   : integer := 0;
        C_S_AXI_CTRL_ADDR_WIDTH: integer := 32;
        C_S_AXI_CTRL_DATA_WIDTH: integer := 32;
        C_INTERCONNECT_CONNECTIVITY_MODE: integer := 1;
        C_DEBUG         : integer := 1;
        C_MAX_DEBUG_THREADS: integer := 1
    );
    port(
        INTERCONNECT_ACLK: in     vl_logic;
        ARESETN         : in     vl_logic;
        IRQ             : out    vl_logic;
        S_AXI_AWID      : in     vl_logic_vector;
        S_AXI_AWADDR    : in     vl_logic_vector;
        S_AXI_AWLEN     : in     vl_logic_vector;
        S_AXI_AWSIZE    : in     vl_logic_vector;
        S_AXI_AWBURST   : in     vl_logic_vector;
        S_AXI_AWLOCK    : in     vl_logic_vector;
        S_AXI_AWCACHE   : in     vl_logic_vector;
        S_AXI_AWPROT    : in     vl_logic_vector;
        S_AXI_AWQOS     : in     vl_logic_vector;
        S_AXI_AWUSER    : in     vl_logic_vector;
        S_AXI_AWVALID   : in     vl_logic_vector;
        S_AXI_AWREADY   : out    vl_logic_vector;
        S_AXI_WDATA     : in     vl_logic_vector;
        S_AXI_WSTRB     : in     vl_logic_vector;
        S_AXI_WLAST     : in     vl_logic_vector;
        S_AXI_WUSER     : in     vl_logic_vector;
        S_AXI_WVALID    : in     vl_logic_vector;
        S_AXI_WREADY    : out    vl_logic_vector;
        S_AXI_BID       : out    vl_logic_vector;
        S_AXI_BRESP     : out    vl_logic_vector;
        S_AXI_BUSER     : out    vl_logic_vector;
        S_AXI_BVALID    : out    vl_logic_vector;
        S_AXI_BREADY    : in     vl_logic_vector;
        S_AXI_ARID      : in     vl_logic_vector;
        S_AXI_ARADDR    : in     vl_logic_vector;
        S_AXI_ARLEN     : in     vl_logic_vector;
        S_AXI_ARSIZE    : in     vl_logic_vector;
        S_AXI_ARBURST   : in     vl_logic_vector;
        S_AXI_ARLOCK    : in     vl_logic_vector;
        S_AXI_ARCACHE   : in     vl_logic_vector;
        S_AXI_ARPROT    : in     vl_logic_vector;
        S_AXI_ARQOS     : in     vl_logic_vector;
        S_AXI_ARUSER    : in     vl_logic_vector;
        S_AXI_ARVALID   : in     vl_logic_vector;
        S_AXI_ARREADY   : out    vl_logic_vector;
        S_AXI_RID       : out    vl_logic_vector;
        S_AXI_RDATA     : out    vl_logic_vector;
        S_AXI_RRESP     : out    vl_logic_vector;
        S_AXI_RLAST     : out    vl_logic_vector;
        S_AXI_RUSER     : out    vl_logic_vector;
        S_AXI_RVALID    : out    vl_logic_vector;
        S_AXI_RREADY    : in     vl_logic_vector;
        M_AXI_AWID      : out    vl_logic_vector;
        M_AXI_AWADDR    : out    vl_logic_vector;
        M_AXI_AWLEN     : out    vl_logic_vector;
        M_AXI_AWSIZE    : out    vl_logic_vector;
        M_AXI_AWBURST   : out    vl_logic_vector;
        M_AXI_AWLOCK    : out    vl_logic_vector;
        M_AXI_AWCACHE   : out    vl_logic_vector;
        M_AXI_AWPROT    : out    vl_logic_vector;
        M_AXI_AWREGION  : out    vl_logic_vector;
        M_AXI_AWQOS     : out    vl_logic_vector;
        M_AXI_AWUSER    : out    vl_logic_vector;
        M_AXI_AWVALID   : out    vl_logic_vector;
        M_AXI_AWREADY   : in     vl_logic_vector;
        M_AXI_WDATA     : out    vl_logic_vector;
        M_AXI_WSTRB     : out    vl_logic_vector;
        M_AXI_WLAST     : out    vl_logic_vector;
        M_AXI_WUSER     : out    vl_logic_vector;
        M_AXI_WVALID    : out    vl_logic_vector;
        M_AXI_WREADY    : in     vl_logic_vector;
        M_AXI_BID       : in     vl_logic_vector;
        M_AXI_BRESP     : in     vl_logic_vector;
        M_AXI_BUSER     : in     vl_logic_vector;
        M_AXI_BVALID    : in     vl_logic_vector;
        M_AXI_BREADY    : out    vl_logic_vector;
        M_AXI_ARID      : out    vl_logic_vector;
        M_AXI_ARADDR    : out    vl_logic_vector;
        M_AXI_ARLEN     : out    vl_logic_vector;
        M_AXI_ARSIZE    : out    vl_logic_vector;
        M_AXI_ARBURST   : out    vl_logic_vector;
        M_AXI_ARLOCK    : out    vl_logic_vector;
        M_AXI_ARCACHE   : out    vl_logic_vector;
        M_AXI_ARPROT    : out    vl_logic_vector;
        M_AXI_ARREGION  : out    vl_logic_vector;
        M_AXI_ARQOS     : out    vl_logic_vector;
        M_AXI_ARUSER    : out    vl_logic_vector;
        M_AXI_ARVALID   : out    vl_logic_vector;
        M_AXI_ARREADY   : in     vl_logic_vector;
        M_AXI_RID       : in     vl_logic_vector;
        M_AXI_RDATA     : in     vl_logic_vector;
        M_AXI_RRESP     : in     vl_logic_vector;
        M_AXI_RLAST     : in     vl_logic_vector;
        M_AXI_RUSER     : in     vl_logic_vector;
        M_AXI_RVALID    : in     vl_logic_vector;
        M_AXI_RREADY    : out    vl_logic_vector;
        S_AXI_CTRL_AWADDR: in     vl_logic_vector;
        S_AXI_CTRL_AWVALID: in     vl_logic;
        S_AXI_CTRL_AWREADY: out    vl_logic;
        S_AXI_CTRL_WDATA: in     vl_logic_vector;
        S_AXI_CTRL_WVALID: in     vl_logic;
        S_AXI_CTRL_WREADY: out    vl_logic;
        S_AXI_CTRL_BRESP: out    vl_logic_vector(1 downto 0);
        S_AXI_CTRL_BVALID: out    vl_logic;
        S_AXI_CTRL_BREADY: in     vl_logic;
        S_AXI_CTRL_ARADDR: in     vl_logic_vector;
        S_AXI_CTRL_ARVALID: in     vl_logic;
        S_AXI_CTRL_ARREADY: out    vl_logic;
        S_AXI_CTRL_RDATA: out    vl_logic_vector;
        S_AXI_CTRL_RRESP: out    vl_logic_vector(1 downto 0);
        S_AXI_CTRL_RVALID: out    vl_logic;
        S_AXI_CTRL_RREADY: in     vl_logic;
        DEBUG_AW_TRANS_SEQ: out    vl_logic_vector(7 downto 0);
        DEBUG_AW_TRANS_QUAL: out    vl_logic_vector;
        DEBUG_AW_ACCEPT_CNT: out    vl_logic_vector;
        DEBUG_AW_ACTIVE_THREAD: out    vl_logic_vector;
        DEBUG_AW_ACTIVE_TARGET: out    vl_logic_vector;
        DEBUG_AW_ACTIVE_REGION: out    vl_logic_vector;
        DEBUG_AW_ERROR  : out    vl_logic_vector;
        DEBUG_AW_TARGET : out    vl_logic_vector;
        DEBUG_AW_ISSUING_CNT: out    vl_logic_vector;
        DEBUG_AW_ARB_GRANT: out    vl_logic_vector(7 downto 0);
        DEBUG_B_TRANS_SEQ: out    vl_logic_vector;
        DEBUG_AR_TRANS_SEQ: out    vl_logic_vector(7 downto 0);
        DEBUG_AR_TRANS_QUAL: out    vl_logic_vector;
        DEBUG_AR_ACCEPT_CNT: out    vl_logic_vector;
        DEBUG_AR_ACTIVE_THREAD: out    vl_logic_vector;
        DEBUG_AR_ACTIVE_TARGET: out    vl_logic_vector;
        DEBUG_AR_ACTIVE_REGION: out    vl_logic_vector;
        DEBUG_AR_ERROR  : out    vl_logic_vector;
        DEBUG_AR_TARGET : out    vl_logic_vector;
        DEBUG_AR_ISSUING_CNT: out    vl_logic_vector;
        DEBUG_AR_ARB_GRANT: out    vl_logic_vector(7 downto 0);
        DEBUG_R_BEAT_CNT: out    vl_logic_vector;
        DEBUG_R_TRANS_SEQ: out    vl_logic_vector;
        DEBUG_RID_TARGET: out    vl_logic_vector;
        DEBUG_RID_ERROR : out    vl_logic_vector;
        DEBUG_BID_TARGET: out    vl_logic_vector;
        DEBUG_BID_ERROR : out    vl_logic_vector;
        DEBUG_W_BEAT_CNT: out    vl_logic_vector;
        DEBUG_W_TRANS_SEQ: out    vl_logic_vector
    );
end ict106_axi_crossbar;
