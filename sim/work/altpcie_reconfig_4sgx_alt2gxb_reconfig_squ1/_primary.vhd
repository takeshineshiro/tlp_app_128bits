library verilog;
use verilog.vl_types.all;
entity altpcie_reconfig_4sgx_alt2gxb_reconfig_squ1 is
    port(
        busy            : out    vl_logic;
        data_valid      : out    vl_logic;
        logical_channel_address: in     vl_logic_vector(2 downto 0);
        offset_cancellation_reset: in     vl_logic;
        read            : in     vl_logic;
        reconfig_clk    : in     vl_logic;
        reconfig_fromgxb: in     vl_logic_vector(33 downto 0);
        reconfig_mode_sel: in     vl_logic_vector(2 downto 0);
        reconfig_togxb  : out    vl_logic_vector(3 downto 0);
        rx_eqctrl       : in     vl_logic_vector(3 downto 0);
        rx_eqctrl_out   : out    vl_logic_vector(3 downto 0);
        rx_eqdcgain     : in     vl_logic_vector(2 downto 0);
        rx_eqdcgain_out : out    vl_logic_vector(2 downto 0);
        tx_preemp_0t    : in     vl_logic_vector(4 downto 0);
        tx_preemp_0t_out: out    vl_logic_vector(4 downto 0);
        tx_preemp_1t    : in     vl_logic_vector(4 downto 0);
        tx_preemp_1t_out: out    vl_logic_vector(4 downto 0);
        tx_preemp_2t    : in     vl_logic_vector(4 downto 0);
        tx_preemp_2t_out: out    vl_logic_vector(4 downto 0);
        tx_vodctrl      : in     vl_logic_vector(2 downto 0);
        tx_vodctrl_out  : out    vl_logic_vector(2 downto 0);
        write_all       : in     vl_logic
    );
end altpcie_reconfig_4sgx_alt2gxb_reconfig_squ1;
