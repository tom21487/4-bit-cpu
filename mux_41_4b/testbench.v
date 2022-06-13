`timescale 1 ns/1 ns	//time scale for simulation

module testbench;
   reg [3:0] A;
   reg [3:0] B;
   reg [3:0] C;
   reg [3:0] D;
   reg       sel0;
   reg       sel1;
   wire [3:0] RES;

   mux_41_4b mux_41_4b_0(.A(A), .B(B), .C(C), .D(D), .sel0(sel0), .sel1(sel1), .RES(RES));

   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, testbench);

      // Debug setup: one hot inputs
      A = 4'b0001;
      B = 4'b0010;
      C = 4'b0100;
      D = 4'b1000;

      // test 0: RES = 4'b0001
      sel1 = 0;
      sel0 = 0;
      #14;
      
      // test 1: RES = 4'b0010
      sel1 = 0;
      sel0 = 1;
      #14;
      
      // test 2: RES = 4'b0100
      sel1 = 1;
      sel0 = 0;
      #14;
      
      // test 3: RES = 4'b1000
      sel1 = 1;
      sel0 = 1;
      #14;
   end
endmodule
