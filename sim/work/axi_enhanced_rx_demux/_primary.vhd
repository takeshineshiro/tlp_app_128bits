library verilog;
use verilog.vl_types.all;
entity axi_enhanced_rx_demux is
    generic(
        C_DATA_WIDTH    : integer := 32;
        C_FAMILY        : string  := "X7";
        C_RX_PRESERVE_ORDER: string  := "FALSE";
        C_RX_REALIGN    : string  := "TRUE";
        C_ROOT_PORT     : string  := "FALSE";
        TCQ             : integer := 1
    );
    port(
        m_axis_rx_tdata : in     vl_logic_vector;
        m_axis_rx_tvalid: in     vl_logic;
        m_axis_rx_tready: out    vl_logic;
        m_axis_rx_tstrb : in     vl_logic_vector;
        m_axis_rx_tlast : in     vl_logic;
        m_axis_rx_tuser : in     vl_logic_vector(21 downto 0);
        is_msi_trn      : in     vl_logic;
        m_axis_cr_tdata : out    vl_logic_vector;
        m_axis_cr_tvalid: out    vl_logic;
        m_axis_cr_tready: in     vl_logic;
        m_axis_cr_tstrb : out    vl_logic_vector;
        m_axis_cr_tlast : out    vl_logic;
        m_axis_cr_tuser : out    vl_logic_vector(21 downto 0);
        m_axis_cw_tdata : out    vl_logic_vector;
        m_axis_cw_tvalid: out    vl_logic;
        m_axis_cw_tready: in     vl_logic;
        m_axis_cw_tstrb : out    vl_logic_vector;
        m_axis_cw_tlast : out    vl_logic;
        m_axis_cw_tuser : out    vl_logic_vector(21 downto 0);
        m_axis_rc_tdata : out    vl_logic_vector;
        m_axis_rc_tvalid: out    vl_logic;
        m_axis_rc_tready: in     vl_logic;
        m_axis_rc_tstrb : out    vl_logic_vector;
        m_axis_rc_tlast : out    vl_logic;
        m_axis_rc_tuser : out    vl_logic_vector(21 downto 0);
        m_axis_cfg_tdata: out    vl_logic_vector;
        m_axis_cfg_tvalid: out    vl_logic;
        m_axis_cfg_tready: in     vl_logic;
        m_axis_cfg_tstrb: out    vl_logic_vector;
        m_axis_cfg_tlast: out    vl_logic;
        m_axis_cfg_tuser: out    vl_logic_vector(21 downto 0);
        is_msi          : out    vl_logic;
        msi_address     : in     vl_logic_vector(63 downto 0);
        com_iclk        : in     vl_logic;
        com_sysrst      : in     vl_logic;
        rnp_ok          : out    vl_logic;
        trn_lnk_up      : in     vl_logic;
        rnp_req         : out    vl_logic;
        rx_np_req       : in     vl_logic;
        cfg_req         : in     vl_logic
    );
end axi_enhanced_rx_demux;
