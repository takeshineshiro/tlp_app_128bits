library verilog;
use verilog.vl_types.all;
entity axi_enhanced_rx_null_gen is
    generic(
        C_DATA_WIDTH    : integer := 128;
        TCQ             : integer := 1
    );
    port(
        m_axis_rx_tdata : in     vl_logic_vector;
        m_axis_rx_tvalid: in     vl_logic;
        m_axis_rx_tready: in     vl_logic;
        m_axis_rx_tlast : in     vl_logic;
        m_axis_rx_tuser : in     vl_logic_vector(21 downto 0);
        null_rx_tvalid  : out    vl_logic;
        null_rx_tlast   : out    vl_logic;
        null_rx_tstrb   : out    vl_logic_vector;
        null_rdst_rdy   : out    vl_logic;
        null_is_eof     : out    vl_logic_vector(4 downto 0);
        pkt_len_counter : out    vl_logic_vector(11 downto 0);
        com_iclk        : in     vl_logic;
        com_sysrst      : in     vl_logic
    );
end axi_enhanced_rx_null_gen;
