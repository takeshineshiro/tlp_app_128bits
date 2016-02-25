library verilog;
use verilog.vl_types.all;
entity signaltap is
    generic(
        DATA_W          : integer := 256;
        DATA_W_CNT      : integer := 9;
        DEPTH_W         : integer := 10
    );
    port(
        clk             : in     vl_logic;
        data            : in     vl_logic_vector;
        dout            : out    vl_logic
    );
end signaltap;
