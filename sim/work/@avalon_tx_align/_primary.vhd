library verilog;
use verilog.vl_types.all;
entity Avalon_tx_align is
    generic(
        AXI_DATA_WIDTH  : integer := 128
    );
    port(
        tx_st_valid_align: out    vl_logic;
        tx_st_sop_align : out    vl_logic;
        tx_st_eop_align : out    vl_logic;
        tx_st_data_align: out    vl_logic_vector;
        axi_clk         : in     vl_logic;
        axi_rst         : in     vl_logic;
        tx_st_valid     : in     vl_logic;
        tx_st_sop       : in     vl_logic;
        tx_st_eop       : in     vl_logic;
        tx_st_data      : in     vl_logic_vector;
        tx_st_be        : in     vl_logic_vector
    );
end Avalon_tx_align;
