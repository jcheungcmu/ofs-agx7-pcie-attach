//Copyright (C) 2024 Intel Corporation
//SPDX-License-Identifier: MIT

//
// PCIe SERDES agent instantiation and connection to the PCIe endpoint IP.
//
// This file is included by tb_top.sv only when PCIe SERDES mode is enabled in the DUT.
//

//
// This file may assume:
//  - The PCIe configuration file ofs_ip_cfg_pcie_ss.vh has been included.
//  - Macros indicating the number of lanes are set, e.g. PCIE_LINK_WIDTH_GT_4 and
//    PCIE_LINK_WIDTH_GT_8. All widths are set up to the maximum. Namely, both GT_4
//    and GT_8 will be set when 16 lanes are in use.
//

if (PCIE_LINK_WIDTH == 16) begin : pcie_agnt
   `PCIE_DEV_AGNT_X16_8G_HDL root0(
       .reset        (~PCIE_RESET_N),
       .rx_datap_0   ( endpoint0_tx_datap[0]), // inputs
       .rx_datap_1   ( endpoint0_tx_datap[1]),
       .rx_datap_2   ( endpoint0_tx_datap[2]),
       .rx_datap_3   ( endpoint0_tx_datap[3]),
       .rx_datap_4   ( endpoint0_tx_datap[4]),
       .rx_datap_5   ( endpoint0_tx_datap[5]),
       .rx_datap_6   ( endpoint0_tx_datap[6]),
       .rx_datap_7   ( endpoint0_tx_datap[7]),
       .rx_datap_8   ( endpoint0_tx_datap[8]),
       .rx_datap_9   ( endpoint0_tx_datap[9]),
       .rx_datap_10  ( endpoint0_tx_datap[10]),
       .rx_datap_11  ( endpoint0_tx_datap[11]),
       .rx_datap_12  ( endpoint0_tx_datap[12]),
       .rx_datap_13  ( endpoint0_tx_datap[13]),
       .rx_datap_14  ( endpoint0_tx_datap[14]),
       .rx_datap_15  ( endpoint0_tx_datap[15]),
       .rx_datan_0   ( endpoint0_tx_datan[0]), // inputs
       .rx_datan_1   ( endpoint0_tx_datan[1]),
       .rx_datan_2   ( endpoint0_tx_datan[2]),
       .rx_datan_3   ( endpoint0_tx_datan[3]),
       .rx_datan_4   ( endpoint0_tx_datan[4]),
       .rx_datan_5   ( endpoint0_tx_datan[5]),
       .rx_datan_6   ( endpoint0_tx_datan[6]),
       .rx_datan_7   ( endpoint0_tx_datan[7]),
       .rx_datan_8   ( endpoint0_tx_datan[8]),
       .rx_datan_9   ( endpoint0_tx_datan[9]),
       .rx_datan_10  ( endpoint0_tx_datan[10]),
       .rx_datan_11  ( endpoint0_tx_datan[11]),
       .rx_datan_12  ( endpoint0_tx_datan[12]),
       .rx_datan_13  ( endpoint0_tx_datan[13]),
       .rx_datan_14  ( endpoint0_tx_datan[14]),
       .rx_datan_15  ( endpoint0_tx_datan[15]),

       .tx_datap_0   (root0_tx_datap[0]),  // outputs
       .tx_datap_1   (root0_tx_datap[1]),
       .tx_datap_2   (root0_tx_datap[2]),
       .tx_datap_3   (root0_tx_datap[3]),
       .tx_datap_4   (root0_tx_datap[4]),
       .tx_datap_5   (root0_tx_datap[5]),
       .tx_datap_6   (root0_tx_datap[6]),
       .tx_datap_7   (root0_tx_datap[7]),
       .tx_datap_8   (root0_tx_datap[8]),
       .tx_datap_9   (root0_tx_datap[9]),
       .tx_datap_10  (root0_tx_datap[10]),
       .tx_datap_11  (root0_tx_datap[11]),
       .tx_datap_12  (root0_tx_datap[12]),
       .tx_datap_13  (root0_tx_datap[13]),
       .tx_datap_14  (root0_tx_datap[14]),
       .tx_datap_15  (root0_tx_datap[15])
       );
end
else if (PCIE_LINK_WIDTH == 8) begin : pcie_agnt
  `PCIE_DEV_AGNT_X8_8G_HDL root0(
       .reset        (~PCIE_RESET_N),
       .rx_datap_0   ( endpoint0_tx_datap[0]), // inputs
       .rx_datap_1   ( endpoint0_tx_datap[1]),
       .rx_datap_2   ( endpoint0_tx_datap[2]),
       .rx_datap_3   ( endpoint0_tx_datap[3]),
       .rx_datap_4   ( endpoint0_tx_datap[4]),
       .rx_datap_5   ( endpoint0_tx_datap[5]),
       .rx_datap_6   ( endpoint0_tx_datap[6]),
       .rx_datap_7   ( endpoint0_tx_datap[7]),
       .rx_datan_0   ( endpoint0_tx_datan[0]), // inputs
       .rx_datan_1   ( endpoint0_tx_datan[1]),
       .rx_datan_2   ( endpoint0_tx_datan[2]),
       .rx_datan_3   ( endpoint0_tx_datan[3]),
       .rx_datan_4   ( endpoint0_tx_datan[4]),
       .rx_datan_5   ( endpoint0_tx_datan[5]),
       .rx_datan_6   ( endpoint0_tx_datan[6]),
       .rx_datan_7   ( endpoint0_tx_datan[7]),

       .tx_datap_0   (root0_tx_datap[0]),  // outputs
       .tx_datap_1   (root0_tx_datap[1]),
       .tx_datap_2   (root0_tx_datap[2]),
       .tx_datap_3   (root0_tx_datap[3]),
       .tx_datap_4   (root0_tx_datap[4]),
       .tx_datap_5   (root0_tx_datap[5]),
       .tx_datap_6   (root0_tx_datap[6]),
       .tx_datap_7   (root0_tx_datap[7])
       );

   assign root0_tx_datap[15:8] = 8'bz;
end
else begin : pcie_agnt
  `PCIE_DEV_AGNT_X4_8G_HDL root0(
       .reset        (~PCIE_RESET_N),
       .rx_datap_0   ( endpoint0_tx_datap[0]), // inputs
       .rx_datap_1   ( endpoint0_tx_datap[1]),
       .rx_datap_2   ( endpoint0_tx_datap[2]),
       .rx_datap_3   ( endpoint0_tx_datap[3]),
       .rx_datan_0   ( endpoint0_tx_datan[0]), // inputs
       .rx_datan_1   ( endpoint0_tx_datan[1]),
       .rx_datan_2   ( endpoint0_tx_datan[2]),
       .rx_datan_3   ( endpoint0_tx_datan[3]),

       .tx_datap_0   (root0_tx_datap[0]),  // outputs
       .tx_datap_1   (root0_tx_datap[1]),
       .tx_datap_2   (root0_tx_datap[2]),
       .tx_datap_3   (root0_tx_datap[3])
       );

   assign root0_tx_datap[15:4] = 12'bz;
end

`define INIT_Z1565a
`ifdef CONFIG_AGILEX5
   `undef INIT_Z1565a
`endif
`ifdef FTILE_SIM
   `undef INIT_Z1565a
`endif
`ifdef RTILE_SIM
   `undef INIT_Z1565a
`endif

        always #500ps tbclk_1Ghz = ~tbclk_1Ghz;
`ifdef INIT_Z1565a
        initial begin
              #1ps;
              force `PCIE_QHIP.intel_pcie_ptile_ast_qhip.inst.inst.maib_and_tile.z1565a.ctp_tile_encrypted_inst.z1565a_inst.u_wrtilectrl.wrssm_aibaux_cnoc_clk_occ.uu_wrdft_ckmux21_inst.ck1 = tbclk_1Ghz;
              force `PCIE_QHIP.intel_pcie_ptile_ast_qhip.inst.inst.maib_and_tile.z1565a.ctp_tile_encrypted_inst.z1565a_inst.u_wrtilectrl.wrssm_aibaux_cnoc_clk_occ.uu_wrdft_ckmux21_inst.s0=1;
              force `PCIE_QHIP.intel_pcie_ptile_ast_qhip.inst.inst.maib_and_tile.z1565a.ctp_tile_encrypted_inst.z1565a_inst.u_wrtilectrl.wrssm_config_avmm_clk_div_mux.s0=1;
              force `PCIE_QHIP.intel_pcie_ptile_ast_qhip.inst.inst.maib_and_tile.z1565a.ctp_tile_encrypted_inst.z1565a_inst.u_wrphy_top.pcs.i_pcie_pcs.upcs_clk_ctl.pcs_laneX_mpllb_sel[15:0] ='hFFFF;
              force `PCIE_QHIP.intel_pcie_ptile_ast_qhip.inst.inst.maib_and_tile.z1565a.ctp_tile_encrypted_inst.z1565a_inst.u_wrphy_top.pcs.i_pcie_pcs.upcs_clk_ctl.pcs_laneX_rate[47:0]= 'h6db6db6db6db;
              #1ps;

              fork
              begin
                 @(posedge `PCIE_DUT.u_core16.u_ip.u_cfg.u_cfg_dbi_if.cfg_blk_done_o);
                 #1ps;
                 if( DUT.pcie_wrapper.pcie_ss.top.host_pcie.pcie_ss.pcie_ss.hssi_ctp_topology =="pcie_x8x8") begin
                    release `PCIE_QHIP.intel_pcie_ptile_ast_qhip.inst.inst.maib_and_tile.z1565a.ctp_tile_encrypted_inst.z1565a_inst.u_wrphy_top.pcs.i_pcie_pcs.upcs_clk_ctl.pcs_laneX_rate[23:0];
                    release `PCIE_QHIP.intel_pcie_ptile_ast_qhip.inst.inst.maib_and_tile.z1565a.ctp_tile_encrypted_inst.z1565a_inst.u_wrphy_top.pcs.i_pcie_pcs.upcs_clk_ctl.pcs_laneX_mpllb_sel[7:0];
                 end 
                 else begin
                    release `PCIE_QHIP.intel_pcie_ptile_ast_qhip.inst.inst.maib_and_tile.z1565a.ctp_tile_encrypted_inst.z1565a_inst.u_wrphy_top.pcs.i_pcie_pcs.upcs_clk_ctl.pcs_laneX_rate[47:0];
                    release `PCIE_QHIP.intel_pcie_ptile_ast_qhip.inst.inst.maib_and_tile.z1565a.ctp_tile_encrypted_inst.z1565a_inst.u_wrphy_top.pcs.i_pcie_pcs.upcs_clk_ctl.pcs_laneX_mpllb_sel[15:0];
                 end
              end
              begin
                 if(DUT.pcie_wrapper.pcie_ss.top.host_pcie.pcie_ss.pcie_ss.hssi_ctp_topology =="pcie_x8x8") begin
                    @(posedge `PCIE_DUT.u_core8.u_ip.u_cfg.u_cfg_dbi_if.cfg_blk_done_o);
                    #1ps;
                    release `PCIE_QHIP.intel_pcie_ptile_ast_qhip.inst.inst.maib_and_tile.z1565a.ctp_tile_encrypted_inst.z1565a_inst.u_wrphy_top.pcs.i_pcie_pcs.upcs_clk_ctl.pcs_laneX_rate[47:24];
                    release `PCIE_QHIP.intel_pcie_ptile_ast_qhip.inst.inst.maib_and_tile.z1565a.ctp_tile_encrypted_inst.z1565a_inst.u_wrphy_top.pcs.i_pcie_pcs.upcs_clk_ctl.pcs_laneX_mpllb_sel[15:8];
                 end
              end
              join
              release `PCIE_QHIP.intel_pcie_ptile_ast_qhip.inst.inst.maib_and_tile.z1565a.ctp_tile_encrypted_inst.z1565a_inst.u_wrtilectrl.wrssm_aibaux_cnoc_clk_occ.uu_wrdft_ckmux21_inst.s0;
              release `PCIE_QHIP.intel_pcie_ptile_ast_qhip.inst.inst.maib_and_tile.z1565a.ctp_tile_encrypted_inst.z1565a_inst.u_wrtilectrl.wrssm_config_avmm_clk_div_mux.s0;
              //enable the DWIP to run in Fast link mode by forcing. 
              force `PCIE_DUT.u_core16.u_ip.u_dwc.diag_ctrl_bus[2] = 1'b1;
              force `PCIE_DUT.u_core8.u_ip.u_dwc.diag_ctrl_bus[2] = 1'b1;
        end
`endif // ifdef INIT_Z1565a

   //def param added to resolve CLK TOLERANCE ERRORs in FTILE and RTILE
   defparam tb_top.pcie_agnt.root0.port0.serdes0.ALLOW_RECOVERED_CLK_WIDTH_ADJUSTMENTS = 1;
   defparam tb_top.pcie_agnt.root0.port0.serdes0.CLK_TOLERANCE = 1;
   defparam tb_top.pcie_agnt.root0.port0.serdes1.ALLOW_RECOVERED_CLK_WIDTH_ADJUSTMENTS = 1;
   defparam tb_top.pcie_agnt.root0.port0.serdes1.CLK_TOLERANCE = 1;
   defparam tb_top.pcie_agnt.root0.port0.serdes2.ALLOW_RECOVERED_CLK_WIDTH_ADJUSTMENTS = 1;
   defparam tb_top.pcie_agnt.root0.port0.serdes2.CLK_TOLERANCE = 1;
   defparam tb_top.pcie_agnt.root0.port0.serdes3.ALLOW_RECOVERED_CLK_WIDTH_ADJUSTMENTS = 1;
   defparam tb_top.pcie_agnt.root0.port0.serdes3.CLK_TOLERANCE = 1;

   defparam tb_top.pcie_agnt.root0.port0.serdes0.ADJUST_RX_CLK_MODE = 4;
   defparam tb_top.pcie_agnt.root0.port0.serdes1.ADJUST_RX_CLK_MODE = 4;
   defparam tb_top.pcie_agnt.root0.port0.serdes2.ADJUST_RX_CLK_MODE = 4;
   defparam tb_top.pcie_agnt.root0.port0.serdes3.ADJUST_RX_CLK_MODE = 4;

`ifdef PCIE_LINK_WIDTH_GT_4
   defparam tb_top.pcie_agnt.root0.port0.serdes4.ALLOW_RECOVERED_CLK_WIDTH_ADJUSTMENTS = 1;
   defparam tb_top.pcie_agnt.root0.port0.serdes4.CLK_TOLERANCE = 1;
   defparam tb_top.pcie_agnt.root0.port0.serdes5.ALLOW_RECOVERED_CLK_WIDTH_ADJUSTMENTS = 1;
   defparam tb_top.pcie_agnt.root0.port0.serdes5.CLK_TOLERANCE = 1;
   defparam tb_top.pcie_agnt.root0.port0.serdes6.ALLOW_RECOVERED_CLK_WIDTH_ADJUSTMENTS = 1;
   defparam tb_top.pcie_agnt.root0.port0.serdes6.CLK_TOLERANCE = 1;
   defparam tb_top.pcie_agnt.root0.port0.serdes7.ALLOW_RECOVERED_CLK_WIDTH_ADJUSTMENTS = 1;
   defparam tb_top.pcie_agnt.root0.port0.serdes7.CLK_TOLERANCE = 1;

   defparam tb_top.pcie_agnt.root0.port0.serdes4.ADJUST_RX_CLK_MODE = 4;
   defparam tb_top.pcie_agnt.root0.port0.serdes5.ADJUST_RX_CLK_MODE = 4;
   defparam tb_top.pcie_agnt.root0.port0.serdes6.ADJUST_RX_CLK_MODE = 4;
   defparam tb_top.pcie_agnt.root0.port0.serdes7.ADJUST_RX_CLK_MODE = 4;
`endif

`ifdef PCIE_LINK_WIDTH_GT_8
   defparam tb_top.pcie_agnt.root0.port0.serdes8.ALLOW_RECOVERED_CLK_WIDTH_ADJUSTMENTS = 1;
   defparam tb_top.pcie_agnt.root0.port0.serdes8.CLK_TOLERANCE = 1;
   defparam tb_top.pcie_agnt.root0.port0.serdes9.ALLOW_RECOVERED_CLK_WIDTH_ADJUSTMENTS = 1;
   defparam tb_top.pcie_agnt.root0.port0.serdes9.CLK_TOLERANCE = 1;
   defparam tb_top.pcie_agnt.root0.port0.serdes10.ALLOW_RECOVERED_CLK_WIDTH_ADJUSTMENTS = 1;
   defparam tb_top.pcie_agnt.root0.port0.serdes10.CLK_TOLERANCE = 1;
   defparam tb_top.pcie_agnt.root0.port0.serdes11.ALLOW_RECOVERED_CLK_WIDTH_ADJUSTMENTS = 1;
   defparam tb_top.pcie_agnt.root0.port0.serdes11.CLK_TOLERANCE = 1;
   defparam tb_top.pcie_agnt.root0.port0.serdes12.ALLOW_RECOVERED_CLK_WIDTH_ADJUSTMENTS = 1;
   defparam tb_top.pcie_agnt.root0.port0.serdes12.CLK_TOLERANCE = 1;
   defparam tb_top.pcie_agnt.root0.port0.serdes13.ALLOW_RECOVERED_CLK_WIDTH_ADJUSTMENTS = 1;
   defparam tb_top.pcie_agnt.root0.port0.serdes13.CLK_TOLERANCE = 1;
   defparam tb_top.pcie_agnt.root0.port0.serdes14.ALLOW_RECOVERED_CLK_WIDTH_ADJUSTMENTS = 1;
   defparam tb_top.pcie_agnt.root0.port0.serdes14.CLK_TOLERANCE = 1;
   defparam tb_top.pcie_agnt.root0.port0.serdes15.ALLOW_RECOVERED_CLK_WIDTH_ADJUSTMENTS = 1;
   defparam tb_top.pcie_agnt.root0.port0.serdes15.CLK_TOLERANCE = 1;

   defparam tb_top.pcie_agnt.root0.port0.serdes8.ADJUST_RX_CLK_MODE = 4;
   defparam tb_top.pcie_agnt.root0.port0.serdes9.ADJUST_RX_CLK_MODE = 4;
   defparam tb_top.pcie_agnt.root0.port0.serdes10.ADJUST_RX_CLK_MODE = 4;
   defparam tb_top.pcie_agnt.root0.port0.serdes11.ADJUST_RX_CLK_MODE = 4;
   defparam tb_top.pcie_agnt.root0.port0.serdes12.ADJUST_RX_CLK_MODE = 4;
   defparam tb_top.pcie_agnt.root0.port0.serdes13.ADJUST_RX_CLK_MODE = 4;
   defparam tb_top.pcie_agnt.root0.port0.serdes14.ADJUST_RX_CLK_MODE = 4;
   defparam tb_top.pcie_agnt.root0.port0.serdes15.ADJUST_RX_CLK_MODE = 4;
`endif
