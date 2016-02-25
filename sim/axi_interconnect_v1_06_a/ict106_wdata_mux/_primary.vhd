library verilog;
use verilog.vl_types.all;
entity ict106_wdata_mux is
    generic(
        C_FAMILY        : string  := "none";
        C_WMESG_WIDTH   : integer := 1;
        C_NUM_SLAVE_SLOTS: integer := 1;
        C_SELECT_WIDTH  : integer := 1;
        C_FIFO_DEPTH_LOG: integer := 0
    );
    port(
        ACLK            : in     vl_logic;
        ARESET          : in     vl_logic;
        S_WMESG         : in     vl_logic_vector;
        S_WLAST         : in     vl_logic_vector;
        S_WVALID        : in     vl_logic_vector;
        S_WREADY        : out    vl_logic_vector;
        M_WMESG         : out    vl_logic_vector;
        M_WLAST         : out    vl_logic;
        M_WVALID        : out    vl_logic;
        M_WREADY        : in     vl_logic;
        S_ASELECT       : in     vl_logic_vector;
        S_AVALID        : in     vl_logic;
        S_AREADY        : out    vl_logic
    );
end ict106_wdata_mux;
