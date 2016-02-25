library verilog;
use verilog.vl_types.all;
entity alt4gxb_reset_controller is
    port(
        inclk           : in     vl_logic;
        async_reset     : in     vl_logic;
        test_sim        : in     vl_logic;
        pll_locked      : in     vl_logic;
        rx_pll_locked   : in     vl_logic;
        fifo_err        : in     vl_logic;
        inclk_eq_125mhz : in     vl_logic;
        gxb_powerdown   : out    vl_logic;
        txdigitalreset  : out    vl_logic;
        rxanalogreset   : out    vl_logic;
        rxdigitalreset  : out    vl_logic
    );
end alt4gxb_reset_controller;
