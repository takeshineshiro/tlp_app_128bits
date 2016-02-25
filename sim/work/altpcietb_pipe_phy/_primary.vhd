library verilog;
use verilog.vl_types.all;
entity altpcietb_pipe_phy is
    generic(
        APIPE_WIDTH     : integer := 16;
        BPIPE_WIDTH     : integer := 16;
        LANE_NUM        : integer := 0;
        A_MAC_NAME      : string  := "EP";
        B_MAC_NAME      : string  := "RP";
        LATENCY         : integer := 23
    );
    port(
        pclk_a          : in     vl_logic;
        pclk_b          : in     vl_logic;
        resetn          : in     vl_logic;
        pipe_mode       : in     vl_logic;
        A_lane_conn     : in     vl_logic;
        B_lane_conn     : in     vl_logic;
        A_txdata        : in     vl_logic_vector;
        A_txdatak       : in     vl_logic_vector;
        A_txdetectrx    : in     vl_logic;
        A_txelecidle    : in     vl_logic;
        A_txcompl       : in     vl_logic;
        A_rxpolarity    : in     vl_logic;
        A_powerdown     : in     vl_logic_vector(1 downto 0);
        A_rxdata        : out    vl_logic_vector;
        A_rxdatak       : out    vl_logic_vector;
        A_rxvalid       : out    vl_logic;
        A_phystatus     : out    vl_logic;
        A_rxelecidle    : out    vl_logic;
        A_rxstatus      : out    vl_logic_vector(2 downto 0);
        B_txdata        : in     vl_logic_vector;
        B_txdatak       : in     vl_logic_vector;
        B_txdetectrx    : in     vl_logic;
        B_txelecidle    : in     vl_logic;
        B_txcompl       : in     vl_logic;
        B_rxpolarity    : in     vl_logic;
        B_powerdown     : in     vl_logic_vector(1 downto 0);
        B_rxdata        : out    vl_logic_vector;
        B_rxdatak       : out    vl_logic_vector;
        B_rxvalid       : out    vl_logic;
        B_phystatus     : out    vl_logic;
        B_rxelecidle    : out    vl_logic;
        B_rxstatus      : out    vl_logic_vector(2 downto 0);
        B_rate          : in     vl_logic;
        A_rate          : in     vl_logic
    );
end altpcietb_pipe_phy;
