library verilog;
use verilog.vl_types.all;
entity altpcietb_pipe_xtx2yrx is
    generic(
        XPIPE_WIDTH     : integer := 16;
        YPIPE_WIDTH     : integer := 16;
        LANE_NUM        : integer := 0;
        X_MAC_NAME      : string  := "EP";
        EBFM_MSG_DEBUG  : integer := 0;
        EBFM_MSG_INFO   : integer := 1;
        EBFM_MSG_WARNING: integer := 2;
        EBFM_MSG_ERROR_INFO: integer := 3;
        EBFM_MSG_ERROR_CONTINUE: integer := 4;
        EBFM_MSG_ERROR_FATAL: integer := 101;
        EBFM_MSG_ERROR_FATAL_TB_ERR: integer := 102;
        EBFM_MSG_MAX_LEN: integer := 100;
        P0              : vl_logic_vector(3 downto 0) := (Hi0, Hi0, Hi0, Hi0);
        P0_ENT          : vl_logic_vector(3 downto 0) := (Hi0, Hi0, Hi0, Hi1);
        P0s             : vl_logic_vector(3 downto 0) := (Hi0, Hi0, Hi1, Hi0);
        P0s_ENT         : vl_logic_vector(3 downto 0) := (Hi0, Hi0, Hi1, Hi1);
        P1              : vl_logic_vector(3 downto 0) := (Hi0, Hi1, Hi0, Hi0);
        P1_DET          : vl_logic_vector(3 downto 0) := (Hi0, Hi1, Hi0, Hi1);
        P1_ENT          : vl_logic_vector(3 downto 0) := (Hi1, Hi0, Hi1, Hi0);
        P2              : vl_logic_vector(3 downto 0) := (Hi1, Hi0, Hi1, Hi1);
        P2_ENT          : vl_logic_vector(3 downto 0) := (Hi1, Hi1, Hi0, Hi0);
        NOT_IN_USE      : vl_logic_vector(3 downto 0) := (Hi1, Hi1, Hi0, Hi1)
    );
    port(
        X_lane_conn     : in     vl_logic;
        Y_lane_conn     : in     vl_logic;
        pclk            : in     vl_logic;
        resetn          : in     vl_logic;
        pipe_mode       : in     vl_logic;
        X_txdata        : in     vl_logic_vector;
        X_txdatak       : in     vl_logic_vector;
        X_txdetectrx    : in     vl_logic;
        X_txelecidle    : in     vl_logic;
        X_txcompl       : in     vl_logic;
        X_rxpolarity    : in     vl_logic;
        X_powerdown     : in     vl_logic_vector(1 downto 0);
        X_rxdata        : out    vl_logic_vector;
        X_rxdatak       : out    vl_logic_vector;
        X_rxvalid       : out    vl_logic;
        X_phystatus     : out    vl_logic;
        X_rxelecidle    : out    vl_logic;
        X_rxstatus      : out    vl_logic_vector(2 downto 0);
        X2Y_data        : out    vl_logic_vector;
        X2Y_datak       : out    vl_logic_vector;
        X2Y_elecidle    : out    vl_logic;
        Y2X_data        : in     vl_logic_vector;
        Y2X_datak       : in     vl_logic_vector;
        Y2X_elecidle    : in     vl_logic;
        X_rate          : in     vl_logic
    );
    attribute P0_mti_vect_attrib : integer;
    attribute P0_mti_vect_attrib of P0 : constant is 0;
    attribute P0_ENT_mti_vect_attrib : integer;
    attribute P0_ENT_mti_vect_attrib of P0_ENT : constant is 1;
    attribute P0s_mti_vect_attrib : integer;
    attribute P0s_mti_vect_attrib of P0s : constant is 2;
    attribute P0s_ENT_mti_vect_attrib : integer;
    attribute P0s_ENT_mti_vect_attrib of P0s_ENT : constant is 3;
    attribute P1_mti_vect_attrib : integer;
    attribute P1_mti_vect_attrib of P1 : constant is 4;
    attribute P1_DET_mti_vect_attrib : integer;
    attribute P1_DET_mti_vect_attrib of P1_DET : constant is 5;
    attribute P1_ENT_mti_vect_attrib : integer;
    attribute P1_ENT_mti_vect_attrib of P1_ENT : constant is 10;
    attribute P2_mti_vect_attrib : integer;
    attribute P2_mti_vect_attrib of P2 : constant is 11;
    attribute P2_ENT_mti_vect_attrib : integer;
    attribute P2_ENT_mti_vect_attrib of P2_ENT : constant is 12;
    attribute NOT_IN_USE_mti_vect_attrib : integer;
    attribute NOT_IN_USE_mti_vect_attrib of NOT_IN_USE : constant is 13;
end altpcietb_pipe_xtx2yrx;
