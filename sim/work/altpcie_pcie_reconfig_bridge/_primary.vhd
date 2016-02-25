library verilog;
use verilog.vl_types.all;
entity altpcie_pcie_reconfig_bridge is
    generic(
        device_address  : integer := 0;
        port_address    : integer := 0;
        base_address    : integer := 0;
        implement_address_checking: integer := 1
    );
    port(
        avs_pcie_reconfig_address: in     vl_logic_vector(7 downto 0);
        avs_pcie_reconfig_chipselect: in     vl_logic;
        avs_pcie_reconfig_write: in     vl_logic;
        avs_pcie_reconfig_writedata: in     vl_logic_vector(15 downto 0);
        avs_pcie_reconfig_waitrequest: out    vl_logic;
        avs_pcie_reconfig_read: in     vl_logic;
        avs_pcie_reconfig_readdata: out    vl_logic_vector(15 downto 0);
        avs_pcie_reconfig_readdatavalid: out    vl_logic;
        avs_pcie_reconfig_clk: in     vl_logic;
        avs_pcie_reconfig_rstn: in     vl_logic;
        dpriodisable    : out    vl_logic;
        dprioin         : out    vl_logic;
        dprioload       : out    vl_logic;
        dpclk           : out    vl_logic;
        dprioout        : in     vl_logic
    );
end altpcie_pcie_reconfig_bridge;
