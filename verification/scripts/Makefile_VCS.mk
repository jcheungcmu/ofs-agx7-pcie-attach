# Copyright (C) 2021 Intel Corporation
# SPDX-License-Identifier: MIT

#// Description:
#//  	Makefile for VCS
#// 
#// Author:  Krupa Shah
#//
#// $Id: Makefile_VCS.mk $
#////////////////////////////////////////////////////////////////////////////////////////////////

ifndef OFS_ROOTDIR
    $(error undefined OFS_ROOTDIR)
endif
ifndef WORKDIR
    WORKDIR := $(OFS_ROOTDIR)
endif

#ifndef UVM_HOME
#    $(error undefined UVM_HOME)
#endif 

#ifndef TESTNAME
#    $(error undefined TESTNAME)
#endif    

# Enable parallel/partial compilation by default. This is so much faster
# that we should consider removing the non-parallel version.
PARTCMP=1
DEBUG=1

SCRIPTS_DIR = $(OFS_ROOTDIR)/sim/scripts
VERIF_SCRIPTS_DIR = $(VERDIR)/scripts

TEST_DIR :=  $(shell $(VERIF_SCRIPTS_DIR)/create_dir.pl $(VERDIR)/sim/$(TESTNAME) )

VCDFILE = $(VERIF_SCRIPTS_DIR)/vpd_dump.key
FSDBFILE = $(VERIF_SCRIPTS_DIR)/fsdb_dump.tcl

ADP_DIR = $(OFS_ROOTDIR)/sim/scripts/
QPROJ_DIR = $(ADP_DIR)/qip_gen/quartus_proj_dir
QIP_DIR = $(ADP_DIR)/qip_sim_script

FPGA_FAMILY = agilex7

# Configure the build target, specifying the board and OFSS IP definitions.
# These can be overridden on the make command line, e.g. BOARD=<board>.
ifdef FTILE_SIM
  BOARD = fseries-dk
  ifeq ($(ETH_200G),1)
   OFSS = "$(OFS_ROOTDIR)"/tools/ofss_config/hssi/hssi_2x200_ftile.ofss
  else ifeq ($(ETH_400G),1)
   OFSS = "$(OFS_ROOTDIR)"/tools/ofss_config/hssi/hssi_1x400_ftile.ofss
  endif
else ifeq ($(n6000_100G),1)
  BOARD = n6000
else ifeq ($(RTILE_SIM),1)
  BOARD = iseries-dk
  # Default to Gen5 2x8. For Gen5x16 set "OFSS=" (empty).
  OFSS = "$(OFS_ROOTDIR)"/tools/ofss_config/pcie/pcie_host_2link.ofss
else
  BOARD = n6001
endif

export VIPDIR = $(VERDIR)
export RALDIR = $(VERDIR)/testbench/ral

VLOG_OPT = -kdb -full64 -error=noMPD -ntb_opts uvm-1.2 +vcs+initreg+random +vcs+lic+wait -ntb_opts dtm -sverilog -timescale=1ns/1ns +libext+.v+.sv -assert enable_diag -ignore unique_checks
VLOG_OPT += -Mdir=./csrc +warn=noBCNACMBP -CFLAGS -y $(VERDIR)/vip/pcie_vip/src/verilog/vcs -y $(VERDIR)/vip/pcie_vip/src/sverilog/vcs -P $(VERIF_SCRIPTS_DIR)/vip/pli.tab $(WORKDIR)/scripts/vip/msglog.o -notice  +incdir+./
ifneq ($(PARTCMP),1)
  VLOG_OPT += -work work
endif
VLOG_OPT += +define+IGNORE_DF_SIM_EXIT  

ifeq ($(n6000_10G),1)
VLOG_OPT += +define+INCLUDE_CVL +define+ENABLE_8_TO_15_PORTS +define+ETH_10G +define+SIM_SERIAL +define+n6000_10G #Includes CVL by passthrough logic
VLOG_OPT += +define+SVT_ETHERNET
VLOG_OPT += +define+SVT_ETHERNET_DEBUG_BUS_ENABLE
else ifeq ($(n6000_25G),1)
VLOG_OPT += +define+INCLUDE_CVL +define+ENABLE_8_TO_15_PORTS +define+ETH_25G +define+SIM_SERIAL +define+n6000_25G #Includes CVL by passthrough logic
VLOG_OPT += +define+SVT_ETHERNET
VLOG_OPT += +define+SVT_ETHERNET_DEBUG_BUS_ENABLE
else ifeq ($(n6000_100G),1)
VLOG_OPT += +define+INCLUDE_CVL +define+ENABLE_8_TO_15_PORTS +define+ETH_100G +define+SIM_SERIAL +define+n6000_100G #Includes CVL by passthrough logic
VLOG_OPT += +define+SVT_ETHERNET
VLOG_OPT += +define+SVT_ETHERNET_DEBUG_BUS_ENABLE
else
VLOG_OPT += +define+FIM_C +define+SIM_VIP 
VLOG_OPT += +define+SVT_ETHERNET +define+VIP_ETHERNET_40G100G_OPT_SVT
VLOG_OPT += +define+ETH_CAUI_25G_INTERFACE_WIDTH=8 +define+SVT_ETHERNET_CLKGEN
VLOG_OPT += +define+VIP_ETHERNET_100G_SVT +define+SVT_ETHERNET_DEBUG_BUS_ENABLE
endif

VLOG_OPT += +define+INCLUDE_PCIE_SS
VLOG_OPT += +define+INCLUDE_MEM_TG +define+INCLUDE_PR
VLOG_OPT += +define+SIM_MODE +define+PU_MMIO #Enable PCIE Serial link up for p-tile and Power user MMIO for PO FIM
VLOG_OPT += +define+SIMULATION_MODE
VLOG_OPT += +define+bypass_address    #bypass UNIMPLEMENTED_ADDRESS
VLOG_OPT += +define+UVM_DISABLE_AUTO_ITEM_RECORDING +define+UVM_NO_DEPRECATED
VLOG_OPT += +define+UVM_PACKER_MAX_BYTES=1500000
VLOG_OPT += +define+MMIO_TIMEOUT_IN_CYCLES=2000
VLOG_OPT += +define+SVT_UVM_TECHNOLOGY +define+SVT_PCIE_ENABLE_10_BIT_TAGS
VLOG_OPT += +define+SVT_ETHERNET +define+VIP_ETHERNET_40G100G_OPT_SVT
VLOG_OPT += +define+ETH_CAUI_25G_INTERFACE_WIDTH=8 +define+SVT_ETHERNET_CLKGEN
VLOG_OPT += +define+VIP_ETHERNET_100G_SVT +define+SVT_ETHERNET_DEBUG_BUS_ENABLE
VLOG_OPT += +define+SYNOPSYS_SV

ifdef FTILE_SIM
    FTILE_SERDES = 1
    VLOG_OPT += +define+FTILE_SIM
endif

ifdef RTILE_SIM
    FTILE_SERDES = 1
    VLOG_OPT += +define+RTILE_SIM
endif

ifdef FTILE_SERDES
    ifndef NO_HSSI
        VLOG_OPT += +define+FTILE_HSSI_SIM
    endif

    ifdef ETH_200G
        VLOG_OPT += +define+ETH_200G +define+ENABLE_8_TO_15_PORTS
    endif
    ifdef ETH_400G
        VLOG_OPT += +define+ETH_400G +define+VIP_ETHERNET_400G_SVT +define+ETH_INTERFACE_WIDTH=40 +define+ENABLE_8_TO_15_PORTS
    endif

    VLOG_OPT += +define+TOP_LEVEL_ENTITY_INSTANCE_PATH=tb_top.DUT
    VLOG_OPT += +define+QUARTUS_ENABLE_DPI_FORCE
    VLOG_OPT += +define+SPEC_FORCE

    # See Fast Simulation Macros for the Agilex 7 F-Tile Hard IP
    # https://www.intel.com/content/dam/support/us/en/programmable/kdb/2024/ip/Fast-Simulation-Macros-for-the-Agilex%E2%84%A2%207-F-Tile-Hard-IP.pdf
    VLOG_OPT += +define+IP7581SERDES_UX_SIMSPEED
    VLOG_OPT += +define+IP7581SERDES_UXS2T1R1PGD_PIPE_SPEC_FORCE
    VLOG_OPT += +define+IP7581SERDES_UXS2T1R1PGD_PIPE_SIMULATION
    VLOG_OPT += +define+IP7581SERDES_UXS2T1R1PGD_PIPE_FAST_SIM
    VLOG_OPT += +define+SRC_SPEC_SPEED_UP
    # There appears to be a race during cold reset between the simulated NIOS-based
    # F-Tile HSSI reset controller and the simulated CSR clock IOPLL setup.
    # If the CSR clock is too late, HSSI reset ACK wires get stuck high and ports
    # never become active. Use the non-NIOS simulation controller instead.
    VLOG_OPT += +define+REMOVE_SRC_NIOS

    VLOG_OPT += +define+TIMESCALE_EN
    VLOG_OPT += +define+INTC_FUNCTIONAL
    VLOG_OPT += +define+__SRC_TEST__
    VLOG_OPT += +define+gdrb_TIMESCALE_EN +define+RTLSIM +define+gdrb_INTC_FUNCTIONAL +define+SSM_SEQUENCE
endif

VLOG_OPT += +define+ETH_FORCE_FS_TIME_PRECISION
VLOG_OPT += +define+BASE_AFU=dummy_afu+
# The simulator functional model may be driven by IP configuration in <proj dir>/ofs_ip_cfg_db
VLOG_OPT += +incdir+$(QPROJ_DIR) +incdir+$(QPROJ_DIR)/ofs_ip_cfg_db
VLOG_OPT += +incdir+$(RALDIR)

VCS_OPT = -full64 -ntb_opts uvm-1.2 -licqueue +vcs+lic+wait -l vcs.log
VCS_OPT += -ignore initializer_driver_checks

ifeq ($(PARTCMP),1)
    VLOG_OPT += +define+SVT_PCIE_OPTIMIZED_COMPILE

    VCS_OPT += -j4 -partcomp ofs_tb_lib.tb_top -partcomp_dir=./libraries/ofs_partition_lib
    VCS_OPT += -fastpartcomp=j8 +optconfigfile+$(VERIF_SCRIPTS_DIR)/pc.optcfg
endif

ifdef FTILE_SERDES
    VCS_OPT += -pvalue+tb_top.DUT.local_mem_wrapper.mem_ss_top.mem_ss_inst.mem_ss.emif_cal_top.emif_cal_top.emif_cal.IOSSM_USE_MODEL=0
endif

VCS_OPT += -xlrm uniq_prior_final
VCS_OPT += -debug_access+wn+pp+dmptf -debug_region+cell+encrypt -debug_region+cell+lib
VCS_OPT += $(QUARTUS_INSTALL_DIR)/eda/sim_lib/quartus_dpi.c $(QUARTUS_INSTALL_DIR)/eda/sim_lib/simsf_dpi.cpp

SIMV_OPT = +UVM_TESTNAME=$(TESTNAME) +TIMEOUT=$(TIMEOUT)
#SIMV_OPT += +UVM_NO_RELNOTES
SIMV_OPT += +ntb_disable_cnst_null_object_warning=1 -assert nopostproc +vcs+lic+wait +vcs+initreg+0 
#SIMV_OPT += +UVM_PHASE_TRACE
SIMV_OPT +=  +vcs+lic+wait 
SIMV_OPT += +vcs+nospecify+notimingchecks +vip_verbosity=svt_pcie_pl:UVM_NONE,svt_pcie_dl:UVM_NONE,svt_pcie_tl:UVM_NONE  

ifndef SEED
    SIMV_OPT += +ntb_random_seed_automatic
else
    SIMV_OPT += +ntb_random_seed=$(SEED)
endif
ifdef TEST_LPBK
    VLOG_OPT += +define+TEST_LPBK 
endif

ifdef LPBK_WITHOUT_HSSI
    VLOG_OPT += +define+LPBK_WITHOUT_HSSI 
endif

ifndef MSG
    SIMV_OPT += +UVM_VERBOSITY=LOW
else
    SIMV_OPT += +UVM_VERBOSITY=$(MSG)
endif


##
## The INCLUDE_* macros from the project are commented out for
## simulation so that the simulation scripts can control them.
## Check for select project macros and replicate them.
M := $(shell grep -q INCLUDE_PMCI "$(SCRIPTS_DIR)"/generated_rtl_flist_macros.f; echo $$?)
ifeq ($(M),0)
    VLOG_OPT += +define+INCLUDE_PMCI
endif

M := $(shell grep -q INCLUDE_UART "$(SCRIPTS_DIR)"/generated_rtl_flist_macros.f; echo $$?)
ifeq ($(M),0)
    VLOG_OPT += +define+INCLUDE_UART
endif

M := $(shell grep -q INCLUDE_USER_CLK "$(SCRIPTS_DIR)"/generated_rtl_flist_macros.f; echo $$?)
ifeq ($(M),0)
    VLOG_OPT += +define+INCLUDE_USER_CLK
endif

ifdef NO_MSIX
    VLOG_OPT += +define+NO_MSIX 
endif

ifndef NO_HSSI
    VLOG_OPT += +define+INCLUDE_HSSI 
endif

ifdef DUMP
    SIMV_OPT += -ucli -i $(VCDFILE)
endif

ifdef DUMP_FSDB
    SIMV_OPT += -ucli -i $(FSDBFILE)
endif

ifneq ($(DEBUG),0)
    SIMV_OPT += -l runsim.log
    VLOG_OPT += +define+RUNSIM
endif

ifdef GUI
    VCS_OPT += -debug_all +memcbk
    SIMV_OPT += -gui
endif

ifdef QUIT
    SIMV_OPT_EXTRA = +UVM_MAX_QUIT_COUNT=1
else
   SIMV_OPT_EXTRA = ""
endif

ifdef COV 
    VLOG_OPT += -debug_all 
    VCS_OPT += -debug_all 
    VLOG_OPT += +define+COV -debug_all -cm line+cond+fsm+tgl+branch -cm_dir simv.vdb
    VCS_OPT  += -debug_all -cm line+cond+fsm+tgl+branch  -cm_dir simv.vdb 
    SIMV_OPT += -cm line+cond+fsm+tgl+branch -cm_name $(TESTNAME) -cm_dir ../regression.vdb
    #SIMV_OPT += -cm line+cond+fsm+tgl+branch -cm_name seed.1 -cm_dir regression.vdb
endif

ifdef COV_FUNCTIONAL
		COV_TST := $(shell basename $(TEST_DIR))
    VLOG_OPT += +define+ENABLE_AC_COVERAGE+define+ENABLE_COV_MSG+define+COV_FUNCTIONAL -cm line+cond+fsm+tgl+branch -cm_dir simv.vdb
    VCS_OPT  += -cm line+cond+fsm+tgl+branch+assert  -cm_dir simv.vdb
    SIMV_OPT += -cm line+cond+fsm+tgl+branch+assert+group -cm_name $(COV_TST) -cm_dir ../regression.vdb
    #SIMV_OPT += -cm line+cond+fsm+tgl+branch -cm_name seed.1 -cm_dir regression.vdb
endif

ifndef DISABLE_EMIF
  VLOG_OPT += +define+INCLUDE_DDR4
  VLOG_OPT += +define+INCLUDE_LOCAL_MEM
  VLOG_OPT += +define+SIM_MODE_NO_MSS_RST
endif

## The Platform Interface Manager is always available for use by AFUs,
## whether or not a specific AFU requires it. These parameters define
## the platform-dependent PIM instance that will be created below
## during cmplib.
PIM_TEMPLATE_DIR=$(QPROJ_DIR)/afu_with_pim/pim_template

ifndef AFU_WITH_PIM
    # No PIM. Use the default exerciser AFU.
    AFU_FLIST_IMPORT=-F $(OFS_ROOTDIR)/sim/scripts/rtl_afu_default.f
else
    # Simulating an AFU wrapped by the PIM's ofs_plat_afu() top-level
    # module wrapper.
    AFU_WITH_PIM_DIR=$(VERDIR)/sim/afu_with_pim
    AFU_FLIST_IMPORT=-F $(AFU_WITH_PIM_DIR)/afu_sim_files.list
endif

batch: vcs
	./simv $(SIMV_OPT) $(SIMV_OPT_EXTRA)

dump:
	make DUMP=1

clean:
	@rm -rf simv* csrc *.out* *.OUT *.log *.txt *.h *.setup *.vpd .vlogansetup.* *.tr *.hex *.xml DVEfiles
	@rm -rf $(VERDIR)/sim $(VERDIR)/vip

clean_dve:
	@rm -rf simv* csrc *.out* *.OUT *.log *.txt *.h *.setup *.vpd .vlogansetup.* *.tr *.hex *.xml

## Generate the target FIM and collect the files to simulate. This stage is identical
## to the command used to generate a FIM for unit test. If you have already run
## gen_sim_files.sh for unit test and want to use the same environment there is
## no need to build cmplib. Just do a "make clean".
cmplib: clean
ifdef OFSS
	sh "$(OFS_ROOTDIR)"/ofs-common/scripts/common/sim/gen_sim_files.sh --ofss $(OFSS) $(BOARD)
else
	sh "$(OFS_ROOTDIR)"/ofs-common/scripts/common/sim/gen_sim_files.sh $(BOARD)
endif

## $(VERDIR)/sim is built once during setup. It is deleted by clean or
## as a side-effect of cmplib.
$(VERDIR)/sim:
	test -s $(VERDIR)/sim || mkdir $(VERDIR)/sim
	test -s $(VERDIR)/vip || mkdir $(VERDIR)/vip
	test -s $(VERDIR)/vip/axi_vip || mkdir $(VERDIR)/vip/axi_vip
	test -s $(VERDIR)/vip/pcie_vip || mkdir $(VERDIR)/vip/pcie_vip

## One time initialization of the sim directory:
##  - Quartus base simulation libraries
##  - VIP/UVM initialization
##  - FIM/AFU library definitions
$(VERDIR)/sim/synopsys_sim.setup: | $(VERDIR)/sim
	@# Copy the Quartus libraries that were pre-compiled by gen_sim_files.sh
	rsync -a $(QIP_DIR)/quartus_libs/vcsmx/ $(VERDIR)/sim/
	@# Defined libraries that will be built for simulation
ifeq ($(PARTCMP),1)
	echo ofs_svt_lib: ./libraries/ofs_svt_lib >> $@
	echo ofs_ip_lib:  ./libraries/ofs_ip_lib  >> $@
	echo ofs_fim_lib: ./libraries/ofs_fim_lib >> $@
	echo ofs_tb_lib:  ./libraries/ofs_tb_lib  >> $@
endif
	@# Memory initialization files from the FIM build
	cd $(VERDIR)/sim && sh "$(OFS_ROOTDIR)"/sim/scripts/ip_flist.sh
	@# Create a dummy files in case no other init files exist for the model.
	@# Rules below assume the existence of at least one file of each type.
	touch $(VERDIR)/sim/dummy.hex
	touch $(VERDIR)/sim/serdes.firmware.rom
	cp -f $(OFS_ROOTDIR)/ofs-common/src/common/fme_id_rom/fme_id.mif $(VERDIR)/sim/
	@# Support logic files from quartus_tlg (ofs_top_auto_tiles) for F and R-Tile
	for f in "$(QPROJ_DIR)"/support_logic/*.mif; do if [ -f "$$f" ]; then cp -f "$$f" $(VERDIR)/sim/; fi; done
ifdef FTILE_SERDES
	if [ -d "$(QUARTUS_ROOTDIR)/libraries/megafunctions/f_tile_soft_reset_ctlr_ip_v1" ]; then cp -f $(QUARTUS_ROOTDIR)/libraries/megafunctions/f_tile_soft_reset_ctlr_ip_v1/*.hex $(VERDIR)/sim/; fi
	cp -f $(OFS_ROOTDIR)/ofs-common/src/common/he_hssi/pkt_client_mac_seg/*.hex $(VERDIR)/sim/
endif
	@echo ''
	@echo VCS_HOME: $(VCS_HOME)
	@$(DESIGNWARE_HOME)/bin/dw_vip_setup -path ../vip/axi_vip -add axi_system_env_svt -svlog
	@$(DESIGNWARE_HOME)/bin/dw_vip_setup -path ../vip/pcie_vip -add pcie_device_agent_svt -svlog
	@$(DESIGNWARE_HOME)/bin/dw_vip_setup -path ../vip/ethernet_vip -add ethernet_agent_svt -svlog
	@echo ''  

## Generate or update the sim directory, starting with the sim template.
## This step runs before the potentially parallel vlog_* rules below are run.
setup: | $(VERDIR)/sim/synopsys_sim.setup clean_dve
ifdef AFU_WITH_PIM
	# Construct the simulation build environment for the target AFU
	"$(OFS_ROOTDIR)"/ofs-common/scripts/common/sim/ofs_pim_sim_setup.sh -t "$(AFU_WITH_PIM_DIR)" -r "$(PIM_TEMPLATE_DIR)" "$(AFU_WITH_PIM)"
endif
	cd $(VERDIR)/sim && vlogan -full64 -ntb_opts uvm-1.2 -sverilog -timescale=1ns/1ns -l vlog_uvm.log

.NOTPARALLEL: setup

vlog_ofs_fim_lib:  
	cd $(VERDIR)/sim && vlogan $(VLOG_OPT) -F $(SCRIPTS_DIR)/generated_rtl_flist.f $(AFU_FLIST_IMPORT) -work ofs_fim_lib -l vlog_ofs_fim_lib.log

vlog_ofs_ip_lib: 
	cd $(VERDIR)/sim && vlogan $(VLOG_OPT) -F $(SCRIPTS_DIR)/ip_flist.f -work ofs_ip_lib -l vlog_ofs_ip_lib.log

vlog_ofs_tb_lib: 
	cd $(VERDIR)/sim && vlogan $(VLOG_OPT) -F $(VERIF_SCRIPTS_DIR)/ver_list.f -work ofs_tb_lib -l vlog_ofs_tb_lib.log

vlog_ofs_svt_lib:  
	cd $(VERDIR)/sim && vlogan $(VLOG_OPT) -F $(VERIF_SCRIPTS_DIR)/svt_list.f -work ofs_svt_lib -l vlog_ofs_svt_lib.log

ifeq ($(PARTCMP),1)
vlog_adp: setup vlog_ofs_fim_lib vlog_ofs_ip_lib vlog_ofs_svt_lib vlog_ofs_tb_lib
else
vlog_adp: setup 
	cd $(VERDIR)/sim && vlogan -full64 -ntb_opts uvm-1.2 -sverilog -timescale=1ns/1ns -l vlog_uvm.log
	cd $(VERDIR)/sim && vlogan $(VLOG_OPT) -l vlog.log -F $(SCRIPTS_DIR)/ip_flist.f -F $(SCRIPTS_DIR)/generated_rtl_flist.f -F $(VERIF_SCRIPTS_DIR)/svt_list.f -F $(VERIF_SCRIPTS_DIR)/ver_list.f $(AFU_FLIST_IMPORT)
endif 

ifeq ($(PARTCMP),1)
build: vlog_adp
	cd $(VERDIR)/sim && vcs $(VCS_OPT)
else
build: vlog_adp
	cd $(VERDIR)/sim && vcs $(VCS_OPT) tb_top
endif

#ifdef DUMP_FSDB
#	 @arc shell synopsys_verdi/R-2020.12-SP2 synopsys_verdi-lic/config
#endif


build_gka: cmplib build
.NOTPARALLEL: build_gka

view:
	dve -full64 -vpd inter.vpd &

run:
ifndef TEST_DIR
	$(error undefined TESTNAME)
else
	mkdir $(TEST_DIR)
	cp -f $(VERDIR)/sim/*.hex $(TEST_DIR)
	cp -f $(VERDIR)/sim/*.mif $(TEST_DIR)
	cp -f $(VERDIR)/sim/*.rom $(TEST_DIR)
	cd $(TEST_DIR) && ../simv $(SIMV_OPT) $(SIMV_OPT_EXTRA)
endif

rundb:    
ifndef TESTNAME
	$(error undefined TESTNAME)
else
	cd $(VERDIR)/sim && ./simv $(SIMV_OPT) $(SIMV_OPT_EXTRA)
endif

# Compatibility rules
cmplib_adp: cmplib
build_adp: build

build_run: vcs run
build_all: cmplib vcs
do_it_all: cmplib vcs run
