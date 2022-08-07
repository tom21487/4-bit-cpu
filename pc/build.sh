#!/bin/bash
iverilog -o testbench testbench.v pc.v ../rca/rca.v ../fa/fa.v\
         ../reg4/reg4.v ../dff/dff.v ../d_latch/d_latch.v ../sr_latch/sr_latch.v\
         ../mux_2_1_4b/mux_2_1_4b.v ../mux_2_1_1b/mux_2_1_1b.v ../oscillator/oscillator.v
