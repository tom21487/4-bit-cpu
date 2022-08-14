// note: testbench for instruction decoder
// note: actual instructions will be tested in ../datapath
`timescale 1 ns/1 ns	//time scale for simulation

module testbench;
   reg [8:0] INS;
   wire      sel_data;
   wire      write_en;
   wire      alu_op;
   wire [1:0] SEL_A;
   wire [1:0] SEL_B;
   wire [1:0] SEL_W;
   wire [3:0] IMM;

   ins_dec my_ins_dec(.INS(INS), .sel_data(sel_data), .write_en(write_en), .alu_op(alu_op), .SEL_A(SEL_A), .SEL_B(SEL_B), .SEL_W(SEL_W), .IMM(IMM));

   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, testbench);

      // test set 0: one hot
      // test 0.0
      // sel_data = INS[7] = 0
      // write_en = ~(INS[7]*INS[6]) = 1
      // alu_op = INS[6] = 0
      // SEL_A = INS[3:2] = 2'b00
      // SEL_B = INS[1:0] = 2'b01
      // SEL_W = INS[5:4] = 2'b00
      // IMM = INS[3:0] = 4'b0001
      INS = 9'b000000001;
      #4;

      // test 0.1
      // sel_data = INS[7] = 0
      // write_en = ~(INS[7]*INS[6]) = 1
      // alu_op = INS[6] = 0
      // SEL_A = INS[3:2] = 2'b00
      // SEL_B = INS[1:0] = 2'b10
      // SEL_W = INS[5:4] = 2'b00
      // IMM = INS[3:0] = 4'b0010
      INS = 9'b000000010;
      #4;

      // test 0.2
      // sel_data = INS[7] = 0
      // write_en = ~(INS[7]*INS[6]) = 1
      // alu_op = INS[6] = 0
      // SEL_A = INS[3:2] = 2'b01
      // SEL_B = INS[1:0] = 2'b00
      // SEL_W = INS[5:4] = 2'b00
      // IMM = INS[3:0] = 4'b0100
      INS = 9'b000000100;
      #4;

      // test 0.3
      // sel_data = INS[7] = 0
      // write_en = ~(INS[7]*INS[6]) = 1
      // alu_op = INS[6] = 0
      // SEL_A = INS[3:2] = 2'b10
      // SEL_B = INS[1:0] = 2'b00
      // SEL_W = INS[5:4] = 2'b00
      // IMM = INS[3:0] = 4'b1000
      INS = 9'b000001000;
      #4;

      // test 0.4
      // sel_data = INS[7] = 0
      // write_en = ~(INS[7]*INS[6]) = 1
      // alu_op = INS[6] = 0
      // SEL_A = INS[3:2] = 2'b00
      // SEL_B = INS[1:0] = 2'b00
      // SEL_W = INS[5:4] = 2'b01
      // IMM = INS[3:0] = 4'b0000
      INS = 9'b000010000;
      #4;

      // test 0.5
      // sel_data = INS[7] = 0
      // write_en = ~(INS[7]*INS[6]) = 1
      // alu_op = INS[6] = 0
      // SEL_A = INS[3:2] = 2'b00
      // SEL_B = INS[1:0] = 2'b00
      // SEL_W = INS[5:4] = 2'b10
      // IMM = INS[3:0] = 4'b0000
      INS = 9'b000100000;
      #4;

      // test 0.6
      // sel_data = INS[7] = 0
      // write_en = ~(INS[7]*INS[6]) = 1
      // alu_op = INS[6] = 1
      // SEL_A = INS[3:2] = 2'b00
      // SEL_B = INS[1:0] = 2'b00
      // SEL_W = INS[5:4] = 2'b00
      // IMM = INS[3:0] = 4'b0000
      INS = 9'b001000000;
      #4;

      // test 0.7
      // sel_data = INS[7] = 1
      // write_en = ~(INS[7]*INS[6]) = 1
      // alu_op = INS[6] = 0
      // SEL_A = INS[3:2] = 2'b00
      // SEL_B = INS[1:0] = 2'b00
      // SEL_W = INS[5:4] = 2'b00
      // IMM = INS[3:0] = 4'b0000
      INS = 9'b010000000;
      #4;

      // test 0.8
      // sel_data = INS[7] = 0
      // write_en = ~(INS[7]*INS[6]) = 1
      // alu_op = INS[6] = 0
      // SEL_A = INS[3:2] = 2'b00
      // SEL_B = INS[1:0] = 2'b00
      // SEL_W = INS[5:4] = 2'b00
      // IMM = INS[3:0] = 4'b0000
      INS = 9'b100000000;
      #4;

      // test set 1: edge cases
      // test 1.0: zero
      // sel_data = INS[7] = 0
      // write_en = ~(INS[7]*INS[6]) = 1
      // alu_op = INS[6] = 0
      // SEL_A = INS[3:2] = 2'b00
      // SEL_B = INS[1:0] = 2'b00
      // SEL_W = INS[5:4] = 2'b00
      // IMM = INS[3:0] = 4'b0000
      INS = 9'b000000000;
      #4;

      // test 1.1: INS[7] = INS[6] = 1 for write_en 
      // sel_data = INS[7] = 1
      // write_en = ~(INS[7]*INS[6]) = 0
      // alu_op = INS[6] = 1
      // SEL_A = INS[3:2] = 2'b11
      // SEL_B = INS[1:0] = 2'b11
      // SEL_W = INS[5:4] = 2'b11
      // IMM = INS[3:0] = 4'b1111
      INS = 9'b111111111;
      #4;
   end
endmodule
