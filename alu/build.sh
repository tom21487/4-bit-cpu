#!/bin/bash
iverilog -o testbench testbench.v alu.v \
	 ../fa/fa.v \
	 ../rca/rca.v \
	 ../mux_2_1_1b/mux_2_1_1b.v \
	 ../mux_2_1_4b/mux_2_1_4b.v
	 
