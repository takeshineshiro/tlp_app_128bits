//-----------------------------------------------------------------------------
// system.v
//-----------------------------------------------------------------------------

module system
  (
    RESET,
    PCI_Express_pci_exp_txp,
    PCI_Express_pci_exp_txn,
    PCI_Express_pci_exp_rxp,
    PCI_Express_pci_exp_rxn,
    CLK_P,
    CLK_N,
    PCIe_Diff_Clk_P,
    PCIe_Diff_Clk_N,
    PCIe_perstn,
    axi_emc_0_RdClk_pin,
    axi_emc_0_Mem_A_pin,
    axi_emc_0_Mem_RPN_pin,
    axi_emc_0_Mem_CE_pin,
    axi_emc_0_Mem_CEN_pin,
    axi_emc_0_Mem_OEN_pin,
    axi_emc_0_Mem_WEN_pin,
    axi_emc_0_Mem_QWEN_pin,
    axi_emc_0_Mem_BEN_pin,
    axi_emc_0_Mem_ADV_LDN_pin,
    axi_emc_0_Mem_LBON_pin,
    axi_emc_0_Mem_CKEN_pin,
    axi_emc_0_Mem_CRE_pin,
    axi_emc_0_Mem_RNW_pin,
    axi_emc_0_Mem_DQ_pin,
    axi_emc_0_MEM_DQ_PARITY_pin
  );
  input RESET;
  output [3:0] PCI_Express_pci_exp_txp;
  output [3:0] PCI_Express_pci_exp_txn;
  input [3:0] PCI_Express_pci_exp_rxp;
  input [3:0] PCI_Express_pci_exp_rxn;
  input CLK_P;
  input CLK_N;
  input PCIe_Diff_Clk_P;
  input PCIe_Diff_Clk_N;
  input PCIe_perstn;
  input axi_emc_0_RdClk_pin;
  output [31:0] axi_emc_0_Mem_A_pin;
  output axi_emc_0_Mem_RPN_pin;
  output axi_emc_0_Mem_CE_pin;
  output axi_emc_0_Mem_CEN_pin;
  output axi_emc_0_Mem_OEN_pin;
  output axi_emc_0_Mem_WEN_pin;
  output [7:0] axi_emc_0_Mem_QWEN_pin;
  output [7:0] axi_emc_0_Mem_BEN_pin;
  output axi_emc_0_Mem_ADV_LDN_pin;
  output axi_emc_0_Mem_LBON_pin;
  output axi_emc_0_Mem_CKEN_pin;
  output axi_emc_0_Mem_CRE_pin;
  output axi_emc_0_Mem_RNW_pin;
  inout [63:0] axi_emc_0_Mem_DQ_pin;
  inout [7:0] axi_emc_0_MEM_DQ_PARITY_pin;

  // Internal signals

  wire CLK;
  wire [31:0] ETHERNET_dma_txc_TDATA;
  wire [3:0] ETHERNET_dma_txc_TKEEP;
  wire ETHERNET_dma_txc_TLAST;
  wire ETHERNET_dma_txc_TREADY;
  wire ETHERNET_dma_txc_TVALID;
  wire [63:0] ETHERNET_dma_txd_TDATA;
  wire [7:0] ETHERNET_dma_txd_TKEEP;
  wire ETHERNET_dma_txd_TLAST;
  wire ETHERNET_dma_txd_TREADY;
  wire ETHERNET_dma_txd_TVALID;
  wire [0:0] PCIe_Diff_Clk;
  wire [0:0] PCIe_MMCM_Lock;
  wire [63:0] axi4_0_M_ARADDR;
  wire [3:0] axi4_0_M_ARBURST;
  wire [7:0] axi4_0_M_ARCACHE;
  wire [1:0] axi4_0_M_ARESETN;
  wire [3:0] axi4_0_M_ARID;
  wire [15:0] axi4_0_M_ARLEN;
  wire [3:0] axi4_0_M_ARLOCK;
  wire [5:0] axi4_0_M_ARPROT;
  wire [1:0] axi4_0_M_ARREADY;
  wire [7:0] axi4_0_M_ARREGION;
  wire [5:0] axi4_0_M_ARSIZE;
  wire [1:0] axi4_0_M_ARVALID;
  wire [63:0] axi4_0_M_AWADDR;
  wire [3:0] axi4_0_M_AWBURST;
  wire [7:0] axi4_0_M_AWCACHE;
  wire [3:0] axi4_0_M_AWID;
  wire [15:0] axi4_0_M_AWLEN;
  wire [3:0] axi4_0_M_AWLOCK;
  wire [5:0] axi4_0_M_AWPROT;
  wire [1:0] axi4_0_M_AWREADY;
  wire [7:0] axi4_0_M_AWREGION;
  wire [5:0] axi4_0_M_AWSIZE;
  wire [1:0] axi4_0_M_AWVALID;
  wire [3:0] axi4_0_M_BID;
  wire [1:0] axi4_0_M_BREADY;
  wire [3:0] axi4_0_M_BRESP;
  wire [1:0] axi4_0_M_BVALID;
  wire [127:0] axi4_0_M_RDATA;
  wire [3:0] axi4_0_M_RID;
  wire [1:0] axi4_0_M_RLAST;
  wire [1:0] axi4_0_M_RREADY;
  wire [3:0] axi4_0_M_RRESP;
  wire [1:0] axi4_0_M_RVALID;
  wire [127:0] axi4_0_M_WDATA;
  wire [1:0] axi4_0_M_WLAST;
  wire [1:0] axi4_0_M_WREADY;
  wire [15:0] axi4_0_M_WSTRB;
  wire [1:0] axi4_0_M_WVALID;
  wire [95:0] axi4_0_S_ARADDR;
  wire [5:0] axi4_0_S_ARBURST;
  wire [11:0] axi4_0_S_ARCACHE;
  wire [23:0] axi4_0_S_ARLEN;
  wire [8:0] axi4_0_S_ARPROT;
  wire [2:0] axi4_0_S_ARREADY;
  wire [8:0] axi4_0_S_ARSIZE;
  wire [2:0] axi4_0_S_ARVALID;
  wire [95:0] axi4_0_S_AWADDR;
  wire [5:0] axi4_0_S_AWBURST;
  wire [11:0] axi4_0_S_AWCACHE;
  wire [23:0] axi4_0_S_AWLEN;
  wire [8:0] axi4_0_S_AWPROT;
  wire [2:0] axi4_0_S_AWREADY;
  wire [8:0] axi4_0_S_AWSIZE;
  wire [2:0] axi4_0_S_AWVALID;
  wire [2:0] axi4_0_S_BREADY;
  wire [5:0] axi4_0_S_BRESP;
  wire [2:0] axi4_0_S_BVALID;
  wire [191:0] axi4_0_S_RDATA;
  wire [2:0] axi4_0_S_RLAST;
  wire [2:0] axi4_0_S_RREADY;
  wire [5:0] axi4_0_S_RRESP;
  wire [2:0] axi4_0_S_RVALID;
  wire [191:0] axi4_0_S_WDATA;
  wire [2:0] axi4_0_S_WLAST;
  wire [2:0] axi4_0_S_WREADY;
  wire [23:0] axi4_0_S_WSTRB;
  wire [2:0] axi4_0_S_WVALID;
  wire [127:0] axi4lite_0_M_ARADDR;
  wire [7:0] axi4lite_0_M_ARBURST;
  wire [15:0] axi4lite_0_M_ARCACHE;
  wire [3:0] axi4lite_0_M_ARESETN;
  wire [3:0] axi4lite_0_M_ARID;
  wire [31:0] axi4lite_0_M_ARLEN;
  wire [7:0] axi4lite_0_M_ARLOCK;
  wire [11:0] axi4lite_0_M_ARPROT;
  wire [3:0] axi4lite_0_M_ARREADY;
  wire [11:0] axi4lite_0_M_ARSIZE;
  wire [3:0] axi4lite_0_M_ARVALID;
  wire [127:0] axi4lite_0_M_AWADDR;
  wire [7:0] axi4lite_0_M_AWBURST;
  wire [15:0] axi4lite_0_M_AWCACHE;
  wire [3:0] axi4lite_0_M_AWID;
  wire [31:0] axi4lite_0_M_AWLEN;
  wire [7:0] axi4lite_0_M_AWLOCK;
  wire [11:0] axi4lite_0_M_AWPROT;
  wire [3:0] axi4lite_0_M_AWREADY;
  wire [11:0] axi4lite_0_M_AWSIZE;
  wire [3:0] axi4lite_0_M_AWVALID;
  wire [3:0] axi4lite_0_M_BID;
  wire [3:0] axi4lite_0_M_BREADY;
  wire [7:0] axi4lite_0_M_BRESP;
  wire [3:0] axi4lite_0_M_BVALID;
  wire [255:0] axi4lite_0_M_RDATA;
  wire [3:0] axi4lite_0_M_RID;
  wire [3:0] axi4lite_0_M_RLAST;
  wire [3:0] axi4lite_0_M_RREADY;
  wire [7:0] axi4lite_0_M_RRESP;
  wire [3:0] axi4lite_0_M_RVALID;
  wire [255:0] axi4lite_0_M_WDATA;
  wire [3:0] axi4lite_0_M_WLAST;
  wire [3:0] axi4lite_0_M_WREADY;
  wire [31:0] axi4lite_0_M_WSTRB;
  wire [3:0] axi4lite_0_M_WVALID;
  wire [31:0] axi4lite_0_S_ARADDR;
  wire [1:0] axi4lite_0_S_ARBURST;
  wire [3:0] axi4lite_0_S_ARCACHE;
  wire [0:0] axi4lite_0_S_ARESETN;
  wire [7:0] axi4lite_0_S_ARLEN;
  wire [1:0] axi4lite_0_S_ARLOCK;
  wire [2:0] axi4lite_0_S_ARPROT;
  wire [0:0] axi4lite_0_S_ARREADY;
  wire [2:0] axi4lite_0_S_ARSIZE;
  wire [0:0] axi4lite_0_S_ARVALID;
  wire [31:0] axi4lite_0_S_AWADDR;
  wire [1:0] axi4lite_0_S_AWBURST;
  wire [3:0] axi4lite_0_S_AWCACHE;
  wire [7:0] axi4lite_0_S_AWLEN;
  wire [1:0] axi4lite_0_S_AWLOCK;
  wire [2:0] axi4lite_0_S_AWPROT;
  wire [0:0] axi4lite_0_S_AWREADY;
  wire [2:0] axi4lite_0_S_AWSIZE;
  wire [0:0] axi4lite_0_S_AWVALID;
  wire [0:0] axi4lite_0_S_BREADY;
  wire [1:0] axi4lite_0_S_BRESP;
  wire [0:0] axi4lite_0_S_BVALID;
  wire [63:0] axi4lite_0_S_RDATA;
  wire [0:0] axi4lite_0_S_RLAST;
  wire [0:0] axi4lite_0_S_RREADY;
  wire [1:0] axi4lite_0_S_RRESP;
  wire [0:0] axi4lite_0_S_RVALID;
  wire [63:0] axi4lite_0_S_WDATA;
  wire [0:0] axi4lite_0_S_WLAST;
  wire [0:0] axi4lite_0_S_WREADY;
  wire [7:0] axi4lite_0_S_WSTRB;
  wire [0:0] axi4lite_0_S_WVALID;
  wire [0:0] axi_aclk_out;
  wire [0:31] axi_bram_ctrl_0_bram_porta_2_axi_bram_ctrl_0_bram_block_porta_BRAM_Addr;
  wire axi_bram_ctrl_0_bram_porta_2_axi_bram_ctrl_0_bram_block_porta_BRAM_Clk;
  wire [31:0] axi_bram_ctrl_0_bram_porta_2_axi_bram_ctrl_0_bram_block_porta_BRAM_Din;
  wire [0:31] axi_bram_ctrl_0_bram_porta_2_axi_bram_ctrl_0_bram_block_porta_BRAM_Dout;
  wire axi_bram_ctrl_0_bram_porta_2_axi_bram_ctrl_0_bram_block_porta_BRAM_EN;
  wire axi_bram_ctrl_0_bram_porta_2_axi_bram_ctrl_0_bram_block_porta_BRAM_Rst;
  wire [0:3] axi_bram_ctrl_0_bram_porta_2_axi_bram_ctrl_0_bram_block_porta_BRAM_WEN;
  wire [0:31] axi_bram_ctrl_0_bram_portb_2_axi_bram_ctrl_0_bram_block_portb_BRAM_Addr;
  wire axi_bram_ctrl_0_bram_portb_2_axi_bram_ctrl_0_bram_block_portb_BRAM_Clk;
  wire [31:0] axi_bram_ctrl_0_bram_portb_2_axi_bram_ctrl_0_bram_block_portb_BRAM_Din;
  wire [0:31] axi_bram_ctrl_0_bram_portb_2_axi_bram_ctrl_0_bram_block_portb_BRAM_Dout;
  wire axi_bram_ctrl_0_bram_portb_2_axi_bram_ctrl_0_bram_block_portb_BRAM_EN;
  wire axi_bram_ctrl_0_bram_portb_2_axi_bram_ctrl_0_bram_block_portb_BRAM_Rst;
  wire [0:3] axi_bram_ctrl_0_bram_portb_2_axi_bram_ctrl_0_bram_block_portb_BRAM_WEN;
  wire axi_ctl_aclk_out;
  wire [7:0] axi_emc_0_MEM_DQ_PARITY_I;
  wire [7:0] axi_emc_0_MEM_DQ_PARITY_O;
  wire [7:0] axi_emc_0_MEM_DQ_PARITY_T;
  wire [31:0] axi_emc_0_Mem_A;
  wire axi_emc_0_Mem_ADV_LDN;
  wire [7:0] axi_emc_0_Mem_BEN;
  wire [0:0] axi_emc_0_Mem_CE;
  wire [0:0] axi_emc_0_Mem_CEN;
  wire axi_emc_0_Mem_CKEN;
  wire axi_emc_0_Mem_CRE;
  wire [63:0] axi_emc_0_Mem_DQ_I;
  wire [63:0] axi_emc_0_Mem_DQ_O;
  wire [63:0] axi_emc_0_Mem_DQ_T;
  wire axi_emc_0_Mem_LBON;
  wire [0:0] axi_emc_0_Mem_OEN;
  wire [7:0] axi_emc_0_Mem_QWEN;
  wire axi_emc_0_Mem_RNW;
  wire axi_emc_0_Mem_RPN;
  wire axi_emc_0_Mem_WEN;
  wire clk_100_0000MHzMMCM0;
  wire [0:0] clk_gen_locked;
  wire net_axi_emc_0_RdClk_pin;
  wire net_gnd0;
  wire [0:0] net_gnd1;
  wire [1:0] net_gnd2;
  wire [2:0] net_gnd3;
  wire [3:0] net_gnd4;
  wire [4:0] net_gnd5;
  wire [5:0] net_gnd6;
  wire [11:0] net_gnd12;
  wire [31:0] net_gnd32;
  wire [0:0] pgassign1;
  wire [0:0] pgassign2;
  wire [3:0] pgassign3;
  wire [2:0] pgassign4;
  wire [1:0] pgassign5;
  wire [0:0] proc_sys_reset_0_Dcm_locked;
  wire [0:0] proc_sys_reset_0_Interconnect_aresetn;
  wire rx_intr;

  // Internal assignments

  assign net_axi_emc_0_RdClk_pin = axi_emc_0_RdClk_pin;
  assign axi_emc_0_Mem_A_pin = axi_emc_0_Mem_A;
  assign axi_emc_0_Mem_RPN_pin = axi_emc_0_Mem_RPN;
  assign axi_emc_0_Mem_CE_pin = axi_emc_0_Mem_CE[0];
  assign axi_emc_0_Mem_CEN_pin = axi_emc_0_Mem_CEN[0];
  assign axi_emc_0_Mem_OEN_pin = axi_emc_0_Mem_OEN[0];
  assign axi_emc_0_Mem_WEN_pin = axi_emc_0_Mem_WEN;
  assign axi_emc_0_Mem_QWEN_pin = axi_emc_0_Mem_QWEN;
  assign axi_emc_0_Mem_BEN_pin = axi_emc_0_Mem_BEN;
  assign axi_emc_0_Mem_ADV_LDN_pin = axi_emc_0_Mem_ADV_LDN;
  assign axi_emc_0_Mem_LBON_pin = axi_emc_0_Mem_LBON;
  assign axi_emc_0_Mem_CKEN_pin = axi_emc_0_Mem_CKEN;
  assign axi_emc_0_Mem_CRE_pin = axi_emc_0_Mem_CRE;
  assign axi_emc_0_Mem_RNW_pin = axi_emc_0_Mem_RNW;
  assign axi4lite_0_M_BID[1:1] = 1'b0;
  assign axi4lite_0_M_RID[1:1] = 1'b0;
  assign axi4lite_0_M_RLAST[1:1] = 1'b0;
  assign axi4_0_S_AWADDR[63:32] = 32'b00000000000000000000000000000000;
  assign axi4_0_S_AWLEN[15:8] = 8'b00000000;
  assign axi4_0_S_AWSIZE[5:3] = 3'b000;
  assign axi4_0_S_AWBURST[3:2] = 2'b00;
  assign axi4_0_S_AWCACHE[7:4] = 4'b0000;
  assign axi4_0_S_AWPROT[5:3] = 3'b000;
  assign axi4_0_S_AWVALID[1:1] = 1'b0;
  assign axi4_0_S_WDATA[127:64] = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  assign axi4_0_S_WSTRB[15:8] = 8'b00000000;
  assign axi4_0_S_WLAST[1:1] = 1'b0;
  assign axi4_0_S_WVALID[1:1] = 1'b0;
  assign axi4_0_S_BREADY[1:1] = 1'b0;
  assign axi4_0_S_ARADDR[95:64] = 32'b00000000000000000000000000000000;
  assign axi4_0_S_ARLEN[23:16] = 8'b00000000;
  assign axi4_0_S_ARSIZE[8:6] = 3'b000;
  assign axi4_0_S_ARBURST[5:4] = 2'b00;
  assign axi4_0_S_ARCACHE[11:8] = 4'b0000;
  assign axi4_0_S_ARPROT[8:6] = 3'b000;
  assign axi4_0_S_ARVALID[2:2] = 1'b0;
  assign axi4_0_S_RREADY[2:2] = 1'b0;
  assign pgassign1[0] = PCIe_Diff_Clk_P;
  assign pgassign2[0] = PCIe_Diff_Clk_N;
  assign pgassign3[3] = clk_100_0000MHzMMCM0;
  assign pgassign3[2] = clk_100_0000MHzMMCM0;
  assign pgassign3[1] = clk_100_0000MHzMMCM0;
  assign pgassign3[0] = clk_100_0000MHzMMCM0;
  assign pgassign4[2] = clk_100_0000MHzMMCM0;
  assign pgassign4[1] = clk_100_0000MHzMMCM0;
  assign pgassign4[0] = clk_100_0000MHzMMCM0;
  assign pgassign5[1] = clk_100_0000MHzMMCM0;
  assign pgassign5[0:0] = axi_aclk_out[0:0];
  assign net_gnd0 = 1'b0;
  assign net_gnd1[0:0] = 1'b0;
  assign net_gnd12[11:0] = 12'b000000000000;
  assign net_gnd2[1:0] = 2'b00;
  assign net_gnd3[2:0] = 3'b000;
  assign net_gnd32[31:0] = 32'b00000000000000000000000000000000;
  assign net_gnd4[3:0] = 4'b0000;
  assign net_gnd5[4:0] = 5'b00000;
  assign net_gnd6[5:0] = 6'b000000;

  (* BOX_TYPE = "user_black_box" *)
  system_util_and_logic_0_wrapper
    util_and_logic_0 (
      .Op1 ( PCIe_MMCM_Lock[0:0] ),
      .Op2 ( clk_gen_locked[0:0] ),
      .Res ( proc_sys_reset_0_Dcm_locked[0:0] )
    );

  (* BOX_TYPE = "user_black_box" *)
  system_proc_sys_reset_0_wrapper
    proc_sys_reset_0 (
      .Slowest_sync_clk ( clk_100_0000MHzMMCM0 ),
      .Ext_Reset_In ( RESET ),
      .Aux_Reset_In ( PCIe_perstn ),
      .MB_Debug_Sys_Rst ( net_gnd0 ),
      .Core_Reset_Req_0 ( net_gnd0 ),
      .Chip_Reset_Req_0 ( net_gnd0 ),
      .System_Reset_Req_0 ( net_gnd0 ),
      .Core_Reset_Req_1 ( net_gnd0 ),
      .Chip_Reset_Req_1 ( net_gnd0 ),
      .System_Reset_Req_1 ( net_gnd0 ),
      .Dcm_locked ( proc_sys_reset_0_Dcm_locked[0] ),
      .RstcPPCresetcore_0 (  ),
      .RstcPPCresetchip_0 (  ),
      .RstcPPCresetsys_0 (  ),
      .RstcPPCresetcore_1 (  ),
      .RstcPPCresetchip_1 (  ),
      .RstcPPCresetsys_1 (  ),
      .MB_Reset (  ),
      .Bus_Struct_Reset (  ),
      .Peripheral_Reset (  ),
      .Interconnect_aresetn ( proc_sys_reset_0_Interconnect_aresetn[0:0] ),
      .Peripheral_aresetn (  )
    );

  (* BOX_TYPE = "user_black_box" *)
  system_clock_generator_0_wrapper
    clock_generator_0 (
      .CLKIN ( CLK ),
      .CLKOUT0 ( clk_100_0000MHzMMCM0 ),
      .CLKOUT1 (  ),
      .CLKOUT2 (  ),
      .CLKOUT3 (  ),
      .CLKOUT4 (  ),
      .CLKOUT5 (  ),
      .CLKOUT6 (  ),
      .CLKOUT7 (  ),
      .CLKOUT8 (  ),
      .CLKOUT9 (  ),
      .CLKOUT10 (  ),
      .CLKOUT11 (  ),
      .CLKOUT12 (  ),
      .CLKOUT13 (  ),
      .CLKOUT14 (  ),
      .CLKOUT15 (  ),
      .CLKFBIN ( net_gnd0 ),
      .CLKFBOUT (  ),
      .PSCLK ( net_gnd0 ),
      .PSEN ( net_gnd0 ),
      .PSINCDEC ( net_gnd0 ),
      .PSDONE (  ),
      .RST ( RESET ),
      .LOCKED ( clk_gen_locked[0] )
    );

  (* BOX_TYPE = "user_black_box" *)
  system_axi_mac_reg_bram_wrapper
    axi_mac_reg_bram (
      .BRAM_Rst_A ( axi_bram_ctrl_0_bram_porta_2_axi_bram_ctrl_0_bram_block_porta_BRAM_Rst ),
      .BRAM_Clk_A ( axi_bram_ctrl_0_bram_porta_2_axi_bram_ctrl_0_bram_block_porta_BRAM_Clk ),
      .BRAM_EN_A ( axi_bram_ctrl_0_bram_porta_2_axi_bram_ctrl_0_bram_block_porta_BRAM_EN ),
      .BRAM_WEN_A ( axi_bram_ctrl_0_bram_porta_2_axi_bram_ctrl_0_bram_block_porta_BRAM_WEN ),
      .BRAM_Addr_A ( axi_bram_ctrl_0_bram_porta_2_axi_bram_ctrl_0_bram_block_porta_BRAM_Addr ),
      .BRAM_Din_A ( axi_bram_ctrl_0_bram_porta_2_axi_bram_ctrl_0_bram_block_porta_BRAM_Din[31:0] ),
      .BRAM_Dout_A ( axi_bram_ctrl_0_bram_porta_2_axi_bram_ctrl_0_bram_block_porta_BRAM_Dout ),
      .BRAM_Rst_B ( axi_bram_ctrl_0_bram_portb_2_axi_bram_ctrl_0_bram_block_portb_BRAM_Rst ),
      .BRAM_Clk_B ( axi_bram_ctrl_0_bram_portb_2_axi_bram_ctrl_0_bram_block_portb_BRAM_Clk ),
      .BRAM_EN_B ( axi_bram_ctrl_0_bram_portb_2_axi_bram_ctrl_0_bram_block_portb_BRAM_EN ),
      .BRAM_WEN_B ( axi_bram_ctrl_0_bram_portb_2_axi_bram_ctrl_0_bram_block_portb_BRAM_WEN ),
      .BRAM_Addr_B ( axi_bram_ctrl_0_bram_portb_2_axi_bram_ctrl_0_bram_block_portb_BRAM_Addr ),
      .BRAM_Din_B ( axi_bram_ctrl_0_bram_portb_2_axi_bram_ctrl_0_bram_block_portb_BRAM_Din[31:0] ),
      .BRAM_Dout_B ( axi_bram_ctrl_0_bram_portb_2_axi_bram_ctrl_0_bram_block_portb_BRAM_Dout )
    );

  (* BOX_TYPE = "user_black_box" *)
  system_axi_mac_reg_0_wrapper
    axi_mac_reg_0 (
      .ECC_Interrupt (  ),
      .ECC_UE (  ),
      .S_AXI_ACLK ( clk_100_0000MHzMMCM0 ),
      .S_AXI_ARESETN ( axi4lite_0_M_ARESETN[0] ),
      .S_AXI_AWID ( axi4lite_0_M_AWID[0:0] ),
      .S_AXI_AWADDR ( axi4lite_0_M_AWADDR[31:0] ),
      .S_AXI_AWLEN ( axi4lite_0_M_AWLEN[7:0] ),
      .S_AXI_AWSIZE ( axi4lite_0_M_AWSIZE[2:0] ),
      .S_AXI_AWBURST ( axi4lite_0_M_AWBURST[1:0] ),
      .S_AXI_AWLOCK ( axi4lite_0_M_AWLOCK[0] ),
      .S_AXI_AWCACHE ( axi4lite_0_M_AWCACHE[3:0] ),
      .S_AXI_AWPROT ( axi4lite_0_M_AWPROT[2:0] ),
      .S_AXI_AWVALID ( axi4lite_0_M_AWVALID[0] ),
      .S_AXI_AWREADY ( axi4lite_0_M_AWREADY[0] ),
      .S_AXI_WDATA ( axi4lite_0_M_WDATA[31:0] ),
      .S_AXI_WSTRB ( axi4lite_0_M_WSTRB[3:0] ),
      .S_AXI_WLAST ( axi4lite_0_M_WLAST[0] ),
      .S_AXI_WVALID ( axi4lite_0_M_WVALID[0] ),
      .S_AXI_WREADY ( axi4lite_0_M_WREADY[0] ),
      .S_AXI_BID ( axi4lite_0_M_BID[0:0] ),
      .S_AXI_BRESP ( axi4lite_0_M_BRESP[1:0] ),
      .S_AXI_BVALID ( axi4lite_0_M_BVALID[0] ),
      .S_AXI_BREADY ( axi4lite_0_M_BREADY[0] ),
      .S_AXI_ARID ( axi4lite_0_M_ARID[0:0] ),
      .S_AXI_ARADDR ( axi4lite_0_M_ARADDR[31:0] ),
      .S_AXI_ARLEN ( axi4lite_0_M_ARLEN[7:0] ),
      .S_AXI_ARSIZE ( axi4lite_0_M_ARSIZE[2:0] ),
      .S_AXI_ARBURST ( axi4lite_0_M_ARBURST[1:0] ),
      .S_AXI_ARLOCK ( axi4lite_0_M_ARLOCK[0] ),
      .S_AXI_ARCACHE ( axi4lite_0_M_ARCACHE[3:0] ),
      .S_AXI_ARPROT ( axi4lite_0_M_ARPROT[2:0] ),
      .S_AXI_ARVALID ( axi4lite_0_M_ARVALID[0] ),
      .S_AXI_ARREADY ( axi4lite_0_M_ARREADY[0] ),
      .S_AXI_RID ( axi4lite_0_M_RID[0:0] ),
      .S_AXI_RDATA ( axi4lite_0_M_RDATA[31:0] ),
      .S_AXI_RRESP ( axi4lite_0_M_RRESP[1:0] ),
      .S_AXI_RVALID ( axi4lite_0_M_RVALID[0] ),
      .S_AXI_RREADY ( axi4lite_0_M_RREADY[0] ),
      .S_AXI_RLAST ( axi4lite_0_M_RLAST[0] ),
      .S_AXI_CTRL_AWVALID ( net_gnd0 ),
      .S_AXI_CTRL_AWREADY (  ),
      .S_AXI_CTRL_AWADDR ( net_gnd32 ),
      .S_AXI_CTRL_WVALID ( net_gnd0 ),
      .S_AXI_CTRL_WREADY (  ),
      .S_AXI_CTRL_WDATA ( net_gnd32 ),
      .S_AXI_CTRL_BRESP (  ),
      .S_AXI_CTRL_BVALID (  ),
      .S_AXI_CTRL_BREADY ( net_gnd0 ),
      .S_AXI_CTRL_ARVALID ( net_gnd0 ),
      .S_AXI_CTRL_ARREADY (  ),
      .S_AXI_CTRL_ARADDR ( net_gnd32 ),
      .S_AXI_CTRL_RVALID (  ),
      .S_AXI_CTRL_RREADY ( net_gnd0 ),
      .S_AXI_CTRL_RDATA (  ),
      .S_AXI_CTRL_RRESP (  ),
      .BRAM_Rst_A ( axi_bram_ctrl_0_bram_porta_2_axi_bram_ctrl_0_bram_block_porta_BRAM_Rst ),
      .BRAM_Clk_A ( axi_bram_ctrl_0_bram_porta_2_axi_bram_ctrl_0_bram_block_porta_BRAM_Clk ),
      .BRAM_En_A ( axi_bram_ctrl_0_bram_porta_2_axi_bram_ctrl_0_bram_block_porta_BRAM_EN ),
      .BRAM_WE_A ( axi_bram_ctrl_0_bram_porta_2_axi_bram_ctrl_0_bram_block_porta_BRAM_WEN[0:3] ),
      .BRAM_Addr_A ( axi_bram_ctrl_0_bram_porta_2_axi_bram_ctrl_0_bram_block_porta_BRAM_Addr[0:31] ),
      .BRAM_WrData_A ( axi_bram_ctrl_0_bram_porta_2_axi_bram_ctrl_0_bram_block_porta_BRAM_Dout[0:31] ),
      .BRAM_RdData_A ( axi_bram_ctrl_0_bram_porta_2_axi_bram_ctrl_0_bram_block_porta_BRAM_Din ),
      .BRAM_Rst_B ( axi_bram_ctrl_0_bram_portb_2_axi_bram_ctrl_0_bram_block_portb_BRAM_Rst ),
      .BRAM_Clk_B ( axi_bram_ctrl_0_bram_portb_2_axi_bram_ctrl_0_bram_block_portb_BRAM_Clk ),
      .BRAM_En_B ( axi_bram_ctrl_0_bram_portb_2_axi_bram_ctrl_0_bram_block_portb_BRAM_EN ),
      .BRAM_WE_B ( axi_bram_ctrl_0_bram_portb_2_axi_bram_ctrl_0_bram_block_portb_BRAM_WEN[0:3] ),
      .BRAM_Addr_B ( axi_bram_ctrl_0_bram_portb_2_axi_bram_ctrl_0_bram_block_portb_BRAM_Addr[0:31] ),
      .BRAM_WrData_B ( axi_bram_ctrl_0_bram_portb_2_axi_bram_ctrl_0_bram_block_portb_BRAM_Dout[0:31] ),
      .BRAM_RdData_B ( axi_bram_ctrl_0_bram_portb_2_axi_bram_ctrl_0_bram_block_portb_BRAM_Din )
    );

  (* BOX_TYPE = "user_black_box" *)
  system_axi4lite_0_wrapper
    axi4lite_0 (
      .INTERCONNECT_ACLK ( clk_100_0000MHzMMCM0 ),
      .INTERCONNECT_ARESETN ( proc_sys_reset_0_Interconnect_aresetn[0] ),
      .S_AXI_ARESET_OUT_N ( axi4lite_0_S_ARESETN[0:0] ),
      .M_AXI_ARESET_OUT_N ( axi4lite_0_M_ARESETN ),
      .IRQ (  ),
      .S_AXI_ACLK ( axi_aclk_out[0:0] ),
      .S_AXI_AWID ( net_gnd1[0:0] ),
      .S_AXI_AWADDR ( axi4lite_0_S_AWADDR ),
      .S_AXI_AWLEN ( axi4lite_0_S_AWLEN ),
      .S_AXI_AWSIZE ( axi4lite_0_S_AWSIZE ),
      .S_AXI_AWBURST ( axi4lite_0_S_AWBURST ),
      .S_AXI_AWLOCK ( axi4lite_0_S_AWLOCK ),
      .S_AXI_AWCACHE ( axi4lite_0_S_AWCACHE ),
      .S_AXI_AWPROT ( axi4lite_0_S_AWPROT ),
      .S_AXI_AWQOS ( net_gnd4 ),
      .S_AXI_AWUSER ( net_gnd1[0:0] ),
      .S_AXI_AWVALID ( axi4lite_0_S_AWVALID[0:0] ),
      .S_AXI_AWREADY ( axi4lite_0_S_AWREADY[0:0] ),
      .S_AXI_WID ( net_gnd1[0:0] ),
      .S_AXI_WDATA ( axi4lite_0_S_WDATA ),
      .S_AXI_WSTRB ( axi4lite_0_S_WSTRB ),
      .S_AXI_WLAST ( axi4lite_0_S_WLAST[0:0] ),
      .S_AXI_WUSER ( net_gnd1[0:0] ),
      .S_AXI_WVALID ( axi4lite_0_S_WVALID[0:0] ),
      .S_AXI_WREADY ( axi4lite_0_S_WREADY[0:0] ),
      .S_AXI_BID (  ),
      .S_AXI_BRESP ( axi4lite_0_S_BRESP ),
      .S_AXI_BUSER (  ),
      .S_AXI_BVALID ( axi4lite_0_S_BVALID[0:0] ),
      .S_AXI_BREADY ( axi4lite_0_S_BREADY[0:0] ),
      .S_AXI_ARID ( net_gnd1[0:0] ),
      .S_AXI_ARADDR ( axi4lite_0_S_ARADDR ),
      .S_AXI_ARLEN ( axi4lite_0_S_ARLEN ),
      .S_AXI_ARSIZE ( axi4lite_0_S_ARSIZE ),
      .S_AXI_ARBURST ( axi4lite_0_S_ARBURST ),
      .S_AXI_ARLOCK ( axi4lite_0_S_ARLOCK ),
      .S_AXI_ARCACHE ( axi4lite_0_S_ARCACHE ),
      .S_AXI_ARPROT ( axi4lite_0_S_ARPROT ),
      .S_AXI_ARQOS ( net_gnd4 ),
      .S_AXI_ARUSER ( net_gnd1[0:0] ),
      .S_AXI_ARVALID ( axi4lite_0_S_ARVALID[0:0] ),
      .S_AXI_ARREADY ( axi4lite_0_S_ARREADY[0:0] ),
      .S_AXI_RID (  ),
      .S_AXI_RDATA ( axi4lite_0_S_RDATA ),
      .S_AXI_RRESP ( axi4lite_0_S_RRESP ),
      .S_AXI_RLAST ( axi4lite_0_S_RLAST[0:0] ),
      .S_AXI_RUSER (  ),
      .S_AXI_RVALID ( axi4lite_0_S_RVALID[0:0] ),
      .S_AXI_RREADY ( axi4lite_0_S_RREADY[0:0] ),
      .M_AXI_ACLK ( pgassign3 ),
      .M_AXI_AWID ( axi4lite_0_M_AWID ),
      .M_AXI_AWADDR ( axi4lite_0_M_AWADDR ),
      .M_AXI_AWLEN ( axi4lite_0_M_AWLEN ),
      .M_AXI_AWSIZE ( axi4lite_0_M_AWSIZE ),
      .M_AXI_AWBURST ( axi4lite_0_M_AWBURST ),
      .M_AXI_AWLOCK ( axi4lite_0_M_AWLOCK ),
      .M_AXI_AWCACHE ( axi4lite_0_M_AWCACHE ),
      .M_AXI_AWPROT ( axi4lite_0_M_AWPROT ),
      .M_AXI_AWREGION (  ),
      .M_AXI_AWQOS (  ),
      .M_AXI_AWUSER (  ),
      .M_AXI_AWVALID ( axi4lite_0_M_AWVALID ),
      .M_AXI_AWREADY ( axi4lite_0_M_AWREADY ),
      .M_AXI_WID (  ),
      .M_AXI_WDATA ( axi4lite_0_M_WDATA ),
      .M_AXI_WSTRB ( axi4lite_0_M_WSTRB ),
      .M_AXI_WLAST ( axi4lite_0_M_WLAST ),
      .M_AXI_WUSER (  ),
      .M_AXI_WVALID ( axi4lite_0_M_WVALID ),
      .M_AXI_WREADY ( axi4lite_0_M_WREADY ),
      .M_AXI_BID ( axi4lite_0_M_BID ),
      .M_AXI_BRESP ( axi4lite_0_M_BRESP ),
      .M_AXI_BUSER ( net_gnd4 ),
      .M_AXI_BVALID ( axi4lite_0_M_BVALID ),
      .M_AXI_BREADY ( axi4lite_0_M_BREADY ),
      .M_AXI_ARID ( axi4lite_0_M_ARID ),
      .M_AXI_ARADDR ( axi4lite_0_M_ARADDR ),
      .M_AXI_ARLEN ( axi4lite_0_M_ARLEN ),
      .M_AXI_ARSIZE ( axi4lite_0_M_ARSIZE ),
      .M_AXI_ARBURST ( axi4lite_0_M_ARBURST ),
      .M_AXI_ARLOCK ( axi4lite_0_M_ARLOCK ),
      .M_AXI_ARCACHE ( axi4lite_0_M_ARCACHE ),
      .M_AXI_ARPROT ( axi4lite_0_M_ARPROT ),
      .M_AXI_ARREGION (  ),
      .M_AXI_ARQOS (  ),
      .M_AXI_ARUSER (  ),
      .M_AXI_ARVALID ( axi4lite_0_M_ARVALID ),
      .M_AXI_ARREADY ( axi4lite_0_M_ARREADY ),
      .M_AXI_RID ( axi4lite_0_M_RID ),
      .M_AXI_RDATA ( axi4lite_0_M_RDATA ),
      .M_AXI_RRESP ( axi4lite_0_M_RRESP ),
      .M_AXI_RLAST ( axi4lite_0_M_RLAST ),
      .M_AXI_RUSER ( net_gnd4 ),
      .M_AXI_RVALID ( axi4lite_0_M_RVALID ),
      .M_AXI_RREADY ( axi4lite_0_M_RREADY ),
      .S_AXI_CTRL_AWADDR ( net_gnd32 ),
      .S_AXI_CTRL_AWVALID ( net_gnd0 ),
      .S_AXI_CTRL_AWREADY (  ),
      .S_AXI_CTRL_WDATA ( net_gnd32 ),
      .S_AXI_CTRL_WVALID ( net_gnd0 ),
      .S_AXI_CTRL_WREADY (  ),
      .S_AXI_CTRL_BRESP (  ),
      .S_AXI_CTRL_BVALID (  ),
      .S_AXI_CTRL_BREADY ( net_gnd0 ),
      .S_AXI_CTRL_ARADDR ( net_gnd32 ),
      .S_AXI_CTRL_ARVALID ( net_gnd0 ),
      .S_AXI_CTRL_ARREADY (  ),
      .S_AXI_CTRL_RDATA (  ),
      .S_AXI_CTRL_RRESP (  ),
      .S_AXI_CTRL_RVALID (  ),
      .S_AXI_CTRL_RREADY ( net_gnd0 ),
      .INTERCONNECT_ARESET_OUT_N (  ),
      .DEBUG_AW_TRANS_SEQ (  ),
      .DEBUG_AW_ARB_GRANT (  ),
      .DEBUG_AR_TRANS_SEQ (  ),
      .DEBUG_AR_ARB_GRANT (  ),
      .DEBUG_AW_TRANS_QUAL (  ),
      .DEBUG_AW_ACCEPT_CNT (  ),
      .DEBUG_AW_ACTIVE_THREAD (  ),
      .DEBUG_AW_ACTIVE_TARGET (  ),
      .DEBUG_AW_ACTIVE_REGION (  ),
      .DEBUG_AW_ERROR (  ),
      .DEBUG_AW_TARGET (  ),
      .DEBUG_AR_TRANS_QUAL (  ),
      .DEBUG_AR_ACCEPT_CNT (  ),
      .DEBUG_AR_ACTIVE_THREAD (  ),
      .DEBUG_AR_ACTIVE_TARGET (  ),
      .DEBUG_AR_ACTIVE_REGION (  ),
      .DEBUG_AR_ERROR (  ),
      .DEBUG_AR_TARGET (  ),
      .DEBUG_B_TRANS_SEQ (  ),
      .DEBUG_R_BEAT_CNT (  ),
      .DEBUG_R_TRANS_SEQ (  ),
      .DEBUG_AW_ISSUING_CNT (  ),
      .DEBUG_AR_ISSUING_CNT (  ),
      .DEBUG_W_BEAT_CNT (  ),
      .DEBUG_W_TRANS_SEQ (  ),
      .DEBUG_BID_TARGET (  ),
      .DEBUG_BID_ERROR (  ),
      .DEBUG_RID_TARGET (  ),
      .DEBUG_RID_ERROR (  ),
      .DEBUG_SR_SC_ARADDR (  ),
      .DEBUG_SR_SC_ARADDRCONTROL (  ),
      .DEBUG_SR_SC_AWADDR (  ),
      .DEBUG_SR_SC_AWADDRCONTROL (  ),
      .DEBUG_SR_SC_BRESP (  ),
      .DEBUG_SR_SC_RDATA (  ),
      .DEBUG_SR_SC_RDATACONTROL (  ),
      .DEBUG_SR_SC_WDATA (  ),
      .DEBUG_SR_SC_WDATACONTROL (  ),
      .DEBUG_SC_SF_ARADDR (  ),
      .DEBUG_SC_SF_ARADDRCONTROL (  ),
      .DEBUG_SC_SF_AWADDR (  ),
      .DEBUG_SC_SF_AWADDRCONTROL (  ),
      .DEBUG_SC_SF_BRESP (  ),
      .DEBUG_SC_SF_RDATA (  ),
      .DEBUG_SC_SF_RDATACONTROL (  ),
      .DEBUG_SC_SF_WDATA (  ),
      .DEBUG_SC_SF_WDATACONTROL (  ),
      .DEBUG_SF_CB_ARADDR (  ),
      .DEBUG_SF_CB_ARADDRCONTROL (  ),
      .DEBUG_SF_CB_AWADDR (  ),
      .DEBUG_SF_CB_AWADDRCONTROL (  ),
      .DEBUG_SF_CB_BRESP (  ),
      .DEBUG_SF_CB_RDATA (  ),
      .DEBUG_SF_CB_RDATACONTROL (  ),
      .DEBUG_SF_CB_WDATA (  ),
      .DEBUG_SF_CB_WDATACONTROL (  ),
      .DEBUG_CB_MF_ARADDR (  ),
      .DEBUG_CB_MF_ARADDRCONTROL (  ),
      .DEBUG_CB_MF_AWADDR (  ),
      .DEBUG_CB_MF_AWADDRCONTROL (  ),
      .DEBUG_CB_MF_BRESP (  ),
      .DEBUG_CB_MF_RDATA (  ),
      .DEBUG_CB_MF_RDATACONTROL (  ),
      .DEBUG_CB_MF_WDATA (  ),
      .DEBUG_CB_MF_WDATACONTROL (  ),
      .DEBUG_MF_MC_ARADDR (  ),
      .DEBUG_MF_MC_ARADDRCONTROL (  ),
      .DEBUG_MF_MC_AWADDR (  ),
      .DEBUG_MF_MC_AWADDRCONTROL (  ),
      .DEBUG_MF_MC_BRESP (  ),
      .DEBUG_MF_MC_RDATA (  ),
      .DEBUG_MF_MC_RDATACONTROL (  ),
      .DEBUG_MF_MC_WDATA (  ),
      .DEBUG_MF_MC_WDATACONTROL (  ),
      .DEBUG_MC_MP_ARADDR (  ),
      .DEBUG_MC_MP_ARADDRCONTROL (  ),
      .DEBUG_MC_MP_AWADDR (  ),
      .DEBUG_MC_MP_AWADDRCONTROL (  ),
      .DEBUG_MC_MP_BRESP (  ),
      .DEBUG_MC_MP_RDATA (  ),
      .DEBUG_MC_MP_RDATACONTROL (  ),
      .DEBUG_MC_MP_WDATA (  ),
      .DEBUG_MC_MP_WDATACONTROL (  ),
      .DEBUG_MP_MR_ARADDR (  ),
      .DEBUG_MP_MR_ARADDRCONTROL (  ),
      .DEBUG_MP_MR_AWADDR (  ),
      .DEBUG_MP_MR_AWADDRCONTROL (  ),
      .DEBUG_MP_MR_BRESP (  ),
      .DEBUG_MP_MR_RDATA (  ),
      .DEBUG_MP_MR_RDATACONTROL (  ),
      .DEBUG_MP_MR_WDATA (  ),
      .DEBUG_MP_MR_WDATACONTROL (  )
    );

  (* BOX_TYPE = "user_black_box" *)
  system_axi4_0_wrapper
    axi4_0 (
      .INTERCONNECT_ACLK ( clk_100_0000MHzMMCM0 ),
      .INTERCONNECT_ARESETN ( proc_sys_reset_0_Interconnect_aresetn[0] ),
      .S_AXI_ARESET_OUT_N (  ),
      .M_AXI_ARESET_OUT_N ( axi4_0_M_ARESETN ),
      .IRQ (  ),
      .S_AXI_ACLK ( pgassign4 ),
      .S_AXI_AWID ( net_gnd6 ),
      .S_AXI_AWADDR ( axi4_0_S_AWADDR ),
      .S_AXI_AWLEN ( axi4_0_S_AWLEN ),
      .S_AXI_AWSIZE ( axi4_0_S_AWSIZE ),
      .S_AXI_AWBURST ( axi4_0_S_AWBURST ),
      .S_AXI_AWLOCK ( net_gnd6 ),
      .S_AXI_AWCACHE ( axi4_0_S_AWCACHE ),
      .S_AXI_AWPROT ( axi4_0_S_AWPROT ),
      .S_AXI_AWQOS ( net_gnd12 ),
      .S_AXI_AWUSER ( net_gnd3 ),
      .S_AXI_AWVALID ( axi4_0_S_AWVALID ),
      .S_AXI_AWREADY ( axi4_0_S_AWREADY ),
      .S_AXI_WID ( net_gnd6 ),
      .S_AXI_WDATA ( axi4_0_S_WDATA ),
      .S_AXI_WSTRB ( axi4_0_S_WSTRB ),
      .S_AXI_WLAST ( axi4_0_S_WLAST ),
      .S_AXI_WUSER ( net_gnd3 ),
      .S_AXI_WVALID ( axi4_0_S_WVALID ),
      .S_AXI_WREADY ( axi4_0_S_WREADY ),
      .S_AXI_BID (  ),
      .S_AXI_BRESP ( axi4_0_S_BRESP ),
      .S_AXI_BUSER (  ),
      .S_AXI_BVALID ( axi4_0_S_BVALID ),
      .S_AXI_BREADY ( axi4_0_S_BREADY ),
      .S_AXI_ARID ( net_gnd6 ),
      .S_AXI_ARADDR ( axi4_0_S_ARADDR ),
      .S_AXI_ARLEN ( axi4_0_S_ARLEN ),
      .S_AXI_ARSIZE ( axi4_0_S_ARSIZE ),
      .S_AXI_ARBURST ( axi4_0_S_ARBURST ),
      .S_AXI_ARLOCK ( net_gnd6 ),
      .S_AXI_ARCACHE ( axi4_0_S_ARCACHE ),
      .S_AXI_ARPROT ( axi4_0_S_ARPROT ),
      .S_AXI_ARQOS ( net_gnd12 ),
      .S_AXI_ARUSER ( net_gnd3 ),
      .S_AXI_ARVALID ( axi4_0_S_ARVALID ),
      .S_AXI_ARREADY ( axi4_0_S_ARREADY ),
      .S_AXI_RID (  ),
      .S_AXI_RDATA ( axi4_0_S_RDATA ),
      .S_AXI_RRESP ( axi4_0_S_RRESP ),
      .S_AXI_RLAST ( axi4_0_S_RLAST ),
      .S_AXI_RUSER (  ),
      .S_AXI_RVALID ( axi4_0_S_RVALID ),
      .S_AXI_RREADY ( axi4_0_S_RREADY ),
      .M_AXI_ACLK ( pgassign5 ),
      .M_AXI_AWID ( axi4_0_M_AWID ),
      .M_AXI_AWADDR ( axi4_0_M_AWADDR ),
      .M_AXI_AWLEN ( axi4_0_M_AWLEN ),
      .M_AXI_AWSIZE ( axi4_0_M_AWSIZE ),
      .M_AXI_AWBURST ( axi4_0_M_AWBURST ),
      .M_AXI_AWLOCK ( axi4_0_M_AWLOCK ),
      .M_AXI_AWCACHE ( axi4_0_M_AWCACHE ),
      .M_AXI_AWPROT ( axi4_0_M_AWPROT ),
      .M_AXI_AWREGION ( axi4_0_M_AWREGION ),
      .M_AXI_AWQOS (  ),
      .M_AXI_AWUSER (  ),
      .M_AXI_AWVALID ( axi4_0_M_AWVALID ),
      .M_AXI_AWREADY ( axi4_0_M_AWREADY ),
      .M_AXI_WID (  ),
      .M_AXI_WDATA ( axi4_0_M_WDATA ),
      .M_AXI_WSTRB ( axi4_0_M_WSTRB ),
      .M_AXI_WLAST ( axi4_0_M_WLAST ),
      .M_AXI_WUSER (  ),
      .M_AXI_WVALID ( axi4_0_M_WVALID ),
      .M_AXI_WREADY ( axi4_0_M_WREADY ),
      .M_AXI_BID ( axi4_0_M_BID ),
      .M_AXI_BRESP ( axi4_0_M_BRESP ),
      .M_AXI_BUSER ( net_gnd2 ),
      .M_AXI_BVALID ( axi4_0_M_BVALID ),
      .M_AXI_BREADY ( axi4_0_M_BREADY ),
      .M_AXI_ARID ( axi4_0_M_ARID ),
      .M_AXI_ARADDR ( axi4_0_M_ARADDR ),
      .M_AXI_ARLEN ( axi4_0_M_ARLEN ),
      .M_AXI_ARSIZE ( axi4_0_M_ARSIZE ),
      .M_AXI_ARBURST ( axi4_0_M_ARBURST ),
      .M_AXI_ARLOCK ( axi4_0_M_ARLOCK ),
      .M_AXI_ARCACHE ( axi4_0_M_ARCACHE ),
      .M_AXI_ARPROT ( axi4_0_M_ARPROT ),
      .M_AXI_ARREGION ( axi4_0_M_ARREGION ),
      .M_AXI_ARQOS (  ),
      .M_AXI_ARUSER (  ),
      .M_AXI_ARVALID ( axi4_0_M_ARVALID ),
      .M_AXI_ARREADY ( axi4_0_M_ARREADY ),
      .M_AXI_RID ( axi4_0_M_RID ),
      .M_AXI_RDATA ( axi4_0_M_RDATA ),
      .M_AXI_RRESP ( axi4_0_M_RRESP ),
      .M_AXI_RLAST ( axi4_0_M_RLAST ),
      .M_AXI_RUSER ( net_gnd2 ),
      .M_AXI_RVALID ( axi4_0_M_RVALID ),
      .M_AXI_RREADY ( axi4_0_M_RREADY ),
      .S_AXI_CTRL_AWADDR ( net_gnd32 ),
      .S_AXI_CTRL_AWVALID ( net_gnd0 ),
      .S_AXI_CTRL_AWREADY (  ),
      .S_AXI_CTRL_WDATA ( net_gnd32 ),
      .S_AXI_CTRL_WVALID ( net_gnd0 ),
      .S_AXI_CTRL_WREADY (  ),
      .S_AXI_CTRL_BRESP (  ),
      .S_AXI_CTRL_BVALID (  ),
      .S_AXI_CTRL_BREADY ( net_gnd0 ),
      .S_AXI_CTRL_ARADDR ( net_gnd32 ),
      .S_AXI_CTRL_ARVALID ( net_gnd0 ),
      .S_AXI_CTRL_ARREADY (  ),
      .S_AXI_CTRL_RDATA (  ),
      .S_AXI_CTRL_RRESP (  ),
      .S_AXI_CTRL_RVALID (  ),
      .S_AXI_CTRL_RREADY ( net_gnd0 ),
      .INTERCONNECT_ARESET_OUT_N (  ),
      .DEBUG_AW_TRANS_SEQ (  ),
      .DEBUG_AW_ARB_GRANT (  ),
      .DEBUG_AR_TRANS_SEQ (  ),
      .DEBUG_AR_ARB_GRANT (  ),
      .DEBUG_AW_TRANS_QUAL (  ),
      .DEBUG_AW_ACCEPT_CNT (  ),
      .DEBUG_AW_ACTIVE_THREAD (  ),
      .DEBUG_AW_ACTIVE_TARGET (  ),
      .DEBUG_AW_ACTIVE_REGION (  ),
      .DEBUG_AW_ERROR (  ),
      .DEBUG_AW_TARGET (  ),
      .DEBUG_AR_TRANS_QUAL (  ),
      .DEBUG_AR_ACCEPT_CNT (  ),
      .DEBUG_AR_ACTIVE_THREAD (  ),
      .DEBUG_AR_ACTIVE_TARGET (  ),
      .DEBUG_AR_ACTIVE_REGION (  ),
      .DEBUG_AR_ERROR (  ),
      .DEBUG_AR_TARGET (  ),
      .DEBUG_B_TRANS_SEQ (  ),
      .DEBUG_R_BEAT_CNT (  ),
      .DEBUG_R_TRANS_SEQ (  ),
      .DEBUG_AW_ISSUING_CNT (  ),
      .DEBUG_AR_ISSUING_CNT (  ),
      .DEBUG_W_BEAT_CNT (  ),
      .DEBUG_W_TRANS_SEQ (  ),
      .DEBUG_BID_TARGET (  ),
      .DEBUG_BID_ERROR (  ),
      .DEBUG_RID_TARGET (  ),
      .DEBUG_RID_ERROR (  ),
      .DEBUG_SR_SC_ARADDR (  ),
      .DEBUG_SR_SC_ARADDRCONTROL (  ),
      .DEBUG_SR_SC_AWADDR (  ),
      .DEBUG_SR_SC_AWADDRCONTROL (  ),
      .DEBUG_SR_SC_BRESP (  ),
      .DEBUG_SR_SC_RDATA (  ),
      .DEBUG_SR_SC_RDATACONTROL (  ),
      .DEBUG_SR_SC_WDATA (  ),
      .DEBUG_SR_SC_WDATACONTROL (  ),
      .DEBUG_SC_SF_ARADDR (  ),
      .DEBUG_SC_SF_ARADDRCONTROL (  ),
      .DEBUG_SC_SF_AWADDR (  ),
      .DEBUG_SC_SF_AWADDRCONTROL (  ),
      .DEBUG_SC_SF_BRESP (  ),
      .DEBUG_SC_SF_RDATA (  ),
      .DEBUG_SC_SF_RDATACONTROL (  ),
      .DEBUG_SC_SF_WDATA (  ),
      .DEBUG_SC_SF_WDATACONTROL (  ),
      .DEBUG_SF_CB_ARADDR (  ),
      .DEBUG_SF_CB_ARADDRCONTROL (  ),
      .DEBUG_SF_CB_AWADDR (  ),
      .DEBUG_SF_CB_AWADDRCONTROL (  ),
      .DEBUG_SF_CB_BRESP (  ),
      .DEBUG_SF_CB_RDATA (  ),
      .DEBUG_SF_CB_RDATACONTROL (  ),
      .DEBUG_SF_CB_WDATA (  ),
      .DEBUG_SF_CB_WDATACONTROL (  ),
      .DEBUG_CB_MF_ARADDR (  ),
      .DEBUG_CB_MF_ARADDRCONTROL (  ),
      .DEBUG_CB_MF_AWADDR (  ),
      .DEBUG_CB_MF_AWADDRCONTROL (  ),
      .DEBUG_CB_MF_BRESP (  ),
      .DEBUG_CB_MF_RDATA (  ),
      .DEBUG_CB_MF_RDATACONTROL (  ),
      .DEBUG_CB_MF_WDATA (  ),
      .DEBUG_CB_MF_WDATACONTROL (  ),
      .DEBUG_MF_MC_ARADDR (  ),
      .DEBUG_MF_MC_ARADDRCONTROL (  ),
      .DEBUG_MF_MC_AWADDR (  ),
      .DEBUG_MF_MC_AWADDRCONTROL (  ),
      .DEBUG_MF_MC_BRESP (  ),
      .DEBUG_MF_MC_RDATA (  ),
      .DEBUG_MF_MC_RDATACONTROL (  ),
      .DEBUG_MF_MC_WDATA (  ),
      .DEBUG_MF_MC_WDATACONTROL (  ),
      .DEBUG_MC_MP_ARADDR (  ),
      .DEBUG_MC_MP_ARADDRCONTROL (  ),
      .DEBUG_MC_MP_AWADDR (  ),
      .DEBUG_MC_MP_AWADDRCONTROL (  ),
      .DEBUG_MC_MP_BRESP (  ),
      .DEBUG_MC_MP_RDATA (  ),
      .DEBUG_MC_MP_RDATACONTROL (  ),
      .DEBUG_MC_MP_WDATA (  ),
      .DEBUG_MC_MP_WDATACONTROL (  ),
      .DEBUG_MP_MR_ARADDR (  ),
      .DEBUG_MP_MR_ARADDRCONTROL (  ),
      .DEBUG_MP_MR_AWADDR (  ),
      .DEBUG_MP_MR_AWADDRCONTROL (  ),
      .DEBUG_MP_MR_BRESP (  ),
      .DEBUG_MP_MR_RDATA (  ),
      .DEBUG_MP_MR_RDATACONTROL (  ),
      .DEBUG_MP_MR_WDATA (  ),
      .DEBUG_MP_MR_WDATACONTROL (  )
    );

  (* BOX_TYPE = "user_black_box" *)
  system_pcie_diff_clk_i_wrapper
    PCIe_Diff_Clk_I (
      .IBUF_DS_P ( pgassign1[0:0] ),
      .IBUF_DS_N ( pgassign2[0:0] ),
      .IBUF_OUT ( PCIe_Diff_Clk[0:0] ),
      .OBUF_IN ( net_gnd1[0:0] ),
      .OBUF_DS_P (  ),
      .OBUF_DS_N (  ),
      .IOBUF_DS_P (  ),
      .IOBUF_DS_N (  ),
      .IOBUF_IO_T ( net_gnd1[0:0] ),
      .IOBUF_IO_I ( net_gnd1[0:0] ),
      .IOBUF_IO_O (  )
    );

  (* BOX_TYPE = "user_black_box" *)
  system_pci_express_wrapper
    PCI_Express (
      .axi_aclk ( clk_100_0000MHzMMCM0 ),
      .axi_aclk_out ( axi_aclk_out[0] ),
      .axi_aresetn ( axi4lite_0_S_ARESETN[0] ),
      .axi_ctl_aclk ( axi_ctl_aclk_out ),
      .axi_ctl_aclk_out ( axi_ctl_aclk_out ),
      .mmcm_lock ( PCIe_MMCM_Lock[0] ),
      .interrupt_out (  ),
      .INTX_MSI_Request ( rx_intr ),
      .INTX_MSI_Grant (  ),
      .MSI_enable (  ),
      .MSI_Vector_Num ( net_gnd5 ),
      .MSI_Vector_Width (  ),
      .s_axi_awid ( axi4_0_M_AWID[1:0] ),
      .s_axi_awaddr ( axi4_0_M_AWADDR[31:0] ),
      .s_axi_awregion ( axi4_0_M_AWREGION[3:0] ),
      .s_axi_awlen ( axi4_0_M_AWLEN[7:0] ),
      .s_axi_awsize ( axi4_0_M_AWSIZE[2:0] ),
      .s_axi_awburst ( axi4_0_M_AWBURST[1:0] ),
      .s_axi_awvalid ( axi4_0_M_AWVALID[0] ),
      .s_axi_awready ( axi4_0_M_AWREADY[0] ),
      .s_axi_wdata ( axi4_0_M_WDATA[63:0] ),
      .s_axi_wstrb ( axi4_0_M_WSTRB[7:0] ),
      .s_axi_wlast ( axi4_0_M_WLAST[0] ),
      .s_axi_wvalid ( axi4_0_M_WVALID[0] ),
      .s_axi_wready ( axi4_0_M_WREADY[0] ),
      .s_axi_bid ( axi4_0_M_BID[1:0] ),
      .s_axi_bresp ( axi4_0_M_BRESP[1:0] ),
      .s_axi_bvalid ( axi4_0_M_BVALID[0] ),
      .s_axi_bready ( axi4_0_M_BREADY[0] ),
      .s_axi_arid ( axi4_0_M_ARID[1:0] ),
      .s_axi_araddr ( axi4_0_M_ARADDR[31:0] ),
      .s_axi_arregion ( axi4_0_M_ARREGION[3:0] ),
      .s_axi_arlen ( axi4_0_M_ARLEN[7:0] ),
      .s_axi_arsize ( axi4_0_M_ARSIZE[2:0] ),
      .s_axi_arburst ( axi4_0_M_ARBURST[1:0] ),
      .s_axi_arvalid ( axi4_0_M_ARVALID[0] ),
      .s_axi_arready ( axi4_0_M_ARREADY[0] ),
      .s_axi_rid ( axi4_0_M_RID[1:0] ),
      .s_axi_rdata ( axi4_0_M_RDATA[63:0] ),
      .s_axi_rresp ( axi4_0_M_RRESP[1:0] ),
      .s_axi_rlast ( axi4_0_M_RLAST[0] ),
      .s_axi_rvalid ( axi4_0_M_RVALID[0] ),
      .s_axi_rready ( axi4_0_M_RREADY[0] ),
      .m_axi_awaddr ( axi4lite_0_S_AWADDR ),
      .m_axi_awlen ( axi4lite_0_S_AWLEN ),
      .m_axi_awsize ( axi4lite_0_S_AWSIZE ),
      .m_axi_awburst ( axi4lite_0_S_AWBURST ),
      .m_axi_awprot ( axi4lite_0_S_AWPROT ),
      .m_axi_awvalid ( axi4lite_0_S_AWVALID[0] ),
      .m_axi_awready ( axi4lite_0_S_AWREADY[0] ),
      .m_axi_awlock ( axi4lite_0_S_AWLOCK[0] ),
      .m_axi_awcache ( axi4lite_0_S_AWCACHE ),
      .m_axi_wdata ( axi4lite_0_S_WDATA ),
      .m_axi_wstrb ( axi4lite_0_S_WSTRB ),
      .m_axi_wlast ( axi4lite_0_S_WLAST[0] ),
      .m_axi_wvalid ( axi4lite_0_S_WVALID[0] ),
      .m_axi_wready ( axi4lite_0_S_WREADY[0] ),
      .m_axi_bresp ( axi4lite_0_S_BRESP ),
      .m_axi_bvalid ( axi4lite_0_S_BVALID[0] ),
      .m_axi_bready ( axi4lite_0_S_BREADY[0] ),
      .m_axi_araddr ( axi4lite_0_S_ARADDR ),
      .m_axi_arlen ( axi4lite_0_S_ARLEN ),
      .m_axi_arsize ( axi4lite_0_S_ARSIZE ),
      .m_axi_arburst ( axi4lite_0_S_ARBURST ),
      .m_axi_arprot ( axi4lite_0_S_ARPROT ),
      .m_axi_arvalid ( axi4lite_0_S_ARVALID[0] ),
      .m_axi_arready ( axi4lite_0_S_ARREADY[0] ),
      .m_axi_arlock ( axi4lite_0_S_ARLOCK[0] ),
      .m_axi_arcache ( axi4lite_0_S_ARCACHE ),
      .m_axi_rdata ( axi4lite_0_S_RDATA ),
      .m_axi_rresp ( axi4lite_0_S_RRESP ),
      .m_axi_rlast ( axi4lite_0_S_RLAST[0] ),
      .m_axi_rvalid ( axi4lite_0_S_RVALID[0] ),
      .m_axi_rready ( axi4lite_0_S_RREADY[0] ),
      .pci_exp_txp ( PCI_Express_pci_exp_txp ),
      .pci_exp_txn ( PCI_Express_pci_exp_txn ),
      .pci_exp_rxp ( PCI_Express_pci_exp_rxp ),
      .pci_exp_rxn ( PCI_Express_pci_exp_rxn ),
      .REFCLK ( PCIe_Diff_Clk[0] ),
      .s_axi_ctl_awaddr ( net_gnd32 ),
      .s_axi_ctl_awvalid ( net_gnd0 ),
      .s_axi_ctl_awready (  ),
      .s_axi_ctl_wdata ( net_gnd32 ),
      .s_axi_ctl_wstrb ( net_gnd4 ),
      .s_axi_ctl_wvalid ( net_gnd0 ),
      .s_axi_ctl_wready (  ),
      .s_axi_ctl_bresp (  ),
      .s_axi_ctl_bvalid (  ),
      .s_axi_ctl_bready ( net_gnd0 ),
      .s_axi_ctl_araddr ( net_gnd32 ),
      .s_axi_ctl_arvalid ( net_gnd0 ),
      .s_axi_ctl_arready (  ),
      .s_axi_ctl_rdata (  ),
      .s_axi_ctl_rresp (  ),
      .s_axi_ctl_rvalid (  ),
      .s_axi_ctl_rready ( net_gnd0 )
    );

  (* BOX_TYPE = "user_black_box" *)
  system_ethernet_dma_wrapper
    ETHERNET_dma (
      .s_axi_lite_aclk ( clk_100_0000MHzMMCM0 ),
      .m_axi_sg_aclk ( clk_100_0000MHzMMCM0 ),
      .m_axi_mm2s_aclk ( clk_100_0000MHzMMCM0 ),
      .m_axi_s2mm_aclk ( clk_100_0000MHzMMCM0 ),
      .axi_resetn ( axi4lite_0_M_ARESETN[1] ),
      .s_axi_lite_awvalid ( axi4lite_0_M_AWVALID[1] ),
      .s_axi_lite_awready ( axi4lite_0_M_AWREADY[1] ),
      .s_axi_lite_awaddr ( axi4lite_0_M_AWADDR[63:32] ),
      .s_axi_lite_wvalid ( axi4lite_0_M_WVALID[1] ),
      .s_axi_lite_wready ( axi4lite_0_M_WREADY[1] ),
      .s_axi_lite_wdata ( axi4lite_0_M_WDATA[95:64] ),
      .s_axi_lite_bresp ( axi4lite_0_M_BRESP[3:2] ),
      .s_axi_lite_bvalid ( axi4lite_0_M_BVALID[1] ),
      .s_axi_lite_bready ( axi4lite_0_M_BREADY[1] ),
      .s_axi_lite_arvalid ( axi4lite_0_M_ARVALID[1] ),
      .s_axi_lite_arready ( axi4lite_0_M_ARREADY[1] ),
      .s_axi_lite_araddr ( axi4lite_0_M_ARADDR[63:32] ),
      .s_axi_lite_rvalid ( axi4lite_0_M_RVALID[1] ),
      .s_axi_lite_rready ( axi4lite_0_M_RREADY[1] ),
      .s_axi_lite_rdata ( axi4lite_0_M_RDATA[95:64] ),
      .s_axi_lite_rresp ( axi4lite_0_M_RRESP[3:2] ),
      .m_axi_sg_awaddr ( axi4_0_S_AWADDR[31:0] ),
      .m_axi_sg_awlen ( axi4_0_S_AWLEN[7:0] ),
      .m_axi_sg_awsize ( axi4_0_S_AWSIZE[2:0] ),
      .m_axi_sg_awburst ( axi4_0_S_AWBURST[1:0] ),
      .m_axi_sg_awprot ( axi4_0_S_AWPROT[2:0] ),
      .m_axi_sg_awcache ( axi4_0_S_AWCACHE[3:0] ),
      .m_axi_sg_awvalid ( axi4_0_S_AWVALID[0] ),
      .m_axi_sg_awready ( axi4_0_S_AWREADY[0] ),
      .m_axi_sg_wdata ( axi4_0_S_WDATA[31:0] ),
      .m_axi_sg_wstrb ( axi4_0_S_WSTRB[3:0] ),
      .m_axi_sg_wlast ( axi4_0_S_WLAST[0] ),
      .m_axi_sg_wvalid ( axi4_0_S_WVALID[0] ),
      .m_axi_sg_wready ( axi4_0_S_WREADY[0] ),
      .m_axi_sg_bresp ( axi4_0_S_BRESP[1:0] ),
      .m_axi_sg_bvalid ( axi4_0_S_BVALID[0] ),
      .m_axi_sg_bready ( axi4_0_S_BREADY[0] ),
      .m_axi_sg_araddr ( axi4_0_S_ARADDR[31:0] ),
      .m_axi_sg_arlen ( axi4_0_S_ARLEN[7:0] ),
      .m_axi_sg_arsize ( axi4_0_S_ARSIZE[2:0] ),
      .m_axi_sg_arburst ( axi4_0_S_ARBURST[1:0] ),
      .m_axi_sg_arprot ( axi4_0_S_ARPROT[2:0] ),
      .m_axi_sg_arcache ( axi4_0_S_ARCACHE[3:0] ),
      .m_axi_sg_arvalid ( axi4_0_S_ARVALID[0] ),
      .m_axi_sg_arready ( axi4_0_S_ARREADY[0] ),
      .m_axi_sg_rdata ( axi4_0_S_RDATA[31:0] ),
      .m_axi_sg_rresp ( axi4_0_S_RRESP[1:0] ),
      .m_axi_sg_rlast ( axi4_0_S_RLAST[0] ),
      .m_axi_sg_rvalid ( axi4_0_S_RVALID[0] ),
      .m_axi_sg_rready ( axi4_0_S_RREADY[0] ),
      .m_axi_mm2s_araddr ( axi4_0_S_ARADDR[63:32] ),
      .m_axi_mm2s_arlen ( axi4_0_S_ARLEN[15:8] ),
      .m_axi_mm2s_arsize ( axi4_0_S_ARSIZE[5:3] ),
      .m_axi_mm2s_arburst ( axi4_0_S_ARBURST[3:2] ),
      .m_axi_mm2s_arprot ( axi4_0_S_ARPROT[5:3] ),
      .m_axi_mm2s_arcache ( axi4_0_S_ARCACHE[7:4] ),
      .m_axi_mm2s_arvalid ( axi4_0_S_ARVALID[1] ),
      .m_axi_mm2s_arready ( axi4_0_S_ARREADY[1] ),
      .m_axi_mm2s_rdata ( axi4_0_S_RDATA[127:64] ),
      .m_axi_mm2s_rresp ( axi4_0_S_RRESP[3:2] ),
      .m_axi_mm2s_rlast ( axi4_0_S_RLAST[1] ),
      .m_axi_mm2s_rvalid ( axi4_0_S_RVALID[1] ),
      .m_axi_mm2s_rready ( axi4_0_S_RREADY[1] ),
      .mm2s_prmry_reset_out_n (  ),
      .m_axis_mm2s_tdata ( ETHERNET_dma_txd_TDATA ),
      .m_axis_mm2s_tkeep ( ETHERNET_dma_txd_TKEEP ),
      .m_axis_mm2s_tvalid ( ETHERNET_dma_txd_TVALID ),
      .m_axis_mm2s_tready ( ETHERNET_dma_txd_TREADY ),
      .m_axis_mm2s_tlast ( ETHERNET_dma_txd_TLAST ),
      .mm2s_cntrl_reset_out_n (  ),
      .m_axis_mm2s_cntrl_tdata ( ETHERNET_dma_txc_TDATA ),
      .m_axis_mm2s_cntrl_tkeep ( ETHERNET_dma_txc_TKEEP ),
      .m_axis_mm2s_cntrl_tvalid ( ETHERNET_dma_txc_TVALID ),
      .m_axis_mm2s_cntrl_tready ( ETHERNET_dma_txc_TREADY ),
      .m_axis_mm2s_cntrl_tlast ( ETHERNET_dma_txc_TLAST ),
      .m_axi_s2mm_awaddr ( axi4_0_S_AWADDR[95:64] ),
      .m_axi_s2mm_awlen ( axi4_0_S_AWLEN[23:16] ),
      .m_axi_s2mm_awsize ( axi4_0_S_AWSIZE[8:6] ),
      .m_axi_s2mm_awburst ( axi4_0_S_AWBURST[5:4] ),
      .m_axi_s2mm_awprot ( axi4_0_S_AWPROT[8:6] ),
      .m_axi_s2mm_awcache ( axi4_0_S_AWCACHE[11:8] ),
      .m_axi_s2mm_awvalid ( axi4_0_S_AWVALID[2] ),
      .m_axi_s2mm_awready ( axi4_0_S_AWREADY[2] ),
      .m_axi_s2mm_wdata ( axi4_0_S_WDATA[191:128] ),
      .m_axi_s2mm_wstrb ( axi4_0_S_WSTRB[23:16] ),
      .m_axi_s2mm_wlast ( axi4_0_S_WLAST[2] ),
      .m_axi_s2mm_wvalid ( axi4_0_S_WVALID[2] ),
      .m_axi_s2mm_wready ( axi4_0_S_WREADY[2] ),
      .m_axi_s2mm_bresp ( axi4_0_S_BRESP[5:4] ),
      .m_axi_s2mm_bvalid ( axi4_0_S_BVALID[2] ),
      .m_axi_s2mm_bready ( axi4_0_S_BREADY[2] ),
      .s2mm_prmry_reset_out_n (  ),
      .s_axis_s2mm_tdata ( ETHERNET_dma_txd_TDATA ),
      .s_axis_s2mm_tkeep ( ETHERNET_dma_txd_TKEEP ),
      .s_axis_s2mm_tvalid ( ETHERNET_dma_txd_TVALID ),
      .s_axis_s2mm_tready ( ETHERNET_dma_txd_TREADY ),
      .s_axis_s2mm_tlast ( ETHERNET_dma_txd_TLAST ),
      .s2mm_sts_reset_out_n (  ),
      .s_axis_s2mm_sts_tdata ( ETHERNET_dma_txc_TDATA ),
      .s_axis_s2mm_sts_tkeep ( ETHERNET_dma_txc_TKEEP ),
      .s_axis_s2mm_sts_tvalid ( ETHERNET_dma_txc_TVALID ),
      .s_axis_s2mm_sts_tready ( ETHERNET_dma_txc_TREADY ),
      .s_axis_s2mm_sts_tlast ( ETHERNET_dma_txc_TLAST ),
      .mm2s_introut (  ),
      .s2mm_introut ( rx_intr )
    );

  (* BOX_TYPE = "user_black_box" *)
  system_axi_emc_0_wrapper
    axi_emc_0 (
      .S_AXI_ACLK ( clk_100_0000MHzMMCM0 ),
      .S_AXI_ARESETN ( axi4_0_M_ARESETN[1] ),
      .S_AXI_REG_AWADDR ( net_gnd32 ),
      .S_AXI_REG_AWVALID ( net_gnd0 ),
      .S_AXI_REG_AWREADY (  ),
      .S_AXI_REG_WDATA ( net_gnd32 ),
      .S_AXI_REG_WSTRB ( net_gnd4 ),
      .S_AXI_REG_WVALID ( net_gnd0 ),
      .S_AXI_REG_WREADY (  ),
      .S_AXI_REG_BRESP (  ),
      .S_AXI_REG_BVALID (  ),
      .S_AXI_REG_BREADY ( net_gnd0 ),
      .S_AXI_REG_ARADDR ( net_gnd32 ),
      .S_AXI_REG_ARVALID ( net_gnd0 ),
      .S_AXI_REG_ARREADY (  ),
      .S_AXI_REG_RDATA (  ),
      .S_AXI_REG_RRESP (  ),
      .S_AXI_REG_RVALID (  ),
      .S_AXI_REG_RREADY ( net_gnd0 ),
      .S_AXI_MEM_AWLEN ( axi4_0_M_AWLEN[15:8] ),
      .S_AXI_MEM_AWSIZE ( axi4_0_M_AWSIZE[5:3] ),
      .S_AXI_MEM_AWBURST ( axi4_0_M_AWBURST[3:2] ),
      .S_AXI_MEM_AWLOCK ( axi4_0_M_AWLOCK[2] ),
      .S_AXI_MEM_AWCACHE ( axi4_0_M_AWCACHE[7:4] ),
      .S_AXI_MEM_AWPROT ( axi4_0_M_AWPROT[5:3] ),
      .S_AXI_MEM_WLAST ( axi4_0_M_WLAST[1] ),
      .S_AXI_MEM_BID ( axi4_0_M_BID[3:2] ),
      .S_AXI_MEM_ARID ( axi4_0_M_ARID[3:2] ),
      .S_AXI_MEM_ARLEN ( axi4_0_M_ARLEN[15:8] ),
      .S_AXI_MEM_ARSIZE ( axi4_0_M_ARSIZE[5:3] ),
      .S_AXI_MEM_ARBURST ( axi4_0_M_ARBURST[3:2] ),
      .S_AXI_MEM_ARLOCK ( axi4_0_M_ARLOCK[2] ),
      .S_AXI_MEM_ARCACHE ( axi4_0_M_ARCACHE[7:4] ),
      .S_AXI_MEM_ARPROT ( axi4_0_M_ARPROT[5:3] ),
      .S_AXI_MEM_RID ( axi4_0_M_RID[3:2] ),
      .S_AXI_MEM_RLAST ( axi4_0_M_RLAST[1] ),
      .S_AXI_MEM_AWID ( axi4_0_M_AWID[3:2] ),
      .S_AXI_MEM_AWADDR ( axi4_0_M_AWADDR[63:32] ),
      .S_AXI_MEM_AWVALID ( axi4_0_M_AWVALID[1] ),
      .S_AXI_MEM_AWREADY ( axi4_0_M_AWREADY[1] ),
      .S_AXI_MEM_WDATA ( axi4_0_M_WDATA[127:64] ),
      .S_AXI_MEM_WSTRB ( axi4_0_M_WSTRB[15:8] ),
      .S_AXI_MEM_WVALID ( axi4_0_M_WVALID[1] ),
      .S_AXI_MEM_WREADY ( axi4_0_M_WREADY[1] ),
      .S_AXI_MEM_BRESP ( axi4_0_M_BRESP[3:2] ),
      .S_AXI_MEM_BVALID ( axi4_0_M_BVALID[1] ),
      .S_AXI_MEM_BREADY ( axi4_0_M_BREADY[1] ),
      .S_AXI_MEM_ARADDR ( axi4_0_M_ARADDR[63:32] ),
      .S_AXI_MEM_ARVALID ( axi4_0_M_ARVALID[1] ),
      .S_AXI_MEM_ARREADY ( axi4_0_M_ARREADY[1] ),
      .S_AXI_MEM_RDATA ( axi4_0_M_RDATA[127:64] ),
      .S_AXI_MEM_RRESP ( axi4_0_M_RRESP[3:2] ),
      .S_AXI_MEM_RVALID ( axi4_0_M_RVALID[1] ),
      .S_AXI_MEM_RREADY ( axi4_0_M_RREADY[1] ),
      .RdClk ( net_axi_emc_0_RdClk_pin ),
      .Mem_A ( axi_emc_0_Mem_A ),
      .Mem_RPN ( axi_emc_0_Mem_RPN ),
      .Mem_CE ( axi_emc_0_Mem_CE[0:0] ),
      .Mem_CEN ( axi_emc_0_Mem_CEN[0:0] ),
      .Mem_OEN ( axi_emc_0_Mem_OEN[0:0] ),
      .Mem_WEN ( axi_emc_0_Mem_WEN ),
      .Mem_QWEN ( axi_emc_0_Mem_QWEN ),
      .Mem_BEN ( axi_emc_0_Mem_BEN ),
      .Mem_ADV_LDN ( axi_emc_0_Mem_ADV_LDN ),
      .Mem_LBON ( axi_emc_0_Mem_LBON ),
      .Mem_CKEN ( axi_emc_0_Mem_CKEN ),
      .Mem_CRE ( axi_emc_0_Mem_CRE ),
      .Mem_RNW ( axi_emc_0_Mem_RNW ),
      .Mem_WAIT ( net_gnd1[0:0] ),
      .Mem_DQ_I ( axi_emc_0_Mem_DQ_I ),
      .Mem_DQ_O ( axi_emc_0_Mem_DQ_O ),
      .Mem_DQ_T ( axi_emc_0_Mem_DQ_T ),
      .MEM_DQ_PARITY_I ( axi_emc_0_MEM_DQ_PARITY_I ),
      .MEM_DQ_PARITY_O ( axi_emc_0_MEM_DQ_PARITY_O ),
      .MEM_DQ_PARITY_T ( axi_emc_0_MEM_DQ_PARITY_T )
    );

  (* BOX_TYPE = "user_black_box" *)
  system_axi_mac_reg_2_wrapper
    axi_mac_reg_2 (
      .ECC_Interrupt (  ),
      .ECC_UE (  ),
      .S_AXI_ACLK ( clk_100_0000MHzMMCM0 ),
      .S_AXI_ARESETN ( axi4lite_0_M_ARESETN[2] ),
      .S_AXI_AWID ( axi4lite_0_M_AWID[2:2] ),
      .S_AXI_AWADDR ( axi4lite_0_M_AWADDR[95:64] ),
      .S_AXI_AWLEN ( axi4lite_0_M_AWLEN[23:16] ),
      .S_AXI_AWSIZE ( axi4lite_0_M_AWSIZE[8:6] ),
      .S_AXI_AWBURST ( axi4lite_0_M_AWBURST[5:4] ),
      .S_AXI_AWLOCK ( axi4lite_0_M_AWLOCK[4] ),
      .S_AXI_AWCACHE ( axi4lite_0_M_AWCACHE[11:8] ),
      .S_AXI_AWPROT ( axi4lite_0_M_AWPROT[8:6] ),
      .S_AXI_AWVALID ( axi4lite_0_M_AWVALID[2] ),
      .S_AXI_AWREADY ( axi4lite_0_M_AWREADY[2] ),
      .S_AXI_WDATA ( axi4lite_0_M_WDATA[159:128] ),
      .S_AXI_WSTRB ( axi4lite_0_M_WSTRB[19:16] ),
      .S_AXI_WLAST ( axi4lite_0_M_WLAST[2] ),
      .S_AXI_WVALID ( axi4lite_0_M_WVALID[2] ),
      .S_AXI_WREADY ( axi4lite_0_M_WREADY[2] ),
      .S_AXI_BID ( axi4lite_0_M_BID[2:2] ),
      .S_AXI_BRESP ( axi4lite_0_M_BRESP[5:4] ),
      .S_AXI_BVALID ( axi4lite_0_M_BVALID[2] ),
      .S_AXI_BREADY ( axi4lite_0_M_BREADY[2] ),
      .S_AXI_ARID ( axi4lite_0_M_ARID[2:2] ),
      .S_AXI_ARADDR ( axi4lite_0_M_ARADDR[95:64] ),
      .S_AXI_ARLEN ( axi4lite_0_M_ARLEN[23:16] ),
      .S_AXI_ARSIZE ( axi4lite_0_M_ARSIZE[8:6] ),
      .S_AXI_ARBURST ( axi4lite_0_M_ARBURST[5:4] ),
      .S_AXI_ARLOCK ( axi4lite_0_M_ARLOCK[4] ),
      .S_AXI_ARCACHE ( axi4lite_0_M_ARCACHE[11:8] ),
      .S_AXI_ARPROT ( axi4lite_0_M_ARPROT[8:6] ),
      .S_AXI_ARVALID ( axi4lite_0_M_ARVALID[2] ),
      .S_AXI_ARREADY ( axi4lite_0_M_ARREADY[2] ),
      .S_AXI_RID ( axi4lite_0_M_RID[2:2] ),
      .S_AXI_RDATA ( axi4lite_0_M_RDATA[159:128] ),
      .S_AXI_RRESP ( axi4lite_0_M_RRESP[5:4] ),
      .S_AXI_RVALID ( axi4lite_0_M_RVALID[2] ),
      .S_AXI_RREADY ( axi4lite_0_M_RREADY[2] ),
      .S_AXI_RLAST ( axi4lite_0_M_RLAST[2] ),
      .S_AXI_CTRL_AWVALID ( net_gnd0 ),
      .S_AXI_CTRL_AWREADY (  ),
      .S_AXI_CTRL_AWADDR ( net_gnd32 ),
      .S_AXI_CTRL_WVALID ( net_gnd0 ),
      .S_AXI_CTRL_WREADY (  ),
      .S_AXI_CTRL_WDATA ( net_gnd32 ),
      .S_AXI_CTRL_BRESP (  ),
      .S_AXI_CTRL_BVALID (  ),
      .S_AXI_CTRL_BREADY ( net_gnd0 ),
      .S_AXI_CTRL_ARVALID ( net_gnd0 ),
      .S_AXI_CTRL_ARREADY (  ),
      .S_AXI_CTRL_ARADDR ( net_gnd32 ),
      .S_AXI_CTRL_RVALID (  ),
      .S_AXI_CTRL_RREADY ( net_gnd0 ),
      .S_AXI_CTRL_RDATA (  ),
      .S_AXI_CTRL_RRESP (  ),
      .BRAM_Rst_A (  ),
      .BRAM_Clk_A (  ),
      .BRAM_En_A (  ),
      .BRAM_WE_A (  ),
      .BRAM_Addr_A (  ),
      .BRAM_WrData_A (  ),
      .BRAM_RdData_A ( net_gnd32 ),
      .BRAM_Rst_B (  ),
      .BRAM_Clk_B (  ),
      .BRAM_En_B (  ),
      .BRAM_WE_B (  ),
      .BRAM_Addr_B (  ),
      .BRAM_WrData_B (  ),
      .BRAM_RdData_B ( net_gnd32 )
    );

  (* BOX_TYPE = "user_black_box" *)
  system_axi_mac_reg_1_wrapper
    axi_mac_reg_1 (
      .ECC_Interrupt (  ),
      .ECC_UE (  ),
      .S_AXI_ACLK ( clk_100_0000MHzMMCM0 ),
      .S_AXI_ARESETN ( axi4lite_0_M_ARESETN[3] ),
      .S_AXI_AWID ( axi4lite_0_M_AWID[3:3] ),
      .S_AXI_AWADDR ( axi4lite_0_M_AWADDR[127:96] ),
      .S_AXI_AWLEN ( axi4lite_0_M_AWLEN[31:24] ),
      .S_AXI_AWSIZE ( axi4lite_0_M_AWSIZE[11:9] ),
      .S_AXI_AWBURST ( axi4lite_0_M_AWBURST[7:6] ),
      .S_AXI_AWLOCK ( axi4lite_0_M_AWLOCK[6] ),
      .S_AXI_AWCACHE ( axi4lite_0_M_AWCACHE[15:12] ),
      .S_AXI_AWPROT ( axi4lite_0_M_AWPROT[11:9] ),
      .S_AXI_AWVALID ( axi4lite_0_M_AWVALID[3] ),
      .S_AXI_AWREADY ( axi4lite_0_M_AWREADY[3] ),
      .S_AXI_WDATA ( axi4lite_0_M_WDATA[223:192] ),
      .S_AXI_WSTRB ( axi4lite_0_M_WSTRB[27:24] ),
      .S_AXI_WLAST ( axi4lite_0_M_WLAST[3] ),
      .S_AXI_WVALID ( axi4lite_0_M_WVALID[3] ),
      .S_AXI_WREADY ( axi4lite_0_M_WREADY[3] ),
      .S_AXI_BID ( axi4lite_0_M_BID[3:3] ),
      .S_AXI_BRESP ( axi4lite_0_M_BRESP[7:6] ),
      .S_AXI_BVALID ( axi4lite_0_M_BVALID[3] ),
      .S_AXI_BREADY ( axi4lite_0_M_BREADY[3] ),
      .S_AXI_ARID ( axi4lite_0_M_ARID[3:3] ),
      .S_AXI_ARADDR ( axi4lite_0_M_ARADDR[127:96] ),
      .S_AXI_ARLEN ( axi4lite_0_M_ARLEN[31:24] ),
      .S_AXI_ARSIZE ( axi4lite_0_M_ARSIZE[11:9] ),
      .S_AXI_ARBURST ( axi4lite_0_M_ARBURST[7:6] ),
      .S_AXI_ARLOCK ( axi4lite_0_M_ARLOCK[6] ),
      .S_AXI_ARCACHE ( axi4lite_0_M_ARCACHE[15:12] ),
      .S_AXI_ARPROT ( axi4lite_0_M_ARPROT[11:9] ),
      .S_AXI_ARVALID ( axi4lite_0_M_ARVALID[3] ),
      .S_AXI_ARREADY ( axi4lite_0_M_ARREADY[3] ),
      .S_AXI_RID ( axi4lite_0_M_RID[3:3] ),
      .S_AXI_RDATA ( axi4lite_0_M_RDATA[223:192] ),
      .S_AXI_RRESP ( axi4lite_0_M_RRESP[7:6] ),
      .S_AXI_RVALID ( axi4lite_0_M_RVALID[3] ),
      .S_AXI_RREADY ( axi4lite_0_M_RREADY[3] ),
      .S_AXI_RLAST ( axi4lite_0_M_RLAST[3] ),
      .S_AXI_CTRL_AWVALID ( net_gnd0 ),
      .S_AXI_CTRL_AWREADY (  ),
      .S_AXI_CTRL_AWADDR ( net_gnd32 ),
      .S_AXI_CTRL_WVALID ( net_gnd0 ),
      .S_AXI_CTRL_WREADY (  ),
      .S_AXI_CTRL_WDATA ( net_gnd32 ),
      .S_AXI_CTRL_BRESP (  ),
      .S_AXI_CTRL_BVALID (  ),
      .S_AXI_CTRL_BREADY ( net_gnd0 ),
      .S_AXI_CTRL_ARVALID ( net_gnd0 ),
      .S_AXI_CTRL_ARREADY (  ),
      .S_AXI_CTRL_ARADDR ( net_gnd32 ),
      .S_AXI_CTRL_RVALID (  ),
      .S_AXI_CTRL_RREADY ( net_gnd0 ),
      .S_AXI_CTRL_RDATA (  ),
      .S_AXI_CTRL_RRESP (  ),
      .BRAM_Rst_A (  ),
      .BRAM_Clk_A (  ),
      .BRAM_En_A (  ),
      .BRAM_WE_A (  ),
      .BRAM_Addr_A (  ),
      .BRAM_WrData_A (  ),
      .BRAM_RdData_A ( net_gnd32 ),
      .BRAM_Rst_B (  ),
      .BRAM_Clk_B (  ),
      .BRAM_En_B (  ),
      .BRAM_WE_B (  ),
      .BRAM_Addr_B (  ),
      .BRAM_WrData_B (  ),
      .BRAM_RdData_B ( net_gnd32 )
    );

  IBUFGDS
    ibufgds_0 (
      .I ( CLK_P ),
      .IB ( CLK_N ),
      .O ( CLK )
    );

  IOBUF
    iobuf_1 (
      .I ( axi_emc_0_Mem_DQ_O[63] ),
      .IO ( axi_emc_0_Mem_DQ_pin[63] ),
      .O ( axi_emc_0_Mem_DQ_I[63] ),
      .T ( axi_emc_0_Mem_DQ_T[63] )
    );

  IOBUF
    iobuf_2 (
      .I ( axi_emc_0_Mem_DQ_O[62] ),
      .IO ( axi_emc_0_Mem_DQ_pin[62] ),
      .O ( axi_emc_0_Mem_DQ_I[62] ),
      .T ( axi_emc_0_Mem_DQ_T[62] )
    );

  IOBUF
    iobuf_3 (
      .I ( axi_emc_0_Mem_DQ_O[61] ),
      .IO ( axi_emc_0_Mem_DQ_pin[61] ),
      .O ( axi_emc_0_Mem_DQ_I[61] ),
      .T ( axi_emc_0_Mem_DQ_T[61] )
    );

  IOBUF
    iobuf_4 (
      .I ( axi_emc_0_Mem_DQ_O[60] ),
      .IO ( axi_emc_0_Mem_DQ_pin[60] ),
      .O ( axi_emc_0_Mem_DQ_I[60] ),
      .T ( axi_emc_0_Mem_DQ_T[60] )
    );

  IOBUF
    iobuf_5 (
      .I ( axi_emc_0_Mem_DQ_O[59] ),
      .IO ( axi_emc_0_Mem_DQ_pin[59] ),
      .O ( axi_emc_0_Mem_DQ_I[59] ),
      .T ( axi_emc_0_Mem_DQ_T[59] )
    );

  IOBUF
    iobuf_6 (
      .I ( axi_emc_0_Mem_DQ_O[58] ),
      .IO ( axi_emc_0_Mem_DQ_pin[58] ),
      .O ( axi_emc_0_Mem_DQ_I[58] ),
      .T ( axi_emc_0_Mem_DQ_T[58] )
    );

  IOBUF
    iobuf_7 (
      .I ( axi_emc_0_Mem_DQ_O[57] ),
      .IO ( axi_emc_0_Mem_DQ_pin[57] ),
      .O ( axi_emc_0_Mem_DQ_I[57] ),
      .T ( axi_emc_0_Mem_DQ_T[57] )
    );

  IOBUF
    iobuf_8 (
      .I ( axi_emc_0_Mem_DQ_O[56] ),
      .IO ( axi_emc_0_Mem_DQ_pin[56] ),
      .O ( axi_emc_0_Mem_DQ_I[56] ),
      .T ( axi_emc_0_Mem_DQ_T[56] )
    );

  IOBUF
    iobuf_9 (
      .I ( axi_emc_0_Mem_DQ_O[55] ),
      .IO ( axi_emc_0_Mem_DQ_pin[55] ),
      .O ( axi_emc_0_Mem_DQ_I[55] ),
      .T ( axi_emc_0_Mem_DQ_T[55] )
    );

  IOBUF
    iobuf_10 (
      .I ( axi_emc_0_Mem_DQ_O[54] ),
      .IO ( axi_emc_0_Mem_DQ_pin[54] ),
      .O ( axi_emc_0_Mem_DQ_I[54] ),
      .T ( axi_emc_0_Mem_DQ_T[54] )
    );

  IOBUF
    iobuf_11 (
      .I ( axi_emc_0_Mem_DQ_O[53] ),
      .IO ( axi_emc_0_Mem_DQ_pin[53] ),
      .O ( axi_emc_0_Mem_DQ_I[53] ),
      .T ( axi_emc_0_Mem_DQ_T[53] )
    );

  IOBUF
    iobuf_12 (
      .I ( axi_emc_0_Mem_DQ_O[52] ),
      .IO ( axi_emc_0_Mem_DQ_pin[52] ),
      .O ( axi_emc_0_Mem_DQ_I[52] ),
      .T ( axi_emc_0_Mem_DQ_T[52] )
    );

  IOBUF
    iobuf_13 (
      .I ( axi_emc_0_Mem_DQ_O[51] ),
      .IO ( axi_emc_0_Mem_DQ_pin[51] ),
      .O ( axi_emc_0_Mem_DQ_I[51] ),
      .T ( axi_emc_0_Mem_DQ_T[51] )
    );

  IOBUF
    iobuf_14 (
      .I ( axi_emc_0_Mem_DQ_O[50] ),
      .IO ( axi_emc_0_Mem_DQ_pin[50] ),
      .O ( axi_emc_0_Mem_DQ_I[50] ),
      .T ( axi_emc_0_Mem_DQ_T[50] )
    );

  IOBUF
    iobuf_15 (
      .I ( axi_emc_0_Mem_DQ_O[49] ),
      .IO ( axi_emc_0_Mem_DQ_pin[49] ),
      .O ( axi_emc_0_Mem_DQ_I[49] ),
      .T ( axi_emc_0_Mem_DQ_T[49] )
    );

  IOBUF
    iobuf_16 (
      .I ( axi_emc_0_Mem_DQ_O[48] ),
      .IO ( axi_emc_0_Mem_DQ_pin[48] ),
      .O ( axi_emc_0_Mem_DQ_I[48] ),
      .T ( axi_emc_0_Mem_DQ_T[48] )
    );

  IOBUF
    iobuf_17 (
      .I ( axi_emc_0_Mem_DQ_O[47] ),
      .IO ( axi_emc_0_Mem_DQ_pin[47] ),
      .O ( axi_emc_0_Mem_DQ_I[47] ),
      .T ( axi_emc_0_Mem_DQ_T[47] )
    );

  IOBUF
    iobuf_18 (
      .I ( axi_emc_0_Mem_DQ_O[46] ),
      .IO ( axi_emc_0_Mem_DQ_pin[46] ),
      .O ( axi_emc_0_Mem_DQ_I[46] ),
      .T ( axi_emc_0_Mem_DQ_T[46] )
    );

  IOBUF
    iobuf_19 (
      .I ( axi_emc_0_Mem_DQ_O[45] ),
      .IO ( axi_emc_0_Mem_DQ_pin[45] ),
      .O ( axi_emc_0_Mem_DQ_I[45] ),
      .T ( axi_emc_0_Mem_DQ_T[45] )
    );

  IOBUF
    iobuf_20 (
      .I ( axi_emc_0_Mem_DQ_O[44] ),
      .IO ( axi_emc_0_Mem_DQ_pin[44] ),
      .O ( axi_emc_0_Mem_DQ_I[44] ),
      .T ( axi_emc_0_Mem_DQ_T[44] )
    );

  IOBUF
    iobuf_21 (
      .I ( axi_emc_0_Mem_DQ_O[43] ),
      .IO ( axi_emc_0_Mem_DQ_pin[43] ),
      .O ( axi_emc_0_Mem_DQ_I[43] ),
      .T ( axi_emc_0_Mem_DQ_T[43] )
    );

  IOBUF
    iobuf_22 (
      .I ( axi_emc_0_Mem_DQ_O[42] ),
      .IO ( axi_emc_0_Mem_DQ_pin[42] ),
      .O ( axi_emc_0_Mem_DQ_I[42] ),
      .T ( axi_emc_0_Mem_DQ_T[42] )
    );

  IOBUF
    iobuf_23 (
      .I ( axi_emc_0_Mem_DQ_O[41] ),
      .IO ( axi_emc_0_Mem_DQ_pin[41] ),
      .O ( axi_emc_0_Mem_DQ_I[41] ),
      .T ( axi_emc_0_Mem_DQ_T[41] )
    );

  IOBUF
    iobuf_24 (
      .I ( axi_emc_0_Mem_DQ_O[40] ),
      .IO ( axi_emc_0_Mem_DQ_pin[40] ),
      .O ( axi_emc_0_Mem_DQ_I[40] ),
      .T ( axi_emc_0_Mem_DQ_T[40] )
    );

  IOBUF
    iobuf_25 (
      .I ( axi_emc_0_Mem_DQ_O[39] ),
      .IO ( axi_emc_0_Mem_DQ_pin[39] ),
      .O ( axi_emc_0_Mem_DQ_I[39] ),
      .T ( axi_emc_0_Mem_DQ_T[39] )
    );

  IOBUF
    iobuf_26 (
      .I ( axi_emc_0_Mem_DQ_O[38] ),
      .IO ( axi_emc_0_Mem_DQ_pin[38] ),
      .O ( axi_emc_0_Mem_DQ_I[38] ),
      .T ( axi_emc_0_Mem_DQ_T[38] )
    );

  IOBUF
    iobuf_27 (
      .I ( axi_emc_0_Mem_DQ_O[37] ),
      .IO ( axi_emc_0_Mem_DQ_pin[37] ),
      .O ( axi_emc_0_Mem_DQ_I[37] ),
      .T ( axi_emc_0_Mem_DQ_T[37] )
    );

  IOBUF
    iobuf_28 (
      .I ( axi_emc_0_Mem_DQ_O[36] ),
      .IO ( axi_emc_0_Mem_DQ_pin[36] ),
      .O ( axi_emc_0_Mem_DQ_I[36] ),
      .T ( axi_emc_0_Mem_DQ_T[36] )
    );

  IOBUF
    iobuf_29 (
      .I ( axi_emc_0_Mem_DQ_O[35] ),
      .IO ( axi_emc_0_Mem_DQ_pin[35] ),
      .O ( axi_emc_0_Mem_DQ_I[35] ),
      .T ( axi_emc_0_Mem_DQ_T[35] )
    );

  IOBUF
    iobuf_30 (
      .I ( axi_emc_0_Mem_DQ_O[34] ),
      .IO ( axi_emc_0_Mem_DQ_pin[34] ),
      .O ( axi_emc_0_Mem_DQ_I[34] ),
      .T ( axi_emc_0_Mem_DQ_T[34] )
    );

  IOBUF
    iobuf_31 (
      .I ( axi_emc_0_Mem_DQ_O[33] ),
      .IO ( axi_emc_0_Mem_DQ_pin[33] ),
      .O ( axi_emc_0_Mem_DQ_I[33] ),
      .T ( axi_emc_0_Mem_DQ_T[33] )
    );

  IOBUF
    iobuf_32 (
      .I ( axi_emc_0_Mem_DQ_O[32] ),
      .IO ( axi_emc_0_Mem_DQ_pin[32] ),
      .O ( axi_emc_0_Mem_DQ_I[32] ),
      .T ( axi_emc_0_Mem_DQ_T[32] )
    );

  IOBUF
    iobuf_33 (
      .I ( axi_emc_0_Mem_DQ_O[31] ),
      .IO ( axi_emc_0_Mem_DQ_pin[31] ),
      .O ( axi_emc_0_Mem_DQ_I[31] ),
      .T ( axi_emc_0_Mem_DQ_T[31] )
    );

  IOBUF
    iobuf_34 (
      .I ( axi_emc_0_Mem_DQ_O[30] ),
      .IO ( axi_emc_0_Mem_DQ_pin[30] ),
      .O ( axi_emc_0_Mem_DQ_I[30] ),
      .T ( axi_emc_0_Mem_DQ_T[30] )
    );

  IOBUF
    iobuf_35 (
      .I ( axi_emc_0_Mem_DQ_O[29] ),
      .IO ( axi_emc_0_Mem_DQ_pin[29] ),
      .O ( axi_emc_0_Mem_DQ_I[29] ),
      .T ( axi_emc_0_Mem_DQ_T[29] )
    );

  IOBUF
    iobuf_36 (
      .I ( axi_emc_0_Mem_DQ_O[28] ),
      .IO ( axi_emc_0_Mem_DQ_pin[28] ),
      .O ( axi_emc_0_Mem_DQ_I[28] ),
      .T ( axi_emc_0_Mem_DQ_T[28] )
    );

  IOBUF
    iobuf_37 (
      .I ( axi_emc_0_Mem_DQ_O[27] ),
      .IO ( axi_emc_0_Mem_DQ_pin[27] ),
      .O ( axi_emc_0_Mem_DQ_I[27] ),
      .T ( axi_emc_0_Mem_DQ_T[27] )
    );

  IOBUF
    iobuf_38 (
      .I ( axi_emc_0_Mem_DQ_O[26] ),
      .IO ( axi_emc_0_Mem_DQ_pin[26] ),
      .O ( axi_emc_0_Mem_DQ_I[26] ),
      .T ( axi_emc_0_Mem_DQ_T[26] )
    );

  IOBUF
    iobuf_39 (
      .I ( axi_emc_0_Mem_DQ_O[25] ),
      .IO ( axi_emc_0_Mem_DQ_pin[25] ),
      .O ( axi_emc_0_Mem_DQ_I[25] ),
      .T ( axi_emc_0_Mem_DQ_T[25] )
    );

  IOBUF
    iobuf_40 (
      .I ( axi_emc_0_Mem_DQ_O[24] ),
      .IO ( axi_emc_0_Mem_DQ_pin[24] ),
      .O ( axi_emc_0_Mem_DQ_I[24] ),
      .T ( axi_emc_0_Mem_DQ_T[24] )
    );

  IOBUF
    iobuf_41 (
      .I ( axi_emc_0_Mem_DQ_O[23] ),
      .IO ( axi_emc_0_Mem_DQ_pin[23] ),
      .O ( axi_emc_0_Mem_DQ_I[23] ),
      .T ( axi_emc_0_Mem_DQ_T[23] )
    );

  IOBUF
    iobuf_42 (
      .I ( axi_emc_0_Mem_DQ_O[22] ),
      .IO ( axi_emc_0_Mem_DQ_pin[22] ),
      .O ( axi_emc_0_Mem_DQ_I[22] ),
      .T ( axi_emc_0_Mem_DQ_T[22] )
    );

  IOBUF
    iobuf_43 (
      .I ( axi_emc_0_Mem_DQ_O[21] ),
      .IO ( axi_emc_0_Mem_DQ_pin[21] ),
      .O ( axi_emc_0_Mem_DQ_I[21] ),
      .T ( axi_emc_0_Mem_DQ_T[21] )
    );

  IOBUF
    iobuf_44 (
      .I ( axi_emc_0_Mem_DQ_O[20] ),
      .IO ( axi_emc_0_Mem_DQ_pin[20] ),
      .O ( axi_emc_0_Mem_DQ_I[20] ),
      .T ( axi_emc_0_Mem_DQ_T[20] )
    );

  IOBUF
    iobuf_45 (
      .I ( axi_emc_0_Mem_DQ_O[19] ),
      .IO ( axi_emc_0_Mem_DQ_pin[19] ),
      .O ( axi_emc_0_Mem_DQ_I[19] ),
      .T ( axi_emc_0_Mem_DQ_T[19] )
    );

  IOBUF
    iobuf_46 (
      .I ( axi_emc_0_Mem_DQ_O[18] ),
      .IO ( axi_emc_0_Mem_DQ_pin[18] ),
      .O ( axi_emc_0_Mem_DQ_I[18] ),
      .T ( axi_emc_0_Mem_DQ_T[18] )
    );

  IOBUF
    iobuf_47 (
      .I ( axi_emc_0_Mem_DQ_O[17] ),
      .IO ( axi_emc_0_Mem_DQ_pin[17] ),
      .O ( axi_emc_0_Mem_DQ_I[17] ),
      .T ( axi_emc_0_Mem_DQ_T[17] )
    );

  IOBUF
    iobuf_48 (
      .I ( axi_emc_0_Mem_DQ_O[16] ),
      .IO ( axi_emc_0_Mem_DQ_pin[16] ),
      .O ( axi_emc_0_Mem_DQ_I[16] ),
      .T ( axi_emc_0_Mem_DQ_T[16] )
    );

  IOBUF
    iobuf_49 (
      .I ( axi_emc_0_Mem_DQ_O[15] ),
      .IO ( axi_emc_0_Mem_DQ_pin[15] ),
      .O ( axi_emc_0_Mem_DQ_I[15] ),
      .T ( axi_emc_0_Mem_DQ_T[15] )
    );

  IOBUF
    iobuf_50 (
      .I ( axi_emc_0_Mem_DQ_O[14] ),
      .IO ( axi_emc_0_Mem_DQ_pin[14] ),
      .O ( axi_emc_0_Mem_DQ_I[14] ),
      .T ( axi_emc_0_Mem_DQ_T[14] )
    );

  IOBUF
    iobuf_51 (
      .I ( axi_emc_0_Mem_DQ_O[13] ),
      .IO ( axi_emc_0_Mem_DQ_pin[13] ),
      .O ( axi_emc_0_Mem_DQ_I[13] ),
      .T ( axi_emc_0_Mem_DQ_T[13] )
    );

  IOBUF
    iobuf_52 (
      .I ( axi_emc_0_Mem_DQ_O[12] ),
      .IO ( axi_emc_0_Mem_DQ_pin[12] ),
      .O ( axi_emc_0_Mem_DQ_I[12] ),
      .T ( axi_emc_0_Mem_DQ_T[12] )
    );

  IOBUF
    iobuf_53 (
      .I ( axi_emc_0_Mem_DQ_O[11] ),
      .IO ( axi_emc_0_Mem_DQ_pin[11] ),
      .O ( axi_emc_0_Mem_DQ_I[11] ),
      .T ( axi_emc_0_Mem_DQ_T[11] )
    );

  IOBUF
    iobuf_54 (
      .I ( axi_emc_0_Mem_DQ_O[10] ),
      .IO ( axi_emc_0_Mem_DQ_pin[10] ),
      .O ( axi_emc_0_Mem_DQ_I[10] ),
      .T ( axi_emc_0_Mem_DQ_T[10] )
    );

  IOBUF
    iobuf_55 (
      .I ( axi_emc_0_Mem_DQ_O[9] ),
      .IO ( axi_emc_0_Mem_DQ_pin[9] ),
      .O ( axi_emc_0_Mem_DQ_I[9] ),
      .T ( axi_emc_0_Mem_DQ_T[9] )
    );

  IOBUF
    iobuf_56 (
      .I ( axi_emc_0_Mem_DQ_O[8] ),
      .IO ( axi_emc_0_Mem_DQ_pin[8] ),
      .O ( axi_emc_0_Mem_DQ_I[8] ),
      .T ( axi_emc_0_Mem_DQ_T[8] )
    );

  IOBUF
    iobuf_57 (
      .I ( axi_emc_0_Mem_DQ_O[7] ),
      .IO ( axi_emc_0_Mem_DQ_pin[7] ),
      .O ( axi_emc_0_Mem_DQ_I[7] ),
      .T ( axi_emc_0_Mem_DQ_T[7] )
    );

  IOBUF
    iobuf_58 (
      .I ( axi_emc_0_Mem_DQ_O[6] ),
      .IO ( axi_emc_0_Mem_DQ_pin[6] ),
      .O ( axi_emc_0_Mem_DQ_I[6] ),
      .T ( axi_emc_0_Mem_DQ_T[6] )
    );

  IOBUF
    iobuf_59 (
      .I ( axi_emc_0_Mem_DQ_O[5] ),
      .IO ( axi_emc_0_Mem_DQ_pin[5] ),
      .O ( axi_emc_0_Mem_DQ_I[5] ),
      .T ( axi_emc_0_Mem_DQ_T[5] )
    );

  IOBUF
    iobuf_60 (
      .I ( axi_emc_0_Mem_DQ_O[4] ),
      .IO ( axi_emc_0_Mem_DQ_pin[4] ),
      .O ( axi_emc_0_Mem_DQ_I[4] ),
      .T ( axi_emc_0_Mem_DQ_T[4] )
    );

  IOBUF
    iobuf_61 (
      .I ( axi_emc_0_Mem_DQ_O[3] ),
      .IO ( axi_emc_0_Mem_DQ_pin[3] ),
      .O ( axi_emc_0_Mem_DQ_I[3] ),
      .T ( axi_emc_0_Mem_DQ_T[3] )
    );

  IOBUF
    iobuf_62 (
      .I ( axi_emc_0_Mem_DQ_O[2] ),
      .IO ( axi_emc_0_Mem_DQ_pin[2] ),
      .O ( axi_emc_0_Mem_DQ_I[2] ),
      .T ( axi_emc_0_Mem_DQ_T[2] )
    );

  IOBUF
    iobuf_63 (
      .I ( axi_emc_0_Mem_DQ_O[1] ),
      .IO ( axi_emc_0_Mem_DQ_pin[1] ),
      .O ( axi_emc_0_Mem_DQ_I[1] ),
      .T ( axi_emc_0_Mem_DQ_T[1] )
    );

  IOBUF
    iobuf_64 (
      .I ( axi_emc_0_Mem_DQ_O[0] ),
      .IO ( axi_emc_0_Mem_DQ_pin[0] ),
      .O ( axi_emc_0_Mem_DQ_I[0] ),
      .T ( axi_emc_0_Mem_DQ_T[0] )
    );

  IOBUF
    iobuf_65 (
      .I ( axi_emc_0_MEM_DQ_PARITY_O[7] ),
      .IO ( axi_emc_0_MEM_DQ_PARITY_pin[7] ),
      .O ( axi_emc_0_MEM_DQ_PARITY_I[7] ),
      .T ( axi_emc_0_MEM_DQ_PARITY_T[7] )
    );

  IOBUF
    iobuf_66 (
      .I ( axi_emc_0_MEM_DQ_PARITY_O[6] ),
      .IO ( axi_emc_0_MEM_DQ_PARITY_pin[6] ),
      .O ( axi_emc_0_MEM_DQ_PARITY_I[6] ),
      .T ( axi_emc_0_MEM_DQ_PARITY_T[6] )
    );

  IOBUF
    iobuf_67 (
      .I ( axi_emc_0_MEM_DQ_PARITY_O[5] ),
      .IO ( axi_emc_0_MEM_DQ_PARITY_pin[5] ),
      .O ( axi_emc_0_MEM_DQ_PARITY_I[5] ),
      .T ( axi_emc_0_MEM_DQ_PARITY_T[5] )
    );

  IOBUF
    iobuf_68 (
      .I ( axi_emc_0_MEM_DQ_PARITY_O[4] ),
      .IO ( axi_emc_0_MEM_DQ_PARITY_pin[4] ),
      .O ( axi_emc_0_MEM_DQ_PARITY_I[4] ),
      .T ( axi_emc_0_MEM_DQ_PARITY_T[4] )
    );

  IOBUF
    iobuf_69 (
      .I ( axi_emc_0_MEM_DQ_PARITY_O[3] ),
      .IO ( axi_emc_0_MEM_DQ_PARITY_pin[3] ),
      .O ( axi_emc_0_MEM_DQ_PARITY_I[3] ),
      .T ( axi_emc_0_MEM_DQ_PARITY_T[3] )
    );

  IOBUF
    iobuf_70 (
      .I ( axi_emc_0_MEM_DQ_PARITY_O[2] ),
      .IO ( axi_emc_0_MEM_DQ_PARITY_pin[2] ),
      .O ( axi_emc_0_MEM_DQ_PARITY_I[2] ),
      .T ( axi_emc_0_MEM_DQ_PARITY_T[2] )
    );

  IOBUF
    iobuf_71 (
      .I ( axi_emc_0_MEM_DQ_PARITY_O[1] ),
      .IO ( axi_emc_0_MEM_DQ_PARITY_pin[1] ),
      .O ( axi_emc_0_MEM_DQ_PARITY_I[1] ),
      .T ( axi_emc_0_MEM_DQ_PARITY_T[1] )
    );

  IOBUF
    iobuf_72 (
      .I ( axi_emc_0_MEM_DQ_PARITY_O[0] ),
      .IO ( axi_emc_0_MEM_DQ_PARITY_pin[0] ),
      .O ( axi_emc_0_MEM_DQ_PARITY_I[0] ),
      .T ( axi_emc_0_MEM_DQ_PARITY_T[0] )
    );

endmodule

module system_util_and_logic_0_wrapper
  (
    Op1,
    Op2,
    Res
  );
  input [0:0] Op1;
  input [0:0] Op2;
  output [0:0] Res;
endmodule

module system_proc_sys_reset_0_wrapper
  (
    Slowest_sync_clk,
    Ext_Reset_In,
    Aux_Reset_In,
    MB_Debug_Sys_Rst,
    Core_Reset_Req_0,
    Chip_Reset_Req_0,
    System_Reset_Req_0,
    Core_Reset_Req_1,
    Chip_Reset_Req_1,
    System_Reset_Req_1,
    Dcm_locked,
    RstcPPCresetcore_0,
    RstcPPCresetchip_0,
    RstcPPCresetsys_0,
    RstcPPCresetcore_1,
    RstcPPCresetchip_1,
    RstcPPCresetsys_1,
    MB_Reset,
    Bus_Struct_Reset,
    Peripheral_Reset,
    Interconnect_aresetn,
    Peripheral_aresetn
  );
  input Slowest_sync_clk;
  input Ext_Reset_In;
  input Aux_Reset_In;
  input MB_Debug_Sys_Rst;
  input Core_Reset_Req_0;
  input Chip_Reset_Req_0;
  input System_Reset_Req_0;
  input Core_Reset_Req_1;
  input Chip_Reset_Req_1;
  input System_Reset_Req_1;
  input Dcm_locked;
  output RstcPPCresetcore_0;
  output RstcPPCresetchip_0;
  output RstcPPCresetsys_0;
  output RstcPPCresetcore_1;
  output RstcPPCresetchip_1;
  output RstcPPCresetsys_1;
  output MB_Reset;
  output [0:0] Bus_Struct_Reset;
  output [0:0] Peripheral_Reset;
  output [0:0] Interconnect_aresetn;
  output [0:0] Peripheral_aresetn;
endmodule

module system_clock_generator_0_wrapper
  (
    CLKIN,
    CLKOUT0,
    CLKOUT1,
    CLKOUT2,
    CLKOUT3,
    CLKOUT4,
    CLKOUT5,
    CLKOUT6,
    CLKOUT7,
    CLKOUT8,
    CLKOUT9,
    CLKOUT10,
    CLKOUT11,
    CLKOUT12,
    CLKOUT13,
    CLKOUT14,
    CLKOUT15,
    CLKFBIN,
    CLKFBOUT,
    PSCLK,
    PSEN,
    PSINCDEC,
    PSDONE,
    RST,
    LOCKED
  );
  input CLKIN;
  output CLKOUT0;
  output CLKOUT1;
  output CLKOUT2;
  output CLKOUT3;
  output CLKOUT4;
  output CLKOUT5;
  output CLKOUT6;
  output CLKOUT7;
  output CLKOUT8;
  output CLKOUT9;
  output CLKOUT10;
  output CLKOUT11;
  output CLKOUT12;
  output CLKOUT13;
  output CLKOUT14;
  output CLKOUT15;
  input CLKFBIN;
  output CLKFBOUT;
  input PSCLK;
  input PSEN;
  input PSINCDEC;
  output PSDONE;
  input RST;
  output LOCKED;
endmodule

module system_axi_mac_reg_bram_wrapper
  (
    BRAM_Rst_A,
    BRAM_Clk_A,
    BRAM_EN_A,
    BRAM_WEN_A,
    BRAM_Addr_A,
    BRAM_Din_A,
    BRAM_Dout_A,
    BRAM_Rst_B,
    BRAM_Clk_B,
    BRAM_EN_B,
    BRAM_WEN_B,
    BRAM_Addr_B,
    BRAM_Din_B,
    BRAM_Dout_B
  );
  input BRAM_Rst_A;
  input BRAM_Clk_A;
  input BRAM_EN_A;
  input [0:3] BRAM_WEN_A;
  input [0:31] BRAM_Addr_A;
  output [0:31] BRAM_Din_A;
  input [0:31] BRAM_Dout_A;
  input BRAM_Rst_B;
  input BRAM_Clk_B;
  input BRAM_EN_B;
  input [0:3] BRAM_WEN_B;
  input [0:31] BRAM_Addr_B;
  output [0:31] BRAM_Din_B;
  input [0:31] BRAM_Dout_B;
endmodule

module system_axi_mac_reg_0_wrapper
  (
    ECC_Interrupt,
    ECC_UE,
    S_AXI_ACLK,
    S_AXI_ARESETN,
    S_AXI_AWID,
    S_AXI_AWADDR,
    S_AXI_AWLEN,
    S_AXI_AWSIZE,
    S_AXI_AWBURST,
    S_AXI_AWLOCK,
    S_AXI_AWCACHE,
    S_AXI_AWPROT,
    S_AXI_AWVALID,
    S_AXI_AWREADY,
    S_AXI_WDATA,
    S_AXI_WSTRB,
    S_AXI_WLAST,
    S_AXI_WVALID,
    S_AXI_WREADY,
    S_AXI_BID,
    S_AXI_BRESP,
    S_AXI_BVALID,
    S_AXI_BREADY,
    S_AXI_ARID,
    S_AXI_ARADDR,
    S_AXI_ARLEN,
    S_AXI_ARSIZE,
    S_AXI_ARBURST,
    S_AXI_ARLOCK,
    S_AXI_ARCACHE,
    S_AXI_ARPROT,
    S_AXI_ARVALID,
    S_AXI_ARREADY,
    S_AXI_RID,
    S_AXI_RDATA,
    S_AXI_RRESP,
    S_AXI_RVALID,
    S_AXI_RREADY,
    S_AXI_RLAST,
    S_AXI_CTRL_AWVALID,
    S_AXI_CTRL_AWREADY,
    S_AXI_CTRL_AWADDR,
    S_AXI_CTRL_WVALID,
    S_AXI_CTRL_WREADY,
    S_AXI_CTRL_WDATA,
    S_AXI_CTRL_BRESP,
    S_AXI_CTRL_BVALID,
    S_AXI_CTRL_BREADY,
    S_AXI_CTRL_ARVALID,
    S_AXI_CTRL_ARREADY,
    S_AXI_CTRL_ARADDR,
    S_AXI_CTRL_RVALID,
    S_AXI_CTRL_RREADY,
    S_AXI_CTRL_RDATA,
    S_AXI_CTRL_RRESP,
    BRAM_Rst_A,
    BRAM_Clk_A,
    BRAM_En_A,
    BRAM_WE_A,
    BRAM_Addr_A,
    BRAM_WrData_A,
    BRAM_RdData_A,
    BRAM_Rst_B,
    BRAM_Clk_B,
    BRAM_En_B,
    BRAM_WE_B,
    BRAM_Addr_B,
    BRAM_WrData_B,
    BRAM_RdData_B
  );
  output ECC_Interrupt;
  output ECC_UE;
  input S_AXI_ACLK;
  input S_AXI_ARESETN;
  input [0:0] S_AXI_AWID;
  input [31:0] S_AXI_AWADDR;
  input [7:0] S_AXI_AWLEN;
  input [2:0] S_AXI_AWSIZE;
  input [1:0] S_AXI_AWBURST;
  input S_AXI_AWLOCK;
  input [3:0] S_AXI_AWCACHE;
  input [2:0] S_AXI_AWPROT;
  input S_AXI_AWVALID;
  output S_AXI_AWREADY;
  input [31:0] S_AXI_WDATA;
  input [3:0] S_AXI_WSTRB;
  input S_AXI_WLAST;
  input S_AXI_WVALID;
  output S_AXI_WREADY;
  output [0:0] S_AXI_BID;
  output [1:0] S_AXI_BRESP;
  output S_AXI_BVALID;
  input S_AXI_BREADY;
  input [0:0] S_AXI_ARID;
  input [31:0] S_AXI_ARADDR;
  input [7:0] S_AXI_ARLEN;
  input [2:0] S_AXI_ARSIZE;
  input [1:0] S_AXI_ARBURST;
  input S_AXI_ARLOCK;
  input [3:0] S_AXI_ARCACHE;
  input [2:0] S_AXI_ARPROT;
  input S_AXI_ARVALID;
  output S_AXI_ARREADY;
  output [0:0] S_AXI_RID;
  output [31:0] S_AXI_RDATA;
  output [1:0] S_AXI_RRESP;
  output S_AXI_RVALID;
  input S_AXI_RREADY;
  output S_AXI_RLAST;
  input S_AXI_CTRL_AWVALID;
  output S_AXI_CTRL_AWREADY;
  input [31:0] S_AXI_CTRL_AWADDR;
  input S_AXI_CTRL_WVALID;
  output S_AXI_CTRL_WREADY;
  input [31:0] S_AXI_CTRL_WDATA;
  output [1:0] S_AXI_CTRL_BRESP;
  output S_AXI_CTRL_BVALID;
  input S_AXI_CTRL_BREADY;
  input S_AXI_CTRL_ARVALID;
  output S_AXI_CTRL_ARREADY;
  input [31:0] S_AXI_CTRL_ARADDR;
  output S_AXI_CTRL_RVALID;
  input S_AXI_CTRL_RREADY;
  output [31:0] S_AXI_CTRL_RDATA;
  output [1:0] S_AXI_CTRL_RRESP;
  output BRAM_Rst_A;
  output BRAM_Clk_A;
  output BRAM_En_A;
  output [3:0] BRAM_WE_A;
  output [31:0] BRAM_Addr_A;
  output [31:0] BRAM_WrData_A;
  input [31:0] BRAM_RdData_A;
  output BRAM_Rst_B;
  output BRAM_Clk_B;
  output BRAM_En_B;
  output [3:0] BRAM_WE_B;
  output [31:0] BRAM_Addr_B;
  output [31:0] BRAM_WrData_B;
  input [31:0] BRAM_RdData_B;
endmodule

module system_axi4lite_0_wrapper
  (
    INTERCONNECT_ACLK,
    INTERCONNECT_ARESETN,
    S_AXI_ARESET_OUT_N,
    M_AXI_ARESET_OUT_N,
    IRQ,
    S_AXI_ACLK,
    S_AXI_AWID,
    S_AXI_AWADDR,
    S_AXI_AWLEN,
    S_AXI_AWSIZE,
    S_AXI_AWBURST,
    S_AXI_AWLOCK,
    S_AXI_AWCACHE,
    S_AXI_AWPROT,
    S_AXI_AWQOS,
    S_AXI_AWUSER,
    S_AXI_AWVALID,
    S_AXI_AWREADY,
    S_AXI_WID,
    S_AXI_WDATA,
    S_AXI_WSTRB,
    S_AXI_WLAST,
    S_AXI_WUSER,
    S_AXI_WVALID,
    S_AXI_WREADY,
    S_AXI_BID,
    S_AXI_BRESP,
    S_AXI_BUSER,
    S_AXI_BVALID,
    S_AXI_BREADY,
    S_AXI_ARID,
    S_AXI_ARADDR,
    S_AXI_ARLEN,
    S_AXI_ARSIZE,
    S_AXI_ARBURST,
    S_AXI_ARLOCK,
    S_AXI_ARCACHE,
    S_AXI_ARPROT,
    S_AXI_ARQOS,
    S_AXI_ARUSER,
    S_AXI_ARVALID,
    S_AXI_ARREADY,
    S_AXI_RID,
    S_AXI_RDATA,
    S_AXI_RRESP,
    S_AXI_RLAST,
    S_AXI_RUSER,
    S_AXI_RVALID,
    S_AXI_RREADY,
    M_AXI_ACLK,
    M_AXI_AWID,
    M_AXI_AWADDR,
    M_AXI_AWLEN,
    M_AXI_AWSIZE,
    M_AXI_AWBURST,
    M_AXI_AWLOCK,
    M_AXI_AWCACHE,
    M_AXI_AWPROT,
    M_AXI_AWREGION,
    M_AXI_AWQOS,
    M_AXI_AWUSER,
    M_AXI_AWVALID,
    M_AXI_AWREADY,
    M_AXI_WID,
    M_AXI_WDATA,
    M_AXI_WSTRB,
    M_AXI_WLAST,
    M_AXI_WUSER,
    M_AXI_WVALID,
    M_AXI_WREADY,
    M_AXI_BID,
    M_AXI_BRESP,
    M_AXI_BUSER,
    M_AXI_BVALID,
    M_AXI_BREADY,
    M_AXI_ARID,
    M_AXI_ARADDR,
    M_AXI_ARLEN,
    M_AXI_ARSIZE,
    M_AXI_ARBURST,
    M_AXI_ARLOCK,
    M_AXI_ARCACHE,
    M_AXI_ARPROT,
    M_AXI_ARREGION,
    M_AXI_ARQOS,
    M_AXI_ARUSER,
    M_AXI_ARVALID,
    M_AXI_ARREADY,
    M_AXI_RID,
    M_AXI_RDATA,
    M_AXI_RRESP,
    M_AXI_RLAST,
    M_AXI_RUSER,
    M_AXI_RVALID,
    M_AXI_RREADY,
    S_AXI_CTRL_AWADDR,
    S_AXI_CTRL_AWVALID,
    S_AXI_CTRL_AWREADY,
    S_AXI_CTRL_WDATA,
    S_AXI_CTRL_WVALID,
    S_AXI_CTRL_WREADY,
    S_AXI_CTRL_BRESP,
    S_AXI_CTRL_BVALID,
    S_AXI_CTRL_BREADY,
    S_AXI_CTRL_ARADDR,
    S_AXI_CTRL_ARVALID,
    S_AXI_CTRL_ARREADY,
    S_AXI_CTRL_RDATA,
    S_AXI_CTRL_RRESP,
    S_AXI_CTRL_RVALID,
    S_AXI_CTRL_RREADY,
    INTERCONNECT_ARESET_OUT_N,
    DEBUG_AW_TRANS_SEQ,
    DEBUG_AW_ARB_GRANT,
    DEBUG_AR_TRANS_SEQ,
    DEBUG_AR_ARB_GRANT,
    DEBUG_AW_TRANS_QUAL,
    DEBUG_AW_ACCEPT_CNT,
    DEBUG_AW_ACTIVE_THREAD,
    DEBUG_AW_ACTIVE_TARGET,
    DEBUG_AW_ACTIVE_REGION,
    DEBUG_AW_ERROR,
    DEBUG_AW_TARGET,
    DEBUG_AR_TRANS_QUAL,
    DEBUG_AR_ACCEPT_CNT,
    DEBUG_AR_ACTIVE_THREAD,
    DEBUG_AR_ACTIVE_TARGET,
    DEBUG_AR_ACTIVE_REGION,
    DEBUG_AR_ERROR,
    DEBUG_AR_TARGET,
    DEBUG_B_TRANS_SEQ,
    DEBUG_R_BEAT_CNT,
    DEBUG_R_TRANS_SEQ,
    DEBUG_AW_ISSUING_CNT,
    DEBUG_AR_ISSUING_CNT,
    DEBUG_W_BEAT_CNT,
    DEBUG_W_TRANS_SEQ,
    DEBUG_BID_TARGET,
    DEBUG_BID_ERROR,
    DEBUG_RID_TARGET,
    DEBUG_RID_ERROR,
    DEBUG_SR_SC_ARADDR,
    DEBUG_SR_SC_ARADDRCONTROL,
    DEBUG_SR_SC_AWADDR,
    DEBUG_SR_SC_AWADDRCONTROL,
    DEBUG_SR_SC_BRESP,
    DEBUG_SR_SC_RDATA,
    DEBUG_SR_SC_RDATACONTROL,
    DEBUG_SR_SC_WDATA,
    DEBUG_SR_SC_WDATACONTROL,
    DEBUG_SC_SF_ARADDR,
    DEBUG_SC_SF_ARADDRCONTROL,
    DEBUG_SC_SF_AWADDR,
    DEBUG_SC_SF_AWADDRCONTROL,
    DEBUG_SC_SF_BRESP,
    DEBUG_SC_SF_RDATA,
    DEBUG_SC_SF_RDATACONTROL,
    DEBUG_SC_SF_WDATA,
    DEBUG_SC_SF_WDATACONTROL,
    DEBUG_SF_CB_ARADDR,
    DEBUG_SF_CB_ARADDRCONTROL,
    DEBUG_SF_CB_AWADDR,
    DEBUG_SF_CB_AWADDRCONTROL,
    DEBUG_SF_CB_BRESP,
    DEBUG_SF_CB_RDATA,
    DEBUG_SF_CB_RDATACONTROL,
    DEBUG_SF_CB_WDATA,
    DEBUG_SF_CB_WDATACONTROL,
    DEBUG_CB_MF_ARADDR,
    DEBUG_CB_MF_ARADDRCONTROL,
    DEBUG_CB_MF_AWADDR,
    DEBUG_CB_MF_AWADDRCONTROL,
    DEBUG_CB_MF_BRESP,
    DEBUG_CB_MF_RDATA,
    DEBUG_CB_MF_RDATACONTROL,
    DEBUG_CB_MF_WDATA,
    DEBUG_CB_MF_WDATACONTROL,
    DEBUG_MF_MC_ARADDR,
    DEBUG_MF_MC_ARADDRCONTROL,
    DEBUG_MF_MC_AWADDR,
    DEBUG_MF_MC_AWADDRCONTROL,
    DEBUG_MF_MC_BRESP,
    DEBUG_MF_MC_RDATA,
    DEBUG_MF_MC_RDATACONTROL,
    DEBUG_MF_MC_WDATA,
    DEBUG_MF_MC_WDATACONTROL,
    DEBUG_MC_MP_ARADDR,
    DEBUG_MC_MP_ARADDRCONTROL,
    DEBUG_MC_MP_AWADDR,
    DEBUG_MC_MP_AWADDRCONTROL,
    DEBUG_MC_MP_BRESP,
    DEBUG_MC_MP_RDATA,
    DEBUG_MC_MP_RDATACONTROL,
    DEBUG_MC_MP_WDATA,
    DEBUG_MC_MP_WDATACONTROL,
    DEBUG_MP_MR_ARADDR,
    DEBUG_MP_MR_ARADDRCONTROL,
    DEBUG_MP_MR_AWADDR,
    DEBUG_MP_MR_AWADDRCONTROL,
    DEBUG_MP_MR_BRESP,
    DEBUG_MP_MR_RDATA,
    DEBUG_MP_MR_RDATACONTROL,
    DEBUG_MP_MR_WDATA,
    DEBUG_MP_MR_WDATACONTROL
  );
  input INTERCONNECT_ACLK;
  input INTERCONNECT_ARESETN;
  output [0:0] S_AXI_ARESET_OUT_N;
  output [3:0] M_AXI_ARESET_OUT_N;
  output IRQ;
  input [0:0] S_AXI_ACLK;
  input [0:0] S_AXI_AWID;
  input [31:0] S_AXI_AWADDR;
  input [7:0] S_AXI_AWLEN;
  input [2:0] S_AXI_AWSIZE;
  input [1:0] S_AXI_AWBURST;
  input [1:0] S_AXI_AWLOCK;
  input [3:0] S_AXI_AWCACHE;
  input [2:0] S_AXI_AWPROT;
  input [3:0] S_AXI_AWQOS;
  input [0:0] S_AXI_AWUSER;
  input [0:0] S_AXI_AWVALID;
  output [0:0] S_AXI_AWREADY;
  input [0:0] S_AXI_WID;
  input [63:0] S_AXI_WDATA;
  input [7:0] S_AXI_WSTRB;
  input [0:0] S_AXI_WLAST;
  input [0:0] S_AXI_WUSER;
  input [0:0] S_AXI_WVALID;
  output [0:0] S_AXI_WREADY;
  output [0:0] S_AXI_BID;
  output [1:0] S_AXI_BRESP;
  output [0:0] S_AXI_BUSER;
  output [0:0] S_AXI_BVALID;
  input [0:0] S_AXI_BREADY;
  input [0:0] S_AXI_ARID;
  input [31:0] S_AXI_ARADDR;
  input [7:0] S_AXI_ARLEN;
  input [2:0] S_AXI_ARSIZE;
  input [1:0] S_AXI_ARBURST;
  input [1:0] S_AXI_ARLOCK;
  input [3:0] S_AXI_ARCACHE;
  input [2:0] S_AXI_ARPROT;
  input [3:0] S_AXI_ARQOS;
  input [0:0] S_AXI_ARUSER;
  input [0:0] S_AXI_ARVALID;
  output [0:0] S_AXI_ARREADY;
  output [0:0] S_AXI_RID;
  output [63:0] S_AXI_RDATA;
  output [1:0] S_AXI_RRESP;
  output [0:0] S_AXI_RLAST;
  output [0:0] S_AXI_RUSER;
  output [0:0] S_AXI_RVALID;
  input [0:0] S_AXI_RREADY;
  input [3:0] M_AXI_ACLK;
  output [3:0] M_AXI_AWID;
  output [127:0] M_AXI_AWADDR;
  output [31:0] M_AXI_AWLEN;
  output [11:0] M_AXI_AWSIZE;
  output [7:0] M_AXI_AWBURST;
  output [7:0] M_AXI_AWLOCK;
  output [15:0] M_AXI_AWCACHE;
  output [11:0] M_AXI_AWPROT;
  output [15:0] M_AXI_AWREGION;
  output [15:0] M_AXI_AWQOS;
  output [3:0] M_AXI_AWUSER;
  output [3:0] M_AXI_AWVALID;
  input [3:0] M_AXI_AWREADY;
  output [3:0] M_AXI_WID;
  output [255:0] M_AXI_WDATA;
  output [31:0] M_AXI_WSTRB;
  output [3:0] M_AXI_WLAST;
  output [3:0] M_AXI_WUSER;
  output [3:0] M_AXI_WVALID;
  input [3:0] M_AXI_WREADY;
  input [3:0] M_AXI_BID;
  input [7:0] M_AXI_BRESP;
  input [3:0] M_AXI_BUSER;
  input [3:0] M_AXI_BVALID;
  output [3:0] M_AXI_BREADY;
  output [3:0] M_AXI_ARID;
  output [127:0] M_AXI_ARADDR;
  output [31:0] M_AXI_ARLEN;
  output [11:0] M_AXI_ARSIZE;
  output [7:0] M_AXI_ARBURST;
  output [7:0] M_AXI_ARLOCK;
  output [15:0] M_AXI_ARCACHE;
  output [11:0] M_AXI_ARPROT;
  output [15:0] M_AXI_ARREGION;
  output [15:0] M_AXI_ARQOS;
  output [3:0] M_AXI_ARUSER;
  output [3:0] M_AXI_ARVALID;
  input [3:0] M_AXI_ARREADY;
  input [3:0] M_AXI_RID;
  input [255:0] M_AXI_RDATA;
  input [7:0] M_AXI_RRESP;
  input [3:0] M_AXI_RLAST;
  input [3:0] M_AXI_RUSER;
  input [3:0] M_AXI_RVALID;
  output [3:0] M_AXI_RREADY;
  input [31:0] S_AXI_CTRL_AWADDR;
  input S_AXI_CTRL_AWVALID;
  output S_AXI_CTRL_AWREADY;
  input [31:0] S_AXI_CTRL_WDATA;
  input S_AXI_CTRL_WVALID;
  output S_AXI_CTRL_WREADY;
  output [1:0] S_AXI_CTRL_BRESP;
  output S_AXI_CTRL_BVALID;
  input S_AXI_CTRL_BREADY;
  input [31:0] S_AXI_CTRL_ARADDR;
  input S_AXI_CTRL_ARVALID;
  output S_AXI_CTRL_ARREADY;
  output [31:0] S_AXI_CTRL_RDATA;
  output [1:0] S_AXI_CTRL_RRESP;
  output S_AXI_CTRL_RVALID;
  input S_AXI_CTRL_RREADY;
  output INTERCONNECT_ARESET_OUT_N;
  output [7:0] DEBUG_AW_TRANS_SEQ;
  output [7:0] DEBUG_AW_ARB_GRANT;
  output [7:0] DEBUG_AR_TRANS_SEQ;
  output [7:0] DEBUG_AR_ARB_GRANT;
  output [0:0] DEBUG_AW_TRANS_QUAL;
  output [7:0] DEBUG_AW_ACCEPT_CNT;
  output [15:0] DEBUG_AW_ACTIVE_THREAD;
  output [7:0] DEBUG_AW_ACTIVE_TARGET;
  output [7:0] DEBUG_AW_ACTIVE_REGION;
  output [7:0] DEBUG_AW_ERROR;
  output [7:0] DEBUG_AW_TARGET;
  output [0:0] DEBUG_AR_TRANS_QUAL;
  output [7:0] DEBUG_AR_ACCEPT_CNT;
  output [15:0] DEBUG_AR_ACTIVE_THREAD;
  output [7:0] DEBUG_AR_ACTIVE_TARGET;
  output [7:0] DEBUG_AR_ACTIVE_REGION;
  output [7:0] DEBUG_AR_ERROR;
  output [7:0] DEBUG_AR_TARGET;
  output [7:0] DEBUG_B_TRANS_SEQ;
  output [7:0] DEBUG_R_BEAT_CNT;
  output [7:0] DEBUG_R_TRANS_SEQ;
  output [7:0] DEBUG_AW_ISSUING_CNT;
  output [7:0] DEBUG_AR_ISSUING_CNT;
  output [7:0] DEBUG_W_BEAT_CNT;
  output [7:0] DEBUG_W_TRANS_SEQ;
  output [7:0] DEBUG_BID_TARGET;
  output DEBUG_BID_ERROR;
  output [7:0] DEBUG_RID_TARGET;
  output DEBUG_RID_ERROR;
  output [31:0] DEBUG_SR_SC_ARADDR;
  output [23:0] DEBUG_SR_SC_ARADDRCONTROL;
  output [31:0] DEBUG_SR_SC_AWADDR;
  output [23:0] DEBUG_SR_SC_AWADDRCONTROL;
  output [4:0] DEBUG_SR_SC_BRESP;
  output [63:0] DEBUG_SR_SC_RDATA;
  output [5:0] DEBUG_SR_SC_RDATACONTROL;
  output [63:0] DEBUG_SR_SC_WDATA;
  output [10:0] DEBUG_SR_SC_WDATACONTROL;
  output [31:0] DEBUG_SC_SF_ARADDR;
  output [23:0] DEBUG_SC_SF_ARADDRCONTROL;
  output [31:0] DEBUG_SC_SF_AWADDR;
  output [23:0] DEBUG_SC_SF_AWADDRCONTROL;
  output [4:0] DEBUG_SC_SF_BRESP;
  output [63:0] DEBUG_SC_SF_RDATA;
  output [5:0] DEBUG_SC_SF_RDATACONTROL;
  output [63:0] DEBUG_SC_SF_WDATA;
  output [10:0] DEBUG_SC_SF_WDATACONTROL;
  output [31:0] DEBUG_SF_CB_ARADDR;
  output [23:0] DEBUG_SF_CB_ARADDRCONTROL;
  output [31:0] DEBUG_SF_CB_AWADDR;
  output [23:0] DEBUG_SF_CB_AWADDRCONTROL;
  output [4:0] DEBUG_SF_CB_BRESP;
  output [63:0] DEBUG_SF_CB_RDATA;
  output [5:0] DEBUG_SF_CB_RDATACONTROL;
  output [63:0] DEBUG_SF_CB_WDATA;
  output [10:0] DEBUG_SF_CB_WDATACONTROL;
  output [31:0] DEBUG_CB_MF_ARADDR;
  output [23:0] DEBUG_CB_MF_ARADDRCONTROL;
  output [31:0] DEBUG_CB_MF_AWADDR;
  output [23:0] DEBUG_CB_MF_AWADDRCONTROL;
  output [4:0] DEBUG_CB_MF_BRESP;
  output [63:0] DEBUG_CB_MF_RDATA;
  output [5:0] DEBUG_CB_MF_RDATACONTROL;
  output [63:0] DEBUG_CB_MF_WDATA;
  output [10:0] DEBUG_CB_MF_WDATACONTROL;
  output [31:0] DEBUG_MF_MC_ARADDR;
  output [23:0] DEBUG_MF_MC_ARADDRCONTROL;
  output [31:0] DEBUG_MF_MC_AWADDR;
  output [23:0] DEBUG_MF_MC_AWADDRCONTROL;
  output [4:0] DEBUG_MF_MC_BRESP;
  output [63:0] DEBUG_MF_MC_RDATA;
  output [5:0] DEBUG_MF_MC_RDATACONTROL;
  output [63:0] DEBUG_MF_MC_WDATA;
  output [10:0] DEBUG_MF_MC_WDATACONTROL;
  output [31:0] DEBUG_MC_MP_ARADDR;
  output [23:0] DEBUG_MC_MP_ARADDRCONTROL;
  output [31:0] DEBUG_MC_MP_AWADDR;
  output [23:0] DEBUG_MC_MP_AWADDRCONTROL;
  output [4:0] DEBUG_MC_MP_BRESP;
  output [63:0] DEBUG_MC_MP_RDATA;
  output [5:0] DEBUG_MC_MP_RDATACONTROL;
  output [63:0] DEBUG_MC_MP_WDATA;
  output [10:0] DEBUG_MC_MP_WDATACONTROL;
  output [31:0] DEBUG_MP_MR_ARADDR;
  output [23:0] DEBUG_MP_MR_ARADDRCONTROL;
  output [31:0] DEBUG_MP_MR_AWADDR;
  output [23:0] DEBUG_MP_MR_AWADDRCONTROL;
  output [4:0] DEBUG_MP_MR_BRESP;
  output [63:0] DEBUG_MP_MR_RDATA;
  output [5:0] DEBUG_MP_MR_RDATACONTROL;
  output [63:0] DEBUG_MP_MR_WDATA;
  output [10:0] DEBUG_MP_MR_WDATACONTROL;
endmodule

module system_axi4_0_wrapper
  (
    INTERCONNECT_ACLK,
    INTERCONNECT_ARESETN,
    S_AXI_ARESET_OUT_N,
    M_AXI_ARESET_OUT_N,
    IRQ,
    S_AXI_ACLK,
    S_AXI_AWID,
    S_AXI_AWADDR,
    S_AXI_AWLEN,
    S_AXI_AWSIZE,
    S_AXI_AWBURST,
    S_AXI_AWLOCK,
    S_AXI_AWCACHE,
    S_AXI_AWPROT,
    S_AXI_AWQOS,
    S_AXI_AWUSER,
    S_AXI_AWVALID,
    S_AXI_AWREADY,
    S_AXI_WID,
    S_AXI_WDATA,
    S_AXI_WSTRB,
    S_AXI_WLAST,
    S_AXI_WUSER,
    S_AXI_WVALID,
    S_AXI_WREADY,
    S_AXI_BID,
    S_AXI_BRESP,
    S_AXI_BUSER,
    S_AXI_BVALID,
    S_AXI_BREADY,
    S_AXI_ARID,
    S_AXI_ARADDR,
    S_AXI_ARLEN,
    S_AXI_ARSIZE,
    S_AXI_ARBURST,
    S_AXI_ARLOCK,
    S_AXI_ARCACHE,
    S_AXI_ARPROT,
    S_AXI_ARQOS,
    S_AXI_ARUSER,
    S_AXI_ARVALID,
    S_AXI_ARREADY,
    S_AXI_RID,
    S_AXI_RDATA,
    S_AXI_RRESP,
    S_AXI_RLAST,
    S_AXI_RUSER,
    S_AXI_RVALID,
    S_AXI_RREADY,
    M_AXI_ACLK,
    M_AXI_AWID,
    M_AXI_AWADDR,
    M_AXI_AWLEN,
    M_AXI_AWSIZE,
    M_AXI_AWBURST,
    M_AXI_AWLOCK,
    M_AXI_AWCACHE,
    M_AXI_AWPROT,
    M_AXI_AWREGION,
    M_AXI_AWQOS,
    M_AXI_AWUSER,
    M_AXI_AWVALID,
    M_AXI_AWREADY,
    M_AXI_WID,
    M_AXI_WDATA,
    M_AXI_WSTRB,
    M_AXI_WLAST,
    M_AXI_WUSER,
    M_AXI_WVALID,
    M_AXI_WREADY,
    M_AXI_BID,
    M_AXI_BRESP,
    M_AXI_BUSER,
    M_AXI_BVALID,
    M_AXI_BREADY,
    M_AXI_ARID,
    M_AXI_ARADDR,
    M_AXI_ARLEN,
    M_AXI_ARSIZE,
    M_AXI_ARBURST,
    M_AXI_ARLOCK,
    M_AXI_ARCACHE,
    M_AXI_ARPROT,
    M_AXI_ARREGION,
    M_AXI_ARQOS,
    M_AXI_ARUSER,
    M_AXI_ARVALID,
    M_AXI_ARREADY,
    M_AXI_RID,
    M_AXI_RDATA,
    M_AXI_RRESP,
    M_AXI_RLAST,
    M_AXI_RUSER,
    M_AXI_RVALID,
    M_AXI_RREADY,
    S_AXI_CTRL_AWADDR,
    S_AXI_CTRL_AWVALID,
    S_AXI_CTRL_AWREADY,
    S_AXI_CTRL_WDATA,
    S_AXI_CTRL_WVALID,
    S_AXI_CTRL_WREADY,
    S_AXI_CTRL_BRESP,
    S_AXI_CTRL_BVALID,
    S_AXI_CTRL_BREADY,
    S_AXI_CTRL_ARADDR,
    S_AXI_CTRL_ARVALID,
    S_AXI_CTRL_ARREADY,
    S_AXI_CTRL_RDATA,
    S_AXI_CTRL_RRESP,
    S_AXI_CTRL_RVALID,
    S_AXI_CTRL_RREADY,
    INTERCONNECT_ARESET_OUT_N,
    DEBUG_AW_TRANS_SEQ,
    DEBUG_AW_ARB_GRANT,
    DEBUG_AR_TRANS_SEQ,
    DEBUG_AR_ARB_GRANT,
    DEBUG_AW_TRANS_QUAL,
    DEBUG_AW_ACCEPT_CNT,
    DEBUG_AW_ACTIVE_THREAD,
    DEBUG_AW_ACTIVE_TARGET,
    DEBUG_AW_ACTIVE_REGION,
    DEBUG_AW_ERROR,
    DEBUG_AW_TARGET,
    DEBUG_AR_TRANS_QUAL,
    DEBUG_AR_ACCEPT_CNT,
    DEBUG_AR_ACTIVE_THREAD,
    DEBUG_AR_ACTIVE_TARGET,
    DEBUG_AR_ACTIVE_REGION,
    DEBUG_AR_ERROR,
    DEBUG_AR_TARGET,
    DEBUG_B_TRANS_SEQ,
    DEBUG_R_BEAT_CNT,
    DEBUG_R_TRANS_SEQ,
    DEBUG_AW_ISSUING_CNT,
    DEBUG_AR_ISSUING_CNT,
    DEBUG_W_BEAT_CNT,
    DEBUG_W_TRANS_SEQ,
    DEBUG_BID_TARGET,
    DEBUG_BID_ERROR,
    DEBUG_RID_TARGET,
    DEBUG_RID_ERROR,
    DEBUG_SR_SC_ARADDR,
    DEBUG_SR_SC_ARADDRCONTROL,
    DEBUG_SR_SC_AWADDR,
    DEBUG_SR_SC_AWADDRCONTROL,
    DEBUG_SR_SC_BRESP,
    DEBUG_SR_SC_RDATA,
    DEBUG_SR_SC_RDATACONTROL,
    DEBUG_SR_SC_WDATA,
    DEBUG_SR_SC_WDATACONTROL,
    DEBUG_SC_SF_ARADDR,
    DEBUG_SC_SF_ARADDRCONTROL,
    DEBUG_SC_SF_AWADDR,
    DEBUG_SC_SF_AWADDRCONTROL,
    DEBUG_SC_SF_BRESP,
    DEBUG_SC_SF_RDATA,
    DEBUG_SC_SF_RDATACONTROL,
    DEBUG_SC_SF_WDATA,
    DEBUG_SC_SF_WDATACONTROL,
    DEBUG_SF_CB_ARADDR,
    DEBUG_SF_CB_ARADDRCONTROL,
    DEBUG_SF_CB_AWADDR,
    DEBUG_SF_CB_AWADDRCONTROL,
    DEBUG_SF_CB_BRESP,
    DEBUG_SF_CB_RDATA,
    DEBUG_SF_CB_RDATACONTROL,
    DEBUG_SF_CB_WDATA,
    DEBUG_SF_CB_WDATACONTROL,
    DEBUG_CB_MF_ARADDR,
    DEBUG_CB_MF_ARADDRCONTROL,
    DEBUG_CB_MF_AWADDR,
    DEBUG_CB_MF_AWADDRCONTROL,
    DEBUG_CB_MF_BRESP,
    DEBUG_CB_MF_RDATA,
    DEBUG_CB_MF_RDATACONTROL,
    DEBUG_CB_MF_WDATA,
    DEBUG_CB_MF_WDATACONTROL,
    DEBUG_MF_MC_ARADDR,
    DEBUG_MF_MC_ARADDRCONTROL,
    DEBUG_MF_MC_AWADDR,
    DEBUG_MF_MC_AWADDRCONTROL,
    DEBUG_MF_MC_BRESP,
    DEBUG_MF_MC_RDATA,
    DEBUG_MF_MC_RDATACONTROL,
    DEBUG_MF_MC_WDATA,
    DEBUG_MF_MC_WDATACONTROL,
    DEBUG_MC_MP_ARADDR,
    DEBUG_MC_MP_ARADDRCONTROL,
    DEBUG_MC_MP_AWADDR,
    DEBUG_MC_MP_AWADDRCONTROL,
    DEBUG_MC_MP_BRESP,
    DEBUG_MC_MP_RDATA,
    DEBUG_MC_MP_RDATACONTROL,
    DEBUG_MC_MP_WDATA,
    DEBUG_MC_MP_WDATACONTROL,
    DEBUG_MP_MR_ARADDR,
    DEBUG_MP_MR_ARADDRCONTROL,
    DEBUG_MP_MR_AWADDR,
    DEBUG_MP_MR_AWADDRCONTROL,
    DEBUG_MP_MR_BRESP,
    DEBUG_MP_MR_RDATA,
    DEBUG_MP_MR_RDATACONTROL,
    DEBUG_MP_MR_WDATA,
    DEBUG_MP_MR_WDATACONTROL
  );
  input INTERCONNECT_ACLK;
  input INTERCONNECT_ARESETN;
  output [2:0] S_AXI_ARESET_OUT_N;
  output [1:0] M_AXI_ARESET_OUT_N;
  output IRQ;
  input [2:0] S_AXI_ACLK;
  input [5:0] S_AXI_AWID;
  input [95:0] S_AXI_AWADDR;
  input [23:0] S_AXI_AWLEN;
  input [8:0] S_AXI_AWSIZE;
  input [5:0] S_AXI_AWBURST;
  input [5:0] S_AXI_AWLOCK;
  input [11:0] S_AXI_AWCACHE;
  input [8:0] S_AXI_AWPROT;
  input [11:0] S_AXI_AWQOS;
  input [2:0] S_AXI_AWUSER;
  input [2:0] S_AXI_AWVALID;
  output [2:0] S_AXI_AWREADY;
  input [5:0] S_AXI_WID;
  input [191:0] S_AXI_WDATA;
  input [23:0] S_AXI_WSTRB;
  input [2:0] S_AXI_WLAST;
  input [2:0] S_AXI_WUSER;
  input [2:0] S_AXI_WVALID;
  output [2:0] S_AXI_WREADY;
  output [5:0] S_AXI_BID;
  output [5:0] S_AXI_BRESP;
  output [2:0] S_AXI_BUSER;
  output [2:0] S_AXI_BVALID;
  input [2:0] S_AXI_BREADY;
  input [5:0] S_AXI_ARID;
  input [95:0] S_AXI_ARADDR;
  input [23:0] S_AXI_ARLEN;
  input [8:0] S_AXI_ARSIZE;
  input [5:0] S_AXI_ARBURST;
  input [5:0] S_AXI_ARLOCK;
  input [11:0] S_AXI_ARCACHE;
  input [8:0] S_AXI_ARPROT;
  input [11:0] S_AXI_ARQOS;
  input [2:0] S_AXI_ARUSER;
  input [2:0] S_AXI_ARVALID;
  output [2:0] S_AXI_ARREADY;
  output [5:0] S_AXI_RID;
  output [191:0] S_AXI_RDATA;
  output [5:0] S_AXI_RRESP;
  output [2:0] S_AXI_RLAST;
  output [2:0] S_AXI_RUSER;
  output [2:0] S_AXI_RVALID;
  input [2:0] S_AXI_RREADY;
  input [1:0] M_AXI_ACLK;
  output [3:0] M_AXI_AWID;
  output [63:0] M_AXI_AWADDR;
  output [15:0] M_AXI_AWLEN;
  output [5:0] M_AXI_AWSIZE;
  output [3:0] M_AXI_AWBURST;
  output [3:0] M_AXI_AWLOCK;
  output [7:0] M_AXI_AWCACHE;
  output [5:0] M_AXI_AWPROT;
  output [7:0] M_AXI_AWREGION;
  output [7:0] M_AXI_AWQOS;
  output [1:0] M_AXI_AWUSER;
  output [1:0] M_AXI_AWVALID;
  input [1:0] M_AXI_AWREADY;
  output [3:0] M_AXI_WID;
  output [127:0] M_AXI_WDATA;
  output [15:0] M_AXI_WSTRB;
  output [1:0] M_AXI_WLAST;
  output [1:0] M_AXI_WUSER;
  output [1:0] M_AXI_WVALID;
  input [1:0] M_AXI_WREADY;
  input [3:0] M_AXI_BID;
  input [3:0] M_AXI_BRESP;
  input [1:0] M_AXI_BUSER;
  input [1:0] M_AXI_BVALID;
  output [1:0] M_AXI_BREADY;
  output [3:0] M_AXI_ARID;
  output [63:0] M_AXI_ARADDR;
  output [15:0] M_AXI_ARLEN;
  output [5:0] M_AXI_ARSIZE;
  output [3:0] M_AXI_ARBURST;
  output [3:0] M_AXI_ARLOCK;
  output [7:0] M_AXI_ARCACHE;
  output [5:0] M_AXI_ARPROT;
  output [7:0] M_AXI_ARREGION;
  output [7:0] M_AXI_ARQOS;
  output [1:0] M_AXI_ARUSER;
  output [1:0] M_AXI_ARVALID;
  input [1:0] M_AXI_ARREADY;
  input [3:0] M_AXI_RID;
  input [127:0] M_AXI_RDATA;
  input [3:0] M_AXI_RRESP;
  input [1:0] M_AXI_RLAST;
  input [1:0] M_AXI_RUSER;
  input [1:0] M_AXI_RVALID;
  output [1:0] M_AXI_RREADY;
  input [31:0] S_AXI_CTRL_AWADDR;
  input S_AXI_CTRL_AWVALID;
  output S_AXI_CTRL_AWREADY;
  input [31:0] S_AXI_CTRL_WDATA;
  input S_AXI_CTRL_WVALID;
  output S_AXI_CTRL_WREADY;
  output [1:0] S_AXI_CTRL_BRESP;
  output S_AXI_CTRL_BVALID;
  input S_AXI_CTRL_BREADY;
  input [31:0] S_AXI_CTRL_ARADDR;
  input S_AXI_CTRL_ARVALID;
  output S_AXI_CTRL_ARREADY;
  output [31:0] S_AXI_CTRL_RDATA;
  output [1:0] S_AXI_CTRL_RRESP;
  output S_AXI_CTRL_RVALID;
  input S_AXI_CTRL_RREADY;
  output INTERCONNECT_ARESET_OUT_N;
  output [7:0] DEBUG_AW_TRANS_SEQ;
  output [7:0] DEBUG_AW_ARB_GRANT;
  output [7:0] DEBUG_AR_TRANS_SEQ;
  output [7:0] DEBUG_AR_ARB_GRANT;
  output [0:0] DEBUG_AW_TRANS_QUAL;
  output [7:0] DEBUG_AW_ACCEPT_CNT;
  output [15:0] DEBUG_AW_ACTIVE_THREAD;
  output [7:0] DEBUG_AW_ACTIVE_TARGET;
  output [7:0] DEBUG_AW_ACTIVE_REGION;
  output [7:0] DEBUG_AW_ERROR;
  output [7:0] DEBUG_AW_TARGET;
  output [0:0] DEBUG_AR_TRANS_QUAL;
  output [7:0] DEBUG_AR_ACCEPT_CNT;
  output [15:0] DEBUG_AR_ACTIVE_THREAD;
  output [7:0] DEBUG_AR_ACTIVE_TARGET;
  output [7:0] DEBUG_AR_ACTIVE_REGION;
  output [7:0] DEBUG_AR_ERROR;
  output [7:0] DEBUG_AR_TARGET;
  output [7:0] DEBUG_B_TRANS_SEQ;
  output [7:0] DEBUG_R_BEAT_CNT;
  output [7:0] DEBUG_R_TRANS_SEQ;
  output [7:0] DEBUG_AW_ISSUING_CNT;
  output [7:0] DEBUG_AR_ISSUING_CNT;
  output [7:0] DEBUG_W_BEAT_CNT;
  output [7:0] DEBUG_W_TRANS_SEQ;
  output [7:0] DEBUG_BID_TARGET;
  output DEBUG_BID_ERROR;
  output [7:0] DEBUG_RID_TARGET;
  output DEBUG_RID_ERROR;
  output [31:0] DEBUG_SR_SC_ARADDR;
  output [24:0] DEBUG_SR_SC_ARADDRCONTROL;
  output [31:0] DEBUG_SR_SC_AWADDR;
  output [24:0] DEBUG_SR_SC_AWADDRCONTROL;
  output [5:0] DEBUG_SR_SC_BRESP;
  output [63:0] DEBUG_SR_SC_RDATA;
  output [6:0] DEBUG_SR_SC_RDATACONTROL;
  output [63:0] DEBUG_SR_SC_WDATA;
  output [10:0] DEBUG_SR_SC_WDATACONTROL;
  output [31:0] DEBUG_SC_SF_ARADDR;
  output [24:0] DEBUG_SC_SF_ARADDRCONTROL;
  output [31:0] DEBUG_SC_SF_AWADDR;
  output [24:0] DEBUG_SC_SF_AWADDRCONTROL;
  output [5:0] DEBUG_SC_SF_BRESP;
  output [63:0] DEBUG_SC_SF_RDATA;
  output [6:0] DEBUG_SC_SF_RDATACONTROL;
  output [63:0] DEBUG_SC_SF_WDATA;
  output [10:0] DEBUG_SC_SF_WDATACONTROL;
  output [31:0] DEBUG_SF_CB_ARADDR;
  output [24:0] DEBUG_SF_CB_ARADDRCONTROL;
  output [31:0] DEBUG_SF_CB_AWADDR;
  output [24:0] DEBUG_SF_CB_AWADDRCONTROL;
  output [5:0] DEBUG_SF_CB_BRESP;
  output [63:0] DEBUG_SF_CB_RDATA;
  output [6:0] DEBUG_SF_CB_RDATACONTROL;
  output [63:0] DEBUG_SF_CB_WDATA;
  output [10:0] DEBUG_SF_CB_WDATACONTROL;
  output [31:0] DEBUG_CB_MF_ARADDR;
  output [24:0] DEBUG_CB_MF_ARADDRCONTROL;
  output [31:0] DEBUG_CB_MF_AWADDR;
  output [24:0] DEBUG_CB_MF_AWADDRCONTROL;
  output [5:0] DEBUG_CB_MF_BRESP;
  output [63:0] DEBUG_CB_MF_RDATA;
  output [6:0] DEBUG_CB_MF_RDATACONTROL;
  output [63:0] DEBUG_CB_MF_WDATA;
  output [10:0] DEBUG_CB_MF_WDATACONTROL;
  output [31:0] DEBUG_MF_MC_ARADDR;
  output [24:0] DEBUG_MF_MC_ARADDRCONTROL;
  output [31:0] DEBUG_MF_MC_AWADDR;
  output [24:0] DEBUG_MF_MC_AWADDRCONTROL;
  output [5:0] DEBUG_MF_MC_BRESP;
  output [63:0] DEBUG_MF_MC_RDATA;
  output [6:0] DEBUG_MF_MC_RDATACONTROL;
  output [63:0] DEBUG_MF_MC_WDATA;
  output [10:0] DEBUG_MF_MC_WDATACONTROL;
  output [31:0] DEBUG_MC_MP_ARADDR;
  output [24:0] DEBUG_MC_MP_ARADDRCONTROL;
  output [31:0] DEBUG_MC_MP_AWADDR;
  output [24:0] DEBUG_MC_MP_AWADDRCONTROL;
  output [5:0] DEBUG_MC_MP_BRESP;
  output [63:0] DEBUG_MC_MP_RDATA;
  output [6:0] DEBUG_MC_MP_RDATACONTROL;
  output [63:0] DEBUG_MC_MP_WDATA;
  output [10:0] DEBUG_MC_MP_WDATACONTROL;
  output [31:0] DEBUG_MP_MR_ARADDR;
  output [24:0] DEBUG_MP_MR_ARADDRCONTROL;
  output [31:0] DEBUG_MP_MR_AWADDR;
  output [24:0] DEBUG_MP_MR_AWADDRCONTROL;
  output [5:0] DEBUG_MP_MR_BRESP;
  output [63:0] DEBUG_MP_MR_RDATA;
  output [6:0] DEBUG_MP_MR_RDATACONTROL;
  output [63:0] DEBUG_MP_MR_WDATA;
  output [10:0] DEBUG_MP_MR_WDATACONTROL;
endmodule

module system_pcie_diff_clk_i_wrapper
  (
    IBUF_DS_P,
    IBUF_DS_N,
    IBUF_OUT,
    OBUF_IN,
    OBUF_DS_P,
    OBUF_DS_N,
    IOBUF_DS_P,
    IOBUF_DS_N,
    IOBUF_IO_T,
    IOBUF_IO_I,
    IOBUF_IO_O
  );
  input [0:0] IBUF_DS_P;
  input [0:0] IBUF_DS_N;
  output [0:0] IBUF_OUT;
  input [0:0] OBUF_IN;
  output [0:0] OBUF_DS_P;
  output [0:0] OBUF_DS_N;
  inout [0:0] IOBUF_DS_P;
  inout [0:0] IOBUF_DS_N;
  input [0:0] IOBUF_IO_T;
  input [0:0] IOBUF_IO_I;
  output [0:0] IOBUF_IO_O;
endmodule

module system_pci_express_wrapper
  (
    axi_aclk,
    axi_aclk_out,
    axi_aresetn,
    axi_ctl_aclk,
    axi_ctl_aclk_out,
    mmcm_lock,
    interrupt_out,
    INTX_MSI_Request,
    INTX_MSI_Grant,
    MSI_enable,
    MSI_Vector_Num,
    MSI_Vector_Width,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awregion,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arregion,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awprot,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_awlock,
    m_axi_awcache,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bresp,
    m_axi_bvalid,
    m_axi_bready,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arsize,
    m_axi_arburst,
    m_axi_arprot,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_arlock,
    m_axi_arcache,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_rvalid,
    m_axi_rready,
    pci_exp_txp,
    pci_exp_txn,
    pci_exp_rxp,
    pci_exp_rxn,
    REFCLK,
    s_axi_ctl_awaddr,
    s_axi_ctl_awvalid,
    s_axi_ctl_awready,
    s_axi_ctl_wdata,
    s_axi_ctl_wstrb,
    s_axi_ctl_wvalid,
    s_axi_ctl_wready,
    s_axi_ctl_bresp,
    s_axi_ctl_bvalid,
    s_axi_ctl_bready,
    s_axi_ctl_araddr,
    s_axi_ctl_arvalid,
    s_axi_ctl_arready,
    s_axi_ctl_rdata,
    s_axi_ctl_rresp,
    s_axi_ctl_rvalid,
    s_axi_ctl_rready
  );
  input axi_aclk;
  output axi_aclk_out;
  input axi_aresetn;
  input axi_ctl_aclk;
  output axi_ctl_aclk_out;
  output mmcm_lock;
  output interrupt_out;
  input INTX_MSI_Request;
  output INTX_MSI_Grant;
  output MSI_enable;
  input [4:0] MSI_Vector_Num;
  output [2:0] MSI_Vector_Width;
  input [1:0] s_axi_awid;
  input [31:0] s_axi_awaddr;
  input [3:0] s_axi_awregion;
  input [7:0] s_axi_awlen;
  input [2:0] s_axi_awsize;
  input [1:0] s_axi_awburst;
  input s_axi_awvalid;
  output s_axi_awready;
  input [63:0] s_axi_wdata;
  input [7:0] s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [1:0] s_axi_bid;
  output [1:0] s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [1:0] s_axi_arid;
  input [31:0] s_axi_araddr;
  input [3:0] s_axi_arregion;
  input [7:0] s_axi_arlen;
  input [2:0] s_axi_arsize;
  input [1:0] s_axi_arburst;
  input s_axi_arvalid;
  output s_axi_arready;
  output [1:0] s_axi_rid;
  output [63:0] s_axi_rdata;
  output [1:0] s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  output [31:0] m_axi_awaddr;
  output [7:0] m_axi_awlen;
  output [2:0] m_axi_awsize;
  output [1:0] m_axi_awburst;
  output [2:0] m_axi_awprot;
  output m_axi_awvalid;
  input m_axi_awready;
  output m_axi_awlock;
  output [3:0] m_axi_awcache;
  output [63:0] m_axi_wdata;
  output [7:0] m_axi_wstrb;
  output m_axi_wlast;
  output m_axi_wvalid;
  input m_axi_wready;
  input [1:0] m_axi_bresp;
  input m_axi_bvalid;
  output m_axi_bready;
  output [31:0] m_axi_araddr;
  output [7:0] m_axi_arlen;
  output [2:0] m_axi_arsize;
  output [1:0] m_axi_arburst;
  output [2:0] m_axi_arprot;
  output m_axi_arvalid;
  input m_axi_arready;
  output m_axi_arlock;
  output [3:0] m_axi_arcache;
  input [63:0] m_axi_rdata;
  input [1:0] m_axi_rresp;
  input m_axi_rlast;
  input m_axi_rvalid;
  output m_axi_rready;
  output [3:0] pci_exp_txp;
  output [3:0] pci_exp_txn;
  input [3:0] pci_exp_rxp;
  input [3:0] pci_exp_rxn;
  input REFCLK;
  input [31:0] s_axi_ctl_awaddr;
  input s_axi_ctl_awvalid;
  output s_axi_ctl_awready;
  input [31:0] s_axi_ctl_wdata;
  input [3:0] s_axi_ctl_wstrb;
  input s_axi_ctl_wvalid;
  output s_axi_ctl_wready;
  output [1:0] s_axi_ctl_bresp;
  output s_axi_ctl_bvalid;
  input s_axi_ctl_bready;
  input [31:0] s_axi_ctl_araddr;
  input s_axi_ctl_arvalid;
  output s_axi_ctl_arready;
  output [31:0] s_axi_ctl_rdata;
  output [1:0] s_axi_ctl_rresp;
  output s_axi_ctl_rvalid;
  input s_axi_ctl_rready;
endmodule

module system_ethernet_dma_wrapper
  (
    s_axi_lite_aclk,
    m_axi_sg_aclk,
    m_axi_mm2s_aclk,
    m_axi_s2mm_aclk,
    axi_resetn,
    s_axi_lite_awvalid,
    s_axi_lite_awready,
    s_axi_lite_awaddr,
    s_axi_lite_wvalid,
    s_axi_lite_wready,
    s_axi_lite_wdata,
    s_axi_lite_bresp,
    s_axi_lite_bvalid,
    s_axi_lite_bready,
    s_axi_lite_arvalid,
    s_axi_lite_arready,
    s_axi_lite_araddr,
    s_axi_lite_rvalid,
    s_axi_lite_rready,
    s_axi_lite_rdata,
    s_axi_lite_rresp,
    m_axi_sg_awaddr,
    m_axi_sg_awlen,
    m_axi_sg_awsize,
    m_axi_sg_awburst,
    m_axi_sg_awprot,
    m_axi_sg_awcache,
    m_axi_sg_awvalid,
    m_axi_sg_awready,
    m_axi_sg_wdata,
    m_axi_sg_wstrb,
    m_axi_sg_wlast,
    m_axi_sg_wvalid,
    m_axi_sg_wready,
    m_axi_sg_bresp,
    m_axi_sg_bvalid,
    m_axi_sg_bready,
    m_axi_sg_araddr,
    m_axi_sg_arlen,
    m_axi_sg_arsize,
    m_axi_sg_arburst,
    m_axi_sg_arprot,
    m_axi_sg_arcache,
    m_axi_sg_arvalid,
    m_axi_sg_arready,
    m_axi_sg_rdata,
    m_axi_sg_rresp,
    m_axi_sg_rlast,
    m_axi_sg_rvalid,
    m_axi_sg_rready,
    m_axi_mm2s_araddr,
    m_axi_mm2s_arlen,
    m_axi_mm2s_arsize,
    m_axi_mm2s_arburst,
    m_axi_mm2s_arprot,
    m_axi_mm2s_arcache,
    m_axi_mm2s_arvalid,
    m_axi_mm2s_arready,
    m_axi_mm2s_rdata,
    m_axi_mm2s_rresp,
    m_axi_mm2s_rlast,
    m_axi_mm2s_rvalid,
    m_axi_mm2s_rready,
    mm2s_prmry_reset_out_n,
    m_axis_mm2s_tdata,
    m_axis_mm2s_tkeep,
    m_axis_mm2s_tvalid,
    m_axis_mm2s_tready,
    m_axis_mm2s_tlast,
    mm2s_cntrl_reset_out_n,
    m_axis_mm2s_cntrl_tdata,
    m_axis_mm2s_cntrl_tkeep,
    m_axis_mm2s_cntrl_tvalid,
    m_axis_mm2s_cntrl_tready,
    m_axis_mm2s_cntrl_tlast,
    m_axi_s2mm_awaddr,
    m_axi_s2mm_awlen,
    m_axi_s2mm_awsize,
    m_axi_s2mm_awburst,
    m_axi_s2mm_awprot,
    m_axi_s2mm_awcache,
    m_axi_s2mm_awvalid,
    m_axi_s2mm_awready,
    m_axi_s2mm_wdata,
    m_axi_s2mm_wstrb,
    m_axi_s2mm_wlast,
    m_axi_s2mm_wvalid,
    m_axi_s2mm_wready,
    m_axi_s2mm_bresp,
    m_axi_s2mm_bvalid,
    m_axi_s2mm_bready,
    s2mm_prmry_reset_out_n,
    s_axis_s2mm_tdata,
    s_axis_s2mm_tkeep,
    s_axis_s2mm_tvalid,
    s_axis_s2mm_tready,
    s_axis_s2mm_tlast,
    s2mm_sts_reset_out_n,
    s_axis_s2mm_sts_tdata,
    s_axis_s2mm_sts_tkeep,
    s_axis_s2mm_sts_tvalid,
    s_axis_s2mm_sts_tready,
    s_axis_s2mm_sts_tlast,
    mm2s_introut,
    s2mm_introut
  );
  input s_axi_lite_aclk;
  input m_axi_sg_aclk;
  input m_axi_mm2s_aclk;
  input m_axi_s2mm_aclk;
  input axi_resetn;
  input s_axi_lite_awvalid;
  output s_axi_lite_awready;
  input [31:0] s_axi_lite_awaddr;
  input s_axi_lite_wvalid;
  output s_axi_lite_wready;
  input [31:0] s_axi_lite_wdata;
  output [1:0] s_axi_lite_bresp;
  output s_axi_lite_bvalid;
  input s_axi_lite_bready;
  input s_axi_lite_arvalid;
  output s_axi_lite_arready;
  input [31:0] s_axi_lite_araddr;
  output s_axi_lite_rvalid;
  input s_axi_lite_rready;
  output [31:0] s_axi_lite_rdata;
  output [1:0] s_axi_lite_rresp;
  output [31:0] m_axi_sg_awaddr;
  output [7:0] m_axi_sg_awlen;
  output [2:0] m_axi_sg_awsize;
  output [1:0] m_axi_sg_awburst;
  output [2:0] m_axi_sg_awprot;
  output [3:0] m_axi_sg_awcache;
  output m_axi_sg_awvalid;
  input m_axi_sg_awready;
  output [31:0] m_axi_sg_wdata;
  output [3:0] m_axi_sg_wstrb;
  output m_axi_sg_wlast;
  output m_axi_sg_wvalid;
  input m_axi_sg_wready;
  input [1:0] m_axi_sg_bresp;
  input m_axi_sg_bvalid;
  output m_axi_sg_bready;
  output [31:0] m_axi_sg_araddr;
  output [7:0] m_axi_sg_arlen;
  output [2:0] m_axi_sg_arsize;
  output [1:0] m_axi_sg_arburst;
  output [2:0] m_axi_sg_arprot;
  output [3:0] m_axi_sg_arcache;
  output m_axi_sg_arvalid;
  input m_axi_sg_arready;
  input [31:0] m_axi_sg_rdata;
  input [1:0] m_axi_sg_rresp;
  input m_axi_sg_rlast;
  input m_axi_sg_rvalid;
  output m_axi_sg_rready;
  output [31:0] m_axi_mm2s_araddr;
  output [7:0] m_axi_mm2s_arlen;
  output [2:0] m_axi_mm2s_arsize;
  output [1:0] m_axi_mm2s_arburst;
  output [2:0] m_axi_mm2s_arprot;
  output [3:0] m_axi_mm2s_arcache;
  output m_axi_mm2s_arvalid;
  input m_axi_mm2s_arready;
  input [63:0] m_axi_mm2s_rdata;
  input [1:0] m_axi_mm2s_rresp;
  input m_axi_mm2s_rlast;
  input m_axi_mm2s_rvalid;
  output m_axi_mm2s_rready;
  output mm2s_prmry_reset_out_n;
  output [63:0] m_axis_mm2s_tdata;
  output [7:0] m_axis_mm2s_tkeep;
  output m_axis_mm2s_tvalid;
  input m_axis_mm2s_tready;
  output m_axis_mm2s_tlast;
  output mm2s_cntrl_reset_out_n;
  output [31:0] m_axis_mm2s_cntrl_tdata;
  output [3:0] m_axis_mm2s_cntrl_tkeep;
  output m_axis_mm2s_cntrl_tvalid;
  input m_axis_mm2s_cntrl_tready;
  output m_axis_mm2s_cntrl_tlast;
  output [31:0] m_axi_s2mm_awaddr;
  output [7:0] m_axi_s2mm_awlen;
  output [2:0] m_axi_s2mm_awsize;
  output [1:0] m_axi_s2mm_awburst;
  output [2:0] m_axi_s2mm_awprot;
  output [3:0] m_axi_s2mm_awcache;
  output m_axi_s2mm_awvalid;
  input m_axi_s2mm_awready;
  output [63:0] m_axi_s2mm_wdata;
  output [7:0] m_axi_s2mm_wstrb;
  output m_axi_s2mm_wlast;
  output m_axi_s2mm_wvalid;
  input m_axi_s2mm_wready;
  input [1:0] m_axi_s2mm_bresp;
  input m_axi_s2mm_bvalid;
  output m_axi_s2mm_bready;
  output s2mm_prmry_reset_out_n;
  input [63:0] s_axis_s2mm_tdata;
  input [7:0] s_axis_s2mm_tkeep;
  input s_axis_s2mm_tvalid;
  output s_axis_s2mm_tready;
  input s_axis_s2mm_tlast;
  output s2mm_sts_reset_out_n;
  input [31:0] s_axis_s2mm_sts_tdata;
  input [3:0] s_axis_s2mm_sts_tkeep;
  input s_axis_s2mm_sts_tvalid;
  output s_axis_s2mm_sts_tready;
  input s_axis_s2mm_sts_tlast;
  output mm2s_introut;
  output s2mm_introut;
endmodule

module system_axi_emc_0_wrapper
  (
    S_AXI_ACLK,
    S_AXI_ARESETN,
    S_AXI_REG_AWADDR,
    S_AXI_REG_AWVALID,
    S_AXI_REG_AWREADY,
    S_AXI_REG_WDATA,
    S_AXI_REG_WSTRB,
    S_AXI_REG_WVALID,
    S_AXI_REG_WREADY,
    S_AXI_REG_BRESP,
    S_AXI_REG_BVALID,
    S_AXI_REG_BREADY,
    S_AXI_REG_ARADDR,
    S_AXI_REG_ARVALID,
    S_AXI_REG_ARREADY,
    S_AXI_REG_RDATA,
    S_AXI_REG_RRESP,
    S_AXI_REG_RVALID,
    S_AXI_REG_RREADY,
    S_AXI_MEM_AWLEN,
    S_AXI_MEM_AWSIZE,
    S_AXI_MEM_AWBURST,
    S_AXI_MEM_AWLOCK,
    S_AXI_MEM_AWCACHE,
    S_AXI_MEM_AWPROT,
    S_AXI_MEM_WLAST,
    S_AXI_MEM_BID,
    S_AXI_MEM_ARID,
    S_AXI_MEM_ARLEN,
    S_AXI_MEM_ARSIZE,
    S_AXI_MEM_ARBURST,
    S_AXI_MEM_ARLOCK,
    S_AXI_MEM_ARCACHE,
    S_AXI_MEM_ARPROT,
    S_AXI_MEM_RID,
    S_AXI_MEM_RLAST,
    S_AXI_MEM_AWID,
    S_AXI_MEM_AWADDR,
    S_AXI_MEM_AWVALID,
    S_AXI_MEM_AWREADY,
    S_AXI_MEM_WDATA,
    S_AXI_MEM_WSTRB,
    S_AXI_MEM_WVALID,
    S_AXI_MEM_WREADY,
    S_AXI_MEM_BRESP,
    S_AXI_MEM_BVALID,
    S_AXI_MEM_BREADY,
    S_AXI_MEM_ARADDR,
    S_AXI_MEM_ARVALID,
    S_AXI_MEM_ARREADY,
    S_AXI_MEM_RDATA,
    S_AXI_MEM_RRESP,
    S_AXI_MEM_RVALID,
    S_AXI_MEM_RREADY,
    RdClk,
    Mem_A,
    Mem_RPN,
    Mem_CE,
    Mem_CEN,
    Mem_OEN,
    Mem_WEN,
    Mem_QWEN,
    Mem_BEN,
    Mem_ADV_LDN,
    Mem_LBON,
    Mem_CKEN,
    Mem_CRE,
    Mem_RNW,
    Mem_WAIT,
    Mem_DQ_I,
    Mem_DQ_O,
    Mem_DQ_T,
    MEM_DQ_PARITY_I,
    MEM_DQ_PARITY_O,
    MEM_DQ_PARITY_T
  );
  input S_AXI_ACLK;
  input S_AXI_ARESETN;
  input [31:0] S_AXI_REG_AWADDR;
  input S_AXI_REG_AWVALID;
  output S_AXI_REG_AWREADY;
  input [31:0] S_AXI_REG_WDATA;
  input [3:0] S_AXI_REG_WSTRB;
  input S_AXI_REG_WVALID;
  output S_AXI_REG_WREADY;
  output [1:0] S_AXI_REG_BRESP;
  output S_AXI_REG_BVALID;
  input S_AXI_REG_BREADY;
  input [31:0] S_AXI_REG_ARADDR;
  input S_AXI_REG_ARVALID;
  output S_AXI_REG_ARREADY;
  output [31:0] S_AXI_REG_RDATA;
  output [1:0] S_AXI_REG_RRESP;
  output S_AXI_REG_RVALID;
  input S_AXI_REG_RREADY;
  input [7:0] S_AXI_MEM_AWLEN;
  input [2:0] S_AXI_MEM_AWSIZE;
  input [1:0] S_AXI_MEM_AWBURST;
  input S_AXI_MEM_AWLOCK;
  input [3:0] S_AXI_MEM_AWCACHE;
  input [2:0] S_AXI_MEM_AWPROT;
  input S_AXI_MEM_WLAST;
  output [1:0] S_AXI_MEM_BID;
  input [1:0] S_AXI_MEM_ARID;
  input [7:0] S_AXI_MEM_ARLEN;
  input [2:0] S_AXI_MEM_ARSIZE;
  input [1:0] S_AXI_MEM_ARBURST;
  input S_AXI_MEM_ARLOCK;
  input [3:0] S_AXI_MEM_ARCACHE;
  input [2:0] S_AXI_MEM_ARPROT;
  output [1:0] S_AXI_MEM_RID;
  output S_AXI_MEM_RLAST;
  input [1:0] S_AXI_MEM_AWID;
  input [31:0] S_AXI_MEM_AWADDR;
  input S_AXI_MEM_AWVALID;
  output S_AXI_MEM_AWREADY;
  input [63:0] S_AXI_MEM_WDATA;
  input [7:0] S_AXI_MEM_WSTRB;
  input S_AXI_MEM_WVALID;
  output S_AXI_MEM_WREADY;
  output [1:0] S_AXI_MEM_BRESP;
  output S_AXI_MEM_BVALID;
  input S_AXI_MEM_BREADY;
  input [31:0] S_AXI_MEM_ARADDR;
  input S_AXI_MEM_ARVALID;
  output S_AXI_MEM_ARREADY;
  output [63:0] S_AXI_MEM_RDATA;
  output [1:0] S_AXI_MEM_RRESP;
  output S_AXI_MEM_RVALID;
  input S_AXI_MEM_RREADY;
  input RdClk;
  output [31:0] Mem_A;
  output Mem_RPN;
  output [0:0] Mem_CE;
  output [0:0] Mem_CEN;
  output [0:0] Mem_OEN;
  output Mem_WEN;
  output [7:0] Mem_QWEN;
  output [7:0] Mem_BEN;
  output Mem_ADV_LDN;
  output Mem_LBON;
  output Mem_CKEN;
  output Mem_CRE;
  output Mem_RNW;
  input [0:0] Mem_WAIT;
  input [63:0] Mem_DQ_I;
  output [63:0] Mem_DQ_O;
  output [63:0] Mem_DQ_T;
  input [7:0] MEM_DQ_PARITY_I;
  output [7:0] MEM_DQ_PARITY_O;
  output [7:0] MEM_DQ_PARITY_T;
endmodule

module system_axi_mac_reg_2_wrapper
  (
    ECC_Interrupt,
    ECC_UE,
    S_AXI_ACLK,
    S_AXI_ARESETN,
    S_AXI_AWID,
    S_AXI_AWADDR,
    S_AXI_AWLEN,
    S_AXI_AWSIZE,
    S_AXI_AWBURST,
    S_AXI_AWLOCK,
    S_AXI_AWCACHE,
    S_AXI_AWPROT,
    S_AXI_AWVALID,
    S_AXI_AWREADY,
    S_AXI_WDATA,
    S_AXI_WSTRB,
    S_AXI_WLAST,
    S_AXI_WVALID,
    S_AXI_WREADY,
    S_AXI_BID,
    S_AXI_BRESP,
    S_AXI_BVALID,
    S_AXI_BREADY,
    S_AXI_ARID,
    S_AXI_ARADDR,
    S_AXI_ARLEN,
    S_AXI_ARSIZE,
    S_AXI_ARBURST,
    S_AXI_ARLOCK,
    S_AXI_ARCACHE,
    S_AXI_ARPROT,
    S_AXI_ARVALID,
    S_AXI_ARREADY,
    S_AXI_RID,
    S_AXI_RDATA,
    S_AXI_RRESP,
    S_AXI_RVALID,
    S_AXI_RREADY,
    S_AXI_RLAST,
    S_AXI_CTRL_AWVALID,
    S_AXI_CTRL_AWREADY,
    S_AXI_CTRL_AWADDR,
    S_AXI_CTRL_WVALID,
    S_AXI_CTRL_WREADY,
    S_AXI_CTRL_WDATA,
    S_AXI_CTRL_BRESP,
    S_AXI_CTRL_BVALID,
    S_AXI_CTRL_BREADY,
    S_AXI_CTRL_ARVALID,
    S_AXI_CTRL_ARREADY,
    S_AXI_CTRL_ARADDR,
    S_AXI_CTRL_RVALID,
    S_AXI_CTRL_RREADY,
    S_AXI_CTRL_RDATA,
    S_AXI_CTRL_RRESP,
    BRAM_Rst_A,
    BRAM_Clk_A,
    BRAM_En_A,
    BRAM_WE_A,
    BRAM_Addr_A,
    BRAM_WrData_A,
    BRAM_RdData_A,
    BRAM_Rst_B,
    BRAM_Clk_B,
    BRAM_En_B,
    BRAM_WE_B,
    BRAM_Addr_B,
    BRAM_WrData_B,
    BRAM_RdData_B
  );
  output ECC_Interrupt;
  output ECC_UE;
  input S_AXI_ACLK;
  input S_AXI_ARESETN;
  input [0:0] S_AXI_AWID;
  input [31:0] S_AXI_AWADDR;
  input [7:0] S_AXI_AWLEN;
  input [2:0] S_AXI_AWSIZE;
  input [1:0] S_AXI_AWBURST;
  input S_AXI_AWLOCK;
  input [3:0] S_AXI_AWCACHE;
  input [2:0] S_AXI_AWPROT;
  input S_AXI_AWVALID;
  output S_AXI_AWREADY;
  input [31:0] S_AXI_WDATA;
  input [3:0] S_AXI_WSTRB;
  input S_AXI_WLAST;
  input S_AXI_WVALID;
  output S_AXI_WREADY;
  output [0:0] S_AXI_BID;
  output [1:0] S_AXI_BRESP;
  output S_AXI_BVALID;
  input S_AXI_BREADY;
  input [0:0] S_AXI_ARID;
  input [31:0] S_AXI_ARADDR;
  input [7:0] S_AXI_ARLEN;
  input [2:0] S_AXI_ARSIZE;
  input [1:0] S_AXI_ARBURST;
  input S_AXI_ARLOCK;
  input [3:0] S_AXI_ARCACHE;
  input [2:0] S_AXI_ARPROT;
  input S_AXI_ARVALID;
  output S_AXI_ARREADY;
  output [0:0] S_AXI_RID;
  output [31:0] S_AXI_RDATA;
  output [1:0] S_AXI_RRESP;
  output S_AXI_RVALID;
  input S_AXI_RREADY;
  output S_AXI_RLAST;
  input S_AXI_CTRL_AWVALID;
  output S_AXI_CTRL_AWREADY;
  input [31:0] S_AXI_CTRL_AWADDR;
  input S_AXI_CTRL_WVALID;
  output S_AXI_CTRL_WREADY;
  input [31:0] S_AXI_CTRL_WDATA;
  output [1:0] S_AXI_CTRL_BRESP;
  output S_AXI_CTRL_BVALID;
  input S_AXI_CTRL_BREADY;
  input S_AXI_CTRL_ARVALID;
  output S_AXI_CTRL_ARREADY;
  input [31:0] S_AXI_CTRL_ARADDR;
  output S_AXI_CTRL_RVALID;
  input S_AXI_CTRL_RREADY;
  output [31:0] S_AXI_CTRL_RDATA;
  output [1:0] S_AXI_CTRL_RRESP;
  output BRAM_Rst_A;
  output BRAM_Clk_A;
  output BRAM_En_A;
  output [3:0] BRAM_WE_A;
  output [31:0] BRAM_Addr_A;
  output [31:0] BRAM_WrData_A;
  input [31:0] BRAM_RdData_A;
  output BRAM_Rst_B;
  output BRAM_Clk_B;
  output BRAM_En_B;
  output [3:0] BRAM_WE_B;
  output [31:0] BRAM_Addr_B;
  output [31:0] BRAM_WrData_B;
  input [31:0] BRAM_RdData_B;
endmodule

module system_axi_mac_reg_1_wrapper
  (
    ECC_Interrupt,
    ECC_UE,
    S_AXI_ACLK,
    S_AXI_ARESETN,
    S_AXI_AWID,
    S_AXI_AWADDR,
    S_AXI_AWLEN,
    S_AXI_AWSIZE,
    S_AXI_AWBURST,
    S_AXI_AWLOCK,
    S_AXI_AWCACHE,
    S_AXI_AWPROT,
    S_AXI_AWVALID,
    S_AXI_AWREADY,
    S_AXI_WDATA,
    S_AXI_WSTRB,
    S_AXI_WLAST,
    S_AXI_WVALID,
    S_AXI_WREADY,
    S_AXI_BID,
    S_AXI_BRESP,
    S_AXI_BVALID,
    S_AXI_BREADY,
    S_AXI_ARID,
    S_AXI_ARADDR,
    S_AXI_ARLEN,
    S_AXI_ARSIZE,
    S_AXI_ARBURST,
    S_AXI_ARLOCK,
    S_AXI_ARCACHE,
    S_AXI_ARPROT,
    S_AXI_ARVALID,
    S_AXI_ARREADY,
    S_AXI_RID,
    S_AXI_RDATA,
    S_AXI_RRESP,
    S_AXI_RVALID,
    S_AXI_RREADY,
    S_AXI_RLAST,
    S_AXI_CTRL_AWVALID,
    S_AXI_CTRL_AWREADY,
    S_AXI_CTRL_AWADDR,
    S_AXI_CTRL_WVALID,
    S_AXI_CTRL_WREADY,
    S_AXI_CTRL_WDATA,
    S_AXI_CTRL_BRESP,
    S_AXI_CTRL_BVALID,
    S_AXI_CTRL_BREADY,
    S_AXI_CTRL_ARVALID,
    S_AXI_CTRL_ARREADY,
    S_AXI_CTRL_ARADDR,
    S_AXI_CTRL_RVALID,
    S_AXI_CTRL_RREADY,
    S_AXI_CTRL_RDATA,
    S_AXI_CTRL_RRESP,
    BRAM_Rst_A,
    BRAM_Clk_A,
    BRAM_En_A,
    BRAM_WE_A,
    BRAM_Addr_A,
    BRAM_WrData_A,
    BRAM_RdData_A,
    BRAM_Rst_B,
    BRAM_Clk_B,
    BRAM_En_B,
    BRAM_WE_B,
    BRAM_Addr_B,
    BRAM_WrData_B,
    BRAM_RdData_B
  );
  output ECC_Interrupt;
  output ECC_UE;
  input S_AXI_ACLK;
  input S_AXI_ARESETN;
  input [0:0] S_AXI_AWID;
  input [31:0] S_AXI_AWADDR;
  input [7:0] S_AXI_AWLEN;
  input [2:0] S_AXI_AWSIZE;
  input [1:0] S_AXI_AWBURST;
  input S_AXI_AWLOCK;
  input [3:0] S_AXI_AWCACHE;
  input [2:0] S_AXI_AWPROT;
  input S_AXI_AWVALID;
  output S_AXI_AWREADY;
  input [31:0] S_AXI_WDATA;
  input [3:0] S_AXI_WSTRB;
  input S_AXI_WLAST;
  input S_AXI_WVALID;
  output S_AXI_WREADY;
  output [0:0] S_AXI_BID;
  output [1:0] S_AXI_BRESP;
  output S_AXI_BVALID;
  input S_AXI_BREADY;
  input [0:0] S_AXI_ARID;
  input [31:0] S_AXI_ARADDR;
  input [7:0] S_AXI_ARLEN;
  input [2:0] S_AXI_ARSIZE;
  input [1:0] S_AXI_ARBURST;
  input S_AXI_ARLOCK;
  input [3:0] S_AXI_ARCACHE;
  input [2:0] S_AXI_ARPROT;
  input S_AXI_ARVALID;
  output S_AXI_ARREADY;
  output [0:0] S_AXI_RID;
  output [31:0] S_AXI_RDATA;
  output [1:0] S_AXI_RRESP;
  output S_AXI_RVALID;
  input S_AXI_RREADY;
  output S_AXI_RLAST;
  input S_AXI_CTRL_AWVALID;
  output S_AXI_CTRL_AWREADY;
  input [31:0] S_AXI_CTRL_AWADDR;
  input S_AXI_CTRL_WVALID;
  output S_AXI_CTRL_WREADY;
  input [31:0] S_AXI_CTRL_WDATA;
  output [1:0] S_AXI_CTRL_BRESP;
  output S_AXI_CTRL_BVALID;
  input S_AXI_CTRL_BREADY;
  input S_AXI_CTRL_ARVALID;
  output S_AXI_CTRL_ARREADY;
  input [31:0] S_AXI_CTRL_ARADDR;
  output S_AXI_CTRL_RVALID;
  input S_AXI_CTRL_RREADY;
  output [31:0] S_AXI_CTRL_RDATA;
  output [1:0] S_AXI_CTRL_RRESP;
  output BRAM_Rst_A;
  output BRAM_Clk_A;
  output BRAM_En_A;
  output [3:0] BRAM_WE_A;
  output [31:0] BRAM_Addr_A;
  output [31:0] BRAM_WrData_A;
  input [31:0] BRAM_RdData_A;
  output BRAM_Rst_B;
  output BRAM_Clk_B;
  output BRAM_En_B;
  output [3:0] BRAM_WE_B;
  output [31:0] BRAM_Addr_B;
  output [31:0] BRAM_WrData_B;
  input [31:0] BRAM_RdData_B;
endmodule

