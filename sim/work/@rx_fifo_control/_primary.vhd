library verilog;
use verilog.vl_types.all;
entity Rx_fifo_control is
    generic(
        AXI_DATA_WIDTH  : integer := 128;
        FIFO_DEPTH      : integer := 10;
        FIFO_DATA_WIDTH : integer := 100
    );
    port(
        trn_rbar_hit    : out    vl_logic_vector(7 downto 0);
        trn_rsof        : out    vl_logic;
        trn_reof        : out    vl_logic;
        trn_rd          : out    vl_logic_vector;
        trn_rrem        : out    vl_logic;
        trn_rsrc_rdy    : out    vl_logic;
        rx_st_ready0    : out    vl_logic;
        data_in_rx      : out    vl_logic_vector;
        rd_req_rx       : out    vl_logic;
        wr_req_rx       : out    vl_logic;
        axi_clk         : in     vl_logic;
        axi_rst         : in     vl_logic;
        trn_clk         : in     vl_logic;
        trn_rst         : in     vl_logic;
        data_out_rx     : in     vl_logic_vector;
        trn_rdst_rdy    : in     vl_logic;
        rx_st_sop0      : in     vl_logic;
        rx_st_bardec0   : in     vl_logic_vector(7 downto 0);
        rx_st_data0     : in     vl_logic_vector;
        rx_st_be0       : in     vl_logic_vector;
        rx_st_eop0      : in     vl_logic;
        rx_st_valid0    : in     vl_logic;
        wrusedw_rx      : in     vl_logic_vector;
        empty_rx        : in     vl_logic;
        eof_empty_rx    : in     vl_logic
    );
end Rx_fifo_control;
