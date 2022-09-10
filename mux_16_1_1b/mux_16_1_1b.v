// Critical path delay = 28 ns
module mux_16_1_1b(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p,
                   sel3, sel2, sel1, sel0, res);
   input a;
   input b;
   input c;
   input d;
   input e;
   input f;
   input g;
   input h;
   input i;
   input j;
   input k;
   input l;
   input m;
   input n;
   input o;
   input p;
   input sel3;
   input sel2;
   input sel1;
   input sel0;
   output res;

   wire   x;
   mux_8_1_1b mux_8_1_1b_0(.a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g), .h(h),
                           .sel2(sel2), .sel1(sel1), .sel0(sel0), .res(x));
   wire   y;
   mux_8_1_1b mux_8_1_1b_1(.a(i), .b(j), .c(k), .d(l), .e(m), .f(n), .g(o), .h(p),
                           .sel2(sel2), .sel1(sel1), .sel0(sel0), .res(y));
   mux_2_1_1b mux_2_1_1b_0(.a(x), .b(y), .sel(sel3), .res(res));
endmodule // mux_16_1_1b
