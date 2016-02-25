library verilog;
use verilog.vl_types.all;
entity ict106_axic_fifo is
    generic(
        C_FAMILY        : string  := "virtex6";
        C_FIFO_DEPTH_LOG: integer := 5;
        C_FIFO_WIDTH    : integer := 64;
        C_FIFO_TYPE     : string  := "lut"
    );
    port(
        ACLK            : in     vl_logic;
        ARESET          : in     vl_logic;
        S_MESG          : in     vl_logic_vector;
        S_VALID         : in     vl_logic;
        S_READY         : out    vl_logic;
        M_MESG          : out    vl_logic_vector;
        M_VALID         : out    vl_logic;
        M_READY         : in     vl_logic
    );
end ict106_axic_fifo;
