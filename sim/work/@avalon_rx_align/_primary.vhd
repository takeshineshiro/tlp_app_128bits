library verilog;
use verilog.vl_types.all;
entity Avalon_rx_align is
    generic(
        AXI_DATA_WIDTH  : integer := 128
    );
    port(
        trn_rbar_hit    : out    vl_logic_vector(7 downto 0);
        trn_rsof        : out    vl_logic;
        trn_reof        : out    vl_logic;
        trn_rd          : out    vl_logic_vector;
        trn_rrem        : out    vl_logic_vector;
        trn_rsrc_rdy    : out    vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        rx_st_bardec_rx : in     vl_logic_vector(7 downto 0);
        rx_st_sop_rx    : in     vl_logic;
        rx_st_eop_rx    : in     vl_logic;
        rx_st_data_rx   : in     vl_logic_vector;
        rx_st_be_rx     : in     vl_logic_vector;
        rx_st_valid_rx  : in     vl_logic
    );
end Avalon_rx_align;
