library verilog;
use verilog.vl_types.all;
entity asyn_fifo is
    generic(
        DATA_W          : integer := 8;
        DEPTH_W         : integer := 10
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
        rdfull          : out    vl_logic;
        rdusedw         : out    vl_logic_vector;
        wrempty         : out    vl_logic;
        wrfull          : out    vl_logic;
        wrusedw         : out    vl_logic_vector
    );
end asyn_fifo;
