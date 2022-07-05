`timescale 1 ns/1 ns	//time scale for simulation

module testbench;
   reg a;
   reg b;
   reg c;
   reg d;
   reg e;
   reg f;
   reg g;
   reg h;
   reg sel2;
   reg sel1;
   reg sel0;
   wire res;

   mux_8_1_1b my_mux_8_1_1b(.a(a), .b(b), .c(c), .d(d),
                            .e(e), .f(f), .g(g), .h(h),
                            .sel2(sel2), .sel1(sel1), .sel0(sel0),
                            .res(res));

   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, testbench);

      // test 0, expected result = 1
      a = 1; b = 0; c = 0; d = 0;
      e = 0; f = 0; g = 0; h = 0;
      sel2 = 0;
      sel1 = 0;
      sel0 = 0;
      #21;

      // test 1, expected result = 0
      a = 1; b = 0; c = 1; d = 1;
      e = 1; f = 1; g = 1; h = 1;
      sel2 = 0;
      sel1 = 0;
      sel0 = 1;
      #21;

      // test 2, expected result = 1
      a = 0; b = 0; c = 1; d = 0;
      e = 0; f = 0; g = 0; h = 0;
      sel2 = 0;
      sel1 = 1;
      sel0 = 0;
      #21;

      // test 3, expected result = 0
      a = 1; b = 1; c = 1; d = 0;
      e = 1; f = 1; g = 1; h = 1;
      sel2 = 0;
      sel1 = 1;
      sel0 = 1;
      #21;

      // test 4, expected result = 0
      a = 1; b = 1; c = 1; d = 1;
      e = 0; f = 1; g = 1; h = 1;
      sel2 = 1;
      sel1 = 0;
      sel0 = 0;
      #21;

      // test 5, expected result = 1
      a = 0; b = 0; c = 0; d = 0;
      e = 0; f = 1; g = 0; h = 0;
      sel2 = 1;
      sel1 = 0;
      sel0 = 1;
      #21;

      // test 6, expected result = 0
      a = 1; b = 1; c = 1; d = 1;
      e = 1; f = 1; g = 0; h = 1;
      sel2 = 1;
      sel1 = 1;
      sel0 = 0;
      #21;

      // test 7, expected result = 1
      a = 0; b = 0; c = 0; d = 0;
      e = 0; f = 0; g = 0; h = 1;
      sel2 = 1;
      sel1 = 1;
      sel0 = 1;
      #21;
   end
endmodule
