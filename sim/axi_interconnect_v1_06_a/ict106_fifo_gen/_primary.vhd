library verilog;
use verilog.vl_types.all;
entity ict106_fifo_gen is
    generic(
        C_FAMILY        : string  := "virtex6";
        C_COMMON_CLOCK  : integer := 1;
        C_FIFO_DEPTH_LOG: integer := 5;
        C_FIFO_WIDTH    : integer := 64;
        C_FIFO_TYPE     : string  := "lut"
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        wr_clk          : in     vl_logic;
        wr_en           : in     vl_logic;
        wr_ready        : out    vl_logic;
        wr_data         : in     vl_logic_vector;
        rd_clk          : in     vl_logic;
        rd_en           : in     vl_logic;
        rd_valid        : out    vl_logic;
        rd_data         : out    vl_logic_vector
    );
end ict106_fifo_gen;
