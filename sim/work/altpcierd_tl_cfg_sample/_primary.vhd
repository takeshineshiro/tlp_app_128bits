library verilog;
use verilog.vl_types.all;
entity altpcierd_tl_cfg_sample is
    generic(
        HIP_SV          : integer := 0
    );
    port(
        pld_clk         : in     vl_logic;
        rstn            : in     vl_logic;
        tl_cfg_add      : in     vl_logic_vector(3 downto 0);
        tl_cfg_ctl      : in     vl_logic_vector(31 downto 0);
        tl_cfg_ctl_wr   : in     vl_logic;
        tl_cfg_sts      : in     vl_logic_vector(52 downto 0);
        tl_cfg_sts_wr   : in     vl_logic;
        cfg_busdev      : out    vl_logic_vector(12 downto 0);
        cfg_devcsr      : out    vl_logic_vector(31 downto 0);
        cfg_linkcsr     : out    vl_logic_vector(31 downto 0);
        cfg_prmcsr      : out    vl_logic_vector(31 downto 0);
        cfg_io_bas      : out    vl_logic_vector(19 downto 0);
        cfg_io_lim      : out    vl_logic_vector(19 downto 0);
        cfg_np_bas      : out    vl_logic_vector(11 downto 0);
        cfg_np_lim      : out    vl_logic_vector(11 downto 0);
        cfg_pr_bas      : out    vl_logic_vector(43 downto 0);
        cfg_pr_lim      : out    vl_logic_vector(43 downto 0);
        cfg_tcvcmap     : out    vl_logic_vector(23 downto 0);
        cfg_msicsr      : out    vl_logic_vector(15 downto 0)
    );
end altpcierd_tl_cfg_sample;
