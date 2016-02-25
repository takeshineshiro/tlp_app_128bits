library verilog;
use verilog.vl_types.all;
entity ict106_addr_decoder is
    generic(
        C_MAX_M         : integer := 16;
        C_FAMILY        : string  := "none";
        C_NUM_TARGETS   : integer := 2;
        C_NUM_TARGETS_LOG: integer := 1;
        C_NUM_RANGES    : integer := 16;
        C_ADDR_WIDTH    : integer := 32;
        C_TARGET_ENC    : integer := 0;
        C_TARGET_HOT    : integer := 1;
        C_REGION_ENC    : integer := 0;
        C_TARGET_QUAL   : vl_logic_vector(31 downto 0) := (Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1);
        C_RESOLUTION    : integer := 0;
        C_COMPARATOR_THRESHOLD: integer := 6
    );
    port(
        ADDR            : in     vl_logic_vector;
        TARGET_HOT      : out    vl_logic_vector;
        TARGET_ENC      : out    vl_logic_vector;
        MATCH           : out    vl_logic;
        REGION          : out    vl_logic_vector(3 downto 0)
    );
    attribute C_TARGET_QUAL_mti_vect_attrib : integer;
    attribute C_TARGET_QUAL_mti_vect_attrib of C_TARGET_QUAL : constant is -1;
end ict106_addr_decoder;
