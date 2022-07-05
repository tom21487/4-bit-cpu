// Critical path delay = 14ns
module mux_4_1_1b(a, b, c, d, sel1, sel0, res);
   input a;
   input b;
   input c;
   input d;
   input sel1;
   input sel0;
   output res;
   wire   ab_out;
   mux_2_1_1b mux_2_1_1b_0(.a(a), .b(b), .sel(sel0), .res(ab_out));
   wire   cd_out;
   mux_2_1_1b mux_2_1_1b_1(.a(c), .b(d), .sel(sel0), .res(cd_out));
   mux_2_1_1b mux_2_1_1b_2(.a(ab_out), .b(cd_out), .sel(sel1), .res(res));
endmodule; // mux_4_1_1b
