library verilog;
use verilog.vl_types.all;
entity axi_enhanced_tx_pipeline is
    generic(
        C_DATA_WIDTH    : integer := 32;
        TCQ             : integer := 1
    );
    port(
        s_axis_tx_tdata : in     vl_logic_vector;
        s_axis_tx_tvalid: in     vl_logic;
        s_axis_tx_tready: out    vl_logic;
        s_axis_tx_tstrb : in     vl_logic_vector;
        s_axis_tx_tlast : in     vl_logic;
        s_axis_tx_tuser : in     vl_logic_vector(3 downto 0);
        trn_td          : out    vl_logic_vector;
        trn_tsof        : out    vl_logic;
        trn_teof        : out    vl_logic;
        trn_tsrc_rdy    : out    vl_logic;
        trn_tdst_rdy    : in     vl_logic;
        trn_tsrc_dsc    : out    vl_logic;
        trn_trem        : out    vl_logic_vector;
        trn_terrfwd     : out    vl_logic;
        trn_tstr        : out    vl_logic;
        trn_tecrc_gen   : out    vl_logic;
        trn_lnk_up      : in     vl_logic;
        flush_axis_tlp  : in     vl_logic;
        com_iclk        : in     vl_logic;
        com_sysrst      : in     vl_logic
    );
end axi_enhanced_tx_pipeline;
