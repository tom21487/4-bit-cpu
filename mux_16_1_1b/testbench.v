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
   reg i;
   reg j;
   reg k;
   reg l;
   reg m;
   reg n;
   reg o;
   reg p;
   reg sel3;
   reg sel2;
   reg sel1;
   reg sel0;
   wire res;

   mux_16_1_1b mux_16_1_1b_0(.a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g), .h(h),
                             .i(i), .j(j),. k(k), .l(l), .m(m), .n(n), .o(o), .p(p),
                             .sel3(sel3), .sel2(sel2), .sel1(sel1), .sel0(sel0),
                             .res(res));

   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, testbench);

      // test 0, expected result = 1
      a = 1; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0;
      i = 0; j = 0; k = 0; l = 0; m = 0; n = 0; o = 0; p = 0;
      sel3 = 0; sel2 = 0; sel1 = 0; sel0 = 0;
      #28;

      // test 1, expected result = 0
      a = 1; b = 0; c = 1; d = 1; e = 1; f = 1; g = 1; h = 1;
      i = 1; j = 1; k = 1; l = 1; m = 1; n = 1; o = 1; p = 1;
      sel3 = 0; sel2 = 0; sel1 = 0; sel0 = 1;
      #28;
      
      // test 2, expected result = 1;
      a = 0; b = 0; c = 1; d = 0; e = 0; f = 0; g = 0; h = 0;
      i = 0; j = 0; k = 0; l = 0; m = 0; n = 0; o = 0; p = 0;
      sel3 = 0; sel2 = 0; sel1 = 1; sel0 = 0;
      #28;
      
      // test 3, expected result = 0
      a = 1; b = 1; c = 1; d = 0; e = 1; f = 1; g = 1; h = 1;
      i = 1; j = 1; k = 1; l = 1; m = 1; n = 1; o = 1; p = 1;
      sel3 = 0; sel2 = 0; sel1 = 1; sel0 = 1;
      #28;

      // test 4, expected result = 1
      a = 0; b = 0; c = 0; d = 0; e = 1; f = 0; g = 0; h = 0;
      i = 0; j = 0; k = 0; l = 0; m = 0; n = 0; o = 0; p = 0;
      sel3 = 0; sel2 = 1; sel1 = 0; sel0 = 0;
      #28;

      // test 5, expected result = 0
      a = 1; b = 1; c = 1; d = 1; e = 1; f = 0; g = 1; h = 1;
      i = 1; j = 1; k = 1; l = 1; m = 1; n = 1; o = 1; p = 1;
      sel3 = 0; sel2 = 1; sel1 = 0; sel0 = 1;
      #28;
      
      // test 6, expected result = 1
      a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 1; h = 0;
      i = 0; j = 0; k = 0; l = 0; m = 0; n = 0; o = 0; p = 0;
      sel3 = 0; sel2 = 1; sel1 = 1; sel0 = 0;
      #28;
      
      // test 7, expected result = 0
      a = 1; b = 1; c = 1; d = 1; e = 1; f = 1; g = 1; h = 0;
      i = 1; j = 1; k = 1; l = 1; m = 1; n = 1; o = 1; p = 1;
      sel3 = 0; sel2 = 1; sel1 = 1; sel0 = 1;
      #28;
      
      // test 8, expected result = 1
      a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0;
      i = 1; j = 0; k = 0; l = 0; m = 0; n = 0; o = 0; p = 0;
      sel3 = 1; sel2 = 0; sel1 = 0; sel0 = 0;
      #28;
      
      // test 9, expected result = 0
      a = 1; b = 1; c = 1; d = 1; e = 1; f = 1; g = 1; h = 1;
      i = 1; j = 0; k = 1; l = 1; m = 1; n = 1; o = 1; p = 1;
      sel3 = 1; sel2 = 0; sel1 = 0; sel0 = 1;
      #28;
      
      // test 10, expected result = 1
      a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0;
      i = 0; j = 0; k = 1; l = 0; m = 0; n = 0; o = 0; p = 0;
      sel3 = 1; sel2 = 0; sel1 = 1; sel0 = 0;
      #28;
      
      // test 11, expected result = 0
      a = 1; b = 1; c = 1; d = 1; e = 1; f = 1; g = 1; h = 1;
      i = 1; j = 1; k = 1; l = 0; m = 1; n = 1; o = 1; p = 1;
      sel3 = 1; sel2 = 0; sel1 = 1; sel0 = 1;
      #28;
      
      // test 12, expected result = 1
      a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0;
      i = 0; j = 0; k = 0; l = 0; m = 1; n = 0; o = 0; p = 0;
      sel3 = 1; sel2 = 1; sel1 = 0; sel0 = 0;
      #28;
      
      // test 13, expected result = 0
      a = 1; b = 1; c = 1; d = 1; e = 1; f = 1; g = 1; h = 1;
      i = 1; j = 1; k = 1; l = 1; m = 1; n = 0; o = 1; p = 1;
      sel3 = 1; sel2 = 1; sel1 = 0; sel0 = 1;
      #28;
      
      // test 14, expected result = 1
      a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0;
      i = 0; j = 0; k = 0; l = 0; m = 0; n = 0; o = 1; p = 0;
      sel3 = 1; sel2 = 1; sel1 = 1; sel0 = 0;
      #28;
      
      // test 15, expected result = 0
      a = 1; b = 1; c = 1; d = 1; e = 1; f = 1; g = 1; h = 1;
      i = 1; j = 1; k = 1; l = 1; m = 1; n = 1; o = 1; p = 0;
      sel3 = 1; sel2 = 1; sel1 = 1; sel0 = 1;
      #28;  
   end
endmodule
