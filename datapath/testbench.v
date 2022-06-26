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

      /*
       test 0.0
       assembly: push r0 #0
       start time: 0 ns
       */
      // SEL_A = 2'bxx;
      // SEL_B = 2'bxx;
      SEL_W = 2'b00;
      IMM = 4'b0000;
      clk = 0;
      sel_data = 1;
      write_en = 1;
      // alu_op = x;
      #103;
      clk = 1;
      #103;
      /*
       reg state:
        r0 = 4'b0000;
        r1 = 4'bxxxx;
        r2 = 4'bxxxx;
        r3 = 4'bxxxx;
       */
      
      /*
       test 0.1
       assembly: push r1 #-1
       start time: 206 ns
       */   
      // SEL_A = 2'bxx;
      // SEL_B = 2'bxx;
      SEL_W = 2'b01;
      IMM = 4'b1111;
      clk = 0;
      sel_data = 1;
      write_en = 1;
      // alu_op = x;
      #103;
      clk = 1;
      #103;
      /*
       reg state:
        r0 = 4'b0000;
        r1 = 4'b1111;
        r2 = 4'bxxxx;
        r3 = 4'bxxxx;
       */

      /*
       test 0.2
       assembly: push r2 #2
       start time: 412 ns
       */
      // SEL_A = 2'bxx;
      // SEL_B = 2'bxx;
      SEL_W = 2'b10;
      IMM = 4'b0010;
      clk = 0;
      sel_data = 1;
      write_en = 1;
      // alu_op = x;
      #103;
      clk = 1;
      #103;
      /*
       reg state:
        r0 = 4'b0000;
        r1 = 4'b1111;
        r2 = 4'b0010;
        r3 = 4'bxxxx;
       */

      /*
       test 0.3
       assembly: push r3 #-3
       start time: 618 ns
       */
      // SEL_A = 2'bxx;
      // SEL_B = 2'bxx;
      SEL_W = 2'b11;
      IMM = 4'b1101;
      clk = 0;
      sel_data = 1;
      write_en = 1;
      // alu_op = x;
      #103;
      clk = 1;
      #103;
      /*
       reg state:
        r0 = 4'b0000;
        r1 = 4'b1111;
        r2 = 4'b0010;
        r3 = 4'b1101;
       */

      /*
       test 1.0
       assembly: add r2 r1 r0
       start time: 824 ns
       */
      SEL_A = 2'b01;
      SEL_B = 2'b00;
      SEL_W = 2'b10;
      // IMM = 4'bxxxx;
      clk = 0;
      sel_data = 0;
      write_en = 1;
      alu_op = 0;
      #103;
      clk = 1;
      #103;
      /*
       reg state:
        r0 = 4'b0000;
        r1 = 4'b1111;
        r2 = 4'b1111;
        r3 = 4'b1101;
       */

      /*
       test 1.1
       assembly: add r3 r2 r1
       start time: 1030 ns
       */
      SEL_A = 2'b10;
      SEL_B = 2'b01;
      SEL_W = 2'b11;
      // IMM = 4'bxxxx;
      clk = 0;
      sel_data = 0;
      write_en = 1;
      alu_op = 0;
      #103;
      clk = 1;
      #103;
      /*
       reg state:
        r0 = 4'b0000;
        r1 = 4'b1111;
        r2 = 4'b1111;
        r3 = 4'b1110;
       */

      /*
       test 1.2
       assembly: add r1 r2 r2
       start time: 1236 ns
       */
      SEL_A = 2'b10;
      SEL_B = 2'b10;
      SEL_W = 2'b01;
      // IMM = 4'bxxxx;
      clk = 0;
      sel_data = 0;
      write_en = 1;
      alu_op = 0;
      #103;
      clk = 1;
      #103;
      /*
       reg state:
        r0 = 4'b0000;
        r1 = 4'b1110;
        r2 = 4'b1111;
        r3 = 4'b1110;
       */

      /*
       test 1.3
       assembly: add r3 r3 r3
       start time: 1442 ns
       */
      SEL_A = 2'b11;
      SEL_B = 2'b11;
      SEL_W = 2'b11;
      // IMM = 4'bxxxx;
      clk = 0;
      sel_data = 0;
      write_en = 1;
      alu_op = 0;
      #103;
      clk = 1;
      #103;
      /*
       reg state:
        r0 = 4'b0000;
        r1 = 4'b1110;
        r2 = 4'b1111;
        r3 = 4'b1100;
       */
      
      /*
       test 3
       assembly: noop
       start time: 1648
       */
      // SEL_A = 2'bxx;
      // SEL_B = 2'bxx;
      // SEL_W = 2'bxx;
      // IMM = 4'bxxxx;
      clk = 0;
      // sel_data = x;
      write_en = 0;
      // alu_op = x;
      #103;
      clk = 1;
      #103;
      /*
       reg state:
        r0 = 4'b0000;
        r1 = 4'b1110;
        r2 = 4'b1111;
        r3 = 4'b1100;
       */

      /*
       test 2.0
       assembly: nand r2 r1 r3
       start time: 1854
       */
      SEL_A = 2'b01;
      SEL_B = 2'b11;
      SEL_W = 2'b10;
      // IMM = 4'bxxxx;
      clk = 0;
      sel_data = 0;
      write_en = 1;
      alu_op = 1;
      #103;
      clk = 1;
      #103;
      /*
       reg state:
        r0 = 4'b0000;
        r1 = 4'b1110;
        r2 = 4'b0011;
        r3 = 4'b1100;
       */

      /*
       test 2.1
       assembly: nand r0 r2 r1
       start time: 2060 ns
       */
      SEL_A = 2'b10;
      SEL_B = 2'b01;
      SEL_W = 2'b00;
      // IMM = 4'bxxxx;
      clk = 0;
      sel_data = 0;
      write_en = 1;
      alu_op = 1;
      #103;
      clk = 1;
      #103;
      /*
       reg state:
        r0 = 4'b1101;
        r1 = 4'b1110;
        r2 = 4'b0011;
        r3 = 4'b1100;
       */

      /*
       test 2.2
       assembly: nand r3 r1 r3
       start time: 2266 ns
       */
      SEL_A = 2'b01;
      SEL_B = 2'b11;
      SEL_W = 2'b11;
      // IMM = 4'bxxxx;
      clk = 0;
      sel_data = 0;
      write_en = 1;
      alu_op = 1;
      #103;
      clk = 1;
      #103;
      /*
       reg state:
        r0 = 4'b1101;
        r1 = 4'b1110;
        r2 = 4'b0011;
        r3 = 4'b0011;
       */

      /*
       test 2.3
       assembly: nand r0 r0 r0
       start time: 2472 ns
       */      
      SEL_A = 2'b00;
      SEL_B = 2'b00;
      SEL_W = 2'b00;
      // IMM = 4'bxxxx;
      clk = 0;
      sel_data = 0;
      write_en = 1;
      alu_op = 1;
      #103;
      clk = 1;
      #103;
      /*
       reg state:
        r0 = 4'b0010;
        r1 = 4'b1110;
        r2 = 4'b0011;
        r3 = 4'b0011;
       */
   end
endmodule
