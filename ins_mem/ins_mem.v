module ins_mem(/*instruction matrix*/, PC);
   // instruction is a user-defined module
   // .b8 -> .b0 are decided by the instruction matrix (need something better than 144 separate inputs)
   instruction ins15(.b8(0), .b7(1), .b6(1), .b5(1), .b4(0), .b3(0), .b2(1), .b1(0), .b0(0));
   instruction ins14(.b8(0), .b7(1), .b6(1), .b5(1), .b4(0), .b3(0), .b2(1), .b1(0), .b0(0));
   mux_16_1_9b(.A(ins15), .B(ins14), .sel3(PC[3]), .sel2(PC[2]), .sel1(PC[1]), .sel0(PC[0]));
endmodule;
