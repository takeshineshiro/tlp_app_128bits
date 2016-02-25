library verilog;
use verilog.vl_types.all;
entity ict106_axic_srl_fifo is
    generic(
        C_FAMILY        : string  := "none";
        C_FIFO_WIDTH    : integer := 1;
        C_MAX_CTRL_FANOUT: integer := 33;
        C_FIFO_DEPTH_LOG: integer := 2;
        C_USE_FULL      : integer := 1
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
end ict106_axic_srl_fifo;
