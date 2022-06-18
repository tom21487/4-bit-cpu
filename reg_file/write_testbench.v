`timescale 1 ns/1 ns	//time scale for simulation

module testbench;
   reg [1:0] SEL_A;
   reg [1:0] SEL_B;
   reg [1:0] SEL_W;
   reg [3:0] DATA_IN;
   reg       clk;
   wire [3:0] OUT_A;
   wire [3:0] OUT_B;

   reg_file reg_file_0(.SEL_A(SEL_A), .SEL_B(SEL_B), .SEL_W(SEL_W), .DATA_IN(DATA_IN),
                       .clk(clk), .OUT_A(OUT_A), .OUT_B(OUT_B));

   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, testbench);

      // test0: write 4'b0101 to reg1
      DATA_IN = 4'b0101;
      SEL_W = 2'b01;
      SEL_A = 2'b01;
      SEL_B = 2'b00;
      clk = 0;
      #28;
      clk = 1;
      #31;

      // test1: write 4'b0000 to reg3
      DATA_IN = 4'b0000;
      SEL_W = 2'b11;
      SEL_A = 2'b01;
      SEL_B = 2'b11;
      clk = 0;
      #28;
      clk = 1;
      #31;
   end
endmodule
