library verilog;
use verilog.vl_types.all;
entity Tx_fifo_control is
    generic(
        AXI_DATA_WIDTH  : integer := 128;
        FIFO_DEPTH      : integer := 10;
        TX_FIFO_DATA_WIDTH: integer := 100;
        FIFO_DATA_WIDTH : integer := 100
    );
    port(
        trn_tdst_rdy    : out    vl_logic;
        tx_st_data0     : out    vl_logic_vector;
        tx_st_sop0      : out    vl_logic;
        tx_st_eop0      : out    vl_logic;
        tx_st_valid0    : out    vl_logic;
        data_in_tx      : out    vl_logic_vector;
        wr_req_tx       : out    vl_logic;
        rd_req_tx       : out    vl_logic;
        axi_clk         : in     vl_logic;
        axi_rst         : in     vl_logic;
        trn_clk         : in     vl_logic;
        trn_rst         : in     vl_logic;
        wrusedw_tx      : in     vl_logic_vector;
        empty_tx        : in     vl_logic;
        tx_st_ready0    : in     vl_logic;
        data_out_tx     : in     vl_logic_vector;
        trn_tsof        : in     vl_logic;
        trn_teof        : in     vl_logic;
        trn_td          : in     vl_logic_vector;
        trn_trem        : in     vl_logic;
        trn_tsrc_rdy    : in     vl_logic;
        trn_tsrc_dsc    : in     vl_logic
    );
end Tx_fifo_control;
