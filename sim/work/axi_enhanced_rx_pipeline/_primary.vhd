library verilog;
use verilog.vl_types.all;
entity axi_enhanced_rx_pipeline is
    generic(
        C_DATA_WIDTH    : integer := 128;
        C_FAMILY        : string  := "X7";
        C_ROOT_PORT     : string  := "FALSE";
        C_RX_REALIGN    : string  := "TRUE";
        TCQ             : integer := 1
    );
    port(
        m_axis_rx_tdata : out    vl_logic_vector;
        m_axis_rx_tvalid: out    vl_logic;
        m_axis_rx_tready: in     vl_logic;
        m_axis_rx_tstrb : out    vl_logic_vector;
        m_axis_rx_tlast : out    vl_logic;
        m_axis_rx_tuser : out    vl_logic_vector(21 downto 0);
        msi_address     : in     vl_logic_vector(63 downto 0);
        is_msi_trn      : out    vl_logic;
        trn_rd          : in     vl_logic_vector;
        trn_rsof        : in     vl_logic;
        trn_reof        : in     vl_logic;
        trn_rsrc_rdy    : in     vl_logic;
        trn_rdst_rdy    : out    vl_logic;
        trn_rsrc_dsc    : in     vl_logic;
        trn_rrem        : in     vl_logic_vector;
        trn_rerrfwd     : in     vl_logic;
        trn_rbar_hit    : in     vl_logic_vector;
        trn_recrc_err   : in     vl_logic;
        null_rx_tvalid  : in     vl_logic;
        null_rx_tlast   : in     vl_logic;
        null_rx_tstrb   : in     vl_logic_vector;
        null_rdst_rdy   : in     vl_logic;
        null_is_eof     : in     vl_logic_vector(4 downto 0);
        pkt_len_counter : in     vl_logic_vector(11 downto 0);
        com_iclk        : in     vl_logic;
        com_sysrst      : in     vl_logic
    );
end axi_enhanced_rx_pipeline;
