###############################################################################
# Created by write_sdc
# Mon Dec  5 17:17:30 2022
###############################################################################
current_design WavePWM
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 50.0000 [get_ports {clk}]
set_clock_transition 0.1500 [get_clocks {clk}]
set_clock_uncertainty 0.2500 clk
set_propagated_clock [get_clocks {clk}]
set_input_delay 10.0000 -clock [get_clocks {clk}] -add_delay [get_ports {divSel[0]}]
set_input_delay 10.0000 -clock [get_clocks {clk}] -add_delay [get_ports {divSel[1]}]
set_input_delay 10.0000 -clock [get_clocks {clk}] -add_delay [get_ports {divSel[2]}]
set_input_delay 10.0000 -clock [get_clocks {clk}] -add_delay [get_ports {divSel[3]}]
set_input_delay 10.0000 -clock [get_clocks {clk}] -add_delay [get_ports {enable}]
set_input_delay 10.0000 -clock [get_clocks {clk}] -add_delay [get_ports {rst}]
set_output_delay 10.0000 -clock [get_clocks {clk}] -add_delay [get_ports {qcomplex}]
set_output_delay 10.0000 -clock [get_clocks {clk}] -add_delay [get_ports {qcos}]
set_output_delay 10.0000 -clock [get_clocks {clk}] -add_delay [get_ports {qsin}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0729 [get_ports {qcomplex}]
set_load -pin_load 0.0729 [get_ports {qcos}]
set_load -pin_load 0.0729 [get_ports {qsin}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_4 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {clk}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {enable}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {rst}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {divSel[3]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {divSel[2]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {divSel[1]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {divSel[0]}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_fanout 10.0000 [current_design]
