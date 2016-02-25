library verilog;
use verilog.vl_types.all;
entity altpcie_reconfig_4sgx_mux_c6a is
    port(
        data            : in     vl_logic_vector(7 downto 0);
        result          : out    vl_logic_vector(0 downto 0);
        sel             : in     vl_logic_vector(2 downto 0)
    );
end altpcie_reconfig_4sgx_mux_c6a;
