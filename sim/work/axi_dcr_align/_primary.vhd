library verilog;
use verilog.vl_types.all;
entity axi_dcr_align is
    generic(
        AXI_DATA_WIDTH  : integer := 128;
        AXI_ADDR_WIDTH  : integer := 32;
        AXI_ID_WIDTH    : integer := 8;
        C_S_AXI_LITE_ADDR_WIDTH: integer := 32;
        C_S_AXI_LITE_DATA_WIDTH: integer := 32
    );
    port(
        m_axi_awready_tlp: out    vl_logic;
        m_axi_wready_tlp: out    vl_logic;
        m_axi_bresp_tlp : out    vl_logic_vector(1 downto 0);
        m_axi_bvalid_tlp: out    vl_logic;
        m_axi_arready_tlp: out    vl_logic;
        m_axi_rlast_tlp : out    vl_logic;
        m_axi_rdata_tlp : out    vl_logic_vector;
        m_axi_rresp_tlp : out    vl_logic_vector(1 downto 0);
        m_axi_rvalid_tlp: out    vl_logic;
        m_axi_awvalid_axidma: out    vl_logic;
        m_axi_awaddr_axidma: out    vl_logic_vector;
        m_axi_wdata_axidma: out    vl_logic_vector;
        m_axi_wvalid_axidma: out    vl_logic;
        m_axi_bready_axidma: out    vl_logic;
        m_axi_arvalid_axidma: out    vl_logic;
        m_axi_araddr_axidma: out    vl_logic_vector;
        m_axi_rready_axidma: out    vl_logic;
        axi_clk         : in     vl_logic;
        axi_rst         : in     vl_logic;
        m_axi_awvalid_tlp: in     vl_logic;
        m_axi_awaddr_tlp: in     vl_logic_vector;
        m_axi_wdata_tlp : in     vl_logic_vector;
        m_axi_wvalid_tlp: in     vl_logic;
        m_axi_wstrb_tlp : in     vl_logic_vector;
        m_axi_bready_tlp: in     vl_logic;
        m_axi_arvalid_tlp: in     vl_logic;
        m_axi_araddr_tlp: in     vl_logic_vector;
        m_axi_rready_tlp: in     vl_logic;
        m_axi_awready_axidma: in     vl_logic;
        m_axi_wready_axidma: in     vl_logic;
        m_axi_bresp_axidma: in     vl_logic_vector(1 downto 0);
        m_axi_bvalid_axidma: in     vl_logic;
        m_axi_arready_axidma: in     vl_logic;
        m_axi_rdata_axidma: in     vl_logic_vector;
        m_axi_rresp_axidma: in     vl_logic_vector(1 downto 0);
        m_axi_rvalid_axidma: in     vl_logic
    );
end axi_dcr_align;
