library verilog;
use verilog.vl_types.all;
entity axi_enhanced_tx is
    generic(
        C_DATA_WIDTH    : integer := 32;
        C_FAMILY        : string  := "X7";
        C_ROOT_PORT     : string  := "FALSE";
        TCQ             : integer := 1
    );
    port(
        s_axis_rr_tdata : in     vl_logic_vector;
        s_axis_rr_tvalid: in     vl_logic;
        s_axis_rr_tready: out    vl_logic;
        s_axis_rr_tstrb : in     vl_logic_vector;
        s_axis_rr_tlast : in     vl_logic;
        s_axis_rr_tuser : in     vl_logic_vector(3 downto 0);
        s_axis_rw_tdata : in     vl_logic_vector;
        s_axis_rw_tvalid: in     vl_logic;
        s_axis_rw_tready: out    vl_logic;
        s_axis_rw_tstrb : in     vl_logic_vector;
        s_axis_rw_tlast : in     vl_logic;
        s_axis_rw_tuser : in     vl_logic_vector(3 downto 0);
        s_axis_cc_tdata : in     vl_logic_vector;
        s_axis_cc_tvalid: in     vl_logic;
        s_axis_cc_tready: out    vl_logic;
        s_axis_cc_tstrb : in     vl_logic_vector;
        s_axis_cc_tlast : in     vl_logic;
        s_axis_cc_tuser : in     vl_logic_vector(3 downto 0);
        s_axis_cfg_tdata: in     vl_logic_vector;
        s_axis_cfg_tvalid: in     vl_logic;
        s_axis_cfg_tready: out    vl_logic;
        s_axis_cfg_tstrb: in     vl_logic_vector;
        s_axis_cfg_tlast: in     vl_logic;
        s_axis_cfg_tuser: in     vl_logic_vector(3 downto 0);
        cfg_req         : in     vl_logic;
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
        com_iclk        : in     vl_logic;
        com_sysrst      : in     vl_logic
    );
end axi_enhanced_tx;
