#!/bin/bash
iverilog -o testbench testbench.v pc.v ../rca/rca.v ../fa/fa.v\
         ../reg4/reg4.v ../dff/dff.v ../d_latch/d_latch.v ../sr_latch/sr_latch.v\
         ../mux_21_4b/mux_21_4b.v ../mux_21_1b/mux_21_1b.v
