#!/bin/bash
iverilog -o testbench testbench.v datapath.v ../reg_file/reg_file.v ../decoder_24_1b/decoder_24_1b.v \
         ../mux_21_4b/mux_21_4b.v ../reg4/reg4.v ../dff/dff.v ../d_latch/d_latch.v \
         ../sr_latch/sr_latch.v ../mux_41_4b/mux_41_4b.v ../mux_41_1b/mux_41_1b.v \
         ../mux_21_1b/mux_21_1b.v ../alu/alu.v ../rca/rca.v ../fa/fa.v
