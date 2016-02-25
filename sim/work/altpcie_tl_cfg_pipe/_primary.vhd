library verilog;
use verilog.vl_types.all;
entity altpcie_tl_cfg_pipe is
    port(
        clk             : in     vl_logic;
        srst            : in     vl_logic;
        o_tl_cfg_add    : out    vl_logic_vector(3 downto 0);
        o_tl_cfg_ctl    : out    vl_logic_vector(31 downto 0);
        o_tl_cfg_ctl_wr : out    vl_logic;
        o_tl_cfg_sts    : out    vl_logic_vector(52 downto 0);
        o_tl_cfg_sts_wr : out    vl_logic;
        i_tl_cfg_add    : in     vl_logic_vector(3 downto 0);
        i_tl_cfg_ctl    : in     vl_logic_vector(31 downto 0);
        i_tl_cfg_ctl_wr : in     vl_logic;
        i_tl_cfg_sts    : in     vl_logic_vector(52 downto 0);
        i_tl_cfg_sts_wr : in     vl_logic
    );
end altpcie_tl_cfg_pipe;
