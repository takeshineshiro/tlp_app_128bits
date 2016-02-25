library verilog;
use verilog.vl_types.all;
entity block_ram is
    generic(
        DATA_W          : integer := 36;
        DEPTH_W         : integer := 9;
        BE_BIT          : integer := 8;
        BE_TYPE         : integer := 0
    );
    port(
        address_a       : in     vl_logic_vector;
        address_b       : in     vl_logic_vector;
        byteena_a       : in     vl_logic_vector;
        clock_a         : in     vl_logic;
        clock_b         : in     vl_logic;
        data_a          : in     vl_logic_vector;
        data_b          : in     vl_logic_vector;
        rden_a          : in     vl_logic;
        rden_b          : in     vl_logic;
        wren_a          : in     vl_logic;
        wren_b          : in     vl_logic;
        q_a             : out    vl_logic_vector;
        q_b             : out    vl_logic_vector
    );
end block_ram;
