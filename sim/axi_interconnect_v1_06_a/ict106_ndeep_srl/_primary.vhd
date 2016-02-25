library verilog;
use verilog.vl_types.all;
entity ict106_ndeep_srl is
    generic(
        C_FAMILY        : string  := "none";
        C_A_WIDTH       : integer := 1
    );
    port(
        CLK             : in     vl_logic;
        A               : in     vl_logic_vector;
        CE              : in     vl_logic;
        D               : in     vl_logic;
        Q               : out    vl_logic
    );
end ict106_ndeep_srl;
