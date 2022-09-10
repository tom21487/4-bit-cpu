// Critical path delay = 28 ns
module mux_16_1_16b(A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P,
                   sel3, sel2, sel1, sel0, RES);
   input [15:0] A;
   input [15:0] B;
   input [15:0] C;
   input [15:0] D;
   input [15:0] E;
   input [15:0] F;
   input [15:0] G;
   input [15:0] H;
   input [15:0] I;
   input [15:0] J;
   input [15:0] K;
   input [15:0] L;
   input [15:0] M;
   input [15:0] N;
   input [15:0] O;
   input [15:0] P;
   input       sel3;       
   input       sel2;
   input       sel1;
   input       sel0;
   output [15:0] RES;

   mux_16_1_1b mux_16_1_1b_0[15:0](.a(A), .b(B), .c(C), .d(D),
                                  .e(E), .f(F), .g(G), .h(H),
                                  .i(I), .j(J), .k(K), .l(L),
                                  .m(M), .n(N), .o(O), .p(P),
                                  .sel3(sel3), .sel2(sel2),
                                  .sel1(sel1), .sel0(sel0),
                                  .res(RES));
endmodule
