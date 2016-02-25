LIBRARY ieee;
USE ieee.std_logic_1164.all;

--LIBRARY altera_mf;
--USE altera_mf.all;

ENTITY async_fifo_gen IS
  	generic (
		C_FAMILY           	: String  := "Stratix IV";
		C_DATA_WIDTH       	: integer := 16;
		C_FIFO_DEPTH		: integer := 16;
		C_FIFO_DEPTH_LOG2       : integer := 4
    	);
	PORT
	(
		aclr		: IN STD_LOGIC  := '0';
		data		: IN STD_LOGIC_VECTOR (C_DATA_WIDTH-1 DOWNTO 0);
		rdclk		: IN STD_LOGIC ;
		rdreq		: IN STD_LOGIC ;
		wrclk		: IN STD_LOGIC ;
		wrreq		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (C_DATA_WIDTH-1 DOWNTO 0);
		rdempty		: OUT STD_LOGIC ;
		rdusedw		: OUT STD_LOGIC_VECTOR (C_FIFO_DEPTH_LOG2-1 DOWNTO 0);
		wrfull		: OUT STD_LOGIC ;
		wrusedw		: OUT STD_LOGIC_VECTOR (C_FIFO_DEPTH_LOG2-1 DOWNTO 0)
	);
END async_fifo_gen;


ARCHITECTURE SYN OF async_fifo_gen IS

	SIGNAL sub_wire0	: STD_LOGIC ;
	SIGNAL sub_wire1	: STD_LOGIC_VECTOR (C_DATA_WIDTH-1 DOWNTO 0);
	SIGNAL sub_wire2	: STD_LOGIC ;
	SIGNAL sub_wire3	: STD_LOGIC_VECTOR (C_FIFO_DEPTH_LOG2-1 DOWNTO 0);
	SIGNAL sub_wire4	: STD_LOGIC_VECTOR (C_FIFO_DEPTH_LOG2-1 DOWNTO 0);



	COMPONENT dcfifo
	GENERIC (
		intended_device_family	: STRING;
		lpm_numwords		: NATURAL;
		lpm_showahead		: STRING;
		lpm_type		: STRING;
		lpm_width		: NATURAL;
		lpm_widthu		: NATURAL;
		overflow_checking	: STRING;
		rdsync_delaypipe	: NATURAL;
		underflow_checking	: STRING;
		use_eab			: STRING;
		write_aclr_synch	: STRING;
		wrsync_delaypipe	: NATURAL
	);
	PORT (
			rdclk	: IN STD_LOGIC ;
			wrfull	: OUT STD_LOGIC ;
			q	: OUT STD_LOGIC_VECTOR (C_DATA_WIDTH-1 DOWNTO 0);
			rdempty	: OUT STD_LOGIC ;
			wrclk	: IN STD_LOGIC ;
			wrreq	: IN STD_LOGIC ;
			wrusedw	: OUT STD_LOGIC_VECTOR (C_FIFO_DEPTH_LOG2-1 DOWNTO 0);
			aclr	: IN STD_LOGIC ;
			data	: IN STD_LOGIC_VECTOR (C_DATA_WIDTH-1 DOWNTO 0);
			rdreq	: IN STD_LOGIC ;
			rdusedw	: OUT STD_LOGIC_VECTOR (C_FIFO_DEPTH_LOG2-1 DOWNTO 0)
	);
	END COMPONENT;

BEGIN
	wrfull    	<=   sub_wire0;
	q    		<=   sub_wire1(C_DATA_WIDTH-1 DOWNTO 0);
	rdempty    	<=   sub_wire2;
	wrusedw    	<=   sub_wire3(C_FIFO_DEPTH_LOG2-1 DOWNTO 0);
	rdusedw    	<=   sub_wire4(C_FIFO_DEPTH_LOG2-1 DOWNTO 0);

	dcfifo_component : dcfifo
	GENERIC MAP (
		intended_device_family 	=>   C_FAMILY,
		lpm_numwords 		=>   C_FIFO_DEPTH,
		lpm_showahead 		=>   "ON",
		lpm_type 		=>   "dcfifo",
		lpm_width 		=>   C_DATA_WIDTH,
		lpm_widthu 		=>   C_FIFO_DEPTH_LOG2,
		overflow_checking 	=>   "ON",
		rdsync_delaypipe 	=>   5,
		underflow_checking 	=>   "ON",
		use_eab 		=>   "ON",
		write_aclr_synch 	=>   "OFF",
		wrsync_delaypipe 	=>   5
	)
	PORT MAP (
		rdclk 	=>   rdclk,
		wrclk 	=>   wrclk,
		wrreq 	=>   wrreq,
		aclr 	=>   aclr,
		data 	=>   data,
		rdreq 	=>   rdreq,
		wrfull 	=>   sub_wire0,
		q 	=>   sub_wire1,
		rdempty =>   sub_wire2,
		wrusedw =>   sub_wire3,
		rdusedw =>   sub_wire4
	);

END SYN;
