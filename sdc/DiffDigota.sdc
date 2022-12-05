###############################################################################
# Created by write_sdc
# Mon Dec  5 17:19:21 2022
###############################################################################
current_design DiffDigota
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name __VIRTUAL_CLK__ -period 24.0000 
set_clock_uncertainty 0.2500 __VIRTUAL_CLK__
set_input_delay 4.8000 -clock [get_clocks {__VIRTUAL_CLK__}] -add_delay [get_ports {INmb}]
set_input_delay 4.8000 -clock [get_clocks {__VIRTUAL_CLK__}] -add_delay [get_ports {INpb}]
set_input_delay 4.8000 -clock [get_clocks {__VIRTUAL_CLK__}] -add_delay [get_ports {OUTm}]
set_input_delay 4.8000 -clock [get_clocks {__VIRTUAL_CLK__}] -add_delay [get_ports {OUTp}]
set_input_delay 4.8000 -clock [get_clocks {__VIRTUAL_CLK__}] -add_delay [get_ports {oe}]
set_output_delay 4.8000 -clock [get_clocks {__VIRTUAL_CLK__}] -add_delay [get_ports {cmnmos}]
set_output_delay 4.8000 -clock [get_clocks {__VIRTUAL_CLK__}] -add_delay [get_ports {cmpmos}]
set_output_delay 4.8000 -clock [get_clocks {__VIRTUAL_CLK__}] -add_delay [get_ports {omnmos}]
set_output_delay 4.8000 -clock [get_clocks {__VIRTUAL_CLK__}] -add_delay [get_ports {ompmos}]
set_output_delay 4.8000 -clock [get_clocks {__VIRTUAL_CLK__}] -add_delay [get_ports {opnmos}]
set_output_delay 4.8000 -clock [get_clocks {__VIRTUAL_CLK__}] -add_delay [get_ports {oppmos}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0729 [get_ports {cmnmos}]
set_load -pin_load 0.0729 [get_ports {cmpmos}]
set_load -pin_load 0.0729 [get_ports {omnmos}]
set_load -pin_load 0.0729 [get_ports {ompmos}]
set_load -pin_load 0.0729 [get_ports {opnmos}]
set_load -pin_load 0.0729 [get_ports {oppmos}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {INmb}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {INpb}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {OUTm}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {OUTp}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {oe}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_fanout 4.0000 [current_design]
