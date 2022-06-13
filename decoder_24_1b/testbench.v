`timescale 1 ns/1 ns	//time scale for simulation

module testbench;
   reg w1;
   reg w0;
   
   wire d3;
   wire d2;
   wire d1;
   wire d0;

   decoder_24_1b decoder_24_1b_0(.w1(w1), .w0(w0), .d3(d3), .d2(d2), .d1(d1), .d0(d0));

   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, testbench);

      // test0, D = 3'b0001
      w1 = 0;
      w0 = 0;
      #4;

      // test1, D = 3'b0010
      w1 = 0;
      w0 = 1;
      #4;

      // test2, D = 3'b0100
      w1 = 1;
      w0 = 0;
      #4;

      // test3, D = 3'b1000
      w1 = 1;
      w0 = 1;
      #4;
   end
endmodule
