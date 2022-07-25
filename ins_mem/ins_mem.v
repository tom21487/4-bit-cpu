// Instruction memory module
// An application of mux_16_1_9b
// Machine-code is stored here
// Critical path delay = 28 ns
module ins_mem(PC, RES_INS);
   input [3:0] PC;
   output [8:0] RES_INS;
   mux_16_1_9b mux_16_1_9b_0(
      .A(9'b000000001), .B(9'b000000010), .C(9'b000000100), .D(9'b000001000),
      .E(9'b000010000), .F(9'b000100000), .G(9'b001000000), .H(9'b010000000),
      .I(9'b100000000), .J(9'b111111110), .K(9'b111111100), .L(9'b111111000),
      .M(9'b111110000), .N(9'b111100000), .O(9'b111000000), .P(9'b110000000),
      .sel3(PC[3]), .sel2(PC[2]), .sel1(PC[1]), .sel0(PC[0]),
      .RES(RES_INS));
endmodule;
