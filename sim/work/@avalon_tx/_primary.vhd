library verilog;
use verilog.vl_types.all;
entity Avalon_tx is
    generic(
        USER_WIDTH_TX   : integer := 4;
        AXI_DATA_WIDTH  : integer := 128
    );
    port(
        tx_st_data0     : out    vl_logic_vector;
        tx_st_sop0      : out    vl_logic;
        tx_st_eop0      : out    vl_logic;
        tx_st_valid0    : out    vl_logic;
        s_axis_rw_tready: out    vl_logic;
        s_axis_rr_tready: out    vl_logic;
        s_axis_cc_tready: out    vl_logic;
        trn_clk         : in     vl_logic;
        trn_rst         : in     vl_logic;
        axi_clk         : in     vl_logic;
        axi_rst         : in     vl_logic;
        tx_st_ready0    : in     vl_logic;
        s_axis_rw_tdata : in     vl_logic_vector;
        s_axis_rw_tstrb : in     vl_logic_vector;
        s_axis_rw_tlast : in     vl_logic;
        s_axis_rw_tvalid: in     vl_logic;
        s_axis_rw_tuser : in     vl_logic_vector;
        s_axis_rr_tuser : in     vl_logic_vector;
        s_axis_rr_tdata : in     vl_logic_vector;
        s_axis_rr_tstrb : in     vl_logic_vector;
        s_axis_rr_tlast : in     vl_logic;
        s_axis_rr_tvalid: in     vl_logic;
        s_axis_cc_tdata : in     vl_logic_vector;
        s_axis_cc_tstrb : in     vl_logic_vector;
        s_axis_cc_tlast : in     vl_logic;
        s_axis_cc_tvalid: in     vl_logic;
        s_axis_cc_tuser : in     vl_logic_vector
    );
end Avalon_tx;
