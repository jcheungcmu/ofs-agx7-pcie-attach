//Copyright (C) 2021 Intel Corporation
//SPDX-License-Identifier: MIT
//===============================================================================================================
/**
 * Abstract:
 * module tb_top is top level verfication module .
 * 
 * This module has instance of DUT,DDR_MEM,PCIE_VIP and ETHERNET_VIP. 
                  1.TEST_LPBK  : Used when HSSI RX_LPK test to be run ,it will chnage the time scale precision
                  2.DDR4       : Includes the EMIF MEMORY module in design
 * 
 * UVM task run_test() is called in this module to start the execution of tests
 */
//===============================================================================================================

`include "synopsys_vip_defines.sv"
`include "ofs_ip_cfg_db.vh"

 `timescale 1ps/1ps

`ifdef TEST_LPBK //Use this switch to run rx loopback test to create accurated frequncies of ETH_VIP clks
    `timescale 1ps/1fs
`endif

`ifdef INCLUDE_CVL
`ifdef n6000_10G 
   `define ETH_INST 1
`elsif n6000_25G
   `define ETH_INST 4
`elsif n6000_100G
 `define ETH_INST 2
`elsif FIM_B
  `define ETH_INST 1
`endif
 `include "tb_ethernet/clk_defines.sv"
`endif

`ifdef ETH_400G
 `define ETH_INST 1
`define NUM_LANES 8 //For 8 lanes of 400GAUI-8
`endif

module tb_top;

    //------------------------------------------------------------------------------
    // Serial interface signals
    //------------------------------------------------------------------------------
    logic [ofs_fim_cfg_pkg::PCIE_LANES-1:0] root0_tx_datap;
    logic [ofs_fim_cfg_pkg::PCIE_LANES-1:0] root0_tx_datan;
    logic [ofs_fim_cfg_pkg::PCIE_LANES-1:0] endpoint0_tx_datap;
    logic [ofs_fim_cfg_pkg::PCIE_LANES-1:0] endpoint0_tx_datan;
    bit pmci_master;
    bit bmc_en;

    reg SYS_RefClk   = 0;
    reg PCIE_RefClk  = 0;
    reg ETH_RefClk   = 0;
    reg PCIE_RESET_N = 0;
    bit outclk_0 = 1'b0; 
    bit outclk_1 = 1'b0;
    bit outclk_2 = 1'b0;
    bit outclk_3 = 1'b0;
    bit outclk_4 = 1'b0;
    bit tbclk_1Ghz = 0;
    bit reference_clk;
    genvar i;

    m10_interface m10_if();
   `include "tb_ethernet/ethernet_clk_gen.sv"
   `ifdef INCLUDE_HSSI
      wire [NUMB_ETH_CHANNELS-1:0] qsfp1_lpbk_serial;
      ofs_fim_hssi_serial_if hssi_if [ofs_fim_eth_plat_if_pkg::NUM_ETH_LANES-1:0]();
   `endif
    always #50 reference_clk        = ~reference_clk;

    `AXI_IF axi_if();
    `AXI_IF axi_passive_if[4]();
    `ifdef LPBK_WITHOUT_HSSI
      `AXI_IF axis_HSSI_if();
    `endif

 `ifndef INCLUDE_CVL
  `ifdef ETH_400G
      `ETH_TXRX_IF mac_ethernet_if(reference_clk);
      `ETH_XXM_BFM_DRV ethernet_mac_txrx_0(mac_ethernet_if);
      `ETH_XXM_MON_CHK_DRV ethernet_mac_mon_0(mac_ethernet_if);
      ethernet_reset_if ethernet_reset_if();
      assign ethernet_reset_if.clk = gmii_rx_clk;
      assign mac_ethernet_if.reset = ethernet_reset_if.reset;
  `else
     `ETH_TXRX_IF mac_ethernet_if[8](reference_clk);
   
    generate
      for( i=0; i<8; i++) begin : ethernet_mac
         `ETH_XXM_BFM_DRV ethernet_mac_txrx(mac_ethernet_if[i]);
         `ETH_XXM_MON_CHK_DRV   ethernet_mac_mon(mac_ethernet_if[i]);
       end
    endgenerate

    ethernet_reset_if ethernet_reset_if();
    assign ethernet_reset_if.clk = gmii_rx_clk;
    for(i=0; i<8; i++) begin
      assign mac_ethernet_if[i].reset = ethernet_reset_if.reset;
    end
  `endif
 `endif

 `ifdef INCLUDE_CVL
   `ifdef n6000_10G
      `ETH_TXRX_IF mac_ethernet_if[8](reference_clk);
   `elsif n6000_25G
      `ETH_TXRX_IF mac_ethernet_if[4](reference_clk);
   `elsif n6000_100G
       `ETH_TXRX_IF mac_ethernet_if[2](reference_clk);
   `endif
 `endif

 `ifdef INCLUDE_LOCAL_MEM
   `ifdef INCLUDE_DDR4


        `ifdef OFS_FIM_IP_CFG_LOCAL_MEM_DEFINES_EMIF_DDR4_PARAM_GROUP_0
            ofs_fim_emif_ddr4_if ddr4_mem [ofs_fim_mem_if_pkg::NUM_GROUP_0_DDR4_CHANNELS-1:0] ();
        `endif // OFS_FIM_IP_CFG_LOCAL_MEM_DEFINES_EMIF_DDR4_PARAM_GROUP_0
        `ifdef OFS_FIM_IP_CFG_LOCAL_MEM_DEFINES_EMIF_DDR4_PARAM_GROUP_1
            ofs_fim_emif_ddr4_group_1_if ddr4_mem_group_1 [ofs_fim_mem_if_pkg::NUM_GROUP_1_DDR4_CHANNELS-1:0] ();
        `endif // OFS_FIM_IP_CFG_LOCAL_MEM_DEFINES_EMIF_DDR4_PARAM_GROUP_1

    `ifdef AGILEX
      ofs_fim_emif_ddr4_if ddr4_hps ();
    `else
     `ifdef INCLUDE_HPS
        ofs_fim_hps_ddr4_if    ddr4_hps ();
      `endif
    `endif
   `endif
 `endif


     `ifdef n6000_10G
        `ETH_XXM_BFM_DRV ethernet_mac_txrx_0(mac_ethernet_if[0]);
        `ETH_XXM_BFM_DRV ethernet_mac_txrx_1(mac_ethernet_if[1]);
        `ETH_XXM_BFM_DRV ethernet_mac_txrx_2(mac_ethernet_if[2]);
        `ETH_XXM_BFM_DRV ethernet_mac_txrx_3(mac_ethernet_if[3]);
        `ETH_XXM_BFM_DRV ethernet_mac_txrx_4(mac_ethernet_if[4]);
        `ETH_XXM_BFM_DRV ethernet_mac_txrx_5(mac_ethernet_if[5]);
        `ETH_XXM_BFM_DRV ethernet_mac_txrx_6(mac_ethernet_if[6]);
        `ETH_XXM_BFM_DRV ethernet_mac_txrx_7(mac_ethernet_if[7]);
        `ETH_XXM_MON_CHK_DRV ethernet_mac_mon_0(mac_ethernet_if[0]);
        `ETH_XXM_MON_CHK_DRV ethernet_mac_mon_1(mac_ethernet_if[1]);
        `ETH_XXM_MON_CHK_DRV ethernet_mac_mon_2(mac_ethernet_if[2]);
        `ETH_XXM_MON_CHK_DRV ethernet_mac_mon_3(mac_ethernet_if[3]);
        `ETH_XXM_MON_CHK_DRV ethernet_mac_mon_4(mac_ethernet_if[4]);
        `ETH_XXM_MON_CHK_DRV ethernet_mac_mon_5(mac_ethernet_if[5]);
        `ETH_XXM_MON_CHK_DRV ethernet_mac_mon_6(mac_ethernet_if[6]);
        `ETH_XXM_MON_CHK_DRV ethernet_mac_mon_7(mac_ethernet_if[7]);

        ethernet_reset_if ethernet_reset_if();
        assign ethernet_reset_if.clk = gmii_rx_clk;
        assign mac_ethernet_if[0].reset = ethernet_reset_if.reset;
        assign mac_ethernet_if[1].reset = ethernet_reset_if.reset;
        assign mac_ethernet_if[2].reset = ethernet_reset_if.reset;
        assign mac_ethernet_if[3].reset = ethernet_reset_if.reset;
        assign mac_ethernet_if[4].reset = ethernet_reset_if.reset;
        assign mac_ethernet_if[5].reset = ethernet_reset_if.reset;
        assign mac_ethernet_if[6].reset = ethernet_reset_if.reset;
        assign mac_ethernet_if[7].reset = ethernet_reset_if.reset;
     
     `elsif n6000_25G
        `ETH_XXM_BFM_DRV ethernet_mac_txrx_0(mac_ethernet_if[0]);
        `ETH_XXM_MON_CHK_DRV ethernet_mac_mon_0(mac_ethernet_if[0]);
        ethernet_reset_if ethernet_reset_if();
        assign ethernet_reset_if.clk = gmii_rx_clk;
        assign mac_ethernet_if[0].reset = ethernet_reset_if.reset;

        `ETH_XXM_BFM_DRV ethernet_mac_txrx_1(mac_ethernet_if[1]);
        `ETH_XXM_MON_CHK_DRV ethernet_mac_mon_1(mac_ethernet_if[1]);
        assign mac_ethernet_if[1].reset = ethernet_reset_if.reset;
        `ETH_XXM_BFM_DRV ethernet_mac_txrx_2(mac_ethernet_if[2]);
        `ETH_XXM_MON_CHK_DRV ethernet_mac_mon_2(mac_ethernet_if[2]);
        assign mac_ethernet_if[2].reset = ethernet_reset_if.reset;

        `ETH_XXM_BFM_DRV ethernet_mac_txrx_3(mac_ethernet_if[3]);
        `ETH_XXM_MON_CHK_DRV ethernet_mac_mon_3(mac_ethernet_if[3]);
        assign mac_ethernet_if[3].reset = ethernet_reset_if.reset;
     
     `elsif n6000_100G
       `ETH_XXM_BFM_DRV ethernet_mac_txrx_0(mac_ethernet_if[0]);
       `ETH_XXM_MON_CHK_DRV ethernet_mac_mon_0(mac_ethernet_if[0]);
       ethernet_reset_if ethernet_reset_if();
       assign ethernet_reset_if.clk = gmii_rx_clk;
       assign mac_ethernet_if[0].reset = ethernet_reset_if.reset;

       `ETH_XXM_BFM_DRV ethernet_mac_txrx_1(mac_ethernet_if[1]);
       `ETH_XXM_MON_CHK_DRV ethernet_mac_mon_1(mac_ethernet_if[1]);
       assign mac_ethernet_if[1].reset = ethernet_reset_if.reset;    
    `endif

   //////ETHERNET_CONNECTION//////////////
    `ifdef INCLUDE_CVL
      logic  [NUM_CVL_LANES_VERIF-1:0]                 cvl_serial_rx_p;
      logic  [NUM_CVL_LANES_VERIF-1:0]                 cvl_serial_rx_n;
      logic  [NUM_CVL_LANES_VERIF-1:0]                 cvl_serial_tx_p;
      logic  [NUM_CVL_LANES_VERIF-1:0]                 cvl_serial_tx_n;
   //////////////////////CVL_LOOPBACK////////////////
   //assign cvl_serial_rx_p[0]= mac_ethernet_if.tx_lane[0];
   //assign cvl_serial_rx_n[0]= ~cvl_serial_rx_p[0];
   //assign mac_ethernet_if.rx_lane[0]=cvl_serial_tx_p[0];
   //////////////////////////////////////////////
   `endif



  //coverage interface
   `ifdef ENABLE_AC_COVERAGE
     coverage_intf  cov_intf();
   `endif

   // These link width macros must be defined before including agents from tb_pcie.
   `ifdef OFS_FIM_IP_CFG_PCIE_SS_PCIE_LINK_WIDTH_IS_8
      `define PCIE_LINK_WIDTH_GT_4 1
   `endif
   `ifdef OFS_FIM_IP_CFG_PCIE_SS_PCIE_LINK_WIDTH_IS_16
      `define PCIE_LINK_WIDTH_GT_4 1
      `define PCIE_LINK_WIDTH_GT_8 1
   `endif
   `ifdef OFS_FIM_IP_CFG_PCIE_SS_PCIE_LINK_WIDTH_IS_32
      `define PCIE_LINK_WIDTH_GT_4 1
      `define PCIE_LINK_WIDTH_GT_8 1
      `define PCIE_LINK_WIDTH_GT_16 1
   `endif

   // Pick an agent to match the PCIe EP configuration
   `ifdef OFS_FIM_IP_CFG_PCIE_SS_IS_PIPE_MODE_SIM
      `include "tb_pcie/tb_pcie_agent_spipe.svh"
   `else
      `include "tb_pcie/tb_pcie_agent_serdes.svh"
   `endif


     top DUT (
        .SYS_REFCLK      (SYS_RefClk),
        .PCIE_REFCLK0    (PCIE_RefClk),
        .PCIE_REFCLK1    (PCIE_RefClk),
        .PCIE_RESET_N    (PCIE_RESET_N),
     	
     `ifdef INCLUDE_HSSI
        .qsfpa_i2c_scl   (qsfpa_i2c_scl),
        .qsfpa_i2c_sda   (qsfpa_i2c_sda),
        .qsfpa_resetn    (qsfpa_resetn),                      
        .qsfpa_modprsln  (qsfpa_modprsln),                   
        .qsfpa_modeseln  (qsfpa_modeseln),                  
        .qsfpa_lpmode    (qsfpa_lpmode),                      
        .qsfpa_intn      (qsfpa_intn),                        
        .qsfpb_resetn    (qsfpb_resetn),                     
        .qsfpb_modprsln  (qsfpb_modprsln),                  
        .qsfpb_modeseln  (qsfpb_modeseln),                  
        .qsfpb_lpmode    (qsfpb_lpmode),                     
        .qsfpb_intn      (qsfpb_intn),                                          
                        
        .qsfp_ref_clk    (ETH_RefClk),                     
        .hssi_if         (hssi_if[ofs_fim_eth_plat_if_pkg::NUM_ETH_LANES-1:0]),
      `endif	
     
     `ifdef INCLUDE_LOCAL_MEM
      `ifdef INCLUDE_DDR4
        `ifdef OFS_FIM_IP_CFG_LOCAL_MEM_DEFINES_EMIF_DDR4_PARAM_GROUP_0
        .ddr4_mem  (ddr4_mem),
        `endif
        `ifdef OFS_FIM_IP_CFG_LOCAL_MEM_DEFINES_EMIF_DDR4_PARAM_GROUP_1
        .ddr4_mem_group_1  (ddr4_mem_group_1),
        `endif
       `ifdef INCLUDE_HPS
        .ddr4_hps     (ddr4_hps),
       `endif
      `endif
     `endif

        .PCIE_RX_P       (root0_tx_datap),
        .PCIE_RX_N       (~root0_tx_datap),

        .PCIE_TX_P       (endpoint0_tx_datap),
        .PCIE_TX_N       (endpoint0_tx_datan)
     );
     
     
     `ifdef INCLUDE_LOCAL_MEM
      `ifdef INCLUDE_DDR4
           
        genvar ch;

        `ifdef OFS_FIM_IP_CFG_LOCAL_MEM_EN_MEM_0
            generate
                for(ch=0; ch < ofs_fim_mem_if_pkg::NUM_GROUP_0_DDR4_CHANNELS; ch = ch+1) begin : mem_model
                    initial ddr4_mem[ch].ref_clk = '0;
                    always #833 ddr4_mem[ch].ref_clk = ~ddr4_mem[ch].ref_clk; // 1200 MHz
                    ed_sim_mem ddr_mem (
                        `CONNECT_DDR4_MODEL_TB(mem, mem, ddr4_mem[ch], GROUP_0)
                    );

                 end
            endgenerate
        `endif //OFS_FIM_IP_CFG_LOCAL_MEM_EN_MEM_0

        `ifdef OFS_FIM_IP_CFG_LOCAL_MEM_DEFINES_EMIF_DDR4_PARAM_GROUP_1
            generate
                for(ch=0; ch < ofs_fim_mem_if_pkg::NUM_GROUP_1_DDR4_CHANNELS; ch = ch+1) begin : mem_model_grp1
                   initial ddr4_mem_group_1[ch].ref_clk = '0;
                   always #833 ddr4_mem_group_1[ch].ref_clk = ~ddr4_mem_group_1[ch].ref_clk; // 1200 MHz
                   ed_sim_mem_group1 ddr_mem_group_1 (
                        `CONNECT_DDR4_MODEL_TB(mem, mem, ddr4_mem_group_1[ch], GROUP_1)
                   );
                    
                end
             endgenerate
        `endif //OFS_FIM_IP_CFG_LOCAL_MEM_EN_MEM_1

      `endif
     `endif
     
     // HSSI serial loopback
      `ifdef INCLUDE_HSSI
         genvar j;
         for( j=0; j<ofs_fim_eth_plat_if_pkg::NUM_ETH_LANES; j++) begin
             assign hssi_if[j].rx_p = hssi_if[j].tx_p;
	     assign hssi_if[j].rx_n = hssi_if[j].tx_n;
         end
      `endif
     
     //// TEST LOOPBACK////////////////////
       int Lane;
       bit run_multiport;
       bit CVL_25G;
       bit CVL_100G;
       bit MODE_25G_10G;
        initial begin
         Lane=10;
          //$display("Forcing will be done test RX_LPBK");
              #2;
         if (uvm_config_db#(int)::get(null,"uvm_test_top.tb_env0", "Lane", Lane))
            //`uvm_fatal("TB_TOP","LANE IS NOT SELECTED");
            $display("LANE SELECTED:%d",Lane);
	 if (uvm_config_db#(bit)::get(null,"uvm_test_top.tb_env0", "CVL_25G", CVL_25G))
             `uvm_info("build_phase", "CVL_25G_MODE SELECTED ...",UVM_LOW);
           `ifdef n6000_25G
               CVL_25G =1 ;
            `endif
         if (uvm_config_db#(bit)::get(null,"uvm_test_top.tb_env0", "CVL_100G", CVL_100G))
             `uvm_info("build_phase", "CVL_100G_MODE SELECTED ...",UVM_LOW);
           `ifdef n6000_100G
               CVL_100G =1 ;
            `endif
            $display("CVL_100G_SELECTED:%b",CVL_100G);
         if (uvm_config_db#(bit)::get(null,"uvm_test_top.tb_env0", "run_multiport",run_multiport))
            $display("LANE SELECTED:%d",Lane);
         if (uvm_config_db#(bit)::get(null,"uvm_test_top.tb_env0", "run_multiport",run_multiport))
            `uvm_info("build_phase", "MULTIPORT_MODE SELECTED ...",UVM_LOW);
         if (uvm_config_db#(bit)::get(null,"uvm_test_top.tb_env0", "MODE_25G_10G", MODE_25G_10G))
           `uvm_info("build_phase", "25G_10G_MODE SELECTED ...",UVM_LOW);
   
         `ifdef TEST_LPBK 
          `include "tb_ethernet/Test_LPBK.sv"
	 `endif
         end

         initial begin
           `ifdef TEST_LPBK
           ethernet_reset_if.reset = 1'b0;
           @(posedge ethernet_reset_if.clk)
           ethernet_reset_if.reset = 1'b1;
           @(posedge ethernet_reset_if.clk)
           ethernet_reset_if.reset = 1'b0;
           `uvm_info("TOP", "ETH_RESET_APPLIED ...",UVM_LOW);
           `endif
         end


`ifdef ETH_400G
//////////////////400G//////////////////////////////////////////////////////////////

//`define NUM_LANES 8 //For 8 lanes of 400GAUI-8
 
            reg [`NUM_LANES-1:0]  tx_serial_pam4;
            reg [`NUM_LANES-1:0]  tx_serial_pam4_n;
            reg [`NUM_LANES-1:0]  rx_serial_pam4;
            reg [`NUM_LANES-1:0]  rx_serial_pam4_n;
            wire [`NUM_LANES-1:0]  rx_serial_tmp;
            wire [`NUM_LANES-1:0]  rx_serial_n_tmp;
            wire [`NUM_LANES-1:0]  tx_serial_tmp;
            wire [`NUM_LANES-1:0]  tx_serial_n_tmp;
	    
 
            generate
             for(genvar i=0; i<`NUM_LANES;i++) begin
 
               assign rx_serial_pam4_n[i]            = mac_ethernet_if.tx_lane[2*i];
               assign rx_serial_pam4[i]              = mac_ethernet_if.tx_lane[(2*i)+1];
	       assign mac_ethernet_if.rx_lane[2*i]     = tx_serial_pam4_n[i];
               assign mac_ethernet_if.rx_lane[(2*i)+1] = tx_serial_pam4[i];
 
             end
            endgenerate

   pam4_encoding #(.NUM_LANES(`NUM_LANES)) pam4_encoding  ( .rx_serial_pam4(rx_serial_pam4), // NUM_CHANNEL as the param passed
                                                                .rx_serial_pam4_n(rx_serial_pam4_n),
                                                                .rx_serial(rx_serial_tmp),
                                                                .rx_serial_n(rx_serial_n_tmp)
                                                                );
    pam4_decoding #(.NUM_LANES(`NUM_LANES)) pam4_decoding ( .tx_serial(tx_serial_tmp),
                                                               .tx_serial_n(tx_serial_n_tmp),
                                                               .tx_serial_pam4(tx_serial_pam4),
                                                               .tx_serial_pam4_n(tx_serial_pam4_n)
                                                               );

      `ifdef TEST_LPBK
	   `ifdef ETH_400G
		   genvar t;
		generate
         	for( t=0; t<ofs_fim_eth_plat_if_pkg::NUM_ETH_LANES; t++) begin
                  initial begin
             	   force hssi_if[t].rx_p =rx_serial_tmp[t];
             	   force hssi_if[t].rx_n =rx_serial_n_tmp[t];
		   force tx_serial_tmp[t] = hssi_if[t].tx_p;
		   force tx_serial_n_tmp[t] = hssi_if[t].tx_n;
	          end
         	end
	      endgenerate
	   `endif
       `endif 

//////////////////////////////////////////////////////////////////////////////////////
`endif
	 
     /////////////////////////////////////////


   `ifdef SIM_MODE
      initial begin
         #1us;
         force {tb_top.DUT.sys_pll.locked} = 1'b1;

         force tb_top.DUT.sys_pll.outclk_0 = outclk_0; 
         force tb_top.DUT.sys_pll.outclk_1 = outclk_1; 
         force tb_top.DUT.sys_pll.outclk_2 = outclk_2;
         force tb_top.DUT.sys_pll.outclk_3 = outclk_3;
         force tb_top.DUT.sys_pll.outclk_4 = outclk_4;
      end 
  `endif

  `ifdef INCLUDE_PMCI
    pmci_axi    pmci_axi(axi_if,m10_if);
    bmc_top     bmc_m10(m10_if);
  `endif

    passive_vip passive_vip(axi_passive_if[0],axi_passive_if[1],axi_passive_if[2],axi_passive_if[3]); 
  `ifdef LPBK_WITHOUT_HSSI
    HE_HSSI_AXIS HE_HSSI_AXIS_INST(axis_HSSI_if);
  `endif
    initial #1us //Min RESET period is 1us
    PCIE_RESET_N = 1;
    always #5ns SYS_RefClk  = ~SYS_RefClk;
    always #5ns PCIE_RefClk = ~PCIE_RefClk;
    always #3200 ETH_RefClk = ~ETH_RefClk;

     always #1063ps  outclk_0 = ~outclk_0; //470MHz
     always #4965ps  outclk_1 = ~outclk_1; //100.71MHz
     always #2837ps  outclk_2 = ~outclk_2; //176.243MHz
     always #3191ps  outclk_3 = ~outclk_3; //156.66MHz
     always #9929ps  outclk_4 = ~outclk_4; //50.358MHz

 
//AXI Lite 2 MMIO Monitors    
    `AXI_IF st2mm_csr_axil2mmio_if();
    `AXI_IF fme_axil2mmio_if();
    `AXI_IF pg_axil2mmio_if();
    st2mm_csr_axil2mmio_bind st2mm_csr_axil2mmio_bind(st2mm_csr_axil2mmio_if); 
    fme_axil2mmio_bind fme_axil2mmio_bind(fme_axil2mmio_if); 
    pg_axil2mmio_bind pg_axil2mmio_bind(pg_axil2mmio_if); 
    `ifdef INCLUDE_TOD
      `AXI_IF tod_axil2mmio_if();
      tod_axil2mmio_bind tod_axil2mmio_bind(tod_axil2mmio_if); 
    `endif                                                               


    initial begin
        uvm_config_db#(virtual `AXI_IF)::set(uvm_root::get(), "*", "vif", axi_if);
        uvm_config_db#(virtual `AXI_IF)::set(uvm_root::get(), "uvm_test_top.tb_env0.st2mm_csr_axil2mmio_env", "vif", st2mm_csr_axil2mmio_if); 
        uvm_config_db#(virtual `AXI_IF)::set(uvm_root::get(), "uvm_test_top.tb_env0.fme_axil2mmio_env", "vif", fme_axil2mmio_if); 
        uvm_config_db#(virtual `AXI_IF)::set(uvm_root::get(), "uvm_test_top.tb_env0.pg_axil2mmio_env", "vif", pg_axil2mmio_if); 
       `ifdef INCLUDE_TOD
         uvm_config_db#(virtual `AXI_IF)::set(uvm_root::get(), "uvm_test_top.tb_env0.tod_axil2mmio_env", "vif", tod_axil2mmio_if); 
       `endif                                                               

       `ifdef LPBK_WITHOUT_HSSI
         uvm_config_db#(virtual `AXI_IF)::set(uvm_root::get(), "uvm_test_top.tb_env0.axis_HSSI_env", "vif", axis_HSSI_if);
       `endif
        uvm_config_db#(virtual m10_interface)::set(uvm_root::get(), "*", "m10_clk", m10_if);
        uvm_config_db#(virtual `AXI_IF)::set(uvm_root::get(), "uvm_test_top.tb_env0.PCie2AFU_BRIDGE", "vif", axi_passive_if[0]);
        uvm_config_db#(virtual `AXI_IF)::set(uvm_root::get(), "uvm_test_top.tb_env0.MUX2HE_HSSI_BRIDGE", "vif", axi_passive_if[1]);
        uvm_config_db#(virtual `AXI_IF)::set(uvm_root::get(), "uvm_test_top.tb_env0.HE_HSSI2HSSI_BRIDGE", "vif", axi_passive_if[2]);  
        uvm_config_db#(virtual `AXI_IF)::set(uvm_root::get(), "uvm_test_top.tb_env0.BPF_BRIDGE", "vif", axi_passive_if[3]); 

        /** Set the reset interface on the virtual sequencer */
    `ifdef INCLUDE_CVL
       uvm_config_db#(virtual ethernet_reset_if.ethernet_reset_modport)::set(uvm_root::get(), "*", "reset_mp", ethernet_reset_if.ethernet_reset_modport); 
    `else
       //uvm_config_db#(virtual ethernet_reset_if.ethernet_reset_modport)::set(uvm_root::get(), "*", "reset_mp", ethernet_reset_if.ethernet_reset_modport); 
       `ifdef ETH_400G
	    uvm_config_db#(virtual `ETH_TXRX_IF)::set(uvm_root::get(),"uvm_test_top.tb_env0.env.vip_ethernet_mac*", "if_port", mac_ethernet_if);
	`endif
    `endif
      `ifdef ENABLE_AC_COVERAGE
        uvm_config_db#(virtual coverage_intf)::set(uvm_root::get(), "*", "cov_intf", cov_intf);
       `endif
    end
    `ifndef INCLUDE_CVL
     `ifndef ETH_400G
       genvar index;
       generate
         for( index=0; index<8; index++) begin
           initial begin
           uvm_config_db#(virtual `ETH_TXRX_IF)::set(uvm_root::get(),$sformatf("uvm_test_top.tb_env0.env.vip_ethernet_mac[%0d]*",index), "if_port", mac_ethernet_if[index]);
           end
         end
       endgenerate
      `endif
    `endif

    `ifdef INCLUDE_CVL
           initial begin
             `ifdef n6000_10G
                uvm_config_db#(virtual `ETH_TXRX_IF)::set(uvm_root::get(),"uvm_test_top.tb_env0.env.vip_ethernet_mac[0]*", "if_port", mac_ethernet_if[0]);
                uvm_config_db#(virtual `ETH_TXRX_IF)::set(uvm_root::get(),"uvm_test_top.tb_env0.env.vip_ethernet_mac[1]*", "if_port", mac_ethernet_if[1]);
                uvm_config_db#(virtual `ETH_TXRX_IF)::set(uvm_root::get(),"uvm_test_top.tb_env0.env.vip_ethernet_mac[2]*", "if_port", mac_ethernet_if[2]);
                uvm_config_db#(virtual `ETH_TXRX_IF)::set(uvm_root::get(),"uvm_test_top.tb_env0.env.vip_ethernet_mac[3]*", "if_port", mac_ethernet_if[3]);
                uvm_config_db#(virtual `ETH_TXRX_IF)::set(uvm_root::get(),"uvm_test_top.tb_env0.env.vip_ethernet_mac[4]*", "if_port", mac_ethernet_if[4]);
                uvm_config_db#(virtual `ETH_TXRX_IF)::set(uvm_root::get(),"uvm_test_top.tb_env0.env.vip_ethernet_mac[5]*", "if_port", mac_ethernet_if[5]);
                uvm_config_db#(virtual `ETH_TXRX_IF)::set(uvm_root::get(),"uvm_test_top.tb_env0.env.vip_ethernet_mac[6]*", "if_port", mac_ethernet_if[6]);
                uvm_config_db#(virtual `ETH_TXRX_IF)::set(uvm_root::get(),"uvm_test_top.tb_env0.env.vip_ethernet_mac[7]*", "if_port", mac_ethernet_if[7]);
             `elsif n6000_25G
                uvm_config_db#(virtual `ETH_TXRX_IF)::set(uvm_root::get(),"uvm_test_top.tb_env0.env.vip_ethernet_mac[0]*", "if_port", mac_ethernet_if[0]);
                uvm_config_db#(virtual `ETH_TXRX_IF)::set(uvm_root::get(),"uvm_test_top.tb_env0.env.vip_ethernet_mac[1]*", "if_port", mac_ethernet_if[1]);
                uvm_config_db#(virtual `ETH_TXRX_IF)::set(uvm_root::get(),"uvm_test_top.tb_env0.env.vip_ethernet_mac[2]*", "if_port", mac_ethernet_if[2]);
                uvm_config_db#(virtual `ETH_TXRX_IF)::set(uvm_root::get(),"uvm_test_top.tb_env0.env.vip_ethernet_mac[3]*", "if_port", mac_ethernet_if[3]);
             `elsif n6000_100G
                uvm_config_db#(virtual `ETH_TXRX_IF)::set(uvm_root::get(),"uvm_test_top.tb_env0.env.vip_ethernet_mac[0]*", "if_port", mac_ethernet_if[0]);
                uvm_config_db#(virtual `ETH_TXRX_IF)::set(uvm_root::get(),"uvm_test_top.tb_env0.env.vip_ethernet_mac[1]*", "if_port", mac_ethernet_if[1]);
             `endif
         end
    `endif
    initial begin
      fork begin
        #2;
        uvm_config_db#(int)::get(null, "uvm_test_top.tb_env0", "pmci_master", pmci_master); 
        uvm_config_db#(int)::get(null, "uvm_test_top.tb_env0", "bmc_en", bmc_en); 
      end
      begin
        run_test();
      end
      join_any
    // `uvm_info("SEED:", $sformatf("random seed = %0d \n", $get_initial_random_seed()), UVM_LOW);
    end  

    
   initial begin
    force tb_top.DUT.ninit_done = 1'b1;
    #1us;
    force tb_top.DUT.ninit_done = 1'b0;
   end 

`ifdef INCLUDE_HSSI
   if (IS_FTILE_SIM || IS_RTILE_SIM) begin
      ofs_top_auto_tiles ofs_top_auto_tiles(); //AUTO_TILE instance
   end
`else
   // F-Tile PCIe uses auto tile for reset
   if (IS_FTILE_SIM) begin
      ofs_top_auto_tiles ofs_top_auto_tiles(); //AUTO_TILE instance
   end
`endif

endmodule : tb_top

