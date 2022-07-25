// Implementation of a PIPO shift register
// Setup delay = hold delay = 17ns
module reg9(D, clk, Q, QB);
   input [8:0] D;
   input       clk;
   output [8:0] Q;
   output [8:0] QB;

   dff dff_0[8:0](.d(D), .clk(clk), .q(Q), .qb(QB));
endmodule; // reg4
