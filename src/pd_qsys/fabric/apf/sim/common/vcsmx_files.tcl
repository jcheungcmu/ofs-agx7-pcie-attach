source [file join [file dirname [info script]] ./../../../ip/apf/apf_st2mm_mst/sim/common/vcsmx_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/apf/apf_uart_mst/sim/common/vcsmx_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/apf/apf_default_slv/sim/common/vcsmx_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/apf/apf_reset_bridge/sim/common/vcsmx_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/apf/apf_bpf_slv/sim/common/vcsmx_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/apf/apf_clock_bridge/sim/common/vcsmx_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/apf/apf_mctp_mst/sim/common/vcsmx_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/apf/apf_pr_2_slv/sim/common/vcsmx_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/apf/apf_bpf_mst/sim/common/vcsmx_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/apf/apf_uart_slv/sim/common/vcsmx_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/apf/apf_pr_slv/sim/common/vcsmx_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/apf/apf_achk_slv/sim/common/vcsmx_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/apf/apf_st2mm_slv/sim/common/vcsmx_files.tcl]

namespace eval apf {
  proc get_design_libraries {} {
    set libraries [dict create]
    set libraries [dict merge $libraries [apf_st2mm_mst::get_design_libraries]]
    set libraries [dict merge $libraries [apf_uart_mst::get_design_libraries]]
    set libraries [dict merge $libraries [apf_default_slv::get_design_libraries]]
    set libraries [dict merge $libraries [apf_reset_bridge::get_design_libraries]]
    set libraries [dict merge $libraries [apf_bpf_slv::get_design_libraries]]
    set libraries [dict merge $libraries [apf_clock_bridge::get_design_libraries]]
    set libraries [dict merge $libraries [apf_mctp_mst::get_design_libraries]]
    set libraries [dict merge $libraries [apf_pr_2_slv::get_design_libraries]]
    set libraries [dict merge $libraries [apf_bpf_mst::get_design_libraries]]
    set libraries [dict merge $libraries [apf_uart_slv::get_design_libraries]]
    set libraries [dict merge $libraries [apf_pr_slv::get_design_libraries]]
    set libraries [dict merge $libraries [apf_achk_slv::get_design_libraries]]
    set libraries [dict merge $libraries [apf_st2mm_slv::get_design_libraries]]
    dict set libraries altera_merlin_axi_master_ni_1962     1
    dict set libraries altera_avalon_sc_fifo_1931           1
    dict set libraries altera_merlin_axi_slave_ni_1971      1
    dict set libraries altera_avalon_st_pipeline_stage_1930 1
    dict set libraries altera_merlin_router_1921            1
    dict set libraries altera_merlin_traffic_limiter_1921   1
    dict set libraries altera_merlin_demultiplexer_1921     1
    dict set libraries altera_merlin_multiplexer_1922       1
    dict set libraries altera_mm_interconnect_1920          1
    dict set libraries apf                                  1
    return $libraries
  }
  
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
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    set design_files [dict merge $design_files [apf_st2mm_mst::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/apf/apf_st2mm_mst/sim/"]]
    set design_files [dict merge $design_files [apf_uart_mst::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/apf/apf_uart_mst/sim/"]]
    set design_files [dict merge $design_files [apf_default_slv::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/apf/apf_default_slv/sim/"]]
    set design_files [dict merge $design_files [apf_reset_bridge::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/apf/apf_reset_bridge/sim/"]]
    set design_files [dict merge $design_files [apf_bpf_slv::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/apf/apf_bpf_slv/sim/"]]
    set design_files [dict merge $design_files [apf_clock_bridge::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/apf/apf_clock_bridge/sim/"]]
    set design_files [dict merge $design_files [apf_mctp_mst::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/apf/apf_mctp_mst/sim/"]]
    set design_files [dict merge $design_files [apf_pr_2_slv::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/apf/apf_pr_2_slv/sim/"]]
    set design_files [dict merge $design_files [apf_bpf_mst::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/apf/apf_bpf_mst/sim/"]]
    set design_files [dict merge $design_files [apf_uart_slv::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/apf/apf_uart_slv/sim/"]]
    set design_files [dict merge $design_files [apf_pr_slv::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/apf/apf_pr_slv/sim/"]]
    set design_files [dict merge $design_files [apf_achk_slv::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/apf/apf_achk_slv/sim/"]]
    set design_files [dict merge $design_files [apf_st2mm_slv::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/apf/apf_st2mm_slv/sim/"]]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    set design_files [concat $design_files [apf_st2mm_mst::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/apf/apf_st2mm_mst/sim/"]]
    set design_files [concat $design_files [apf_uart_mst::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/apf/apf_uart_mst/sim/"]]
    set design_files [concat $design_files [apf_default_slv::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/apf/apf_default_slv/sim/"]]
    set design_files [concat $design_files [apf_reset_bridge::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/apf/apf_reset_bridge/sim/"]]
    set design_files [concat $design_files [apf_bpf_slv::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/apf/apf_bpf_slv/sim/"]]
    set design_files [concat $design_files [apf_clock_bridge::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/apf/apf_clock_bridge/sim/"]]
    set design_files [concat $design_files [apf_mctp_mst::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/apf/apf_mctp_mst/sim/"]]
    set design_files [concat $design_files [apf_pr_2_slv::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/apf/apf_pr_2_slv/sim/"]]
    set design_files [concat $design_files [apf_bpf_mst::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/apf/apf_bpf_mst/sim/"]]
    set design_files [concat $design_files [apf_uart_slv::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/apf/apf_uart_slv/sim/"]]
    set design_files [concat $design_files [apf_pr_slv::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/apf/apf_pr_slv/sim/"]]
    set design_files [concat $design_files [apf_achk_slv::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/apf/apf_achk_slv/sim/"]]
    set design_files [concat $design_files [apf_st2mm_slv::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/apf/apf_st2mm_slv/sim/"]]
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_master_ni_1962/sim/altera_merlin_address_alignment.sv\"  -work altera_merlin_axi_master_ni_1962"                               
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_master_ni_1962/sim/apf_altera_merlin_axi_master_ni_1962_2kryw2a.sv\"  -work altera_merlin_axi_master_ni_1962"                  
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_avalon_sc_fifo_1931/sim/apf_altera_avalon_sc_fifo_1931_fzgstwy.v\"  -work altera_avalon_sc_fifo_1931"                                               
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_sc_fifo_1971_d4r75ai.v\"  -work altera_merlin_axi_slave_ni_1971"          
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_avalon_st_pipeline_stage_1930/sim/apf_altera_avalon_st_pipeline_stage_1930_bv2ucky.sv\"  -work altera_avalon_st_pipeline_stage_1930"      
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_avalon_st_pipeline_stage_1930/sim/altera_avalon_st_pipeline_base.v\"  -work altera_avalon_st_pipeline_stage_1930"                         
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_a42nnri.v\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_h6wexfa.v\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_ouwi2vq.v\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_burst_uncompressor.sv\"  -work altera_merlin_axi_slave_ni_1971"                                
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_address_alignment.sv\"  -work altera_merlin_axi_slave_ni_1971"                                 
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/compare_eq.sv\"  -work altera_merlin_axi_slave_ni_1971"                                                      
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_response_mem_ifkli3q.sv\"  -work altera_merlin_axi_slave_ni_1971"                                         
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_comp_sel_ifkli3q.sv\"  -work altera_merlin_axi_slave_ni_1971"                                             
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_pri_mux_ifkli3q.sv\"  -work altera_merlin_axi_slave_ni_1971"                                              
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_sipo_plus_ifkli3q.sv\"  -work altera_merlin_axi_slave_ni_1971"                                            
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_response_mem_ifkli3q.sv\"  -work altera_merlin_axi_slave_ni_1971"                                         
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_comp_sel_ifkli3q.sv\"  -work altera_merlin_axi_slave_ni_1971"                                             
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_pri_mux_ifkli3q.sv\"  -work altera_merlin_axi_slave_ni_1971"                                              
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_sipo_plus_ifkli3q.sv\"  -work altera_merlin_axi_slave_ni_1971"                                            
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_1971_ifkli3q.sv\"  -work altera_merlin_axi_slave_ni_1971"                     
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_sc_fifo_1971_spfdq2a.v\"  -work altera_merlin_axi_slave_ni_1971"          
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_a42nnri.v\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_h6wexfa.v\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_ouwi2vq.v\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_burst_uncompressor.sv\"  -work altera_merlin_axi_slave_ni_1971"                                
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_address_alignment.sv\"  -work altera_merlin_axi_slave_ni_1971"                                 
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/compare_eq.sv\"  -work altera_merlin_axi_slave_ni_1971"                                                      
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_response_mem_tt2xwma.sv\"  -work altera_merlin_axi_slave_ni_1971"                                         
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_comp_sel_tt2xwma.sv\"  -work altera_merlin_axi_slave_ni_1971"                                             
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_pri_mux_tt2xwma.sv\"  -work altera_merlin_axi_slave_ni_1971"                                              
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_sipo_plus_tt2xwma.sv\"  -work altera_merlin_axi_slave_ni_1971"                                            
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_response_mem_tt2xwma.sv\"  -work altera_merlin_axi_slave_ni_1971"                                         
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_comp_sel_tt2xwma.sv\"  -work altera_merlin_axi_slave_ni_1971"                                             
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_pri_mux_tt2xwma.sv\"  -work altera_merlin_axi_slave_ni_1971"                                              
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_sipo_plus_tt2xwma.sv\"  -work altera_merlin_axi_slave_ni_1971"                                            
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_1971_tt2xwma.sv\"  -work altera_merlin_axi_slave_ni_1971"                     
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_sc_fifo_1971_spfdq2a.v\"  -work altera_merlin_axi_slave_ni_1971"          
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_a42nnri.v\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_h6wexfa.v\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_ouwi2vq.v\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_burst_uncompressor.sv\"  -work altera_merlin_axi_slave_ni_1971"                                
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_address_alignment.sv\"  -work altera_merlin_axi_slave_ni_1971"                                 
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/compare_eq.sv\"  -work altera_merlin_axi_slave_ni_1971"                                                      
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_response_mem_plrxymy.sv\"  -work altera_merlin_axi_slave_ni_1971"                                         
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_comp_sel_plrxymy.sv\"  -work altera_merlin_axi_slave_ni_1971"                                             
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_pri_mux_plrxymy.sv\"  -work altera_merlin_axi_slave_ni_1971"                                              
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_sipo_plus_plrxymy.sv\"  -work altera_merlin_axi_slave_ni_1971"                                            
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_response_mem_plrxymy.sv\"  -work altera_merlin_axi_slave_ni_1971"                                         
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_comp_sel_plrxymy.sv\"  -work altera_merlin_axi_slave_ni_1971"                                             
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_pri_mux_plrxymy.sv\"  -work altera_merlin_axi_slave_ni_1971"                                              
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_sipo_plus_plrxymy.sv\"  -work altera_merlin_axi_slave_ni_1971"                                            
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_1971_plrxymy.sv\"  -work altera_merlin_axi_slave_ni_1971"                     
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_sc_fifo_1971_spfdq2a.v\"  -work altera_merlin_axi_slave_ni_1971"          
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_a42nnri.v\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_h6wexfa.v\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_ouwi2vq.v\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_burst_uncompressor.sv\"  -work altera_merlin_axi_slave_ni_1971"                                
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_address_alignment.sv\"  -work altera_merlin_axi_slave_ni_1971"                                 
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/compare_eq.sv\"  -work altera_merlin_axi_slave_ni_1971"                                                      
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_response_mem_47p3fxq.sv\"  -work altera_merlin_axi_slave_ni_1971"                                         
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_comp_sel_47p3fxq.sv\"  -work altera_merlin_axi_slave_ni_1971"                                             
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_pri_mux_47p3fxq.sv\"  -work altera_merlin_axi_slave_ni_1971"                                              
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_sipo_plus_47p3fxq.sv\"  -work altera_merlin_axi_slave_ni_1971"                                            
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_response_mem_47p3fxq.sv\"  -work altera_merlin_axi_slave_ni_1971"                                         
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_comp_sel_47p3fxq.sv\"  -work altera_merlin_axi_slave_ni_1971"                                             
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_pri_mux_47p3fxq.sv\"  -work altera_merlin_axi_slave_ni_1971"                                              
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_sipo_plus_47p3fxq.sv\"  -work altera_merlin_axi_slave_ni_1971"                                            
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_1971_47p3fxq.sv\"  -work altera_merlin_axi_slave_ni_1971"                     
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_sc_fifo_1971_spfdq2a.v\"  -work altera_merlin_axi_slave_ni_1971"          
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_a42nnri.v\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_h6wexfa.v\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_ouwi2vq.v\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_burst_uncompressor.sv\"  -work altera_merlin_axi_slave_ni_1971"                                
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_address_alignment.sv\"  -work altera_merlin_axi_slave_ni_1971"                                 
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/compare_eq.sv\"  -work altera_merlin_axi_slave_ni_1971"                                                      
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_response_mem_qsiaw5a.sv\"  -work altera_merlin_axi_slave_ni_1971"                                         
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_comp_sel_qsiaw5a.sv\"  -work altera_merlin_axi_slave_ni_1971"                                             
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_pri_mux_qsiaw5a.sv\"  -work altera_merlin_axi_slave_ni_1971"                                              
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_sipo_plus_qsiaw5a.sv\"  -work altera_merlin_axi_slave_ni_1971"                                            
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_response_mem_qsiaw5a.sv\"  -work altera_merlin_axi_slave_ni_1971"                                         
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_comp_sel_qsiaw5a.sv\"  -work altera_merlin_axi_slave_ni_1971"                                             
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_pri_mux_qsiaw5a.sv\"  -work altera_merlin_axi_slave_ni_1971"                                              
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_sipo_plus_qsiaw5a.sv\"  -work altera_merlin_axi_slave_ni_1971"                                            
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_1971_qsiaw5a.sv\"  -work altera_merlin_axi_slave_ni_1971"                     
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_sc_fifo_1971_spfdq2a.v\"  -work altera_merlin_axi_slave_ni_1971"          
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_a42nnri.v\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_h6wexfa.v\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_ouwi2vq.v\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_burst_uncompressor.sv\"  -work altera_merlin_axi_slave_ni_1971"                                
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_address_alignment.sv\"  -work altera_merlin_axi_slave_ni_1971"                                 
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/compare_eq.sv\"  -work altera_merlin_axi_slave_ni_1971"                                                      
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_response_mem_uhqnppq.sv\"  -work altera_merlin_axi_slave_ni_1971"                                         
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_comp_sel_uhqnppq.sv\"  -work altera_merlin_axi_slave_ni_1971"                                             
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_pri_mux_uhqnppq.sv\"  -work altera_merlin_axi_slave_ni_1971"                                              
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_sipo_plus_uhqnppq.sv\"  -work altera_merlin_axi_slave_ni_1971"                                            
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_response_mem_uhqnppq.sv\"  -work altera_merlin_axi_slave_ni_1971"                                         
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_comp_sel_uhqnppq.sv\"  -work altera_merlin_axi_slave_ni_1971"                                             
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_pri_mux_uhqnppq.sv\"  -work altera_merlin_axi_slave_ni_1971"                                              
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_sipo_plus_uhqnppq.sv\"  -work altera_merlin_axi_slave_ni_1971"                                            
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_1971_uhqnppq.sv\"  -work altera_merlin_axi_slave_ni_1971"                     
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_sc_fifo_1971_spfdq2a.v\"  -work altera_merlin_axi_slave_ni_1971"          
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_a42nnri.v\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_h6wexfa.v\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_ouwi2vq.v\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_burst_uncompressor.sv\"  -work altera_merlin_axi_slave_ni_1971"                                
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_address_alignment.sv\"  -work altera_merlin_axi_slave_ni_1971"                                 
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/compare_eq.sv\"  -work altera_merlin_axi_slave_ni_1971"                                                      
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_response_mem_g3gfuhy.sv\"  -work altera_merlin_axi_slave_ni_1971"                                         
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_comp_sel_g3gfuhy.sv\"  -work altera_merlin_axi_slave_ni_1971"                                             
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_pri_mux_g3gfuhy.sv\"  -work altera_merlin_axi_slave_ni_1971"                                              
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_sipo_plus_g3gfuhy.sv\"  -work altera_merlin_axi_slave_ni_1971"                                            
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_response_mem_g3gfuhy.sv\"  -work altera_merlin_axi_slave_ni_1971"                                         
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_comp_sel_g3gfuhy.sv\"  -work altera_merlin_axi_slave_ni_1971"                                             
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_pri_mux_g3gfuhy.sv\"  -work altera_merlin_axi_slave_ni_1971"                                              
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_sipo_plus_g3gfuhy.sv\"  -work altera_merlin_axi_slave_ni_1971"                                            
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/apf_altera_merlin_axi_slave_ni_1971_g3gfuhy.sv\"  -work altera_merlin_axi_slave_ni_1971"                     
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_router_1921/sim/apf_altera_merlin_router_1921_a646sqa.sv\"  -work altera_merlin_router_1921"                                       
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_router_1921/sim/apf_altera_merlin_router_1921_bbaqrwi.sv\"  -work altera_merlin_router_1921"                                       
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_router_1921/sim/apf_altera_merlin_router_1921_qrp6k3i.sv\"  -work altera_merlin_router_1921"                                       
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_router_1921/sim/apf_altera_merlin_router_1921_bxgv4da.sv\"  -work altera_merlin_router_1921"                                       
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_router_1921/sim/apf_altera_merlin_router_1921_4sjj5kq.sv\"  -work altera_merlin_router_1921"                                       
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_router_1921/sim/apf_altera_merlin_router_1921_uaklday.sv\"  -work altera_merlin_router_1921"                                       
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_router_1921/sim/apf_altera_merlin_router_1921_tmd2eti.sv\"  -work altera_merlin_router_1921"                                       
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_router_1921/sim/apf_altera_merlin_router_1921_qq4w7ta.sv\"  -work altera_merlin_router_1921"                                       
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/apf_altera_merlin_traffic_limiter_altera_avalon_sc_fifo_1921_ho5tama.v\"  -work altera_merlin_traffic_limiter_1921" 
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/altera_merlin_reorder_memory.sv\"  -work altera_merlin_traffic_limiter_1921"                              
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/altera_avalon_st_pipeline_base.v\"  -work altera_merlin_traffic_limiter_1921"                             
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/apf_altera_merlin_traffic_limiter_1921_p5flxai.sv\"  -work altera_merlin_traffic_limiter_1921"            
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/apf_altera_merlin_demultiplexer_1921_ibov6ma.sv\"  -work altera_merlin_demultiplexer_1921"                  
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/apf_altera_merlin_demultiplexer_1921_4cdysia.sv\"  -work altera_merlin_demultiplexer_1921"                  
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/apf_altera_merlin_multiplexer_1922_gpq72ii.sv\"  -work altera_merlin_multiplexer_1922"                        
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv\"  -work altera_merlin_multiplexer_1922"                                          
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/apf_altera_merlin_multiplexer_1922_2jnytna.sv\"  -work altera_merlin_multiplexer_1922"                        
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv\"  -work altera_merlin_multiplexer_1922"                                          
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/apf_altera_merlin_demultiplexer_1921_hfula6q.sv\"  -work altera_merlin_demultiplexer_1921"                  
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/apf_altera_merlin_demultiplexer_1921_gu3jqaq.sv\"  -work altera_merlin_demultiplexer_1921"                  
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/apf_altera_merlin_multiplexer_1922_n3ujnhi.sv\"  -work altera_merlin_multiplexer_1922"                        
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv\"  -work altera_merlin_multiplexer_1922"                                          
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/apf_altera_merlin_multiplexer_1922_tigfd3y.sv\"  -work altera_merlin_multiplexer_1922"                        
    lappend design_files "vlogan +v2k -sverilog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv\"  -work altera_merlin_multiplexer_1922"                                          
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_mm_interconnect_1920/sim/apf_altera_mm_interconnect_1920_tpkmrta.v\"  -work altera_mm_interconnect_1920"                                            
    lappend design_files "vlogan +v2k $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/apf.v\"  -work apf"                                                                                                                                           
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
