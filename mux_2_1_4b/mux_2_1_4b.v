// Critical path delay = 7ns
module mux_2_1_4b(A, B, sel, RES);
   input [3:0] A;
   input [3:0] B;
   input       sel;
   output [3:0] RES;
   mux_2_1_1b mux_2_1_1b_0[3:0](.a(A), .b(B), .sel(sel), .res(RES));
endmodule // mux4
