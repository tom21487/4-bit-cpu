// Critical path delay = 7ns
module ins_dec(INS, sel_data, write_en, alu_op, SEL_A, SEL_B, SEL_W, IMM, JMP);
   input [10:0] INS;
   output      sel_data;
   output      write_en;
   output      alu_op;
   output [1:0] SEL_A;
   output [1:0] SEL_B;
   output [1:0] SEL_W;
   output [3:0] IMM;
   output [3:0] JMP;
   // sel_data = INS[9]
   buf #(1) buf_0(sel_data, INS[9]); // buf is wire delay
   // write_en = (INS[10]+~INS[9]+~INS[8])*(~INS[10]+INS[9]+INS[8])
   wire         w0, w1, w2, w3, w4;
   not #(1) not_0(w0, INS[9]);
   not #(1) not_1(w1, INS[8]);
   not #(1) not_2(w2, INS[10]);
   or #(3) or_0(w3, INS[10], w0, w1);
   or #(3) or_1(w4, w2, INS[9], INS[8]);
   and #(3) and_0(write_en, w3, w4);
   // alu_op = INS[8]
   buf #(1) buf_1(alu_op, INS[8]);
   // SEL_A = INS[3:2]
   buf #(1) buf_2(SEL_A[1], INS[3]);
   buf #(1) buf_3(SEL_A[0], INS[2]);
   // SEL_B = INS[1:0]
   buf #(1) buf_4(SEL_B[1], INS[1]);
   buf #(1) buf_5(SEL_B[0], INS[0]);
   // SEL_W = INS[5:4]
   buf #(1) buf_6(SEL_W[1], INS[5]);
   buf #(1) buf_7(SEL_W[0], INS[4]);
   // IMM = INS[3:0]
   buf #(1) buf_8(IMM[3], INS[3]);
   buf #(1) buf_9(IMM[2], INS[2]);
   buf #(1) buf_10(IMM[1], INS[1]);
   buf #(1) buf_11(IMM[0], INS[0]);
   // JMP = INS[7:4]
   buf #(1) buf_12(JMP[3], INS[7]);
   buf #(1) buf_13(JMP[2], INS[6]);
   buf #(1) buf_14(JMP[1], INS[5]);
   buf #(1) buf_15(JMP[0], INS[4]);
endmodule
