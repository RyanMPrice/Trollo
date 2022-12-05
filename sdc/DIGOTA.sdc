###############################################################################
# Created by write_sdc
# Mon Dec  5 17:16:57 2022
###############################################################################
current_design DIGOTA
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name __VIRTUAL_CLK__ -period 24.0000 
set_clock_uncertainty 0.2500 __VIRTUAL_CLK__
set_input_delay 4.8000 -clock [get_clocks {__VIRTUAL_CLK__}] -add_delay [get_ports {INmb}]
set_input_delay 4.8000 -clock [get_clocks {__VIRTUAL_CLK__}] -add_delay [get_ports {INpb}]
set_input_delay 4.8000 -clock [get_clocks {__VIRTUAL_CLK__}] -add_delay [get_ports {oe}]
set_output_delay 4.8000 -clock [get_clocks {__VIRTUAL_CLK__}] -add_delay [get_ports {cmnmos}]
set_output_delay 4.8000 -clock [get_clocks {__VIRTUAL_CLK__}] -add_delay [get_ports {cmpmos}]
set_output_delay 4.8000 -clock [get_clocks {__VIRTUAL_CLK__}] -add_delay [get_ports {onmos}]
set_output_delay 4.8000 -clock [get_clocks {__VIRTUAL_CLK__}] -add_delay [get_ports {opmos}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0729 [get_ports {cmnmos}]
set_load -pin_load 0.0729 [get_ports {cmpmos}]
set_load -pin_load 0.0729 [get_ports {onmos}]
set_load -pin_load 0.0729 [get_ports {opmos}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {INmb}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {INpb}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {oe}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_fanout 4.0000 [current_design]
