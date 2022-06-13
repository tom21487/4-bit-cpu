// Critical path delay = 7ns
module mux_21_4b(A, B, sel, RES);
   input [3:0] A;
   input [3:0] B;
   input       sel;
   output [3:0] RES;
   mux1 my_mux1[3:0](.a(A), .b(B), .sel(sel), .res(RES));
endmodule; // mux4
