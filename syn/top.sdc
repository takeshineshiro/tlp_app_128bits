derive_pll_clocks 
derive_clock_uncertainty
create_clock -period "100 MHz" -name {free_100MHz} {free_100MHz}

set_false_path -from axi_pcie|pcie_top|epmap|wrapper|altpcie_hip_pipen1b_inst|stratix_iv.stratixiv_hssi_pcie_hip|coreclkout -to axi_pcie|reconfig_pll|altpll_component|auto_generated|pll1|clk[2]
set_false_path -from axi_pcie|reconfig_pll|altpll_component|auto_generated|pll1|clk[2] -to axi_pcie|pcie_top|epmap|wrapper|altpcie_hip_pipen1b_inst|stratix_iv.stratixiv_hssi_pcie_hip|coreclkout

