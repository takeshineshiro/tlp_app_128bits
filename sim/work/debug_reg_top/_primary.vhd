library verilog;
use verilog.vl_types.all;
entity debug_reg_top is
    port(
        m_axi_awready_user: out    vl_logic;
        m_axi_wready_user: out    vl_logic;
        m_axi_bresp_user: out    vl_logic_vector(1 downto 0);
        m_axi_bvalid_user: out    vl_logic;
        m_axi_arready_user: out    vl_logic;
        m_axi_rdata_user: out    vl_logic_vector(31 downto 0);
        m_axi_rresp_user: out    vl_logic_vector(1 downto 0);
        m_axi_rvalid_user: out    vl_logic;
        sft_rst         : out    vl_logic;
        axi_clk         : in     vl_logic;
        axi_rst         : in     vl_logic;
        s_axi_rresp     : in     vl_logic_vector(1 downto 0);
        m_axi_awvalid_user: in     vl_logic;
        m_axi_awaddr_user: in     vl_logic_vector(31 downto 0);
        m_axi_wdata_user: in     vl_logic_vector(31 downto 0);
        m_axi_wvalid_user: in     vl_logic;
        m_axi_bready_user: in     vl_logic;
        m_axi_arvalid_user: in     vl_logic;
        m_axi_araddr_user: in     vl_logic_vector(31 downto 0);
        m_axi_rready_user: in     vl_logic;
        app_rst         : in     vl_logic
    );
end debug_reg_top;
