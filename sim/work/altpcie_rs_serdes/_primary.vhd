library verilog;
use verilog.vl_types.all;
entity altpcie_rs_serdes is
    port(
        pld_clk         : in     vl_logic;
        test_in         : in     vl_logic_vector(39 downto 0);
        ltssm           : in     vl_logic_vector(4 downto 0);
        npor            : in     vl_logic;
        pll_locked      : in     vl_logic;
        busy_altgxb_reconfig: in     vl_logic;
        rx_pll_locked   : in     vl_logic_vector(7 downto 0);
        rx_freqlocked   : in     vl_logic_vector(7 downto 0);
        rx_signaldetect : in     vl_logic_vector(7 downto 0);
        use_c4gx_serdes : in     vl_logic;
        fifo_err        : in     vl_logic;
        rc_inclk_eq_125mhz: in     vl_logic;
        detect_mask_rxdrst: in     vl_logic;
        txdigitalreset  : out    vl_logic;
        rxanalogreset   : out    vl_logic;
        rxdigitalreset  : out    vl_logic
    );
end altpcie_rs_serdes;
