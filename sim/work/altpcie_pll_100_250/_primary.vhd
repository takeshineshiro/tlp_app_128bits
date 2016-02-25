library verilog;
use verilog.vl_types.all;
entity altpcie_pll_100_250 is
    port(
        areset          : in     vl_logic;
        inclk0          : in     vl_logic;
        c0              : out    vl_logic
    );
end altpcie_pll_100_250;
