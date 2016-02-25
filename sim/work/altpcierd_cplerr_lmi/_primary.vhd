library verilog;
use verilog.vl_types.all;
entity altpcierd_cplerr_lmi is
    port(
        clk_in          : in     vl_logic;
        rstn            : in     vl_logic;
        err_desc        : in     vl_logic_vector(127 downto 0);
        cpl_err_in      : in     vl_logic_vector(6 downto 0);
        lmi_ack         : in     vl_logic;
        lmi_din         : out    vl_logic_vector(31 downto 0);
        lmi_addr        : out    vl_logic_vector(11 downto 0);
        lmi_wren        : out    vl_logic;
        cpl_err_out     : out    vl_logic_vector(6 downto 0);
        lmi_rden        : out    vl_logic;
        cplerr_lmi_busy : out    vl_logic
    );
end altpcierd_cplerr_lmi;
