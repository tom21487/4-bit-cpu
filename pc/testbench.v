`timescale 1 ns/1 ns	//time scale for simulation

module testbench;
   reg set_pc;
   reg alu_eq;
   wire clk;
   wire [3:0] PC_CURR;
   pc my_pc(.set_pc(set_pc), .alu_eq(alu_eq), .clk(clk), .PC_CURR(PC_CURR));

   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, testbench);
      /*
       test 0
       time: 0 ns
       PC_CURR = 4'bxxxx
       */
      alu_eq = 1;
      clk = 0;
      set_pc = 1;
      #35;
      clk = 1
      #61;
      
      /*
       test 1
       time: 96 ns
       PC_CURR = 4'b0000
       */
      clk = 0;
      set_pc = 0;
      #35;
      clk = 1;
      #61;

      /*
       test 2
       time: 192 ns
       PC_CURR = 4'b0001
       */
      clk = 0;
      #35;
      clk = 1;
      #61;

      /*
       test 3
       time: 288 ns
       PC_CURR = 4'b0010
       */
      clk = 0;
      #35;
      clk = 1;
      #61;

      /*
       test 4
       time: 384 ns
       PC_CURR = 4'b0011
       */
      clk = 0;
      #35;
      clk = 1;
      #61;

      /*
       test 5
       time: 480 ns
       PC_CURR = 4'b0100
       */
      clk = 0;
      #35;
      clk = 1;
      #61;

      /*
       test 6
       time: 576 ns
       PC_CURR = 4'b0101
       */
      clk = 0;
      #35;
      clk = 1;
      #61;

      /*
       test 7
       time: 672 ns
       PC_CURR = 4'b0110
       */
      clk = 0;
      #35;
      clk = 1;
      #61;

      /*
       test 8
       time: 768 ns
       PC_CURR = 4'b0111
       */
      clk = 0;
      #35;
      clk = 1;
      #61;

      /*
       test 9
       time: 864 ns
       PC_CURR = 4'b1000
       rca_0 flow
       */
      clk = 0;
      #35;
      clk = 1;
      #61;

      /*
       test 10
       time: 960 ns
       PC_CURR = 4'b1001
       */
      clk = 0;
      #35;
      clk = 1;
      #61;

      /*
       test 11
       time: 1056 ns
       PC_CURR = 4'b1010
       */
      clk = 0;
      #35;
      clk = 1;
      #61;

      /*
       test 12
       time: 1152 ns
       PC_CURR = 4'b1011
       */
      clk = 0;
      #35;
      clk = 1;
      #61;

      /*
       test 13
       time: 1248 ns
       PC_CURR = 4'b1100
       */
      clk = 0;
      #35;
      clk = 1;
      #61;

      /*
       test 14
       time: 1344 ns
       PC_CURR = 4'b1101
       */
      clk = 0;
      #35;
      clk = 1;
      #61;

      /*
       test 15
       time: 1440 ns
       PC_CURR = 4'b1110
       */
      clk = 0;
      #35;
      clk = 1;
      #61;

      /*
       test 16
       time: 1536 ns
       PC_CURR = 4'b1111
       */
      clk = 0;
      #35;
      clk = 1;
      #61;

      /*
       test 17
       time: 1632 ns
       PC_CURR = 4'b0000
       INS -> branch + 7
       */
      clk = 0;
      #35;
      clk = 1;
      #61;

      /*
       test 18
       time: 1728 ns
       PC_CURR = 4'b0111
       INS -> branch - 8
       */
      clk = 0;
      #35;
      clk = 1;
      #61;

      /*
       test 19
       time: 1824 ns
       PC_CURR = 4'b1111
       rca_0 overflow
       rca_1 overflow
       INS -> branch + 0
       */
      clk = 0;
      #35;
      clk = 1;
      #61;

      /*
       test 20
       time: 1920 ns
       PC_CURR = 4'b1111
       */
      clk = 0;
      #35;
      clk = 1;
      #61;
      
      $finish;
   end
endmodule
