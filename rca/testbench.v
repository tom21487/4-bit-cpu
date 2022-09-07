`timescale 1 ns/1 ns	//time scale for simulation

module testbench;
   reg [3:0] A;
   reg [3:0] B;
   wire [3:0] SUM;
   wire       ovf;
   rca rca0(.A(A), .B(B), .SUM(SUM), .ovf(ovf));

   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, testbench);

      // Add simple numbers with no overflow
      // test0: 3 + 4 = 7
      A = 4'b0011;
      B = 4'b0100;
      #44;
      
      // test1: 5 + -7 = -2
      A = 4'b0101;
      B = 4'b1001;
      #44;
      
      // test2: -2 + -3 = -5
      A = 4'b1110;
      B = 4'b1101;
      #44;

      // Add some numbers with overflow (binary_arithmetic.pdf s16)
      // test3: 5 + 6 = ovf
      A = 4'b0101;
      B = 4'b0110;
      #44;

      // test4: -3 + -6 = ovf
      A = 4'b1101;
      B = 4'b1010;
      #44;
   end
endmodule
