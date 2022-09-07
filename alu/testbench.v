`timescale 1 ns/1 ns	//time scale for simulation

module testbench;
   reg [3:0] A;
   reg [3:0] B;
   reg       sel;   
   wire [3:0] RES;
   wire       eq;
   alu my_alu(.A(A), .B(B), .sel(sel), .RES(RES), .eq(eq));

   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, testbench);
      // test0: -1 + -5 = -6, eq = 0
      A = 4'b1111;
      B = 4'b1011;
      sel = 0;
      #51;
      // test1: -2 nand -2 = 1, eq = 1
      A = 4'b1110;
      B = 4'b1110;
      sel = 1;
      #51;
      // test2: -8 + -3 = 5 (ovf: should be -11), eq = 0
      A = 4'b1000;
      B = 4'b1101;
      sel = 0;
      #51;
      // test3: 5 + 5 = -6 (ovf: should be 10), eq = 1
      A = 4'b0101;
      B = 4'b0101;
      sel = 0;
      #51;
   end
endmodule
