library verilog;
use verilog.vl_types.all;
entity command_fifo is
    generic(
        C_FAMILY        : string  := "virtex6";
        C_ENABLE_S_VALID_CARRY: integer := 0;
        C_ENABLE_REGISTERED_OUTPUT: integer := 0;
        C_FIFO_DEPTH_LOG: integer := 5;
        C_FIFO_WIDTH    : integer := 64
    );
    port(
        ACLK            : in     vl_logic;
        ARESET          : in     vl_logic;
        EMPTY           : out    vl_logic;
        S_MESG          : in     vl_logic_vector;
        S_VALID         : in     vl_logic;
        S_READY         : out    vl_logic;
        M_MESG          : out    vl_logic_vector;
        M_VALID         : out    vl_logic;
        M_READY         : in     vl_logic
    );
end command_fifo;
