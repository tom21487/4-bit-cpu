`timescale 1 ns/1 ns	//time scale for simulation

module testbench;
   reg [1:0] SEL_A;
   reg [1:0] SEL_B;
   reg [1:0] SEL_W;
   reg [3:0] IMM;
   reg clk;
   reg sel_data;
   reg write_en;
   reg alu_op;
   wire [3:0] R3;
   wire [3:0] R2;
   wire [3:0] R1;
   wire [3:0] R0;

   datapath datapath_0(.SEL_A(SEL_A), .SEL_B(SEL_B), .SEL_W(SEL_W),
                       .IMM(IMM), .clk(clk), .sel_data(sel_data), .write_en(write_en),
                       .alu_op(alu_op), .R3(R3), .R2(R2), .R1(R1), .R0(R0));

   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, testbench);

      // test 0.0: push r0 #0
      // SEL_A = 2'bxx;
      // SEL_B = 2'bxx;
      SEL_W = 2'b00;
      IMM = 4'b0000;
      clk = 0;
      sel_data = 1;
      write_en = 1;
      #103;
      clk = 1;
      #103;
      
      // alu_op = x;
      // test 0.1: push r1 #-1
      // test 0.2: push r2 #2
      // test 0.3: push r3 #-3

      // test 1: add

      // test 2: nand

      // test 3: noop

      // test 4: left shift
   end
endmodule
