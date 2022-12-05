###############################################################################
# Created by write_sdc
# Mon Dec  5 17:14:20 2022
###############################################################################
current_design clkgate
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name gclk -period 24.0000 [get_ports {gclk}]
set_clock_transition 0.1500 [get_clocks {gclk}]
set_clock_uncertainty 0.2500 gclk
set_propagated_clock [get_clocks {gclk}]
set_input_delay 4.8000 -clock [get_clocks {gclk}] -add_delay [get_ports {clk}]
set_input_delay 4.8000 -clock [get_clocks {gclk}] -add_delay [get_ports {gate}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0729 [get_ports {gclk}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {clk}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {gate}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_4 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {gclk}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_fanout 4.0000 [current_design]
