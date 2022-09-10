`timescale 1 ns/1 ns	//time scale for simulation

module testbench;
   reg [15:0] INS0;
   reg [15:0] INS1;
   reg [15:0] INS2;
   reg [15:0] INS3;
   reg [15:0] INS4;
   reg [15:0] INS5;
   reg [15:0] INS6;
   reg [15:0] INS7;
   reg [15:0] INS8;
   reg [15:0] INS9;
   reg [15:0] INS10;
   reg [15:0] INS11;
   reg [15:0] INS12;
   reg [15:0] INS13;
   reg [15:0] INS14;
   reg [15:0] INS15;
   reg       sel3;
   reg       sel2;
   reg       sel1;
   reg       sel0;
   wire [15:0] RES;

   mux_16_1_16b mux_16_1_16b_0(.A(INS0), .B(INS1), .C(INS2), .D(INS3),
                             .E(INS4), .F(INS5), .G(INS6), .H(INS7),
                             .I(INS8), .J(INS9), .K(INS10), .L(INS11),
                             .M(INS12), .N(INS13), .O(INS14), .P(INS15),
                             .sel3(sel3), .sel2(sel2),
                             .sel1(sel1), .sel0(sel0),
                             .RES(RES));

   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, testbench);

      INS0 =  16'b0000000000000001;
      INS1 =  16'b0000000000000010;
      INS2 =  16'b0000000000000100;
      INS3 =  16'b0000000000001000;
      INS4 =  16'b0000000000010000;
      INS5 =  16'b0000000000100000;
      INS6 =  16'b0000000001000000;
      INS7 =  16'b0000000010000000;
      INS8 =  16'b0000000100000000;
      INS9 =  16'b0000001000000000;
      INS10 = 16'b0000010000000000;
      INS11 = 16'b0000100000000000;
      INS12 = 16'b0001000000000000;
      INS13 = 16'b0010000000000000;
      INS14 = 16'b0100000000000000;
      INS15 = 16'b1000000000000000;

      // test0
      sel3 = 0;
      sel2 = 0;
      sel1 = 0;
      sel0 = 0;
      #28;

      // test1
      sel3 = 0;
      sel2 = 0;
      sel1 = 0;
      sel0 = 1;
      #28;

      // test2
      sel3 = 0;
      sel2 = 0;
      sel1 = 1;
      sel0 = 0;
      #28;

      // test3
      sel3 = 0;
      sel2 = 0;
      sel1 = 1;
      sel0 = 1;
      #28;
      
      // test4
      sel3 = 0;
      sel2 = 1;
      sel1 = 0;
      sel0 = 0;
      #28;
      
      // test5
      sel3 = 0;
      sel2 = 1;
      sel1 = 0;
      sel0 = 1;
      #28;
      
      // test6
      sel3 = 0;
      sel2 = 1;
      sel1 = 1;
      sel0 = 0;
      #28;
      
      // test7
      sel3 = 0;
      sel2 = 1;
      sel1 = 1;
      sel0 = 1;
      #28;
      
      // test8
      sel3 = 1;
      sel2 = 0;
      sel1 = 0;
      sel0 = 0;
      #28;

      // test9
      sel3 = 1;
      sel2 = 0;
      sel1 = 0;
      sel0 = 1;
      #28;

      // test10
      sel3 = 1;
      sel2 = 0;
      sel1 = 1;
      sel0 = 0;
      #28;

      // test11
      sel3 = 1;
      sel2 = 0;
      sel1 = 1;
      sel0 = 1;
      #28;
      
      // test12
      sel3 = 1;
      sel2 = 1;
      sel1 = 0;
      sel0 = 0;
      #28;
      
      // test13
      sel3 = 1;
      sel2 = 1;
      sel1 = 0;
      sel0 = 1;
      #28;
      
      // test14
      sel3 = 1;
      sel2 = 1;
      sel1 = 1;
      sel0 = 0;
      #28;
      
      // test15
      sel3 = 1;
      sel2 = 1;
      sel1 = 1;
      sel0 = 1;
      #28;
   end
endmodule
