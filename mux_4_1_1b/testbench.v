`timescale 1 ns/1 ns	//time scale for simulation

module testbench;
   reg a;
   reg b;
   reg c;
   reg d;
   reg sel1;
   reg sel0;
   wire res;

   mux_41_1b mux_41_1b_0(.a(a), .b(b), .c(c), .d(d), .sel1(sel1), .sel0(sel0), .res(res));

   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, testbench);

      // test group 0: 1010
      // test 0, res = 1
      a = 1;
      b = 0;
      c = 1;
      d = 0;
      sel1 = 0;
      sel0 = 0;
      #14;

      // test 1, res = 0
      a = 1;
      b = 0;
      c = 1;
      d = 0;
      sel1 = 0;
      sel0 = 1;
      #14;

      // test 2, res = 1
      a = 1;
      b = 0;
      c = 1;
      d = 0;
      sel1 = 1;
      sel0 = 0;
      #14;
      
      // test 3, res = 0
      a = 1;
      b = 0;
      c = 1;
      d = 0;
      sel1 = 1;
      sel0 = 1;
      #14;
      
      // test group 1: 0110
      // test 4, res = 0
      a = 0;
      b = 1;
      c = 1;
      d = 0;
      sel1 = 0;
      sel0 = 0;
      #14;

      // test 5, res = 1
      a = 0;
      b = 1;
      c = 1;
      d = 0;
      sel1 = 0;
      sel0 = 1;
      #14;

      // test 6, res = 1
      a = 0;
      b = 1;
      c = 1;
      d = 0;
      sel1 = 1;
      sel0 = 0;
      #14;

      // test 7, res = 0
      a = 0;
      b = 1;
      c = 1;
      d = 0;
      sel1 = 1;
      sel0 = 1;
      #14;
   end
endmodule; // testbench
