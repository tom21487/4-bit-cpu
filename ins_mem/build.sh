iverilog -o testbench testbench.v ins_mem.v \
         ../mux_16_1_9b/mux_16_1_9b.v \
	 ../mux_16_1_1b/mux_16_1_1b.v \
         ../mux_8_1_1b/mux_8_1_1b.v \
	 ../mux_4_1_1b/mux_4_1_1b.v \
         ../mux_2_1_1b/mux_2_1_1b.v \
	 ../dff/dff.v \
	 ../d_latch/d_latch.v \
	 ../sr_latch/sr_latch.v
