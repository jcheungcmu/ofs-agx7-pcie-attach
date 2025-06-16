source [file join [file dirname [info script]] ./../../../ip/apf/apf_st2mm_mst/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/apf/apf_uart_mst/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/apf/apf_default_slv/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/apf/apf_reset_bridge/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/apf/apf_bpf_slv/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/apf/apf_clock_bridge/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/apf/apf_mctp_mst/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/apf/apf_pr_2_slv/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/apf/apf_bpf_mst/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/apf/apf_uart_slv/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/apf/apf_pr_slv/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/apf/apf_achk_slv/sim/common/vcs_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/apf/apf_st2mm_slv/sim/common/vcs_files.tcl]

namespace eval apf {
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    set memory_files [concat $memory_files [apf_st2mm_mst::get_memory_files "$QSYS_SIMDIR/../../ip/apf/apf_st2mm_mst/sim/"]]
    set memory_files [concat $memory_files [apf_uart_mst::get_memory_files "$QSYS_SIMDIR/../../ip/apf/apf_uart_mst/sim/"]]
    set memory_files [concat $memory_files [apf_default_slv::get_memory_files "$QSYS_SIMDIR/../../ip/apf/apf_default_slv/sim/"]]
    set memory_files [concat $memory_files [apf_reset_bridge::get_memory_files "$QSYS_SIMDIR/../../ip/apf/apf_reset_bridge/sim/"]]
    set memory_files [concat $memory_files [apf_bpf_slv::get_memory_files "$QSYS_SIMDIR/../../ip/apf/apf_bpf_slv/sim/"]]
    set memory_files [concat $memory_files [apf_clock_bridge::get_memory_files "$QSYS_SIMDIR/../../ip/apf/apf_clock_bridge/sim/"]]
    set memory_files [concat $memory_files [apf_mctp_mst::get_memory_files "$QSYS_SIMDIR/../../ip/apf/apf_mctp_mst/sim/"]]
    set memory_files [concat $memory_files [apf_pr_2_slv::get_memory_files "$QSYS_SIMDIR/../../ip/apf/apf_pr_2_slv/sim/"]]
    set memory_files [concat $memory_files [apf_bpf_mst::get_memory_files "$QSYS_SIMDIR/../../ip/apf/apf_bpf_mst/sim/"]]
    set memory_files [concat $memory_files [apf_uart_slv::get_memory_files "$QSYS_SIMDIR/../../ip/apf/apf_uart_slv/sim/"]]
    set memory_files [concat $memory_files [apf_pr_slv::get_memory_files "$QSYS_SIMDIR/../../ip/apf/apf_pr_slv/sim/"]]
    set memory_files [concat $memory_files [apf_achk_slv::get_memory_files "$QSYS_SIMDIR/../../ip/apf/apf_achk_slv/sim/"]]
    set memory_files [concat $memory_files [apf_st2mm_slv::get_memory_files "$QSYS_SIMDIR/../../ip/apf/apf_st2mm_slv/sim/"]]
    return $memory_files
  }
  
  proc get_common_design_files {QSYS_SIMDIR} {
    set design_files [dict create]
    set design_files [dict merge $design_files [apf_st2mm_mst::get_common_design_files "$QSYS_SIMDIR/../../ip/apf/apf_st2mm_mst/sim/"]]
    set design_files [dict merge $design_files [apf_uart_mst::get_common_design_files "$QSYS_SIMDIR/../../ip/apf/apf_uart_mst/sim/"]]
    set design_files [dict merge $design_files [apf_default_slv::get_common_design_files "$QSYS_SIMDIR/../../ip/apf/apf_default_slv/sim/"]]
    set design_files [dict merge $design_files [apf_reset_bridge::get_common_design_files "$QSYS_SIMDIR/../../ip/apf/apf_reset_bridge/sim/"]]
    set design_files [dict merge $design_files [apf_bpf_slv::get_common_design_files "$QSYS_SIMDIR/../../ip/apf/apf_bpf_slv/sim/"]]
    set design_files [dict merge $design_files [apf_clock_bridge::get_common_design_files "$QSYS_SIMDIR/../../ip/apf/apf_clock_bridge/sim/"]]
    set design_files [dict merge $design_files [apf_mctp_mst::get_common_design_files "$QSYS_SIMDIR/../../ip/apf/apf_mctp_mst/sim/"]]
    set design_files [dict merge $design_files [apf_pr_2_slv::get_common_design_files "$QSYS_SIMDIR/../../ip/apf/apf_pr_2_slv/sim/"]]
    set design_files [dict merge $design_files [apf_bpf_mst::get_common_design_files "$QSYS_SIMDIR/../../ip/apf/apf_bpf_mst/sim/"]]
    set design_files [dict merge $design_files [apf_uart_slv::get_common_design_files "$QSYS_SIMDIR/../../ip/apf/apf_uart_slv/sim/"]]
    set design_files [dict merge $design_files [apf_pr_slv::get_common_design_files "$QSYS_SIMDIR/../../ip/apf/apf_pr_slv/sim/"]]
    set design_files [dict merge $design_files [apf_achk_slv::get_common_design_files "$QSYS_SIMDIR/../../ip/apf/apf_achk_slv/sim/"]]
    set design_files [dict merge $design_files [apf_st2mm_slv::get_common_design_files "$QSYS_SIMDIR/../../ip/apf/apf_st2mm_slv/sim/"]]
    return $design_files
  }
  
  proc get_design_files {QSYS_SIMDIR} {
    set design_files [dict create]
    set design_files [dict merge $design_files [apf_st2mm_mst::get_design_files "$QSYS_SIMDIR/../../ip/apf/apf_st2mm_mst/sim/"]]
    set design_files [dict merge $design_files [apf_uart_mst::get_design_files "$QSYS_SIMDIR/../../ip/apf/apf_uart_mst/sim/"]]
    set design_files [dict merge $design_files [apf_default_slv::get_design_files "$QSYS_SIMDIR/../../ip/apf/apf_default_slv/sim/"]]
    set design_files [dict merge $design_files [apf_reset_bridge::get_design_files "$QSYS_SIMDIR/../../ip/apf/apf_reset_bridge/sim/"]]
    set design_files [dict merge $design_files [apf_bpf_slv::get_design_files "$QSYS_SIMDIR/../../ip/apf/apf_bpf_slv/sim/"]]
    set design_files [dict merge $design_files [apf_clock_bridge::get_design_files "$QSYS_SIMDIR/../../ip/apf/apf_clock_bridge/sim/"]]
    set design_files [dict merge $design_files [apf_mctp_mst::get_design_files "$QSYS_SIMDIR/../../ip/apf/apf_mctp_mst/sim/"]]
    set design_files [dict merge $design_files [apf_pr_2_slv::get_design_files "$QSYS_SIMDIR/../../ip/apf/apf_pr_2_slv/sim/"]]
    set design_files [dict merge $design_files [apf_bpf_mst::get_design_files "$QSYS_SIMDIR/../../ip/apf/apf_bpf_mst/sim/"]]
    set design_files [dict merge $design_files [apf_uart_slv::get_design_files "$QSYS_SIMDIR/../../ip/apf/apf_uart_slv/sim/"]]
    set design_files [dict merge $design_files [apf_pr_slv::get_design_files "$QSYS_SIMDIR/../../ip/apf/apf_pr_slv/sim/"]]
    set design_files [dict merge $design_files [apf_achk_slv::get_design_files "$QSYS_SIMDIR/../../ip/apf/apf_achk_slv/sim/"]]
    set design_files [dict merge $design_files [apf_st2mm_slv::get_design_files "$QSYS_SIMDIR/../../ip/apf/apf_st2mm_slv/sim/"]]
    dict set design_files "altera_merlin_address_alignment.sv"                                            "$QSYS_SIMDIR/../altera_merlin_axi_master_ni_1962/sim/altera_merlin_address_alignment.sv"                                          
    dict set design_files "apf_altera_merlin_axi_master_ni_1962_2kryw2a.sv"                               "$QSYS_SIMDIR/../altera_merlin_axi_master_ni_1962/sim/apf_altera_merlin_axi_master_ni_1962_2kryw2a.sv"                             
    dict set design_files "apf_altera_avalon_sc_fifo_1931_fzgstwy.v"                                      "$QSYS_SIMDIR/../altera_avalon_sc_fifo_1931/sim/apf_altera_avalon_sc_fifo_1931_fzgstwy.v"                                          
    dict set design_files "apf_altera_merlin_axi_slave_ni_altera_avalon_sc_fifo_1971_d4r75ai.v"           "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_sc_fifo_1971_d4r75ai.v"          
    dict set design_files "apf_altera_avalon_st_pipeline_stage_1930_bv2ucky.sv"                           "$QSYS_SIMDIR/../altera_avalon_st_pipeline_stage_1930/sim/apf_altera_avalon_st_pipeline_stage_1930_bv2ucky.sv"                     
    dict set design_files "altera_avalon_st_pipeline_base.v"                                              "$QSYS_SIMDIR/../altera_avalon_st_pipeline_stage_1930/sim/altera_avalon_st_pipeline_base.v"                                        
    dict set design_files "apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_a42nnri.v" "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_a42nnri.v"
    dict set design_files "apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_h6wexfa.v" "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_h6wexfa.v"
    dict set design_files "apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_ouwi2vq.v" "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_ouwi2vq.v"
    dict set design_files "altera_merlin_burst_uncompressor.sv"                                           "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_burst_uncompressor.sv"                                          
    dict set design_files "altera_merlin_address_alignment.sv"                                            "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_address_alignment.sv"                                           
    dict set design_files "compare_eq.sv"                                                                 "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/compare_eq.sv"                                                                
    dict set design_files "rd_response_mem_ifkli3q.sv"                                                    "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_response_mem_ifkli3q.sv"                                                   
    dict set design_files "rd_comp_sel_ifkli3q.sv"                                                        "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_comp_sel_ifkli3q.sv"                                                       
    dict set design_files "rd_pri_mux_ifkli3q.sv"                                                         "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_pri_mux_ifkli3q.sv"                                                        
    dict set design_files "rd_sipo_plus_ifkli3q.sv"                                                       "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_sipo_plus_ifkli3q.sv"                                                      
    dict set design_files "wr_response_mem_ifkli3q.sv"                                                    "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_response_mem_ifkli3q.sv"                                                   
    dict set design_files "wr_comp_sel_ifkli3q.sv"                                                        "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_comp_sel_ifkli3q.sv"                                                       
    dict set design_files "wr_pri_mux_ifkli3q.sv"                                                         "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_pri_mux_ifkli3q.sv"                                                        
    dict set design_files "wr_sipo_plus_ifkli3q.sv"                                                       "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_sipo_plus_ifkli3q.sv"                                                      
    dict set design_files "apf_altera_merlin_axi_slave_ni_1971_ifkli3q.sv"                                "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_1971_ifkli3q.sv"                               
    dict set design_files "apf_altera_merlin_axi_slave_ni_altera_avalon_sc_fifo_1971_spfdq2a.v"           "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_sc_fifo_1971_spfdq2a.v"          
    dict set design_files "apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_a42nnri.v" "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_a42nnri.v"
    dict set design_files "apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_h6wexfa.v" "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_h6wexfa.v"
    dict set design_files "apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_ouwi2vq.v" "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_ouwi2vq.v"
    dict set design_files "altera_merlin_burst_uncompressor.sv"                                           "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_burst_uncompressor.sv"                                          
    dict set design_files "altera_merlin_address_alignment.sv"                                            "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_address_alignment.sv"                                           
    dict set design_files "compare_eq.sv"                                                                 "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/compare_eq.sv"                                                                
    dict set design_files "rd_response_mem_tt2xwma.sv"                                                    "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_response_mem_tt2xwma.sv"                                                   
    dict set design_files "rd_comp_sel_tt2xwma.sv"                                                        "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_comp_sel_tt2xwma.sv"                                                       
    dict set design_files "rd_pri_mux_tt2xwma.sv"                                                         "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_pri_mux_tt2xwma.sv"                                                        
    dict set design_files "rd_sipo_plus_tt2xwma.sv"                                                       "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_sipo_plus_tt2xwma.sv"                                                      
    dict set design_files "wr_response_mem_tt2xwma.sv"                                                    "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_response_mem_tt2xwma.sv"                                                   
    dict set design_files "wr_comp_sel_tt2xwma.sv"                                                        "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_comp_sel_tt2xwma.sv"                                                       
    dict set design_files "wr_pri_mux_tt2xwma.sv"                                                         "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_pri_mux_tt2xwma.sv"                                                        
    dict set design_files "wr_sipo_plus_tt2xwma.sv"                                                       "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_sipo_plus_tt2xwma.sv"                                                      
    dict set design_files "apf_altera_merlin_axi_slave_ni_1971_tt2xwma.sv"                                "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_1971_tt2xwma.sv"                               
    dict set design_files "apf_altera_merlin_axi_slave_ni_altera_avalon_sc_fifo_1971_spfdq2a.v"           "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_sc_fifo_1971_spfdq2a.v"          
    dict set design_files "apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_a42nnri.v" "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_a42nnri.v"
    dict set design_files "apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_h6wexfa.v" "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_h6wexfa.v"
    dict set design_files "apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_ouwi2vq.v" "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_ouwi2vq.v"
    dict set design_files "altera_merlin_burst_uncompressor.sv"                                           "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_burst_uncompressor.sv"                                          
    dict set design_files "altera_merlin_address_alignment.sv"                                            "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_address_alignment.sv"                                           
    dict set design_files "compare_eq.sv"                                                                 "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/compare_eq.sv"                                                                
    dict set design_files "rd_response_mem_plrxymy.sv"                                                    "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_response_mem_plrxymy.sv"                                                   
    dict set design_files "rd_comp_sel_plrxymy.sv"                                                        "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_comp_sel_plrxymy.sv"                                                       
    dict set design_files "rd_pri_mux_plrxymy.sv"                                                         "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_pri_mux_plrxymy.sv"                                                        
    dict set design_files "rd_sipo_plus_plrxymy.sv"                                                       "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_sipo_plus_plrxymy.sv"                                                      
    dict set design_files "wr_response_mem_plrxymy.sv"                                                    "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_response_mem_plrxymy.sv"                                                   
    dict set design_files "wr_comp_sel_plrxymy.sv"                                                        "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_comp_sel_plrxymy.sv"                                                       
    dict set design_files "wr_pri_mux_plrxymy.sv"                                                         "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_pri_mux_plrxymy.sv"                                                        
    dict set design_files "wr_sipo_plus_plrxymy.sv"                                                       "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_sipo_plus_plrxymy.sv"                                                      
    dict set design_files "apf_altera_merlin_axi_slave_ni_1971_plrxymy.sv"                                "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_1971_plrxymy.sv"                               
    dict set design_files "apf_altera_merlin_axi_slave_ni_altera_avalon_sc_fifo_1971_spfdq2a.v"           "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_sc_fifo_1971_spfdq2a.v"          
    dict set design_files "apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_a42nnri.v" "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_a42nnri.v"
    dict set design_files "apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_h6wexfa.v" "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_h6wexfa.v"
    dict set design_files "apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_ouwi2vq.v" "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_ouwi2vq.v"
    dict set design_files "altera_merlin_burst_uncompressor.sv"                                           "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_burst_uncompressor.sv"                                          
    dict set design_files "altera_merlin_address_alignment.sv"                                            "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_address_alignment.sv"                                           
    dict set design_files "compare_eq.sv"                                                                 "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/compare_eq.sv"                                                                
    dict set design_files "rd_response_mem_47p3fxq.sv"                                                    "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_response_mem_47p3fxq.sv"                                                   
    dict set design_files "rd_comp_sel_47p3fxq.sv"                                                        "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_comp_sel_47p3fxq.sv"                                                       
    dict set design_files "rd_pri_mux_47p3fxq.sv"                                                         "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_pri_mux_47p3fxq.sv"                                                        
    dict set design_files "rd_sipo_plus_47p3fxq.sv"                                                       "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_sipo_plus_47p3fxq.sv"                                                      
    dict set design_files "wr_response_mem_47p3fxq.sv"                                                    "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_response_mem_47p3fxq.sv"                                                   
    dict set design_files "wr_comp_sel_47p3fxq.sv"                                                        "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_comp_sel_47p3fxq.sv"                                                       
    dict set design_files "wr_pri_mux_47p3fxq.sv"                                                         "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_pri_mux_47p3fxq.sv"                                                        
    dict set design_files "wr_sipo_plus_47p3fxq.sv"                                                       "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_sipo_plus_47p3fxq.sv"                                                      
    dict set design_files "apf_altera_merlin_axi_slave_ni_1971_47p3fxq.sv"                                "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_1971_47p3fxq.sv"                               
    dict set design_files "apf_altera_merlin_axi_slave_ni_altera_avalon_sc_fifo_1971_spfdq2a.v"           "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_sc_fifo_1971_spfdq2a.v"          
    dict set design_files "apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_a42nnri.v" "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_a42nnri.v"
    dict set design_files "apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_h6wexfa.v" "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_h6wexfa.v"
    dict set design_files "apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_ouwi2vq.v" "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_ouwi2vq.v"
    dict set design_files "altera_merlin_burst_uncompressor.sv"                                           "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_burst_uncompressor.sv"                                          
    dict set design_files "altera_merlin_address_alignment.sv"                                            "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_address_alignment.sv"                                           
    dict set design_files "compare_eq.sv"                                                                 "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/compare_eq.sv"                                                                
    dict set design_files "rd_response_mem_qsiaw5a.sv"                                                    "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_response_mem_qsiaw5a.sv"                                                   
    dict set design_files "rd_comp_sel_qsiaw5a.sv"                                                        "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_comp_sel_qsiaw5a.sv"                                                       
    dict set design_files "rd_pri_mux_qsiaw5a.sv"                                                         "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_pri_mux_qsiaw5a.sv"                                                        
    dict set design_files "rd_sipo_plus_qsiaw5a.sv"                                                       "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_sipo_plus_qsiaw5a.sv"                                                      
    dict set design_files "wr_response_mem_qsiaw5a.sv"                                                    "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_response_mem_qsiaw5a.sv"                                                   
    dict set design_files "wr_comp_sel_qsiaw5a.sv"                                                        "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_comp_sel_qsiaw5a.sv"                                                       
    dict set design_files "wr_pri_mux_qsiaw5a.sv"                                                         "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_pri_mux_qsiaw5a.sv"                                                        
    dict set design_files "wr_sipo_plus_qsiaw5a.sv"                                                       "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_sipo_plus_qsiaw5a.sv"                                                      
    dict set design_files "apf_altera_merlin_axi_slave_ni_1971_qsiaw5a.sv"                                "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_1971_qsiaw5a.sv"                               
    dict set design_files "apf_altera_merlin_axi_slave_ni_altera_avalon_sc_fifo_1971_spfdq2a.v"           "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_sc_fifo_1971_spfdq2a.v"          
    dict set design_files "apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_a42nnri.v" "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_a42nnri.v"
    dict set design_files "apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_h6wexfa.v" "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_h6wexfa.v"
    dict set design_files "apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_ouwi2vq.v" "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_ouwi2vq.v"
    dict set design_files "altera_merlin_burst_uncompressor.sv"                                           "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_burst_uncompressor.sv"                                          
    dict set design_files "altera_merlin_address_alignment.sv"                                            "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_address_alignment.sv"                                           
    dict set design_files "compare_eq.sv"                                                                 "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/compare_eq.sv"                                                                
    dict set design_files "rd_response_mem_uhqnppq.sv"                                                    "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_response_mem_uhqnppq.sv"                                                   
    dict set design_files "rd_comp_sel_uhqnppq.sv"                                                        "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_comp_sel_uhqnppq.sv"                                                       
    dict set design_files "rd_pri_mux_uhqnppq.sv"                                                         "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_pri_mux_uhqnppq.sv"                                                        
    dict set design_files "rd_sipo_plus_uhqnppq.sv"                                                       "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_sipo_plus_uhqnppq.sv"                                                      
    dict set design_files "wr_response_mem_uhqnppq.sv"                                                    "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_response_mem_uhqnppq.sv"                                                   
    dict set design_files "wr_comp_sel_uhqnppq.sv"                                                        "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_comp_sel_uhqnppq.sv"                                                       
    dict set design_files "wr_pri_mux_uhqnppq.sv"                                                         "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_pri_mux_uhqnppq.sv"                                                        
    dict set design_files "wr_sipo_plus_uhqnppq.sv"                                                       "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_sipo_plus_uhqnppq.sv"                                                      
    dict set design_files "apf_altera_merlin_axi_slave_ni_1971_uhqnppq.sv"                                "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_1971_uhqnppq.sv"                               
    dict set design_files "apf_altera_merlin_axi_slave_ni_altera_avalon_sc_fifo_1971_spfdq2a.v"           "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_sc_fifo_1971_spfdq2a.v"          
    dict set design_files "apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_a42nnri.v" "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_a42nnri.v"
    dict set design_files "apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_h6wexfa.v" "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_h6wexfa.v"
    dict set design_files "apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_ouwi2vq.v" "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_ouwi2vq.v"
    dict set design_files "altera_merlin_burst_uncompressor.sv"                                           "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_burst_uncompressor.sv"                                          
    dict set design_files "altera_merlin_address_alignment.sv"                                            "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_address_alignment.sv"                                           
    dict set design_files "compare_eq.sv"                                                                 "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/compare_eq.sv"                                                                
    dict set design_files "rd_response_mem_g3gfuhy.sv"                                                    "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_response_mem_g3gfuhy.sv"                                                   
    dict set design_files "rd_comp_sel_g3gfuhy.sv"                                                        "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_comp_sel_g3gfuhy.sv"                                                       
    dict set design_files "rd_pri_mux_g3gfuhy.sv"                                                         "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_pri_mux_g3gfuhy.sv"                                                        
    dict set design_files "rd_sipo_plus_g3gfuhy.sv"                                                       "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_sipo_plus_g3gfuhy.sv"                                                      
    dict set design_files "wr_response_mem_g3gfuhy.sv"                                                    "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_response_mem_g3gfuhy.sv"                                                   
    dict set design_files "wr_comp_sel_g3gfuhy.sv"                                                        "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_comp_sel_g3gfuhy.sv"                                                       
    dict set design_files "wr_pri_mux_g3gfuhy.sv"                                                         "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_pri_mux_g3gfuhy.sv"                                                        
    dict set design_files "wr_sipo_plus_g3gfuhy.sv"                                                       "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_sipo_plus_g3gfuhy.sv"                                                      
    dict set design_files "apf_altera_merlin_axi_slave_ni_1971_g3gfuhy.sv"                                "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_1971_g3gfuhy.sv"                               
    dict set design_files "apf_altera_merlin_router_1921_a646sqa.sv"                                      "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/apf_altera_merlin_router_1921_a646sqa.sv"                                           
    dict set design_files "apf_altera_merlin_router_1921_bbaqrwi.sv"                                      "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/apf_altera_merlin_router_1921_bbaqrwi.sv"                                           
    dict set design_files "apf_altera_merlin_router_1921_qrp6k3i.sv"                                      "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/apf_altera_merlin_router_1921_qrp6k3i.sv"                                           
    dict set design_files "apf_altera_merlin_router_1921_bxgv4da.sv"                                      "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/apf_altera_merlin_router_1921_bxgv4da.sv"                                           
    dict set design_files "apf_altera_merlin_router_1921_4sjj5kq.sv"                                      "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/apf_altera_merlin_router_1921_4sjj5kq.sv"                                           
    dict set design_files "apf_altera_merlin_router_1921_uaklday.sv"                                      "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/apf_altera_merlin_router_1921_uaklday.sv"                                           
    dict set design_files "apf_altera_merlin_router_1921_tmd2eti.sv"                                      "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/apf_altera_merlin_router_1921_tmd2eti.sv"                                           
    dict set design_files "apf_altera_merlin_router_1921_qq4w7ta.sv"                                      "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/apf_altera_merlin_router_1921_qq4w7ta.sv"                                           
    dict set design_files "apf_altera_merlin_traffic_limiter_altera_avalon_sc_fifo_1921_ho5tama.v"        "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/apf_altera_merlin_traffic_limiter_altera_avalon_sc_fifo_1921_ho5tama.v"    
    dict set design_files "altera_merlin_reorder_memory.sv"                                               "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/altera_merlin_reorder_memory.sv"                                           
    dict set design_files "altera_avalon_st_pipeline_base.v"                                              "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/altera_avalon_st_pipeline_base.v"                                          
    dict set design_files "apf_altera_merlin_traffic_limiter_1921_p5flxai.sv"                             "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/apf_altera_merlin_traffic_limiter_1921_p5flxai.sv"                         
    dict set design_files "apf_altera_merlin_demultiplexer_1921_ibov6ma.sv"                               "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/apf_altera_merlin_demultiplexer_1921_ibov6ma.sv"                             
    dict set design_files "apf_altera_merlin_demultiplexer_1921_4cdysia.sv"                               "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/apf_altera_merlin_demultiplexer_1921_4cdysia.sv"                             
    dict set design_files "apf_altera_merlin_multiplexer_1922_gpq72ii.sv"                                 "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/apf_altera_merlin_multiplexer_1922_gpq72ii.sv"                                 
    dict set design_files "altera_merlin_arbitrator.sv"                                                   "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"                                                   
    dict set design_files "apf_altera_merlin_multiplexer_1922_2jnytna.sv"                                 "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/apf_altera_merlin_multiplexer_1922_2jnytna.sv"                                 
    dict set design_files "altera_merlin_arbitrator.sv"                                                   "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"                                                   
    dict set design_files "apf_altera_merlin_demultiplexer_1921_hfula6q.sv"                               "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/apf_altera_merlin_demultiplexer_1921_hfula6q.sv"                             
    dict set design_files "apf_altera_merlin_demultiplexer_1921_gu3jqaq.sv"                               "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/apf_altera_merlin_demultiplexer_1921_gu3jqaq.sv"                             
    dict set design_files "apf_altera_merlin_multiplexer_1922_n3ujnhi.sv"                                 "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/apf_altera_merlin_multiplexer_1922_n3ujnhi.sv"                                 
    dict set design_files "altera_merlin_arbitrator.sv"                                                   "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"                                                   
    dict set design_files "apf_altera_merlin_multiplexer_1922_tigfd3y.sv"                                 "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/apf_altera_merlin_multiplexer_1922_tigfd3y.sv"                                 
    dict set design_files "altera_merlin_arbitrator.sv"                                                   "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"                                                   
    dict set design_files "apf_altera_mm_interconnect_1920_tpkmrta.v"                                     "$QSYS_SIMDIR/../altera_mm_interconnect_1920/sim/apf_altera_mm_interconnect_1920_tpkmrta.v"                                        
    dict set design_files "apf.v"                                                                         "$QSYS_SIMDIR/apf.v"                                                                                                               
    return $design_files
  }
  
  proc get_elab_options {SIMULATOR_TOOL_BITNESS} {
    set ELAB_OPTIONS ""
    append ELAB_OPTIONS [apf_st2mm_mst::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [apf_uart_mst::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [apf_default_slv::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [apf_reset_bridge::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [apf_bpf_slv::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [apf_clock_bridge::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [apf_mctp_mst::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [apf_pr_2_slv::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [apf_bpf_mst::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [apf_uart_slv::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [apf_pr_slv::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [apf_achk_slv::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [apf_st2mm_slv::get_elab_options $SIMULATOR_TOOL_BITNESS]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    append SIM_OPTIONS [apf_st2mm_mst::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [apf_uart_mst::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [apf_default_slv::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [apf_reset_bridge::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [apf_bpf_slv::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [apf_clock_bridge::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [apf_mctp_mst::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [apf_pr_2_slv::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [apf_bpf_mst::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [apf_uart_slv::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [apf_pr_slv::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [apf_achk_slv::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [apf_st2mm_slv::get_sim_options $SIMULATOR_TOOL_BITNESS]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [apf_st2mm_mst::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [apf_uart_mst::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [apf_default_slv::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [apf_reset_bridge::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [apf_bpf_slv::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [apf_clock_bridge::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [apf_mctp_mst::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [apf_pr_2_slv::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [apf_bpf_mst::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [apf_uart_slv::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [apf_pr_slv::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [apf_achk_slv::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [apf_st2mm_slv::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    dict set ENV_VARIABLES "LD_LIBRARY_PATH" $LD_LIBRARY_PATH
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ENV_VARIABLES
  }
  
  
  proc get_dpi_libraries {QSYS_SIMDIR} {
    set libraries [dict create]
    set libraries [dict merge $libraries [apf_st2mm_mst::get_dpi_libraries "$QSYS_SIMDIR/../../ip/apf/apf_st2mm_mst/sim/"]]
    set libraries [dict merge $libraries [apf_uart_mst::get_dpi_libraries "$QSYS_SIMDIR/../../ip/apf/apf_uart_mst/sim/"]]
    set libraries [dict merge $libraries [apf_default_slv::get_dpi_libraries "$QSYS_SIMDIR/../../ip/apf/apf_default_slv/sim/"]]
    set libraries [dict merge $libraries [apf_reset_bridge::get_dpi_libraries "$QSYS_SIMDIR/../../ip/apf/apf_reset_bridge/sim/"]]
    set libraries [dict merge $libraries [apf_bpf_slv::get_dpi_libraries "$QSYS_SIMDIR/../../ip/apf/apf_bpf_slv/sim/"]]
    set libraries [dict merge $libraries [apf_clock_bridge::get_dpi_libraries "$QSYS_SIMDIR/../../ip/apf/apf_clock_bridge/sim/"]]
    set libraries [dict merge $libraries [apf_mctp_mst::get_dpi_libraries "$QSYS_SIMDIR/../../ip/apf/apf_mctp_mst/sim/"]]
    set libraries [dict merge $libraries [apf_pr_2_slv::get_dpi_libraries "$QSYS_SIMDIR/../../ip/apf/apf_pr_2_slv/sim/"]]
    set libraries [dict merge $libraries [apf_bpf_mst::get_dpi_libraries "$QSYS_SIMDIR/../../ip/apf/apf_bpf_mst/sim/"]]
    set libraries [dict merge $libraries [apf_uart_slv::get_dpi_libraries "$QSYS_SIMDIR/../../ip/apf/apf_uart_slv/sim/"]]
    set libraries [dict merge $libraries [apf_pr_slv::get_dpi_libraries "$QSYS_SIMDIR/../../ip/apf/apf_pr_slv/sim/"]]
    set libraries [dict merge $libraries [apf_achk_slv::get_dpi_libraries "$QSYS_SIMDIR/../../ip/apf/apf_achk_slv/sim/"]]
    set libraries [dict merge $libraries [apf_st2mm_slv::get_dpi_libraries "$QSYS_SIMDIR/../../ip/apf/apf_st2mm_slv/sim/"]]
    
    return $libraries
  }
  
}
