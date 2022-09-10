// Critical path delay = 21 ns
module mux_8_1_1b(a, b, c, d, e, f, g, h, sel2, sel1, sel0, res);
   input a;
   input b;
   input c;
   input d;
   input e;
   input f;
   input g;
   input h;
   input sel2;
   input sel1;
   input sel0;
   output res;

   wire   x;
   mux_4_1_1b mux_4_1_1b_0(.a(a), .b(b), .c(c), .d(d),
                           .sel1(sel1), .sel0(sel0), .res(x));
   wire   y;
   mux_4_1_1b mux_4_1_1b_1(.a(e), .b(f), .c(g), .d(h),
                           .sel1(sel1), .sel0(sel0), .res(y));
   mux_2_1_1b mux_2_1_1b_0(.a(x), .b(y), .sel(sel2), .res(res));
endmodule
