//Copyright (C) 2024 Intel Corporation
//SPDX-License-Identifier: MIT

//
// PCIe PIPE agent instantiation and connection to the PCIe endpoint IP.
//
// This file is included by tb_top.sv only when PCIe PIPE mode is enabled in the DUT.
//

//
// This file may assume:
//  - The PCIe configuration file ofs_ip_cfg_pcie_ss.vh has been included.
//  - Macros indicating the number of lanes are set, e.g. PCIE_LINK_WIDTH_GT_4 and
//    PCIE_LINK_WIDTH_GT_8. All widths are set up to the maximum. Namely, both GT_4
//    and GT_8 will be set when 16 lanes are in use.
//

// The R-Tile PIPE interface is unlike the F-Tile and Agilex 5 interfaces. It is
// not supported yet by the OFS PIPE simulation setup. Use the SERDES version.
`ifdef OFS_FIM_IP_CFG_PCIE_SS_IS_R_TILE
   *** ERROR *** R-Tile not supported
`endif

// VIP configuration
`define PCIESVC_PIPE_SPEC_VER_GTR_4_0
`define PCIESVC_PIPE_SPEC_VER_4_3
`define PCIESVC_PIPE_SPEC_VER_4_4
`define PCIESVC_PIPE_PCLK_AS_PHY_INPUT

// Ports to the VIP PIPE agent
logic max_pclk;
logic attached_pclk_change_ok;
logic attached_pclk_change_ack = 0;
logic attached_pipe_reset_n;
logic [3:0] attached_powerdown;
logic attached_async_power_change_ack;
logic attached_tx_commonmode_disable;
logic attached_rx_eidetect_disable;

logic [1:0] attached_rate;
logic [2:0] attached_pclk_rate;
logic attached_txdetectrx;
logic attached_block_align_control;
logic [2:0] attached_tx_margin;
logic attached_tx_swing;
logic [1:0] attached_width;
logic [ofs_fim_cfg_pkg::PCIE_LANES-1:0] attached_rx_standby;
logic [31:0] attached_phy_status;
logic [ofs_fim_cfg_pkg::PCIE_LANES-1:0] attached_rx_standby_status;
logic [1:0] attached_data_bus_width;

logic [31:0] attached_tx_data[ofs_fim_cfg_pkg::PCIE_LANES];
logic [3:0] attached_tx_data_k[ofs_fim_cfg_pkg::PCIE_LANES];
logic [31:0] attached_tx_ei_code[ofs_fim_cfg_pkg::PCIE_LANES];
logic attached_tx_compliance[ofs_fim_cfg_pkg::PCIE_LANES];
logic attached_tx_elec_idle[ofs_fim_cfg_pkg::PCIE_LANES];
logic attached_tx_data_valid[ofs_fim_cfg_pkg::PCIE_LANES];
logic attached_tx_start_block[ofs_fim_cfg_pkg::PCIE_LANES];
logic [1:0] attached_tx_sync_header[ofs_fim_cfg_pkg::PCIE_LANES];
logic [5:0] attached_lf[ofs_fim_cfg_pkg::PCIE_LANES];
logic [5:0] attached_fs[ofs_fim_cfg_pkg::PCIE_LANES];

logic [31:0] attached_rx_data[ofs_fim_cfg_pkg::PCIE_LANES];
logic [3:0] attached_rx_data_k[ofs_fim_cfg_pkg::PCIE_LANES];
logic [2:0] attached_rx_status[ofs_fim_cfg_pkg::PCIE_LANES];
logic attached_rx_valid[ofs_fim_cfg_pkg::PCIE_LANES];
logic attached_rx_data_valid[ofs_fim_cfg_pkg::PCIE_LANES];
logic attached_rx_elec_idle[ofs_fim_cfg_pkg::PCIE_LANES];
logic attached_rx_start_block[ofs_fim_cfg_pkg::PCIE_LANES];
logic [1:0] attached_rx_sync_header[ofs_fim_cfg_pkg::PCIE_LANES];
logic attached_invert_rx_polarity[ofs_fim_cfg_pkg::PCIE_LANES];

logic [17:0] attached_tx_deemph[ofs_fim_cfg_pkg::PCIE_LANES];
logic [4:0] attached_local_preset_index[ofs_fim_cfg_pkg::PCIE_LANES];
logic [2:0] attached_rx_preset_hint[ofs_fim_cfg_pkg::PCIE_LANES];
logic attached_get_local_preset_coefficients[ofs_fim_cfg_pkg::PCIE_LANES];
logic attached_rx_eq_eval[ofs_fim_cfg_pkg::PCIE_LANES];
logic attached_rx_eq_in_progress[ofs_fim_cfg_pkg::PCIE_LANES];
logic attached_invalid_request[ofs_fim_cfg_pkg::PCIE_LANES];

logic [17:0] attached_local_tx_preset_coefficients[ofs_fim_cfg_pkg::PCIE_LANES];
logic [7:0] attached_link_eval_feedback_figure_of_merit[ofs_fim_cfg_pkg::PCIE_LANES];
logic [5:0] attached_link_eval_feedback_direction_change[ofs_fim_cfg_pkg::PCIE_LANES];
logic [5:0] attached_local_fs[ofs_fim_cfg_pkg::PCIE_LANES];
logic [5:0] attached_local_lf[ofs_fim_cfg_pkg::PCIE_LANES];
logic attached_local_tx_coefficients_valid[ofs_fim_cfg_pkg::PCIE_LANES];


// The testbench here must provide the PCIe clock, changing it as the rate is
// negotiated. The current rate is chosen by the agent from attached_pclk_rate.

// Generate all possible clocks, indexed by rate
bit [6:0] pcie_pipe_all_clks = 0;
always #4ns pcie_pipe_all_clks[1] = ~pcie_pipe_all_clks[1];
always #2ns pcie_pipe_all_clks[2] = ~pcie_pipe_all_clks[2];
always #1ns pcie_pipe_all_clks[3] = ~pcie_pipe_all_clks[3];
always #500ps pcie_pipe_all_clks[4] = ~pcie_pipe_all_clks[4];
always #250ps pcie_pipe_all_clks[5] = ~pcie_pipe_all_clks[5];
always #125ps pcie_pipe_all_clks[6] = ~pcie_pipe_all_clks[6];

// pcie_pipe_clk is the active clock
bit pcie_pipe_clk;
// For reasons not yet understood, the VIP expects a 4ns (Gen 2) clock at time 0 in
// some models and an 8ns (Gen 1) in others. For now, we pick based on the number
// of lanes because it works with the current set of DUTs. Picking the wrong initial
// clock runs correctly, but triggers a UVM_ERROR.
bit [2:0] cur_pclk_rate = ofs_fim_cfg_pkg::PCIE_LANES > 8 ? 2 : 1;
assign pcie_pipe_clk = pcie_pipe_all_clks[cur_pclk_rate];

// Time to switch clocks?
always @(posedge PCIE_RefClk) begin
    // Agent expects an ACK to rate change once it sets attached_pclk_change_ok
    attached_pclk_change_ack <= 0;
    if (attached_pclk_change_ok)
        attached_pclk_change_ack <= 1;

    // Clock changes happen while rx_standby is set. In the model,
    // all lanes enter standby simultaneously.
    if (attached_rx_standby[0])
        cur_pclk_rate <= attached_pclk_rate;
end

// Macro for connecting one lane to the agent
`define PCIESVC_MAC_SPIPE_LANE(lane) \
    .pipe_clk_``lane``(pcie_pipe_clk), \
    \
    .attached_tx_data_``lane``(attached_tx_data[lane]), \
    .attached_tx_data_k_``lane``(attached_tx_data_k[lane]), \
    .attached_tx_ei_code_``lane``(attached_tx_ei_code[lane]), \
    .attached_tx_compliance_``lane``(attached_tx_compliance[lane]), \
    .attached_tx_elec_idle_``lane``(attached_tx_elec_idle[lane]), \
    .attached_tx_data_valid_``lane``(attached_tx_data_valid[lane]), \
    .attached_tx_start_block_``lane``(attached_tx_start_block[lane]), \
    .attached_tx_sync_header_``lane``(attached_tx_sync_header[lane]), \
    .attached_lf_``lane``(attached_lf[lane]), \
    .attached_fs_``lane``(attached_fs[lane]), \
    \
    .attached_rx_data_``lane``(attached_rx_data[lane]), \
    .attached_rx_data_k_``lane``(attached_rx_data_k[lane]), \
    .attached_rx_status_``lane``(attached_rx_status[lane]), \
    .attached_rx_valid_``lane``(attached_rx_valid[lane]), \
    .attached_rx_data_valid_``lane``(attached_rx_data_valid[lane]), \
    .attached_rx_elec_idle_``lane``(attached_rx_elec_idle[lane]), \
    .attached_rx_start_block_``lane``(attached_rx_start_block[lane]), \
    .attached_rx_sync_header_``lane``(attached_rx_sync_header[lane]), \
    .attached_invert_rx_polarity_``lane``(attached_invert_rx_polarity[lane]), \
    \
    .attached_tx_deemph_``lane``(attached_tx_deemph[lane]), \
    .attached_local_preset_index_``lane``(attached_local_preset_index[lane]), \
    .attached_rx_preset_hint_``lane``(attached_rx_preset_hint[lane]), \
    .attached_get_local_preset_coefficients_``lane``(attached_get_local_preset_coefficients[lane]), \
    .attached_rx_eq_eval_``lane``(attached_rx_eq_eval[lane]), \
    .attached_rx_eq_in_progress_``lane``(attached_rx_eq_in_progress[lane]), \
    .attached_invalid_request_``lane``(attached_invalid_request[lane]), \
    \
    .attached_local_tx_preset_coefficients_``lane``(attached_local_tx_preset_coefficients[lane]), \
    .attached_link_eval_feedback_figure_of_merit_``lane``(attached_link_eval_feedback_figure_of_merit[lane]), \
    .attached_link_eval_feedback_direction_change_``lane``(attached_link_eval_feedback_direction_change[lane]), \
    .attached_local_fs_``lane``(attached_local_fs[lane]), \
    .attached_local_lf_``lane``(attached_local_lf[lane]), \
    .attached_local_tx_coefficients_valid_``lane``(attached_local_tx_coefficients_valid[lane])

`define PCIE_EP_PIPE_LANE(lane) \
    assign `PCIE_SS_TOP.i_rxpipe``lane``_pclkchangeok = attached_pclk_change_ok; \
    assign `PCIE_SS_TOP.i_rxpipe``lane``_phystatus = attached_phy_status; \
    assign attached_rx_standby[lane] = `PCIE_SS_TOP.o_txpipe``lane``_rxstandby; \
    assign `PCIE_SS_TOP.i_rxpipe``lane``_rxstandbystatus = attached_rx_standby_status[lane]; \
    assign attached_tx_data[lane] = `PCIE_SS_TOP.o_txpipe``lane``_txdata; \
    \
    assign attached_tx_data_k[lane] = `PCIE_SS_TOP.o_txpipe``lane``_txdatak; \
    assign attached_tx_ei_code[lane] = '0; \
    assign attached_tx_compliance[lane] = `PCIE_SS_TOP.o_txpipe``lane``_txcompliance; \
    assign attached_tx_elec_idle[lane] = `PCIE_SS_TOP.o_txpipe``lane``_txelecidle; \
    assign attached_tx_data_valid[lane] = `PCIE_SS_TOP.o_txpipe``lane``_txdatavalid; \
    assign attached_tx_start_block[lane] = `PCIE_SS_TOP.o_txpipe``lane``_txstartblock; \
    assign attached_tx_sync_header[lane] = `PCIE_SS_TOP.o_txpipe``lane``_txsyncheader; \
    assign attached_lf[lane] = `PCIE_SS_TOP.o_txpipe``lane``_lf; \
    assign attached_fs[lane] = `PCIE_SS_TOP.o_txpipe``lane``_fs; \
    \
    assign `PCIE_SS_TOP.i_rxpipe``lane``_rxdata = attached_rx_data[lane]; \
    assign `PCIE_SS_TOP.i_rxpipe``lane``_rxdatak = attached_rx_data_k[lane]; \
    assign `PCIE_SS_TOP.i_rxpipe``lane``_rxstatus = attached_rx_status[lane]; \
    assign `PCIE_SS_TOP.i_rxpipe``lane``_rxvalid = attached_rx_valid[lane]; \
    assign `PCIE_SS_TOP.i_rxpipe``lane``_rxdatavalid = attached_rx_data_valid[lane]; \
    assign `PCIE_SS_TOP.i_rxpipe``lane``_rxelecidlea = attached_rx_elec_idle[lane]; \
    assign `PCIE_SS_TOP.i_rxpipe``lane``_rxstartblock = attached_rx_start_block[lane]; \
    assign `PCIE_SS_TOP.i_rxpipe``lane``_rxsyncheader = attached_rx_sync_header[lane]; \
    assign attached_invert_rx_polarity[lane] = `PCIE_SS_TOP.o_txpipe``lane``_rxpolarity; \
    \
    assign attached_tx_deemph[lane] = `PCIE_SS_TOP.o_txpipe``lane``_txdeemph; \
    assign attached_local_preset_index[lane] = `PCIE_SS_TOP.o_txpipe``lane``_localpresetindex; \
    assign attached_rx_preset_hint[lane] = `PCIE_SS_TOP.o_txpipe``lane``_rxpresethint; \
    assign attached_get_local_preset_coefficients[lane] = `PCIE_SS_TOP.o_txpipe``lane``_getlocalpresetcoefficients; \
    assign attached_rx_eq_eval[lane] = `PCIE_SS_TOP.o_txpipe``lane``_rxeqeval; \
    assign attached_rx_eq_in_progress[lane] = `PCIE_SS_TOP.o_txpipe``lane``_rxeqinprogress; \
    assign attached_invalid_request[lane] = `PCIE_SS_TOP.o_txpipe``lane``_invalidrequest; \


// Primary PCIe endpoint PIPE clock
`ifdef OFS_FIM_IP_CFG_PCIE_SS_HAS_I_PCLK_X16_L0
    assign `PCIE_SS_TOP.i_pclk_x16_l0 = pcie_pipe_clk;
`endif
`ifdef OFS_FIM_IP_CFG_PCIE_SS_HAS_PCLK
    assign `PCIE_SS_TOP.i_pcs0_pclk = pcie_pipe_clk;
`endif

// Default slow clocks for unused PCIe cores
`ifdef OFS_FIM_IP_CFG_PCIE_SS_HAS_I_PCLK_X8_L8
    assign `PCIE_SS_TOP.i_pclk_x8_l8 = pcie_pipe_all_clks[1];
`endif
`ifdef OFS_FIM_IP_CFG_PCIE_SS_HAS_I_PCLK_X4_L12
    assign `PCIE_SS_TOP.i_pclk_x4_l12 = pcie_pipe_all_clks[1];
`endif
`ifdef OFS_FIM_IP_CFG_PCIE_SS_HAS_I_PCLK_X4_L4
    assign `PCIE_SS_TOP.i_pclk_x4_l4 = pcie_pipe_all_clks[1];
`endif

// PIPE reset
`ifdef OFS_FIM_IP_CFG_PCIE_SS_HAS_PIPE_RST_N
    assign attached_pipe_reset_n = `PCIE_SS_TOP.o_pcs0_pipe_rst_n
                                   & `PCIE_SS_TOP.o_pcs1_pipe_rst_n
                                   & `PCIE_SS_TOP.o_pcs2_pipe_rst_n
                                   & `PCIE_SS_TOP.o_pcs3_pipe_rst_n
                                `ifdef PCIE_LINK_WIDTH_GT_4
                                   & `PCIE_SS_TOP.o_pcs4_pipe_rst_n
                                   & `PCIE_SS_TOP.o_pcs5_pipe_rst_n
                                   & `PCIE_SS_TOP.o_pcs6_pipe_rst_n
                                   & `PCIE_SS_TOP.o_pcs7_pipe_rst_n
                                `endif
                                `ifdef PCIE_LINK_WIDTH_GT_4
                                   & `PCIE_SS_TOP.o_pcs8_pipe_rst_n
                                   & `PCIE_SS_TOP.o_pcs9_pipe_rst_n
                                   & `PCIE_SS_TOP.o_pcs10_pipe_rst_n
                                   & `PCIE_SS_TOP.o_pcs11_pipe_rst_n
                                   & `PCIE_SS_TOP.o_pcs12_pipe_rst_n
                                   & `PCIE_SS_TOP.o_pcs13_pipe_rst_n
                                   & `PCIE_SS_TOP.o_pcs14_pipe_rst_n
                                   & `PCIE_SS_TOP.o_pcs15_pipe_rst_n
                                `endif
                                   ;
`else
    // No known reset from the PCIe SS. Just use PCIE_RESET_N.
    assign attached_pipe_reset_n = PCIE_RESET_N;
`endif

assign `PCIE_SS_TOP.i_rxpipe0_dirfeedback = attached_link_eval_feedback_direction_change[0];
assign attached_powerdown = `PCIE_SS_TOP.o_txpipe0_powerdown;
assign attached_async_power_change_ack = `PCIE_SS_TOP.o_txpipe0_asyncpowerchangeack;

assign attached_tx_commonmode_disable = `PCIE_SS_TOP.o_txpipe0_txcmnmode_disable_a;
assign attached_rx_eidetect_disable = `PCIE_SS_TOP.o_txpipe0_rxelecidle_disable_a;

assign attached_rate = `PCIE_SS_TOP.o_txpipe0_rate;
assign attached_pclk_rate = `PCIE_SS_TOP.o_txpipe0_pclk_rate;
assign attached_txdetectrx = `PCIE_SS_TOP.o_txpipe0_txdtctrx_lb;
assign attached_block_align_control = `PCIE_SS_TOP.o_txpipe0_blockaligncontrol;
assign attached_tx_margin = `PCIE_SS_TOP.o_txpipe0_txmargin;
assign attached_tx_swing = `PCIE_SS_TOP.o_txpipe0_txswing;
assign attached_width = `PCIE_SS_TOP.o_txpipe0_width;

`PCIE_EP_PIPE_LANE(0)
`PCIE_EP_PIPE_LANE(1)
`PCIE_EP_PIPE_LANE(2)
`PCIE_EP_PIPE_LANE(3)
`ifdef PCIE_LINK_WIDTH_GT_4
`PCIE_EP_PIPE_LANE(4)
`PCIE_EP_PIPE_LANE(5)
`PCIE_EP_PIPE_LANE(6)
`PCIE_EP_PIPE_LANE(7)
`endif
`ifdef PCIE_LINK_WIDTH_GT_8
`PCIE_EP_PIPE_LANE(8)
`PCIE_EP_PIPE_LANE(9)
`PCIE_EP_PIPE_LANE(10)
`PCIE_EP_PIPE_LANE(11)
`PCIE_EP_PIPE_LANE(12)
`PCIE_EP_PIPE_LANE(13)
`PCIE_EP_PIPE_LANE(14)
`PCIE_EP_PIPE_LANE(15)
`endif

//
// OFS testbench logic expects the model to be instantiated inside a block named "pcie_agent".
// It would be better to use the VIP SystemVerilog interface variants of the model, e.g.
// pciesvc_mac_spipe_model_8g(). Picking the svt_pcie_device_agent used below matches the
// hierarchy of the SERDES variant.
//
begin : pcie_agnt
  `ifdef OFS_FIM_IP_CFG_PCIE_SS_PCIE_LINK_WIDTH_IS_16
    svt_pcie_device_agent_spipe_rev4_2_pclk_input_x16_8g_hdl
  `elsif OFS_FIM_IP_CFG_PCIE_SS_PCIE_LINK_WIDTH_IS_8
    svt_pcie_device_agent_spipe_rev4_2_pclk_input_x8_8g_hdl
  `else
    svt_pcie_device_agent_spipe_rev4_2_pclk_input_x4_8g_hdl
  `endif
      #(
        .PCIE_SPEC_VER(`PCIE_DEV_CFG_CLASS::PCIE_SPEC_VER_5_0)
        )
      root0
       (
        .reset(~PCIE_RESET_N),

        `PCIESVC_MAC_SPIPE_LANE(0),
        `PCIESVC_MAC_SPIPE_LANE(1),
        `PCIESVC_MAC_SPIPE_LANE(2),
        `PCIESVC_MAC_SPIPE_LANE(3),
      `ifdef PCIE_LINK_WIDTH_GT_4
        `PCIESVC_MAC_SPIPE_LANE(4),
        `PCIESVC_MAC_SPIPE_LANE(5),
        `PCIESVC_MAC_SPIPE_LANE(6),
        `PCIESVC_MAC_SPIPE_LANE(7),
      `endif
      `ifdef PCIE_LINK_WIDTH_GT_8
        `PCIESVC_MAC_SPIPE_LANE(8),
        `PCIESVC_MAC_SPIPE_LANE(9),
        `PCIESVC_MAC_SPIPE_LANE(10),
        `PCIESVC_MAC_SPIPE_LANE(11),
        `PCIESVC_MAC_SPIPE_LANE(12),
        `PCIESVC_MAC_SPIPE_LANE(13),
        `PCIESVC_MAC_SPIPE_LANE(14),
        `PCIESVC_MAC_SPIPE_LANE(15),
      `endif

        .max_pclk,
        .attached_pclk_change_ok,

        .attached_pclk_change_ack,
        .attached_pipe_reset_n,
        .attached_powerdown,
        .attached_async_power_change_ack,
        .attached_tx_commonmode_disable,
        .attached_rx_eidetect_disable,

        .attached_rate,
        .attached_pclk_rate,
        .attached_txdetectrx,
        .attached_block_align_control,
        .attached_tx_margin,
        .attached_tx_swing,
        .attached_width,
        .attached_rx_standby,
        .attached_clkreq_n(),
        .attached_phy_status,
        .attached_rx_standby_status,
        .attached_data_bus_width
    );
end
