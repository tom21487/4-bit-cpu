`timescale 1 ns/1 ns	//time scale for simulation

module testbench;
   reg set_pc;
   reg alu_eq;
   reg clk;
   reg [15:0] INS;
   wire [3:0] PC_CURR;
   pc my_pc(.set_pc(set_pc), .alu_eq(alu_eq), .clk(clk), .INS(INS), .PC_CURR(PC_CURR));

   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, testbench);
      /*
       test 0
       time: 0 ns
       at this time PC_CURR = 4'bxxxx
       */
      INS = 16'b0000001100000000;
      alu_eq = 1;
      clk = 0;
      set_pc = 1;
      #75;
      clk = 1;
      #17;
      
      /*
       test 1
       time: 92 ns
       at this time PC_CURR = 4'b0000
       */
      clk = 0;
      set_pc = 0;
      #75;
      clk = 1;
      #17;

      /*
       test 2
       time: 184 ns
       at this time PC_CURR = 4'b0001
       */
      clk = 0;
      #75;
      clk = 1;
      #17;

      /*
       test 3
       time: 276 ns
       at this time PC_CURR = 4'b0010
       */
      clk = 0;
      #75;
      clk = 1;
      #17;

      /*
       test 4
       time: 368 ns
       at this time PC_CURR = 4'b0011
       */
      clk = 0;
      #75;
      clk = 1;
      #17;

      /*
       test 5
       time: 460 ns
       at this time PC_CURR = 4'b0100
       */
      clk = 0;
      #75;
      clk = 1;
      #17;

      /*
       test 6
       time: 552 ns
       at this time PC_CURR = 4'b0101
       */
      clk = 0;
      #75;
      clk = 1;
      #17;

      /*
       test 7
       time: 644 ns
       at this time PC_CURR = 4'b0110
       */
      clk = 0;
      #75;
      clk = 1;
      #17;

      /*
       test 8
       time: 736 ns
       at this time PC_CURR = 4'b0111
       */
      clk = 0;
      #75;
      clk = 1;
      #17;

      /*
       test 9
       time: 828 ns
       at this time PC_CURR = 4'b1000
       */
      clk = 0;
      #75;
      clk = 1;
      #17;

      /*
       test 10
       time: 920 ns
       at this time PC_CURR = 4'b1001
       */
      clk = 0;
      #75;
      clk = 1;
      #17;

      /*
       test 11
       time: 1012 ns
       at this time PC_CURR = 4'b1010
       */
      clk = 0;
      #75;
      clk = 1;
      #17;

      /*
       test 12
       time: 1104 ns
       at this time PC_CURR = 4'b1011
       */
      clk = 0;
      #75;
      clk = 1;
      #17;

      /*
       test 13
       time: 1196 ns
       at this time PC_CURR = 4'b1100
       */
      clk = 0;
      #75;
      clk = 1;
      #17;

      /*
       test 14
       time: 1288 ns
       at this time PC_CURR = 4'b1101
       */
      clk = 0;
      #75;
      clk = 1;
      #17;

      /*
       test 15
       time: 1380 ns
       at this time PC_CURR = 4'b1110
       */
      clk = 0;
      #75;
      clk = 1;
      #17;

      /*
       test 16
       time: 1472 ns
       at this time PC_CURR = 4'b1111
       */
      clk = 0;
      #75;
      clk = 1;
      #17;

      /*
       test 17
       time: 1564 ns
       at this time PC_CURR = 4'b0000
       INS -> branch + 7
       */
      INS = 16'b0000010001110000;
      clk = 0;
      #75;
      clk = 1;
      #17;

      /*
       test 18
       time: 1656 ns
       at this time PC_CURR = 4'b0111
       INS -> branch - 2
       */
      INS = 16'b0000010011100000;
      clk = 0;
      #75;
      clk = 1;
      #17;

      /*
       test 19
       time: 1748 ns
       at this time PC_CURR = 4'b0101
       INS -> branch + 0
       */
      INS = 16'b0000010000000000;
      clk = 0;
      #75;
      clk = 1;
      #17;

      /*
       test 20
       time: 1840 ns
       at this time PC_CURR = 4'b0101
       */
      clk = 0;
      #75;
      clk = 1;
      #17;
      
      $finish;
   end
endmodule
