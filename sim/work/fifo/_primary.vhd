library verilog;
use verilog.vl_types.all;
entity fifo is
    generic(
        MEM_TYPE        : integer := 1;
        DATA_W          : integer := 32;
        DEPTH_W         : integer := 9
    );
    port(
        aclr            : in     vl_logic;
        clock           : in     vl_logic;
        data            : in     vl_logic_vector;
        rdreq           : in     vl_logic;
        sclr            : in     vl_logic;
        wrreq           : in     vl_logic;
        almost_empty    : out    vl_logic;
        almost_full     : out    vl_logic;
        empty           : out    vl_logic;
        full            : out    vl_logic;
        q               : out    vl_logic_vector;
        usedw           : out    vl_logic_vector
    );
end fifo;
