module ins_dec(INS, sel_data, write_en, alu_op, SEL_A, SEL_B, SEL_W, IMM);
   input [8:0] INS;
   output      sel_data;
   output      write_en;
   output      alu_op;
   output [1:0] SEL_A;
   output [1:0] SEL_B;
   output [1:0] SEL_W;
   output [3:0] IMM;
endmodule
