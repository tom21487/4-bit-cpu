module reg_file(SEL_A, SEL_B, clk, OUT_A, OUT_B);
   input [1:0] SEL_A;
   input [1:0] SEL_B;
   input clk;
   
   output [3:0] OUT_A;
   output [3:0] OUT_B;

   wire [3:0]   Q0;
   wire [3:0]   QB0;
   reg4 r0(.D(4'b0000), .clk(clk), .Q(Q0), .QB(QB0));

   wire [3:0]   Q1;
   wire [3:0]   QB1;
   reg4 r1(.D(4'b0001), .clk(clk), .Q(Q1), .QB(QB1));

   wire [3:0]   Q2;
   wire [3:0]   QB2;
   reg4 r2(.D(4'b0010), .clk(clk), .Q(Q2), .QB(QB2));

   wire [3:0]   Q3;
   wire [3:0]   QB3;
   reg4 r3(.D(4'b0011), .clk(clk), .Q(Q3), .QB(QB3));

   mux_41_4b mux_41_4b_0(.A(Q0), .B(Q1), .C(Q2), .D(Q3), .sel1(SEL_A[1]), .sel0(SEL_A[0]),
                         .RES(OUT_A));
   mux_41_4b mux_41_4b_1(.A(Q0), .B(Q1), .C(Q2), .D(Q3), .sel1(SEL_B[1]), .sel0(SEL_B[0]),
                         .RES(OUT_B));
endmodule;
