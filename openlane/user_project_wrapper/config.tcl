# SPDX-FileCopyrightText: 2020 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# SPDX-License-Identifier: Apache-2.0

# Base Configurations. Don't Touch
# section begin

set ::env(PDK) "gf180mcuC"
set ::env(STD_CELL_LIBRARY) "gf180mcu_fd_sc_mcu7t5v0"

# YOU CAN CHANGE ANY VARIABLES DEFINED IN THE DEFAULT WRAPPER CFGS BY OVERRIDING THEM IN THIS CONFIG.TCL
source $::env(DESIGN_DIR)/fixed_dont_change/default_wrapper_cfgs.tcl

set ::env(DESIGN_NAME) user_project_wrapper
#section end

# User Configurations

## Source Verilog Files
set ::env(VERILOG_FILES) "\
	$::env(CARAVEL_ROOT)/verilog/rtl/defines.v \
	$::env(CARAVEL_ROOT)/verilog/rtl/Wishbone/WishboneSlave.v \
	$::env(DESIGN_DIR)/../../verilog/rtl/user_project_wrapper.v"

## Clock configurations
set ::env(CLOCK_PORT) "user_clock2"
set ::env(CLOCK_NET) "clk"

set ::env(CLOCK_PERIOD) "24.0"

## Internal Macros
### Macro PDN Connections
set ::env(FP_PDN_MACRO_HOOKS) "\
	mprj vdd vss vdd vss"

### Black-box verilog and views
set ::env(VERILOG_FILES_BLACKBOX) "\
	$::env(CARAVEL_ROOT)/verilog/rtl/defines.v \
	$::env(CARAVEL_ROOT)/verilog/rtl/DIGOTA/DiffDigota.v \
	$::env(CARAVEL_ROOT)/verilog/rtl/DIGOTA/DIGOTA.v \
	$::env(CARAVEL_ROOT)/verilog/rtl/Clocks/clkgate.v \
	$::env(CARAVEL_ROOT)/verilog/rtl/Clocks/clkmux2.v \
	$::env(CARAVEL_ROOT)/verilog/rtl/WaveTbl/WavePWM.v"

set ::env(EXTRA_LEFS) "\
	$::env(CARAVEL_ROOT)/../../lef/DiffDigota.lef \
	$::env(CARAVEL_ROOT)/../../lef/DIGOTA.lef \
	$::env(CARAVEL_ROOT)/../../lef/clkgate.lef \
	$::env(CARAVEL_ROOT)/../../lef/clkmux2.lef \
	$::env(CARAVEL_ROOT)/../../lef/WavePWM.lef"

set ::env(EXTRA_GDS_FILES) "\
	$::env(CARAVEL_ROOT)/../../gds/DiffDigota.gds \
	$::env(CARAVEL_ROOT)/../../gds/DIGOTA.gds \
	$::env(CARAVEL_ROOT)/../../gds/clkgate.gds \
	$::env(CARAVEL_ROOT)/../../gds/clkmux2.gds \
	$::env(CARAVEL_ROOT)/../../gds/WavePWM.gds"

set ::env(EXTRA_LIBS) "\
    $::env(DESIGN_DIR)/../../lib/DiffDigota.lib \
    $::env(DESIGN_DIR)/../../lib/DIGOTA.lib \
    $::env(CARAVEL_ROOT)/../../lib/clkgate.lib\
    $::env(CARAVEL_ROOT)/../../lib/clkmux2.lib\
    $::env(CARAVEL_ROOT)/../../lib/WavePWM.lib"

set ::env(RT_MAX_LAYER) {Metal4}

# disable pdn check nodes becuase it hangs with multiple power domains.
# any issue with pdn connections will be flagged with LVS so it is not a critical check.
set ::env(FP_PDN_CHECK_NODES) 0

# The following is because there are no std cells in the example wrapper project.
set ::env(SYNTH_ELABORATE_ONLY) 1
set ::env(PL_RANDOM_GLB_PLACEMENT) 1

set ::env(PL_RESIZER_DESIGN_OPTIMIZATIONS) 0
set ::env(PL_RESIZER_TIMING_OPTIMIZATIONS) 0
set ::env(PL_RESIZER_BUFFER_INPUT_PORTS) 0
set ::env(PL_RESIZER_BUFFER_OUTPUT_PORTS) 0

set ::env(FP_PDN_ENABLE_RAILS) 0

set ::env(DIODE_INSERTION_STRATEGY) 0
set ::env(RUN_FILL_INSERTION) 0
set ::env(RUN_TAP_DECAP_INSERTION) 0
set ::env(CLOCK_TREE_SYNTH) 0

# YOU ARE NOT ALLOWED TO CHANGE ANY VARIABLES DEFINED IN THE FIXED WRAPPER CFGS 
source $::env(DESIGN_DIR)/fixed_dont_change/fixed_wrapper_cfgs.tcl