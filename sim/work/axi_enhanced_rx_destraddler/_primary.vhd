library verilog;
use verilog.vl_types.all;
entity axi_enhanced_rx_destraddler is
    generic(
        C_DATA_WIDTH    : integer := 32;
        C_FAMILY        : string  := "X7";
        TCQ             : integer := 1
    );
    port(
        trn_rd          : in     vl_logic_vector;
        trn_rsof        : in     vl_logic;
        trn_reof        : in     vl_logic;
        trn_rsrc_rdy    : in     vl_logic;
        trn_rdst_rdy_o  : out    vl_logic;
        trn_rsrc_dsc    : in     vl_logic;
        trn_rrem        : in     vl_logic_vector;
        trn_rerrfwd     : in     vl_logic;
        trn_rbar_hit    : in     vl_logic_vector;
        trn_recrc_err   : in     vl_logic;
        trn_rd_o        : out    vl_logic_vector;
        trn_rsof_o      : out    vl_logic;
        trn_reof_o      : out    vl_logic;
        trn_rsrc_rdy_o  : out    vl_logic;
        trn_rdst_rdy    : in     vl_logic;
        trn_rsrc_dsc_o  : out    vl_logic;
        trn_rrem_o      : out    vl_logic_vector;
        trn_rerrfwd_o   : out    vl_logic;
        trn_rbar_hit_o  : out    vl_logic_vector;
        trn_recrc_err_o : out    vl_logic;
        com_iclk        : in     vl_logic;
        com_sysrst      : in     vl_logic
    );
end axi_enhanced_rx_destraddler;
