`timescale 1 ns/1 ns	//time scale for simulation

module testbench;
   reg [3:0] A;
   reg [3:0] B;
   wire [3:0] SUM;

   rca rca0(.A(A), .B(B), .SUM(SUM));

   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, testbench);

      // Add simple numbers with no overflow
      // test0: 3 + 4 = 7
      A = 4'b0011;
      B = 4'b0100;
      #40;
      
      // test1: 5 + -7 = -2
      A = 4'b0101;
      B = 4'b1001;
      #40;
      
      // test2: -2 + -3 = -5
      A = 4'b1110;
      B = 4'b1101;
      #40;
   end
endmodule
