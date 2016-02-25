library verilog;
use verilog.vl_types.all;
entity altpcietb_rst_clk is
    port(
        ref_clk_sel_code: in     vl_logic_vector(3 downto 0);
        ref_clk_out     : out    vl_logic;
        pcie_rstn       : out    vl_logic;
        ep_core_clk_out : in     vl_logic;
        rp_rstn         : out    vl_logic
    );
end altpcietb_rst_clk;
