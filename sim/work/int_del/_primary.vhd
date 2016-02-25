library verilog;
use verilog.vl_types.all;
entity int_del is
    generic(
        C_INT_NUM       : integer := 2;
        MSI_EN          : integer := 1
    );
    port(
        cfg_interrupt_n : out    vl_logic;
        cfg_interrupt_assert_n: out    vl_logic;
        cfg_interrupt_di: out    vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        msi_request     : in     vl_logic_vector;
        cfg_interrupt_rdy_n: in     vl_logic
    );
end int_del;
