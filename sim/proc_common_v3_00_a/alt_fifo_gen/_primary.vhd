library verilog;
use verilog.vl_types.all;
entity alt_fifo_gen is
    generic(
        DEVICE_FAMILY   : string  := "Stratix IV";
        C_FIFO_DEPTH_LOG: integer := 9;
        C_FIFO_WIDTH    : integer := 256
    );
    port(
        aclr            : in     vl_logic;
        data            : in     vl_logic_vector;
        rdclk           : in     vl_logic;
        rdreq           : in     vl_logic;
        wrclk           : in     vl_logic;
        wrreq           : in     vl_logic;
        q               : out    vl_logic_vector;
        rdempty         : out    vl_logic;
        wrfull          : out    vl_logic
    );
end alt_fifo_gen;
