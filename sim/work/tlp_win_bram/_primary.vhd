library verilog;
use verilog.vl_types.all;
entity tlp_win_bram is
    port(
        ip2axi_rdata    : out    vl_logic_vector(31 downto 0);
        channel_sel     : out    vl_logic;
        axi_clk         : in     vl_logic;
        axi_rst         : in     vl_logic;
        trn_clk         : in     vl_logic;
        trn_rst         : in     vl_logic;
        s_rst           : in     vl_logic;
        st_valid0       : in     vl_logic;
        st_ready0       : in     vl_logic;
        st_sop0         : in     vl_logic;
        st_eop0         : in     vl_logic;
        st_be0          : in     vl_logic_vector(7 downto 0);
        st_data0        : in     vl_logic_vector(63 downto 0);
        m_axi_arvalid_user: in     vl_logic;
        m_axi_araddr_user: in     vl_logic_vector(31 downto 0);
        bram_sel        : in     vl_logic
    );
end tlp_win_bram;
