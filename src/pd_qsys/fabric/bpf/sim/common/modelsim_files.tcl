source [file join [file dirname [info script]] ./../../../ip/bpf/bpf_fme_slv/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/bpf/bpf_default_slv/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/bpf/bpf_hssi_slv/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/bpf/bpf_pmci_lpbk_mst/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/bpf/bpf_pmci_mst/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/bpf/bpf_qsfp0_slv/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/bpf/bpf_apf_slv/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/bpf/bpf_emif_slv/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/bpf/bpf_reset_bridge/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/bpf/bpf_pcie_slv/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/bpf/bpf_clock_bridge/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/bpf/bpf_apf_mst/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/bpf/bpf_pmci_slv/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/bpf/bpf_qsfp1_slv/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/bpf/bpf_fme_mst/sim/common/modelsim_files.tcl]
source [file join [file dirname [info script]] ./../../../ip/bpf/bpf_pmci_lpbk_slv/sim/common/modelsim_files.tcl]

namespace eval bpf {
  proc get_design_libraries {} {
    set libraries [dict create]
    set libraries [dict merge $libraries [bpf_fme_slv::get_design_libraries]]
    set libraries [dict merge $libraries [bpf_default_slv::get_design_libraries]]
    set libraries [dict merge $libraries [bpf_hssi_slv::get_design_libraries]]
    set libraries [dict merge $libraries [bpf_pmci_lpbk_mst::get_design_libraries]]
    set libraries [dict merge $libraries [bpf_pmci_mst::get_design_libraries]]
    set libraries [dict merge $libraries [bpf_qsfp0_slv::get_design_libraries]]
    set libraries [dict merge $libraries [bpf_apf_slv::get_design_libraries]]
    set libraries [dict merge $libraries [bpf_emif_slv::get_design_libraries]]
    set libraries [dict merge $libraries [bpf_reset_bridge::get_design_libraries]]
    set libraries [dict merge $libraries [bpf_pcie_slv::get_design_libraries]]
    set libraries [dict merge $libraries [bpf_clock_bridge::get_design_libraries]]
    set libraries [dict merge $libraries [bpf_apf_mst::get_design_libraries]]
    set libraries [dict merge $libraries [bpf_pmci_slv::get_design_libraries]]
    set libraries [dict merge $libraries [bpf_qsfp1_slv::get_design_libraries]]
    set libraries [dict merge $libraries [bpf_fme_mst::get_design_libraries]]
    set libraries [dict merge $libraries [bpf_pmci_lpbk_slv::get_design_libraries]]
    dict set libraries altera_merlin_axi_master_ni_1962     1
    dict set libraries altera_avalon_sc_fifo_1931           1
    dict set libraries altera_merlin_axi_slave_ni_1971      1
    dict set libraries altera_avalon_st_pipeline_stage_1930 1
    dict set libraries altera_merlin_router_1921            1
    dict set libraries altera_merlin_traffic_limiter_1921   1
    dict set libraries altera_merlin_demultiplexer_1921     1
    dict set libraries altera_merlin_multiplexer_1922       1
    dict set libraries altera_mm_interconnect_1920          1
    dict set libraries bpf                                  1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    set memory_files [concat $memory_files [bpf_fme_slv::get_memory_files "$QSYS_SIMDIR/../../ip/bpf/bpf_fme_slv/sim/"]]
    set memory_files [concat $memory_files [bpf_default_slv::get_memory_files "$QSYS_SIMDIR/../../ip/bpf/bpf_default_slv/sim/"]]
    set memory_files [concat $memory_files [bpf_hssi_slv::get_memory_files "$QSYS_SIMDIR/../../ip/bpf/bpf_hssi_slv/sim/"]]
    set memory_files [concat $memory_files [bpf_pmci_lpbk_mst::get_memory_files "$QSYS_SIMDIR/../../ip/bpf/bpf_pmci_lpbk_mst/sim/"]]
    set memory_files [concat $memory_files [bpf_pmci_mst::get_memory_files "$QSYS_SIMDIR/../../ip/bpf/bpf_pmci_mst/sim/"]]
    set memory_files [concat $memory_files [bpf_qsfp0_slv::get_memory_files "$QSYS_SIMDIR/../../ip/bpf/bpf_qsfp0_slv/sim/"]]
    set memory_files [concat $memory_files [bpf_apf_slv::get_memory_files "$QSYS_SIMDIR/../../ip/bpf/bpf_apf_slv/sim/"]]
    set memory_files [concat $memory_files [bpf_emif_slv::get_memory_files "$QSYS_SIMDIR/../../ip/bpf/bpf_emif_slv/sim/"]]
    set memory_files [concat $memory_files [bpf_reset_bridge::get_memory_files "$QSYS_SIMDIR/../../ip/bpf/bpf_reset_bridge/sim/"]]
    set memory_files [concat $memory_files [bpf_pcie_slv::get_memory_files "$QSYS_SIMDIR/../../ip/bpf/bpf_pcie_slv/sim/"]]
    set memory_files [concat $memory_files [bpf_clock_bridge::get_memory_files "$QSYS_SIMDIR/../../ip/bpf/bpf_clock_bridge/sim/"]]
    set memory_files [concat $memory_files [bpf_apf_mst::get_memory_files "$QSYS_SIMDIR/../../ip/bpf/bpf_apf_mst/sim/"]]
    set memory_files [concat $memory_files [bpf_pmci_slv::get_memory_files "$QSYS_SIMDIR/../../ip/bpf/bpf_pmci_slv/sim/"]]
    set memory_files [concat $memory_files [bpf_qsfp1_slv::get_memory_files "$QSYS_SIMDIR/../../ip/bpf/bpf_qsfp1_slv/sim/"]]
    set memory_files [concat $memory_files [bpf_fme_mst::get_memory_files "$QSYS_SIMDIR/../../ip/bpf/bpf_fme_mst/sim/"]]
    set memory_files [concat $memory_files [bpf_pmci_lpbk_slv::get_memory_files "$QSYS_SIMDIR/../../ip/bpf/bpf_pmci_lpbk_slv/sim/"]]
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    set design_files [dict merge $design_files [bpf_fme_slv::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/bpf/bpf_fme_slv/sim/"]]
    set design_files [dict merge $design_files [bpf_default_slv::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/bpf/bpf_default_slv/sim/"]]
    set design_files [dict merge $design_files [bpf_hssi_slv::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/bpf/bpf_hssi_slv/sim/"]]
    set design_files [dict merge $design_files [bpf_pmci_lpbk_mst::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/bpf/bpf_pmci_lpbk_mst/sim/"]]
    set design_files [dict merge $design_files [bpf_pmci_mst::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/bpf/bpf_pmci_mst/sim/"]]
    set design_files [dict merge $design_files [bpf_qsfp0_slv::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/bpf/bpf_qsfp0_slv/sim/"]]
    set design_files [dict merge $design_files [bpf_apf_slv::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/bpf/bpf_apf_slv/sim/"]]
    set design_files [dict merge $design_files [bpf_emif_slv::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/bpf/bpf_emif_slv/sim/"]]
    set design_files [dict merge $design_files [bpf_reset_bridge::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/bpf/bpf_reset_bridge/sim/"]]
    set design_files [dict merge $design_files [bpf_pcie_slv::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/bpf/bpf_pcie_slv/sim/"]]
    set design_files [dict merge $design_files [bpf_clock_bridge::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/bpf/bpf_clock_bridge/sim/"]]
    set design_files [dict merge $design_files [bpf_apf_mst::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/bpf/bpf_apf_mst/sim/"]]
    set design_files [dict merge $design_files [bpf_pmci_slv::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/bpf/bpf_pmci_slv/sim/"]]
    set design_files [dict merge $design_files [bpf_qsfp1_slv::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/bpf/bpf_qsfp1_slv/sim/"]]
    set design_files [dict merge $design_files [bpf_fme_mst::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/bpf/bpf_fme_mst/sim/"]]
    set design_files [dict merge $design_files [bpf_pmci_lpbk_slv::get_common_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/bpf/bpf_pmci_lpbk_slv/sim/"]]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    set design_files [concat $design_files [bpf_fme_slv::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/bpf/bpf_fme_slv/sim/"]]
    set design_files [concat $design_files [bpf_default_slv::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/bpf/bpf_default_slv/sim/"]]
    set design_files [concat $design_files [bpf_hssi_slv::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/bpf/bpf_hssi_slv/sim/"]]
    set design_files [concat $design_files [bpf_pmci_lpbk_mst::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/bpf/bpf_pmci_lpbk_mst/sim/"]]
    set design_files [concat $design_files [bpf_pmci_mst::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/bpf/bpf_pmci_mst/sim/"]]
    set design_files [concat $design_files [bpf_qsfp0_slv::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/bpf/bpf_qsfp0_slv/sim/"]]
    set design_files [concat $design_files [bpf_apf_slv::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/bpf/bpf_apf_slv/sim/"]]
    set design_files [concat $design_files [bpf_emif_slv::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/bpf/bpf_emif_slv/sim/"]]
    set design_files [concat $design_files [bpf_reset_bridge::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/bpf/bpf_reset_bridge/sim/"]]
    set design_files [concat $design_files [bpf_pcie_slv::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/bpf/bpf_pcie_slv/sim/"]]
    set design_files [concat $design_files [bpf_clock_bridge::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/bpf/bpf_clock_bridge/sim/"]]
    set design_files [concat $design_files [bpf_apf_mst::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/bpf/bpf_apf_mst/sim/"]]
    set design_files [concat $design_files [bpf_pmci_slv::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/bpf/bpf_pmci_slv/sim/"]]
    set design_files [concat $design_files [bpf_qsfp1_slv::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/bpf/bpf_qsfp1_slv/sim/"]]
    set design_files [concat $design_files [bpf_fme_mst::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/bpf/bpf_fme_mst/sim/"]]
    set design_files [concat $design_files [bpf_pmci_lpbk_slv::get_design_files $USER_DEFINED_COMPILE_OPTIONS $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_VHDL_COMPILE_OPTIONS "$QSYS_SIMDIR/../../ip/bpf/bpf_pmci_lpbk_slv/sim/"]]
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_master_ni_1962/sim/altera_merlin_address_alignment.sv"]\"  -work altera_merlin_axi_master_ni_1962"                                     
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_master_ni_1962/sim/bpf_altera_merlin_axi_master_ni_1962_2kryw2a.sv"]\"  -work altera_merlin_axi_master_ni_1962"                        
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_avalon_sc_fifo_1931/sim/bpf_altera_avalon_sc_fifo_1931_fzgstwy.v"]\"  -work altera_avalon_sc_fifo_1931"                                               
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_sc_fifo_1971_6f46wua.v"]\"  -work altera_merlin_axi_slave_ni_1971"          
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_avalon_st_pipeline_stage_1930/sim/bpf_altera_avalon_st_pipeline_stage_1930_bv2ucky.sv"]\"  -work altera_avalon_st_pipeline_stage_1930"            
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_avalon_st_pipeline_stage_1930/sim/altera_avalon_st_pipeline_base.v"]\"  -work altera_avalon_st_pipeline_stage_1930"                               
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_a42nnri.v"]\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_h6wexfa.v"]\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_7asbqai.v"]\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_burst_uncompressor.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                      
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_address_alignment.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                       
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/compare_eq.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                            
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_response_mem_hfsbxta.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_comp_sel_hfsbxta.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_pri_mux_hfsbxta.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_sipo_plus_hfsbxta.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_response_mem_hfsbxta.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_comp_sel_hfsbxta.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_pri_mux_hfsbxta.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_sipo_plus_hfsbxta.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_1971_hfsbxta.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                           
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_sc_fifo_1971_zewvfuy.v"]\"  -work altera_merlin_axi_slave_ni_1971"          
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_a42nnri.v"]\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_h6wexfa.v"]\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_7asbqai.v"]\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_burst_uncompressor.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                      
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_address_alignment.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                       
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/compare_eq.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                            
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_response_mem_artnyka.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_comp_sel_artnyka.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_pri_mux_artnyka.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_sipo_plus_artnyka.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_response_mem_artnyka.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_comp_sel_artnyka.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_pri_mux_artnyka.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_sipo_plus_artnyka.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_1971_artnyka.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                           
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_sc_fifo_1971_zewvfuy.v"]\"  -work altera_merlin_axi_slave_ni_1971"          
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_a42nnri.v"]\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_h6wexfa.v"]\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_7asbqai.v"]\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_burst_uncompressor.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                      
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_address_alignment.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                       
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/compare_eq.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                            
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_response_mem_onpxjry.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_comp_sel_onpxjry.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_pri_mux_onpxjry.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_sipo_plus_onpxjry.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_response_mem_onpxjry.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_comp_sel_onpxjry.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_pri_mux_onpxjry.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_sipo_plus_onpxjry.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_1971_onpxjry.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                           
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_sc_fifo_1971_zewvfuy.v"]\"  -work altera_merlin_axi_slave_ni_1971"          
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_a42nnri.v"]\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_h6wexfa.v"]\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_7asbqai.v"]\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_burst_uncompressor.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                      
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_address_alignment.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                       
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/compare_eq.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                            
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_response_mem_jidvjzi.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_comp_sel_jidvjzi.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_pri_mux_jidvjzi.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_sipo_plus_jidvjzi.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_response_mem_jidvjzi.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_comp_sel_jidvjzi.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_pri_mux_jidvjzi.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_sipo_plus_jidvjzi.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_1971_jidvjzi.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                           
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_sc_fifo_1971_zewvfuy.v"]\"  -work altera_merlin_axi_slave_ni_1971"          
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_a42nnri.v"]\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_h6wexfa.v"]\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_7asbqai.v"]\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_burst_uncompressor.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                      
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_address_alignment.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                       
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/compare_eq.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                            
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_response_mem_47k3fca.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_comp_sel_47k3fca.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_pri_mux_47k3fca.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_sipo_plus_47k3fca.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_response_mem_47k3fca.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_comp_sel_47k3fca.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_pri_mux_47k3fca.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_sipo_plus_47k3fca.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_1971_47k3fca.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                           
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_sc_fifo_1971_zewvfuy.v"]\"  -work altera_merlin_axi_slave_ni_1971"          
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_a42nnri.v"]\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_h6wexfa.v"]\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_7asbqai.v"]\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_burst_uncompressor.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                      
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_address_alignment.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                       
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/compare_eq.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                            
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_response_mem_y32nn3y.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_comp_sel_y32nn3y.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_pri_mux_y32nn3y.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_sipo_plus_y32nn3y.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_response_mem_y32nn3y.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_comp_sel_y32nn3y.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_pri_mux_y32nn3y.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_sipo_plus_y32nn3y.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_1971_y32nn3y.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                           
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_sc_fifo_1971_zewvfuy.v"]\"  -work altera_merlin_axi_slave_ni_1971"          
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_a42nnri.v"]\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_h6wexfa.v"]\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_7asbqai.v"]\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_burst_uncompressor.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                      
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_address_alignment.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                       
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/compare_eq.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                            
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_response_mem_rgdvaay.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_comp_sel_rgdvaay.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_pri_mux_rgdvaay.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_sipo_plus_rgdvaay.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_response_mem_rgdvaay.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_comp_sel_rgdvaay.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_pri_mux_rgdvaay.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_sipo_plus_rgdvaay.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_1971_rgdvaay.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                           
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_sc_fifo_1971_zewvfuy.v"]\"  -work altera_merlin_axi_slave_ni_1971"          
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_a42nnri.v"]\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_h6wexfa.v"]\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_7asbqai.v"]\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_burst_uncompressor.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                      
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_address_alignment.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                       
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/compare_eq.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                            
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_response_mem_vcfvj5i.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_comp_sel_vcfvj5i.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_pri_mux_vcfvj5i.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_sipo_plus_vcfvj5i.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_response_mem_vcfvj5i.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_comp_sel_vcfvj5i.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_pri_mux_vcfvj5i.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_sipo_plus_vcfvj5i.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_1971_vcfvj5i.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                           
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_sc_fifo_1971_zewvfuy.v"]\"  -work altera_merlin_axi_slave_ni_1971"          
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_a42nnri.v"]\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_h6wexfa.v"]\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_7asbqai.v"]\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_burst_uncompressor.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                      
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_address_alignment.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                       
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/compare_eq.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                            
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_response_mem_5c3miba.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_comp_sel_5c3miba.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_pri_mux_5c3miba.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_sipo_plus_5c3miba.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_response_mem_5c3miba.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_comp_sel_5c3miba.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_pri_mux_5c3miba.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_sipo_plus_5c3miba.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_1971_5c3miba.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                           
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_sc_fifo_1971_zewvfuy.v"]\"  -work altera_merlin_axi_slave_ni_1971"          
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_a42nnri.v"]\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_h6wexfa.v"]\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_7asbqai.v"]\"  -work altera_merlin_axi_slave_ni_1971"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_burst_uncompressor.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                      
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/altera_merlin_address_alignment.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                       
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/compare_eq.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                            
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_response_mem_tyzqqri.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_comp_sel_tyzqqri.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_pri_mux_tyzqqri.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/rd_sipo_plus_tyzqqri.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_response_mem_tyzqqri.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_comp_sel_tyzqqri.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_pri_mux_tyzqqri.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/wr_sipo_plus_tyzqqri.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_axi_slave_ni_1971/sim/bpf_altera_merlin_axi_slave_ni_1971_tyzqqri.sv"]\"  -work altera_merlin_axi_slave_ni_1971"                           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/bpf_altera_merlin_router_1921_dxb44hi.sv"]\"  -work altera_merlin_router_1921"                                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/bpf_altera_merlin_router_1921_a7quflq.sv"]\"  -work altera_merlin_router_1921"                                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/bpf_altera_merlin_router_1921_c2ajpdi.sv"]\"  -work altera_merlin_router_1921"                                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/bpf_altera_merlin_router_1921_ozxyppq.sv"]\"  -work altera_merlin_router_1921"                                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/bpf_altera_merlin_router_1921_72c3a4q.sv"]\"  -work altera_merlin_router_1921"                                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/bpf_altera_merlin_router_1921_f4yhgki.sv"]\"  -work altera_merlin_router_1921"                                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/bpf_altera_merlin_router_1921_stsce6y.sv"]\"  -work altera_merlin_router_1921"                                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/bpf_altera_merlin_router_1921_a6i454a.sv"]\"  -work altera_merlin_router_1921"                                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/bpf_altera_merlin_router_1921_fuvvuqq.sv"]\"  -work altera_merlin_router_1921"                                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/bpf_altera_merlin_router_1921_2d52dly.sv"]\"  -work altera_merlin_router_1921"                                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/bpf_altera_merlin_router_1921_wksrbji.sv"]\"  -work altera_merlin_router_1921"                                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/bpf_altera_merlin_router_1921_zhhqfji.sv"]\"  -work altera_merlin_router_1921"                                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/bpf_altera_merlin_router_1921_spslutq.sv"]\"  -work altera_merlin_router_1921"                                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_router_1921/sim/bpf_altera_merlin_router_1921_nywgomq.sv"]\"  -work altera_merlin_router_1921"                                             
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/bpf_altera_merlin_traffic_limiter_altera_avalon_sc_fifo_1921_ho5tama.v"]\"  -work altera_merlin_traffic_limiter_1921" 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/altera_merlin_reorder_memory.sv"]\"  -work altera_merlin_traffic_limiter_1921"                                    
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/altera_avalon_st_pipeline_base.v"]\"  -work altera_merlin_traffic_limiter_1921"                                   
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_traffic_limiter_1921/sim/bpf_altera_merlin_traffic_limiter_1921_p5flxai.sv"]\"  -work altera_merlin_traffic_limiter_1921"                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/bpf_altera_merlin_demultiplexer_1921_ti6d3uy.sv"]\"  -work altera_merlin_demultiplexer_1921"                        
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/bpf_altera_merlin_demultiplexer_1921_wkkjz7i.sv"]\"  -work altera_merlin_demultiplexer_1921"                        
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/bpf_altera_merlin_demultiplexer_1921_vtoouzq.sv"]\"  -work altera_merlin_demultiplexer_1921"                        
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/bpf_altera_merlin_multiplexer_1922_3dfdvma.sv"]\"  -work altera_merlin_multiplexer_1922"                              
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"]\"  -work altera_merlin_multiplexer_1922"                                                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/bpf_altera_merlin_multiplexer_1922_cdpjm4a.sv"]\"  -work altera_merlin_multiplexer_1922"                              
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"]\"  -work altera_merlin_multiplexer_1922"                                                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/bpf_altera_merlin_multiplexer_1922_mityqiq.sv"]\"  -work altera_merlin_multiplexer_1922"                              
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"]\"  -work altera_merlin_multiplexer_1922"                                                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/bpf_altera_merlin_demultiplexer_1921_twn2xqi.sv"]\"  -work altera_merlin_demultiplexer_1921"                        
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/bpf_altera_merlin_demultiplexer_1921_fum5tcq.sv"]\"  -work altera_merlin_demultiplexer_1921"                        
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_demultiplexer_1921/sim/bpf_altera_merlin_demultiplexer_1921_iraid2i.sv"]\"  -work altera_merlin_demultiplexer_1921"                        
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/bpf_altera_merlin_multiplexer_1922_d6pfiny.sv"]\"  -work altera_merlin_multiplexer_1922"                              
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"]\"  -work altera_merlin_multiplexer_1922"                                                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/bpf_altera_merlin_multiplexer_1922_foeu7bq.sv"]\"  -work altera_merlin_multiplexer_1922"                              
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"]\"  -work altera_merlin_multiplexer_1922"                                                
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/bpf_altera_merlin_multiplexer_1922_2hno62q.sv"]\"  -work altera_merlin_multiplexer_1922"                              
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1922/sim/altera_merlin_arbitrator.sv"]\"  -work altera_merlin_multiplexer_1922"                                                
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_mm_interconnect_1920/sim/bpf_altera_mm_interconnect_1920_thhyi2i.v"]\"  -work altera_mm_interconnect_1920"                                            
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/bpf.v"]\"  -work bpf"                                                                                                                                           
    return $design_files
  }
  
  proc get_elab_options {SIMULATOR_TOOL_BITNESS} {
    set ELAB_OPTIONS ""
    append ELAB_OPTIONS [bpf_fme_slv::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [bpf_default_slv::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [bpf_hssi_slv::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [bpf_pmci_lpbk_mst::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [bpf_pmci_mst::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [bpf_qsfp0_slv::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [bpf_apf_slv::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [bpf_emif_slv::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [bpf_reset_bridge::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [bpf_pcie_slv::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [bpf_clock_bridge::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [bpf_apf_mst::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [bpf_pmci_slv::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [bpf_qsfp1_slv::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [bpf_fme_mst::get_elab_options $SIMULATOR_TOOL_BITNESS]
    append ELAB_OPTIONS [bpf_pmci_lpbk_slv::get_elab_options $SIMULATOR_TOOL_BITNESS]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    append SIM_OPTIONS [bpf_fme_slv::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [bpf_default_slv::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [bpf_hssi_slv::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [bpf_pmci_lpbk_mst::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [bpf_pmci_mst::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [bpf_qsfp0_slv::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [bpf_apf_slv::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [bpf_emif_slv::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [bpf_reset_bridge::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [bpf_pcie_slv::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [bpf_clock_bridge::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [bpf_apf_mst::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [bpf_pmci_slv::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [bpf_qsfp1_slv::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [bpf_fme_mst::get_sim_options $SIMULATOR_TOOL_BITNESS]
    append SIM_OPTIONS [bpf_pmci_lpbk_slv::get_sim_options $SIMULATOR_TOOL_BITNESS]
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [bpf_fme_slv::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [bpf_default_slv::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [bpf_hssi_slv::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [bpf_pmci_lpbk_mst::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [bpf_pmci_mst::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [bpf_qsfp0_slv::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [bpf_apf_slv::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [bpf_emif_slv::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [bpf_reset_bridge::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [bpf_pcie_slv::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [bpf_clock_bridge::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [bpf_apf_mst::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [bpf_pmci_slv::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [bpf_qsfp1_slv::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [bpf_fme_mst::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    set LD_LIBRARY_PATH [dict merge $LD_LIBRARY_PATH [dict get [bpf_pmci_lpbk_slv::get_env_variables $SIMULATOR_TOOL_BITNESS] "LD_LIBRARY_PATH"]]
    dict set ENV_VARIABLES "LD_LIBRARY_PATH" $LD_LIBRARY_PATH
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ENV_VARIABLES
  }
  
  
  proc normalize_path {FILEPATH} {
      if {[catch { package require fileutil } err]} { 
          return $FILEPATH 
      } 
      set path [fileutil::lexnormalize [file join [pwd] $FILEPATH]]  
      if {[file pathtype $FILEPATH] eq "relative"} { 
          set path [fileutil::relative [pwd] $path] 
      } 
      return $path 
  } 
  proc get_dpi_libraries {QSYS_SIMDIR} {
    set libraries [dict create]
    set libraries [dict merge $libraries [bpf_fme_slv::get_dpi_libraries "$QSYS_SIMDIR/../../ip/bpf/bpf_fme_slv/sim/"]]
    set libraries [dict merge $libraries [bpf_default_slv::get_dpi_libraries "$QSYS_SIMDIR/../../ip/bpf/bpf_default_slv/sim/"]]
    set libraries [dict merge $libraries [bpf_hssi_slv::get_dpi_libraries "$QSYS_SIMDIR/../../ip/bpf/bpf_hssi_slv/sim/"]]
    set libraries [dict merge $libraries [bpf_pmci_lpbk_mst::get_dpi_libraries "$QSYS_SIMDIR/../../ip/bpf/bpf_pmci_lpbk_mst/sim/"]]
    set libraries [dict merge $libraries [bpf_pmci_mst::get_dpi_libraries "$QSYS_SIMDIR/../../ip/bpf/bpf_pmci_mst/sim/"]]
    set libraries [dict merge $libraries [bpf_qsfp0_slv::get_dpi_libraries "$QSYS_SIMDIR/../../ip/bpf/bpf_qsfp0_slv/sim/"]]
    set libraries [dict merge $libraries [bpf_apf_slv::get_dpi_libraries "$QSYS_SIMDIR/../../ip/bpf/bpf_apf_slv/sim/"]]
    set libraries [dict merge $libraries [bpf_emif_slv::get_dpi_libraries "$QSYS_SIMDIR/../../ip/bpf/bpf_emif_slv/sim/"]]
    set libraries [dict merge $libraries [bpf_reset_bridge::get_dpi_libraries "$QSYS_SIMDIR/../../ip/bpf/bpf_reset_bridge/sim/"]]
    set libraries [dict merge $libraries [bpf_pcie_slv::get_dpi_libraries "$QSYS_SIMDIR/../../ip/bpf/bpf_pcie_slv/sim/"]]
    set libraries [dict merge $libraries [bpf_clock_bridge::get_dpi_libraries "$QSYS_SIMDIR/../../ip/bpf/bpf_clock_bridge/sim/"]]
    set libraries [dict merge $libraries [bpf_apf_mst::get_dpi_libraries "$QSYS_SIMDIR/../../ip/bpf/bpf_apf_mst/sim/"]]
    set libraries [dict merge $libraries [bpf_pmci_slv::get_dpi_libraries "$QSYS_SIMDIR/../../ip/bpf/bpf_pmci_slv/sim/"]]
    set libraries [dict merge $libraries [bpf_qsfp1_slv::get_dpi_libraries "$QSYS_SIMDIR/../../ip/bpf/bpf_qsfp1_slv/sim/"]]
    set libraries [dict merge $libraries [bpf_fme_mst::get_dpi_libraries "$QSYS_SIMDIR/../../ip/bpf/bpf_fme_mst/sim/"]]
    set libraries [dict merge $libraries [bpf_pmci_lpbk_slv::get_dpi_libraries "$QSYS_SIMDIR/../../ip/bpf/bpf_pmci_lpbk_slv/sim/"]]
    
    return $libraries
  }
  
}
