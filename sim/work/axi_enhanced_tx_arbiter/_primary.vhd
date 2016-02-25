library verilog;
use verilog.vl_types.all;
entity axi_enhanced_tx_arbiter is
    generic(
        C_ROOT_PORT     : string  := "FALSE";
        TCQ             : integer := 1
    );
    port(
        s_axis_rr_tvalid: in     vl_logic;
        s_axis_rw_tvalid: in     vl_logic;
        s_axis_cc_tvalid: in     vl_logic;
        s_axis_cfg_tvalid: in     vl_logic;
        cfg_req         : in     vl_logic;
        s_axis_rw_tlast : in     vl_logic;
        s_axis_rr_tlast : in     vl_logic;
        s_axis_cc_tlast : in     vl_logic;
        s_axis_cfg_tlast: in     vl_logic;
        s_axis_tx_tready: in     vl_logic;
        trn_lnk_up      : in     vl_logic;
        trn_teof        : in     vl_logic;
        com_iclk        : in     vl_logic;
        com_sysrst      : in     vl_logic;
        channel_sel     : out    vl_logic_vector(1 downto 0);
        rr_thrtl        : out    vl_logic;
        rw_thrtl        : out    vl_logic;
        cc_thrtl        : out    vl_logic
    );
end axi_enhanced_tx_arbiter;
