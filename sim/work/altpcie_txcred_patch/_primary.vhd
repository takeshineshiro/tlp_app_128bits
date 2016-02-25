library verilog;
use verilog.vl_types.all;
entity altpcie_txcred_patch is
    generic(
        enable_adapter_half_rate_mode: string  := "false";
        BYP_PATCH       : integer := 0
    );
    port(
        clk             : in     vl_logic;
        rstn            : in     vl_logic;
        srst            : in     vl_logic;
        tx_cred_int     : in     vl_logic_vector(35 downto 0);
        tx_stream_valid : in     vl_logic;
        tx_st_sop       : in     vl_logic;
        tx_st_eop       : in     vl_logic_vector(1 downto 0);
        tx_st_err       : in     vl_logic;
        tx_st_data      : in     vl_logic_vector(31 downto 0);
        nph_alloc_1cred : out    vl_logic;
        npd_alloc_1cred : out    vl_logic;
        nph_cred_viol   : out    vl_logic;
        npd_cred_viol   : out    vl_logic;
        tx_cred         : out    vl_logic_vector(35 downto 0)
    );
end altpcie_txcred_patch;
