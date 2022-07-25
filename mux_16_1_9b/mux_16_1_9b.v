// Critical path delay = 28 ns
module mux_16_1_9b(A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P,
                   sel3, sel2, sel1, sel0, RES);
   input [8:0] A;
   input [8:0] B;
   input [8:0] C;
   input [8:0] D;
   input [8:0] E;
   input [8:0] F;
   input [8:0] G;
   input [8:0] H;
   input [8:0] I;
   input [8:0] J;
   input [8:0] K;
   input [8:0] L;
   input [8:0] M;
   input [8:0] N;
   input [8:0] O;
   input [8:0] P;
   input       sel3;       
   input       sel2;
   input       sel1;
   input       sel0;
   output [8:0]      RES;

   mux_16_1_1b mux_16_1_1b_0[8:0](.a(A), .b(B), .c(C), .d(D),
                                  .e(E), .f(F), .g(G), .h(H),
                                  .i(I), .j(J), .k(K), .l(L),
                                  .m(M), .n(N), .o(O), .p(P),
                                  .sel3(sel3), .sel2(sel2),
                                  .sel1(sel1), .sel0(sel0),
                                  .res(RES));
endmodule;
