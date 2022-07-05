// Critical path delay = 7ns
// 0 -> copy a
// 1 -> copy b
module mux_2_1_1b(a, b, sel, res);
   input a;
   input b;
   input sel;
   output res;
   wire   not_sel;
   not #(1) not0(not_sel, sel);
   wire   a_out;
   and #(3) and0(a_out, a, not_sel);
   wire   b_out;
   and #(3) and1(b_out, b, sel);
   or #(3) and2(res, a_out, b_out);
endmodule; // mux1

   
   
