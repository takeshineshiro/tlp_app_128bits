EDA := /home/wong
SIM_LIB := $(EDA)/altera_13_0
ALTERA_LIB_PATH := $(SIM_LIB)/alib/verilog_libs
VSIM_LIB_ALTERA := -L altera_mf_ver -L lpm_ver -L sgate_ver -L altgxb_ver -L stratixiigx_hssi_ver -L stratixiv_hssi_ver -L stratixiv_pcie_hip_ver -L arriaii_hssi_ver -L arriaii_pcie_hip_ver -L axi_pcie_mm_s_v1_03_a -L proc_common_v3_00_a -L axi_lite_ipif_v1_01_a -L unisim -L axi_interconnect_v1_06_a -L axi_sg_v4_00_a -L axi_datamover_v4_00_a -L axi_dma_v6_00_a
VSIM_LIB := $(VSIM_LIB_ALTERA)

TOP := pcie_chaining_testbench

all: lib comp vsim

lib:
	-vlib work
	-vlib unisim
	-vlib axi_pcie_mm_s_v1_03_a
	-vlib proc_common_v3_00_a
	-vlib axi_lite_ipif_v1_01_a
	-vlib axi_datamover_v4_00_a
	-vlib axi_interconnect_v1_06_a
	-vlib axi_sg_v4_00_a
	-vlib axi_dma_v6_00_a
	vmap altera_mf_ver		$(ALTERA_LIB_PATH)/altera_mf_ver
	vmap lpm_ver 			$(ALTERA_LIB_PATH)/lpm_ver
	vmap sgate_ver			$(ALTERA_LIB_PATH)/sgate_ver
	vmap altgxb_ver			$(ALTERA_LIB_PATH)/altgxb_ver
	vmap stratixiigx_hssi_ver	$(ALTERA_LIB_PATH)/stratixiigx_hssi_ver
	vmap stratixiv_hssi_ver		$(ALTERA_LIB_PATH)/stratixiv_hssi_ver
	vmap stratixiv_pcie_hip_ver	$(ALTERA_LIB_PATH)/stratixiv_pcie_hip_ver
	vmap arriaii_hssi_ver		$(ALTERA_LIB_PATH)/arriaii_hssi_ver
	vmap arriaii_pcie_hip_ver	$(ALTERA_LIB_PATH)/arriaii_pcie_hip_ver


comp:
	vcom -f ../src/tlif_app_axi_if/unisims/unisims.f -reportprogress 30 -work unisim 
	vlog -f ../src/tlif_app_axi_if/axi_interconnect_v1_06_a/axi_interconnect_v1_06_a.f -reportprogress 30 -work axi_interconnect_v1_06_a 
	vcom -f ../src/tlif_app_axi_if/proc_common_v3_00_a/proc_common_v3_00_a.f -reportprogress 30 -work proc_common_v3_00_a
	vcom -f ../src/tlif_app_axi_if/axi_lite_ipif_v1_01_a/axi_lite_ipif_v1_01_a.f -reportprogress 30 -work axi_lite_ipif_v1_01_a   
	vcom -f ../src/tlif_app_axi_if/axi_datamover_v4_00_a/axi_datamover_v4_00_a.f -reportprogress 30 -work axi_datamover_v4_00_a 
	vlog -f ../src/tlif_app_axi_if/proc_common_v3_00_b/proc_common_v3_00_b.f -reportprogress 30 -work axi_pcie_mm_s_v1_03_a
	vcom -f ../src/tlif_app_axi_if/axi_sg_v4_00_a/axi_sg_v4_00_a.f -reportprogress 30 -work axi_sg_v4_00_a
	vcom -f ../src/tlif_app_axi_if/fifo_generator_v8_3/fifo_generator_v8_3_vhdl.f -reportprogress 30 -work proc_common_v3_00_a
	vlog -f ../src/tlif_app_axi_if/fifo_generator_v8_3/fifo_generator_v8_3_verilog.f -reportprogress 30 -work proc_common_v3_00_a
	vlog -f ../src/tlif_app_axi_if/axi_pcie_mm_s_v1_03_a/axi_pcie_mm_s_v1_03_a_verilog.f -reportprogress 30 -work axi_pcie_mm_s_v1_03_a  
	vcom -f ../src/tlif_app_axi_if/axi_pcie_mm_s_v1_03_a/axi_pcie_mm_s_v1_03_a_vhdl.f -reportprogress 30 -work axi_pcie_mm_s_v1_03_a
	vcom -f ../src/axi_dma_v6_00_a/axi_dma_v6_00_a.f -reportprogress 30 -work axi_dma_v6_00_a 
	vlog -f ../src/tlif_app_axi_if/int_del/int_del.f
	vlog -f ../src/user_lib/user_lib.f
	vlog -f ./pcie_sim/pcie_sim.f 
	vlog -f ../src/tlif_app_axi_if/my_cores/Avalon2Axi/Avalon2Axi.f
	vlog -f ../src/tlif_app_axi_if/my_cores/axi_dcr_align/axi_dcr_align.f 
	vlog -f ../src/tlif_app_axi_if/conv/conv.f
	vlog    ../src/axi_pcie.v 
	vlog    ../src/dma_loop_fifo.v
	vlog    ../src/system_axi4lite.v
	vlog    ./top_sim/top.v
	vlog -f ../src/tlif_app_axi_if/my_cores/debug/debug.f
	vcom    ../src/tlif_app_axi_if/my_cores/debug/axi_mm_if.vhd

vsim: vsim_run.do 
	vsim  -novopt -t ps $(VSIM_LIB) $(TOP) glbl -do vsim_run.do          

vsim_run.do:
	echo "do wave.do" >>vsim_run.do
	echo "run 50us" >>vsim_run.do

clean:
	-rm -rf vsim_run.do work nWaveLog verdiLog novas.rc *~ *.wlf modelsim.ini *.vstf vsim_run.do axi_pcie_mm_s_v1_03_a transcript proc_common_v3_00_a axi_lite_ipif_v1_01_a  axi_interconnect_v1_06_a axi_sg_v4_00_a fifo_generator_v8_3 axi_datamover_v4_00_a unisim proc_common_v3_00_b  axi_dma_v6_00_a unism wlft*



