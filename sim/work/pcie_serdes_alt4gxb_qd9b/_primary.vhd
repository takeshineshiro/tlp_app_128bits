library verilog;
use verilog.vl_types.all;
entity pcie_serdes_alt4gxb_qd9b is
    generic(
        starting_channel_number: integer := 0
    );
    port(
        cal_blk_clk     : in     vl_logic;
        coreclkout      : out    vl_logic_vector(0 downto 0);
        fixedclk        : in     vl_logic;
        gxb_powerdown   : in     vl_logic_vector(0 downto 0);
        hip_tx_clkout   : out    vl_logic_vector(7 downto 0);
        pipe8b10binvpolarity: in     vl_logic_vector(7 downto 0);
        pipedatavalid   : out    vl_logic_vector(7 downto 0);
        pipeelecidle    : out    vl_logic_vector(7 downto 0);
        pipephydonestatus: out    vl_logic_vector(7 downto 0);
        pipestatus      : out    vl_logic_vector(23 downto 0);
        pll_inclk       : in     vl_logic;
        pll_locked      : out    vl_logic_vector(0 downto 0);
        pll_powerdown   : in     vl_logic_vector(0 downto 0);
        powerdn         : in     vl_logic_vector(15 downto 0);
        rateswitch      : in     vl_logic_vector(0 downto 0);
        rateswitchbaseclock: out    vl_logic_vector(1 downto 0);
        reconfig_clk    : in     vl_logic;
        reconfig_fromgxb: out    vl_logic_vector(33 downto 0);
        reconfig_togxb  : in     vl_logic_vector(3 downto 0);
        rx_analogreset  : in     vl_logic_vector(0 downto 0);
        rx_cruclk       : in     vl_logic_vector(7 downto 0);
        rx_ctrldetect   : out    vl_logic_vector(7 downto 0);
        rx_datain       : in     vl_logic_vector(7 downto 0);
        rx_dataout      : out    vl_logic_vector(63 downto 0);
        rx_digitalreset : in     vl_logic_vector(0 downto 0);
        rx_elecidleinfersel: in     vl_logic_vector(23 downto 0);
        rx_freqlocked   : out    vl_logic_vector(7 downto 0);
        rx_patterndetect: out    vl_logic_vector(7 downto 0);
        rx_pll_locked   : out    vl_logic_vector(7 downto 0);
        rx_signaldetect : out    vl_logic_vector(7 downto 0);
        rx_syncstatus   : out    vl_logic_vector(7 downto 0);
        tx_ctrlenable   : in     vl_logic_vector(7 downto 0);
        tx_datain       : in     vl_logic_vector(63 downto 0);
        tx_dataout      : out    vl_logic_vector(7 downto 0);
        tx_detectrxloop : in     vl_logic_vector(7 downto 0);
        tx_digitalreset : in     vl_logic_vector(0 downto 0);
        tx_forcedispcompliance: in     vl_logic_vector(7 downto 0);
        tx_forceelecidle: in     vl_logic_vector(7 downto 0);
        tx_pipedeemph   : in     vl_logic_vector(7 downto 0);
        tx_pipemargin   : in     vl_logic_vector(23 downto 0)
    );
end pcie_serdes_alt4gxb_qd9b;
