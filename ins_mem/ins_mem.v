/* Instruction memory module
 * An application of mux_16_1_16b
 * Machine-code is stored here
 * Critical path delay = 28 ns
 */
module ins_mem(PC, RES_INS);
   input [3:0] PC;
   output [15:0] RES_INS;
   mux_16_1_16b mux_16_1_16b_0(
        .A(16'b0000001000000000),
        .B(16'b0000001000011111),
        .C(16'b0000001000100010),
        .D(16'b0000001000110011),
        .E(16'b0000010000110110),
        .F(16'b0000000000010111),
        .G(16'b0000010011100000),
        .H(16'b0000001100000000),
        .I(16'b0000001100000000),
        .J(16'b0000001100000000),
        .K(16'b0000001100000000),
        .L(16'b0000001100000000),
        .M(16'b0000001100000000),
        .N(16'b0000001100000000),
        .O(16'b0000001100000000),
        .P(16'b0000001100000000),
	.sel3(PC[3]), .sel2(PC[2]), .sel1(PC[1]), .sel0(PC[0]),
	.RES(RES_INS));
endmodule;
