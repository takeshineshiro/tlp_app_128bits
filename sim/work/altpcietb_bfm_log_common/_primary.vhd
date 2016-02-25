library verilog;
use verilog.vl_types.all;
entity altpcietb_bfm_log_common is
    generic(
        EBFM_MSG_DEBUG  : integer := 0;
        EBFM_MSG_INFO   : integer := 1;
        EBFM_MSG_WARNING: integer := 2;
        EBFM_MSG_ERROR_INFO: integer := 3;
        EBFM_MSG_ERROR_CONTINUE: integer := 4;
        EBFM_MSG_ERROR_FATAL: integer := 101;
        EBFM_MSG_ERROR_FATAL_TB_ERR: integer := 102;
        EBFM_MSG_MAX_LEN: integer := 100
    );
    port(
        dummy_out       : out    vl_logic
    );
end altpcietb_bfm_log_common;
