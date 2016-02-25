library verilog;
use verilog.vl_types.all;
entity pcie_rs_hip is
    port(
        dlup_exit       : in     vl_logic;
        hotrst_exit     : in     vl_logic;
        l2_exit         : in     vl_logic;
        ltssm           : in     vl_logic_vector(4 downto 0);
        npor            : in     vl_logic;
        pld_clk         : in     vl_logic;
        test_sim        : in     vl_logic;
        app_rstn        : out    vl_logic;
        crst            : out    vl_logic;
        srst            : out    vl_logic
    );
end pcie_rs_hip;
