// Critical path delay = 47 ns
module alu(A, B, sel, RES);
   input [3:0] A;
   input [3:0] B;
   input       sel;
   output [3:0] RES;
   
   wire [3:0]  W0;
   rca rca_0(.A(A), .B(B), .SUM(W0));
   wire [3:0] W1;
   /*
   nand nand_0(W1[0], A[0], B[0]);
   nand nand_1(W1[1], A[1], B[1]);
   nand nand_2(W1[2], A[2], B[2]);
   nand nand_3(W1[3], A[3], B[3]);
   */
   genvar i;
   generate
      for (i = 3; i >= 0; i = i-1) begin
	 nand #(2) my_nand(W1[i], A[i], B[i]);
      end
   endgenerate
   mux_2_1_4b mux_2_1_4b_0(.A(W0), .B(W1), .sel(sel), .RES(RES));
endmodule
