library verilog;
use verilog.vl_types.all;
entity ict106_axic_register_slice is
    generic(
        C_FAMILY        : string  := "virtex6";
        C_DATA_WIDTH    : integer := 32;
        C_REG_CONFIG    : vl_logic_vector(31 downto 0) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0)
    );
    port(
        ACLK            : in     vl_logic;
        ARESET          : in     vl_logic;
        S_PAYLOAD_DATA  : in     vl_logic_vector;
        S_VALID         : in     vl_logic;
        S_READY         : out    vl_logic;
        M_PAYLOAD_DATA  : out    vl_logic_vector;
        M_VALID         : out    vl_logic;
        M_READY         : in     vl_logic
    );
    attribute C_REG_CONFIG_mti_vect_attrib : integer;
    attribute C_REG_CONFIG_mti_vect_attrib of C_REG_CONFIG : constant is 0;
end ict106_axic_register_slice;
