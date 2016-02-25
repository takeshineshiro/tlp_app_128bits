library verilog;
use verilog.vl_types.all;
entity Avalon_rx is
    generic(
        USER_WIDTH_RX   : integer := 22;
        AXI_DATA_WIDTH  : integer := 128
    );
    port(
        rx_st_ready0    : out    vl_logic;
        m_axis_rc_tdata : out    vl_logic_vector;
        m_axis_rc_tstrb : out    vl_logic_vector;
        m_axis_rc_tlast : out    vl_logic;
        m_axis_rc_tvalid: out    vl_logic;
        m_axis_cw_tdata : out    vl_logic_vector;
        m_axis_cw_tstrb : out    vl_logic_vector;
        m_axis_cw_tlast : out    vl_logic;
        m_axis_cw_tvalid: out    vl_logic;
        m_axis_cw_tuser : out    vl_logic_vector;
        m_axis_cr_tdata : out    vl_logic_vector;
        m_axis_cr_tstrb : out    vl_logic_vector;
        m_axis_cr_tlast : out    vl_logic;
        m_axis_cr_tvalid: out    vl_logic;
        m_axis_cr_tuser : out    vl_logic_vector;
        trn_clk         : in     vl_logic;
        trn_rst         : in     vl_logic;
        axi_clk         : in     vl_logic;
        axi_rst         : in     vl_logic;
        rx_st_bardec0   : in     vl_logic_vector(7 downto 0);
        rx_st_data0     : in     vl_logic_vector;
        rx_st_be0       : in     vl_logic_vector;
        rx_st_sop0      : in     vl_logic;
        rx_st_eop0      : in     vl_logic;
        rx_st_valid0    : in     vl_logic;
        m_axis_rc_tready: in     vl_logic;
        m_axis_cw_tready: in     vl_logic;
        m_axis_cr_tready: in     vl_logic
    );
end Avalon_rx;
