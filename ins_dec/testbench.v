// testbench for instruction decoder combination logic
// actual instructions will be tested in ../datapath
`timescale 1 ns/1 ns	//time scale for simulation

module testbench;
   reg [15:0] INS;
   wire      sel_data;
   wire      write_en;
   wire      alu_op;
   wire [1:0] SEL_A;
   wire [1:0] SEL_B;
   wire [1:0] SEL_W;
   wire [3:0] IMM;
   wire [3:0] JMP;

   ins_dec my_ins_dec(.INS(INS), .sel_data(sel_data), .write_en(write_en), .alu_op(alu_op), .SEL_A(SEL_A), .SEL_B(SEL_B), .SEL_W(SEL_W), .IMM(IMM), .JMP(JMP));

   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, testbench);

      // test 0: all zeros
      // time: 0 ns
      // sel_data = INS[9] = 0
      // write_en = (INS[10]+~INS[9]+~INS[8])*(~INS[10]+INS[9]+INS[8])
      //          = (0+1+1)*(1+0+0) = 1*1 = 1
      // alu_op = INS[8] = 0
      // SEL_A = INS[3:2] = 2'b00
      // SEL_B = INS[1:0] = 2'b00
      // SEL_W = INS[5:4] = 2'b00
      // IMM = INS[3:0] = 4'b0000
      // JMP = INS[7:4] = 4'b0000
      INS = 16'b00000000000000;
      #7;

      // test 1: all ones
      // time: 7 ns
      // sel_data = INS[9] = 1
      // write_en = (INS[10]+~INS[9]+~INS[8])*(~INS[10]+INS[9]+INS[8])
      //          = (1+0+0)*(0+1+1) = 1*1 = 1
      // alu_op = INS[8] = 1
      // SEL_A = INS[3:2] = 2'b11
      // SEL_B = INS[1:0] = 2'b11
      // SEL_W = INS[5:4] = 2'b11
      // IMM = INS[3:0] = 4'b1111
      // JMP = INS[7:4] = 4'b1111
      INS = 16'b0000011111111111;
      #7;

      // test 2: interlacing 1
      // time: 14 ns
      // sel_data = INS[9] = 0
      // write_en = (INS[10]+~INS[9]+~INS[8])*(~INS[10]+INS[9]+INS[8])
      //          = (1+1+0)*(0+0+1) = 1*1 = 1
      // alu_op = INS[8] = 1
      // SEL_A = INS[3:2] = 2'b01
      // SEL_B = INS[1:0] = 2'b01
      // SEL_W = INS[5:4] = 2'b01
      // IMM = INS[3:0] = 4'b0101
      // JMP = INS[7:4] = 4'b0101
      INS = 16'b0000010101010101;
      #7;
      
      // test 3: interlacing 2
      // time: 21 ns
      // sel_data = INS[9] = 1
      // write_en = (INS[10]+~INS[9]+~INS[8])*(~INS[10]+INS[9]+INS[8])
      //          = (0+0+1)*(1+1+0) = 1*1 = 1
      // alu_op = INS[8] = 0
      // SEL_A = INS[3:2] = 2'b10
      // SEL_B = INS[1:0] = 2'b10
      // SEL_W = INS[5:4] = 2'b10
      // IMM = INS[3:0] = 4'b1010
      // JMP = INS[7:4] = 4'b1010
      INS = 16'b0000001010101010;
      #7;
      
      // test 4: branch opcode, write_en should be 0
      // time: 28 ns
      // sel_data = INS[9] = 0
      // write_en = (INS[10]+~INS[9]+~INS[8])*(~INS[10]+INS[9]+INS[8])
      //          = (1+1+1)*(0+0+0) = 1*0 = 0
      // alu_op = INS[8] = 0
      // SEL_A = INS[3:2] = 2'b00
      // SEL_B = INS[1:0] = 2'b00
      // SEL_W = INS[5:4] = 2'b00
      // IMM = INS[3:0] = 4'b0000
      // JMP = INS[7:4] = 4'b0000
      INS = 16'b0000010000000000;
      #7;

      // test 5: noop opcode, write_en should be 0
      // time: 35 ns
      // sel_data = INS[9] = 1
      // write_en = (INS[10]+~INS[9]+~INS[8])*(~INS[10]+INS[9]+INS[8])
      //          = (0+0+0)*(1+1+1) = 0*1 = 0
      // alu_op = INS[8] = 1
      // SEL_A = INS[3:2] = 2'b00
      // SEL_B = INS[1:0] = 2'b00
      // SEL_W = INS[5:4] = 2'b00
      // IMM = INS[3:0] = 4'b0000
      // JMP = INS[7:4] = 4'b0000
      INS = 16'b0000001100000000;
      #7;      
   end
endmodule
