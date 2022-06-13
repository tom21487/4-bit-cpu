`timescale 1 ns/1 ns	//time scale for simulation
`define DELAY 10

module testbench;
   reg a;
   reg b;
   reg sel;
   wire res;

   mux1 my_mux1(.a(a), .b(b), .sel(sel), .res(res));

   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, testbench);

      // test 0, res = 0
      a = 0;
      b = 0;
      sel = 0;
      #DELAY;

      // test 1, res = 0
      a = 0;
      b = 1;
      sel = 0;
      #DELAY;

      // test 2, res = 1
      a = 1;
      b = 0;
      sel = 0;
      #DELAY;

      // test 3, res = 1
      a = 1;
      b = 1;
      sel = 0;
      #DELAY;

      // test 4, res = 0
      a = 0;
      b = 0;
      sel = 1;
      #DELAY;

      // test 5, res = 1
      a = 0;
      b = 1;
      sel = 1;
      #DELAY;

      // test 6, res = 0
      a = 1;
      b = 0;
      sel = 1;
      #DELAY;

      // test 7,  res = 1
      a = 1;
      b = 1;
      sel = 1;
      #DELAY;
   end
endmodule; // testbench
