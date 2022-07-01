// Critical path delay: 40 ns
module rca(A, B, SUM);
   input [3:0] A;
   input [3:0] B;
   output [3:0] SUM;
   wire         c_out0;
   fa fa0(.a(A[0]), .b(B[0]), .c_in(1'b0), .sum(SUM[0]), .c_out(c_out0));
   wire         c_out1;
   fa fa1(.a(A[1]), .b(B[1]), .c_in(c_out0), .sum(SUM[1]), .c_out(c_out1));
   wire         c_out2;
   fa fa2(.a(A[2]), .b(B[2]), .c_in(c_out1), .sum(SUM[2]), .c_out(c_out2));
   wire         c_out3;
   fa fa3(.a(A[3]), .b(B[3]), .c_in(c_out2), .sum(SUM[3]), .c_out(c_out3));
endmodule
