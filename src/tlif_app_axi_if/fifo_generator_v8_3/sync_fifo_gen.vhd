LIBRARY ieee;
USE ieee.std_logic_1164.all;

--LIBRARY altera_mf;
--USE altera_mf.all;

ENTITY sync_fifo_gen IS
  	generic (
		C_FAMILY		:    string  := "Stratix IV";
    		C_WRITE_DATA_WIDTH   	:    integer := 16;
    		C_READ_DATA_WIDTH    	:    integer := 16;
    		C_FIFO_DEPTH      	:    integer := 16;
		C_FIFO_DEPTH_LOG2	:    integer := 4;
    		C_SHOWAHEAD    	 	:    integer := 1
    	);
	PORT
	(
		clock		: IN STD_LOGIC ;
		data		: IN STD_LOGIC_VECTOR (C_WRITE_DATA_WIDTH-1 DOWNTO 0);
		rdreq		: IN STD_LOGIC ;
		sclr		: IN STD_LOGIC ;
		wrreq		: IN STD_LOGIC ;
		almost_full	: OUT STD_LOGIC ;
		empty		: OUT STD_LOGIC ;
		full		: OUT STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (C_READ_DATA_WIDTH-1 DOWNTO 0);
		usedw		: OUT STD_LOGIC_VECTOR (C_FIFO_DEPTH_LOG2-1 DOWNTO 0)
	);
END sync_fifo_gen;

ARCHITECTURE SYN OF sync_fifo_gen IS

constant C_ALMOST_FULL_THRESHOLD : integer := C_FIFO_DEPTH-4;

SIGNAL sub_wire0	: STD_LOGIC_VECTOR (C_FIFO_DEPTH_LOG2-1 DOWNTO 0);
SIGNAL sub_wire1	: STD_LOGIC ;
SIGNAL sub_wire2	: STD_LOGIC ;
SIGNAL sub_wire3	: STD_LOGIC_VECTOR (C_READ_DATA_WIDTH-1 DOWNTO 0);
SIGNAL sub_wire4	: STD_LOGIC ;

COMPONENT scfifo
	GENERIC (
		add_ram_output_register	: STRING;
		almost_full_value	: NATURAL;
		intended_device_family	: STRING;
		lpm_numwords		: NATURAL;
		lpm_showahead		: STRING;
		lpm_type		: STRING;
		lpm_width		: NATURAL;
		lpm_widthu		: NATURAL;
		overflow_checking	: STRING;
		underflow_checking	: STRING;
		use_eab			: STRING
	);
	PORT (
		clock		: IN STD_LOGIC ;
		sclr		: IN STD_LOGIC ;
		usedw		: OUT STD_LOGIC_VECTOR (C_FIFO_DEPTH_LOG2-1 DOWNTO 0);
		empty		: OUT STD_LOGIC ;
		full		: OUT STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (C_READ_DATA_WIDTH-1 DOWNTO 0);
		wrreq		: IN STD_LOGIC ;
		almost_full	: OUT STD_LOGIC ;
		data		: IN STD_LOGIC_VECTOR (C_WRITE_DATA_WIDTH-1 DOWNTO 0);
		rdreq		: IN STD_LOGIC 
	);
END COMPONENT;

BEGIN

usedw    	<= sub_wire0(C_FIFO_DEPTH_LOG2-1 DOWNTO 0);
empty    	<= sub_wire1;
full    	<= sub_wire2;
q    		<= sub_wire3(C_READ_DATA_WIDTH-1 DOWNTO 0);
almost_full    	<= sub_wire4;

GEN_SHOWAHEAD_MODE_FIFO : if (C_SHOWAHEAD = 1) generate
begin
	scfifo_showahead : scfifo
	GENERIC MAP (
		add_ram_output_register 	=> 	"ON",
		almost_full_value 		=> 	C_ALMOST_FULL_THRESHOLD,
		intended_device_family 		=> 	C_FAMILY,
		lpm_numwords 			=> 	C_FIFO_DEPTH,
		lpm_showahead 			=> 	"ON",
		lpm_type 			=> 	"scfifo",
		lpm_width 			=> 	C_READ_DATA_WIDTH,
		lpm_widthu 			=> 	C_FIFO_DEPTH_LOG2,
		overflow_checking 		=> 	"ON",
		underflow_checking 		=> 	"ON",
		use_eab 			=> 	"ON"
	)
	PORT MAP (
		clock 		=> 	clock,
		sclr 		=> 	sclr,
		wrreq 		=> 	wrreq,
		data 		=> 	data,
		rdreq 		=> 	rdreq,
		usedw 		=> 	sub_wire0,
		empty 		=> 	sub_wire1,
		full 		=> 	sub_wire2,
		q 		=> 	sub_wire3,
		almost_full 	=> 	sub_wire4
	);
end generate GEN_SHOWAHEAD_MODE_FIFO;

GEN_NORMAL_MODE_FIFO : if (C_SHOWAHEAD = 0) generate
begin
	scfifo_normal : scfifo
	GENERIC MAP (
		add_ram_output_register 	=> 	"OFF",
		almost_full_value 		=> 	C_ALMOST_FULL_THRESHOLD,
		intended_device_family 		=> 	C_FAMILY,
		lpm_numwords 			=> 	C_FIFO_DEPTH,
		lpm_showahead 			=> 	"OFF",
		lpm_type 			=> 	"scfifo",
		lpm_width 			=> 	C_READ_DATA_WIDTH,
		lpm_widthu 			=> 	C_FIFO_DEPTH_LOG2,
		overflow_checking 		=> 	"ON",
		underflow_checking 		=> 	"ON",
		use_eab 			=> 	"ON"
	)
	PORT MAP (
		clock 		=> 	clock,
		sclr 		=> 	sclr,
		wrreq 		=> 	wrreq,
		data 		=> 	data,
		rdreq 		=> 	rdreq,
		usedw 		=> 	sub_wire0,
		empty 		=> 	sub_wire1,
		full 		=> 	sub_wire2,
		q 		=> 	sub_wire3,
		almost_full 	=> 	sub_wire4
	);
end generate GEN_NORMAL_MODE_FIFO;

END SYN;
