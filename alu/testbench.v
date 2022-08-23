`timescale 1 ns/1 ns	//time scale for simulation

module testbench;
   reg [3:0] A;
   reg [3:0] B;
   reg       sel;   
   wire [3:0] RES;

   alu my_alu(.A(A), .B(B), .sel(sel), .RES(RES));

   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, testbench);
      // test0: 3 + 4 = 7
      A = 4'b0011;
      B = 4'b0100;
      sel = 0;
      #47;
      // test1: 3 nand 4 = -1
      A = 4'b0011;
      B = 4'b0100;
      sel = 1;
      #47;
      // test2: -1 + -5 = -6
      A = 4'b1111;
      B = 4'b1011;
      sel = 0;
      #47;
      // test3: -4 + 4 = 0
      A = 4'b1100;
      B = 4'b0100;
      sel = 0;
      #47;
      // test4: -8 nand -2 = 7
      A = 4'b1000;
      B = 4'b1110;
      sel = 1;
      #47;
   end
endmodule
