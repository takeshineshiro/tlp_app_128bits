library verilog;
use verilog.vl_types.all;
entity pcie_chaining_testbench is
    generic(
        PIPE_MODE_SIM   : integer := 1;
        TEST_LEVEL      : integer := 1;
        NUM_CONNECTED_LANES: integer := 8;
        FAST_COUNTERS   : integer := 1
    );
end pcie_chaining_testbench;
