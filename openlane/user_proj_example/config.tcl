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

set ::env(PDK) "gf180mcuC"
set ::env(STD_CELL_LIBRARY) "gf180mcu_fd_sc_mcu7t5v0"

set ::env(DESIGN_NAME) user_proj_example

set ::env(VERILOG_FILES) "\
	$::env(CARAVEL_ROOT)/verilog/rtl/defines.v \
	$::env(DESIGN_DIR)/../../verilog/rtl/Wishbone/WishboneSlave.v \
	$::env(DESIGN_DIR)/../../verilog/rtl/user_proj_example.v"

set ::env(DESIGN_IS_CORE) 0

set ::env(CLOCK_PORT) "wb_clk_i"
set ::env(CLOCK_NET) "clk"
set ::env(CLOCK_PERIOD) "24.0"

#set ::env(FP_SIZING) absolute
#set ::env(DIE_AREA) "0 0 900 600"

set ::env(FP_PIN_ORDER_CFG) $::env(DESIGN_DIR)/pin_order.cfg

set ::env(PL_BASIC_PLACEMENT) 0
set ::env(PL_TARGET_DENSITY) 0.50

set ::env(FP_CORE_UTIL) 40

set ::env(SYNTH_MAX_FANOUT) 4

### Macro PDN Connections
set ::env(FP_PDN_MACRO_HOOKS) "\
	mprj vdd vss vdd vss"

### Black-box verilog and views
set ::env(VERILOG_FILES_BLACKBOX) "\
	$::env(DESIGN_DIR)/../../verilog/rtl/defines.v \
	$::env(DESIGN_DIR)/../../verilog/rtl/DIGOTA/DiffDigota.v \
	$::env(DESIGN_DIR)/../../verilog/rtl/DIGOTA/DIGOTA.v \
	$::env(DESIGN_DIR)/../../verilog/rtl/Clocks/clkgate.v \
	$::env(DESIGN_DIR)/../../verilog/rtl/Clocks/clkmux2.v \
	$::env(DESIGN_DIR)/../../verilog/rtl/WaveTbl/WavePWM.v"

set ::env(EXTRA_LEFS) "\
	$::env(DESIGN_DIR)/../../lef/DiffDigota.lef \
	$::env(DESIGN_DIR)/../../lef/DIGOTA.lef \
	$::env(DESIGN_DIR)/../../lef/clkgate.lef \
	$::env(DESIGN_DIR)/../../lef/clkmux2.lef \
	$::env(DESIGN_DIR)/../../lef/WavePWM.lef"

set ::env(EXTRA_GDS_FILES) "\
	$::env(DESIGN_DIR)/../../gds/DiffDigota.gds \
	$::env(DESIGN_DIR)/../../gds/DIGOTA.gds \
	$::env(DESIGN_DIR)/../../gds/clkgate.gds \
	$::env(DESIGN_DIR)/../../gds/clkmux2.gds \
	$::env(DESIGN_DIR)/../../gds/WavePWM.gds"

set ::env(EXTRA_LIBS) "\
    $::env(DESIGN_DIR)/../../lib/DiffDigota.lib \
    $::env(DESIGN_DIR)/../../lib/DIGOTA.lib \
    $::env(DESIGN_DIR)/../../lib/clkgate.lib\
    $::env(DESIGN_DIR)/../../lib/clkmux2.lib\
    $::env(DESIGN_DIR)/../../lib/WavePWM.lib"

set ::env(RT_MAX_LAYER) {Metal4}

# disable pdn check nodes becuase it hangs with multiple power domains.
# any issue with pdn connections will be flagged with LVS so it is not a critical check.
set ::env(FP_PDN_CHECK_NODES) 0


# Maximum layer used for routing is metal 4.
# This is because this macro will be inserted in a top level (user_project_wrapper) 
# where the PDN is planned on metal 5. So, to avoid having shorts between routes
# in this macro and the top level metal 5 stripes, we have to restrict routes to metal4.  
# 
set ::env(RT_MAX_LAYER) {Metal4}

# You can draw more power domains if you need to 
set ::env(VDD_NETS) [list {vdd}]
set ::env(GND_NETS) [list {vss}]

set ::env(DIODE_INSERTION_STRATEGY) 4 
# If you're going to use multiple power domains, then disable cvc run.
set ::env(RUN_CVC) 1