// Critical path delay = 28 ns
module mux_16_1_11b(A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P,
                   sel3, sel2, sel1, sel0, RES);
   input [10:0] A;
   input [10:0] B;
   input [10:0] C;
   input [10:0] D;
   input [10:0] E;
   input [10:0] F;
   input [10:0] G;
   input [10:0] H;
   input [10:0] I;
   input [10:0] J;
   input [10:0] K;
   input [10:0] L;
   input [10:0] M;
   input [10:0] N;
   input [10:0] O;
   input [10:0] P;
   input       sel3;       
   input       sel2;
   input       sel1;
   input       sel0;
   output [10:0] RES;

   mux_16_1_1b mux_16_1_1b_0[10:0](.a(A), .b(B), .c(C), .d(D),
                                  .e(E), .f(F), .g(G), .h(H),
                                  .i(I), .j(J), .k(K), .l(L),
                                  .m(M), .n(N), .o(O), .p(P),
                                  .sel3(sel3), .sel2(sel2),
                                  .sel1(sel1), .sel0(sel0),
                                  .res(RES));
endmodule;
