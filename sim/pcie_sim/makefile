all: dir syn_file sim_file clean


dir:
	-mkdir pcie_sdc lib verilog simmodel ./simmodel/common

syn_file:
	cp pcie.sdc      ./pcie_sdc
	cp pcie.v        ./verilog
	cp pcie_core.v   ./verilog
	cp pcie_serdes.v ./verilog
	cp pcie_examples/chaining_dma/pcie_rs_hip.v                   ./verilog
	cp pcie_examples/chaining_dma/altpcierd_tl_cfg_sample.v       ./verilog
	cp pcie_examples/chaining_dma/altpcierd_cplerr_lmi.v          ./verilog
	cp ./ip_compiler*library/altpcie_pll_100_250.v 		      ./verilog
	cp ./ip_compiler*library/altpcie_pll_125_250.v		      ./verilog
	cp ./ip_compiler*library/altpcie_reconfig_4sgx.v              ./verilog
	cp ./ip_compiler*library/altpcie_rs_serdes.v                  ./verilog
	cp ./ip_compiler*library/altpcie_hip_pipen1b.v                ./lib
	cp ./ip_compiler*library/pciexp_dcram.v                       ./lib

sim_file:
	cp pcie_examples/chaining_dma/testbench/altpcierd_dma_dt_cst_sim.v      ./simmodel	
	cp pcie_examples/chaining_dma/testbench/pcie_chaining_testbench.v       ./simmodel
	cp pcie_examples/chaining_dma/testbench/altpcietb_bfm_driver_chaining.v ./simmodel
	cp pcie_examples/common/testbench/*_bfm*.v                 ./simmodel/common
	cp pcie_examples/common/testbench/altpcietb_bfm_ep_example_chaining_pipen1b.vo     ./simmodel/common
	cp pcie_examples/common/testbench/altpcietb_ltssm_mon.v    ./simmodel/common
	cp pcie_examples/common/testbench/altpcietb_pipe_phy.v     ./simmodel/common
	cp pcie_examples/common/testbench/altpcietb_pipe_xtx2yrx.v ./simmodel/common
	cp pcie_examples/common/testbench/altpcietb_rst_clk.v      ./simmodel/common
	cp pcie_examples/common/testbench/altpcietb_bfm_rpvar_64b_x8_gen1_pipen1b.vo            ./simmodel/common
	cp pcie_examples/common/testbench/altpcietb_bfm_rpvar_64b_x8_gen2_pipen1b.vo            ./simmodel/common

clean:
	rm -rf 	db ip_compiler_for_pci_express-library pcie_examples
	rm *.v  *.vo *.bsf *.html *.ppf *.ppx *.qip *.sdc *.tcl *.cmp
