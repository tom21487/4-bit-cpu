// Implementation of a PIPO shift register
// Setup delay = hold delay = 17ns
module reg4(D, clk, Q, QB);
   input [3:0] D;
   input       clk;
   output [3:0] Q;
   output [3:0] QB;

   dff DFF[3:0](.d(D), .clk(clk), .q(Q), .qb(QB));
endmodule; // reg4
