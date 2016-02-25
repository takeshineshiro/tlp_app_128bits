library verilog;
use verilog.vl_types.all;
entity altpcietb_ltssm_mon is
    generic(
        RP_PRI_BUS_NUM  : vl_logic_vector(7 downto 0) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        RP_PRI_DEV_NUM  : vl_logic_vector(4 downto 0) := (Hi0, Hi0, Hi0, Hi0, Hi0);
        SHMEM_ADDR_WIDTH: integer := 21;
        EBFM_BAR_M64_MIN: vl_logic_vector(63 downto 0) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        EBFM_NUM_VC     : integer := 4;
        EBFM_NUM_TAG    : integer := 32;
        EBFM_MSG_DEBUG  : integer := 0;
        EBFM_MSG_INFO   : integer := 1;
        EBFM_MSG_WARNING: integer := 2;
        EBFM_MSG_ERROR_INFO: integer := 3;
        EBFM_MSG_ERROR_CONTINUE: integer := 4;
        EBFM_MSG_ERROR_FATAL: integer := 101;
        EBFM_MSG_ERROR_FATAL_TB_ERR: integer := 102;
        EBFM_MSG_MAX_LEN: integer := 100;
        SHMEM_FILL_ZERO : integer := 0;
        SHMEM_FILL_BYTE_INC: integer := 1;
        SHMEM_FILL_WORD_INC: integer := 2;
        SHMEM_FILL_DWORD_INC: integer := 4;
        SHMEM_FILL_QWORD_INC: integer := 8;
        SHMEM_FILL_ONE  : integer := 15;
        BAR_TABLE_SIZE  : integer := 64;
        SCR_SIZE        : integer := 64;
        NUM_PS_TO_WAIT  : integer := 8000
    );
    port(
        rp_clk          : in     vl_logic;
        rstn            : in     vl_logic;
        rp_ltssm        : in     vl_logic_vector(4 downto 0);
        ep_ltssm        : in     vl_logic_vector(4 downto 0);
        dummy_out       : out    vl_logic
    );
    attribute RP_PRI_BUS_NUM_mti_vect_attrib : integer;
    attribute RP_PRI_BUS_NUM_mti_vect_attrib of RP_PRI_BUS_NUM : constant is 0;
    attribute RP_PRI_DEV_NUM_mti_vect_attrib : integer;
    attribute RP_PRI_DEV_NUM_mti_vect_attrib of RP_PRI_DEV_NUM : constant is 0;
    attribute EBFM_BAR_M64_MIN_mti_vect_attrib : integer;
    attribute EBFM_BAR_M64_MIN_mti_vect_attrib of EBFM_BAR_M64_MIN : constant is 0;
end altpcietb_ltssm_mon;
