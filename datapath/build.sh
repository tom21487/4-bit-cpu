#!/bin/bash
iverilog -o testbench \
 ./testbench.v \
 ./datapath.v \
../mux_4_1_1b/mux_4_1_1b.v \
../mux_4_1_4b/mux_4_1_4b.v \
../mux_2_1_1b/mux_2_1_1b.v \
../mux_2_1_4b/mux_2_1_4b.v \
../mux_8_1_1b/mux_8_1_1b.v \
../mux_16_1_1b/mux_16_1_1b.v \
../mux_16_1_16b/mux_16_1_16b.v \
../decoder_2_4_1b/decoder_2_4_1b.v \
../fa/fa.v \
../rca/rca.v \
../alu/alu.v \
../sr_latch/sr_latch.v \
../d_latch/d_latch.v \
../dff/dff.v \
../reg4/reg4.v \
../reg_file/reg_file.v \
../ins_mem/ins_mem.v \
../ins_dec/ins_dec.v \
../pc/pc.v \
../oscillator/oscillator.v
