/* Instruction memory module
 * An application of mux_16_1_9b
 * Machine-code is stored here
 * Critical path delay = 28 ns
 * Opcodes:
 * add    -> 000
 * nand   -> 001
 * push   -> 010
 * noop   -> 011
 * branch -> 111
 */
module ins_mem(PC, RES_INS);
   input [3:0] PC;
   output [8:0] RES_INS;
   mux_16_1_9b mux_16_1_9b_0(
	/*
	cycle 0
	current register state
	reg3: 4'bxxxx
	reg2: 4'bxxxx
	reg1: 4'bxxxx
	reg0: 4'bxxxx
	instruction to run: push reg0 4'b0110
	*/
	.A(9'b010000110),
	/*
	cycle 1
	current register state
	reg3: 4'bxxxx
	reg2: 4'bxxxx
	reg1: 4'bxxxx
	reg0: 4'b0110
	instruction to run: push reg1 4'b1101
	*/
	.B(9'b010011101),
	/* 
	cycle 2
	current register state
	reg3: 4'bxxxx
	reg2: 4'bxxxx
	reg1: 4'b1101
	reg0: 4'b0110
	instruction to run: add reg2 reg0 reg1
	*/
	.C(9'b000100001),
	// instruction 3: noop
	.D(9'b011000000),
	// instruction 4: nand reg1 reg1 reg2
	.E(9'b001010110),
	// instruction 5: nand reg2 reg2 reg2
	.F(9'b001101010),
	// instruction 6
	.G(9'b001000000),
	// instruction 7
	.H(9'b010000000),
	// instruction 8
	.I(9'b100000000),
	// instruction 9
	.J(9'b111111110),
	// instruction 10
	.K(9'b111111100),
	// instruction 11
	.L(9'b111111000),
	// instruction 12
	.M(9'b111110000),
	// instruction 13
	.N(9'b111100000),
	// instruction 14
	.O(9'b111000000),
	// instruction 15
	.P(9'b110000000),
	.sel3(PC[3]), .sel2(PC[2]), .sel1(PC[1]), .sel0(PC[0]),
	.RES(RES_INS));
endmodule;
