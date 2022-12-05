# Caravel User Project

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) [![UPRJ_CI](https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml/badge.svg)](https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml) [![Caravel Build](https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml/badge.svg)](https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml)

| :exclamation: Important Note            |
|-----------------------------------------|

Refer to [README](docs/source/index.rst#section-quickstart) for a quickstart of how to use caravel_user_project
Refer to [README](docs/source/index.rst) for this sample project documentation. 

| :exclamation: Important MAKE!           |
|-----------------------------------------|

This design uses design rules for the gf180mcuC PDK.

This project implements a 16 bit RISC themed processor for educational purposes. 
  --would if the PDK were complete
  --Since the number of IO pins are limited the Address/Databus are merged into a single external bus.

This project provides experimental digital blocks to explore and learn about the idea-to-silicon pipeline.

Blocks included
  clkgate
    simple latch and a bit of logic to safely control a clock signal with logic
  clkmux2
    simple switch that allows two clock signals to be switched between without glitching
  DIGOTA
    these are purely experimental
  WavePWm
    waveform synthesis from wavetable rom memory

More documentation to come in the following days!
