// Critical path delay = 14ns
module mux_41_4b(A, B, C, D, sel1, sel0, RES);
   input [3:0] A;
   input [3:0] B;
   input [3:0] C;
   input [3:0] D;
   input       sel1;
   input       sel0;
   output [3:0] RES;
   mux_41_1b mux_41_1b_0[3:0](.a(A), .b(B), .c(C), .d(D), .sel1(sel1), .sel0(sel0), .res(RES));
endmodule
