// Critical path delay:
// Everything: 51 ns
// Equality: 8 ns
module alu(A, B, sel, RES, eq, ovf);
   input [3:0] A;
   input [3:0] B;
   input sel;
   output [3:0] RES;
   output eq;
   output ovf;
   
   wire [3:0]  W0;
   rca rca_0(.A(A), .B(B), .SUM(W0), .ovf(ovf));
   wire [3:0] W1;
   wire [3:0] W2;
   genvar i;
   generate
      for (i = 3; i >= 0; i = i-1) begin : gen_operations
		   nand #(2) nand_0(W1[i], A[i], B[i]);
         xnor #(5) xnor_0(W2[i], A[i], B[i]);
      end
   endgenerate
   mux_2_1_4b mux_2_1_4b_0(.A(W0), .B(W1), .sel(sel), .RES(RES));
   and #(3) and_0(eq, W2[3], W2[2], W2[1], W2[0]);
endmodule
