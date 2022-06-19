`timescale 1 ns/1 ns	//time scale for simulation

module testbench;
   reg [1:0] SEL_A;
   reg [1:0] SEL_B;
   reg       write_en;
   reg [1:0] SEL_W;
   reg [3:0] DATA_IN;
   reg       clk;
   wire [3:0] OUT_A;
   wire [3:0] OUT_B;

   reg_file reg_file_0(.SEL_A(SEL_A), .SEL_B(SEL_B), .write_en(write_en), .SEL_W(SEL_W),
                       .DATA_IN(DATA_IN), .clk(clk), .OUT_A(OUT_A), .OUT_B(OUT_B));

   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, testbench);

      // tests use one-hot values
      // test 0.0: write 4'b0001 to reg0, result in OUT_A
      DATA_IN = 4'b0001;
      SEL_W = 2'b00;
      SEL_A = 2'b00;
      SEL_B = 2'b00;
      write_en = 1;
      clk = 0;
      #35;
      clk = 1;
      #31;

      // test 0.1: write 4'b0001 to reg1, result in OUT_A (ignored)
      DATA_IN = 4'b0001;
      SEL_W = 2'b01;
      SEL_A = 2'b01;
      SEL_B = 2'b00;
      write_en = 0;
      clk = 0;
      #35;
      clk = 1;
      #31;
      
      // test 1.0: write 4'b0010 to reg1, result in OUT_B
      DATA_IN = 4'b0010;
      SEL_W = 2'b01;
      SEL_A = 2'b00;
      SEL_B = 2'b01;
      write_en = 1;
      clk = 0;
      #35;
      clk = 1;
      #31;

      // test 1.1: write 4'b0010 to reg2, result in OUT_B (ignored)
      DATA_IN = 4'b0010;
      SEL_W = 2'b10;
      SEL_A = 2'b00;
      SEL_B = 2'b10;
      write_en = 0;
      clk = 0;
      #35;
      clk = 1;
      #31;
      
      // test 2.0: write 4'b0100 to reg2, result in OUT_A
      DATA_IN = 4'b0100;
      SEL_W = 2'b10;
      SEL_A = 2'b10;
      SEL_B = 2'b01;
      write_en = 1;
      clk = 0;
      #35;
      clk = 1;
      #31;

      // test 2.1: write 4'b0100 to reg3, result in OUT_A (ignored)
      DATA_IN = 4'b0100;
      SEL_W = 2'b11;
      SEL_A = 2'b11;
      SEL_B = 2'b01;
      write_en = 0;
      clk = 0;
      #35;
      clk = 1;
      #31;
      
      // test 3.0: write 4'b1000 to reg3, result in OUT_B
      DATA_IN = 4'b1000;
      SEL_W = 2'b11;
      SEL_A = 2'b10;
      SEL_B = 2'b11;
      write_en = 1;
      clk = 0;
      #35;
      clk = 1;
      #31;
      
      // test 3.1: write 4'b1000 to reg0, result in OUT_B (ignored)
      DATA_IN = 4'b1000;
      SEL_W = 2'b00;
      SEL_A = 2'b10;
      SEL_B = 2'b00;
      write_en = 0;
      clk = 0;
      #35;
      clk = 1;
      #31;
   end
endmodule
