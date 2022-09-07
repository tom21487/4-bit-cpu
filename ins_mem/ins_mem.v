/* Instruction memory module
 * An application of mux_16_1_11b
 * Machine-code is stored here
 * Critical path delay = 28 ns
 */
module ins_mem(PC, RES_INS);
   input [3:0] PC;
   output [10:0] RES_INS;
   mux_16_1_11b mux_16_1_11b_0(
        .A(11'b01000000110),
        .B(11'b01000011101),
        .C(11'b00000100001),
        .D(11'b01100000000),
        .E(11'b00100010110),
        .F(11'b00100101010),
        .G(11'b10001010001),
        .H(11'b01100000000),
        .I(11'b01100000000),
        .J(11'b01100000000),
        .K(11'b01100000000),
        .L(11'b01100000000),
        .M(11'b01100000000),
        .N(11'b01100000000),
        .O(11'b01100000000),
        .P(11'b01100000000),
	.sel3(PC[3]), .sel2(PC[2]), .sel1(PC[1]), .sel0(PC[0]),
	.RES(RES_INS));
endmodule;
