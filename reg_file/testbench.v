`timescale 1 ns/1 ns	//time scale for simulation

module testbench;
   reg [1:0] SEL_A;
   reg [1:0] SEL_B;
   reg       clk;
   wire [3:0] OUT_A;
   wire [3:0] OUT_B;
   
   reg_file my_reg_file(.SEL_A(SEL_A), .SEL_B(SEL_B), .clk(clk), .OUT_A(OUT_A),
                        .OUT_B(OUT_B));

   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, testbench);

      // Setup fixed register values
      // Setup
      clk = 0;
      #17;

      // Hold
      clk = 1;
      #17;

      // Once register values are set, check values asynchronously
      // test0, OUT_A = r0.content
      //        OUT_B = r3.content
      SEL_A = 2'b00;
      SEL_B = 2'b11;
      #14;

      // test1, OUT_A = r1.content
      //        OUT_B = r2.content
      SEL_A = 2'b01;
      SEL_B = 2'b10;
      #14;

      // test2, OUT_A = r2.content
      //        OUT_B = r1.content
      SEL_A = 2'b10;
      SEL_B = 2'b01;
      #14;

      // test3, OUT_A = r3.content
      //        OUT_B = r0.content
      SEL_A = 2'b11;
      SEL_B = 2'b00;
      #14;
   end
endmodule
