library verilog;
use verilog.vl_types.all;
entity dma_loop_fifo is
    generic(
        AXI_DATA_WIDTH  : integer := 64
    );
    port(
        m_axis_mm2s_tready: out    vl_logic;
        s_axis_s2mm_tdata: out    vl_logic_vector;
        s_axis_s2mm_tkeep: out    vl_logic_vector;
        s_axis_s2mm_tvalid: out    vl_logic;
        s_axis_s2mm_tlast: out    vl_logic;
        axi_clk         : in     vl_logic;
        axi_rst         : in     vl_logic;
        m_axis_mm2s_tdata: in     vl_logic_vector;
        m_axis_mm2s_tkeep: in     vl_logic_vector;
        m_axis_mm2s_tvalid: in     vl_logic;
        m_axis_mm2s_tlast: in     vl_logic;
        s_axis_s2mm_tready: in     vl_logic
    );
end dma_loop_fifo;
