`timescale 1 ns/1 ns	//time scale for simulation

module testbench;
   reg [3:0] PC_INIT;
   reg       set_pc;
   reg       clk;
   wire [3:0] PC_CURR;

   pc my_pc(.PC_INIT(PC_INIT), .set_pc(set_pc), .clk(clk), .PC_CURR(PC_CURR));

   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, testbench);

      /*
       test 0
       time: 0 ns
       PC_CURR = 4'bxxxx
       */
      PC_INIT = 4'b0000;
      set_pc = 1;
      clk = 0;
      #24;
      clk = 1;
      #57;
      set_pc = 0;
      
      /*
       test 1
       time: 81 ns
       PC_CURR = 4'b0000
       */
      clk = 0;
      #24;
      clk = 1;
      #57;

      /* test 2
       time: 162 ns
       PC_CURR = 4'b0001
       */
      clk = 0;
      #24;
      clk = 1;
      #57;

      /* test 3
       time: 243 ns
       PC_CURR = 4'b0010
       */
      clk = 0;
      #24;
      clk = 1;
      #57;
   end
endmodule
