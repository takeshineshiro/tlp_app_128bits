library verilog;
use verilog.vl_types.all;
entity altpcie_reconfig_4sgx_alt_dprio_2vj is
    port(
        address         : in     vl_logic_vector(15 downto 0);
        busy            : out    vl_logic;
        datain          : in     vl_logic_vector(15 downto 0);
        dataout         : out    vl_logic_vector(15 downto 0);
        dpclk           : in     vl_logic;
        dpriodisable    : out    vl_logic;
        dprioin         : out    vl_logic;
        dprioload       : out    vl_logic;
        dprioout        : in     vl_logic;
        quad_address    : in     vl_logic_vector(8 downto 0);
        rden            : in     vl_logic;
        reset           : in     vl_logic;
        wren            : in     vl_logic;
        wren_data       : in     vl_logic
    );
end altpcie_reconfig_4sgx_alt_dprio_2vj;
