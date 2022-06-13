`timescale 1 ns/1 ns	//time scale for simulation

module testbench;
   reg a;
   reg b;
   reg c_in;
   wire sum;
   wire c_out;

   fa my_fa(.a(a), .b(b), .c_in(c_in), .sum(sum), .c_out(c_out));

   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, testbench);

      // test0, c_out = 0, sum = 0
      a = 0;
      b = 0;
      c_in = 0;
      #10;
      
      // test1, c_out = 0, sum = 1
      a = 0;
      b = 0;
      c_in = 1;
      #10;

      // test2, c_out = 0, sum = 1
      a = 0;
      b = 1;
      c_in = 0;
      #10;

      // test3, c_out = 1, sum = 0
      a = 0;
      b = 1;
      c_in = 1;
      #10;

      // test 4, c_out = 0, sum = 1
      a = 1;
      b = 0;
      c_in = 0;
      #10;

      // test 5, c_out = 1, sum = 0
      a = 1;
      b = 0;
      c_in = 1;
      #10;

      // test 6, c_out = 1, sum = 0
      a = 1;
      b = 1;
      c_in = 0;
      #10;

      // test 7, c_out = 1, sum = 1
      a = 1;
      b = 1;
      c_in = 1;
      #10;
   end
endmodule
