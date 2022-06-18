module reg_file(SEL_A, SEL_B, SEL_W, DATA_IN, clk, OUT_A, OUT_B);
   // IO
   input [1:0] SEL_A;
   input [1:0] SEL_B;
   input [1:0] SEL_W;
   input [3:0] DATA_IN;
   input clk;
   output [3:0] OUT_A;
   output [3:0] OUT_B;

   // Write
   wire         s3;
   wire         s2;
   wire         s1;
   wire         s0;
   decoder_24_1b decoder_24_1b_0(.w1(SEL_W[1]), .w0(SEL_W[0]), .d3(s3), .d2(s2), .d1(s1), .d0(s0));

   wire [3:0]   Q3;
   wire [3:0]   QB3;
   wire [3:0]   IN3;
   mux_21_4b mux_21_4b_3(.A(Q3), .B(DATA_IN), .sel(s3), .RES(IN3));

   wire [3:0]   Q2;
   wire [3:0]   QB2;
   wire [3:0]   IN2;
   mux_21_4b mux_21_4b_2(.A(Q2), .B(DATA_IN), .sel(s2), .RES(IN2));

   wire [3:0]   Q1;
   wire [3:0]   QB1;
   wire [3:0]   IN1;
   mux_21_4b mux_21_4b_1(.A(Q1), .B(DATA_IN), .sel(s1), .RES(IN1));
   
   wire [3:0]   Q0;
   wire [3:0]   QB0;
   wire [3:0]   IN0;
   mux_21_4b mux_21_4b_0(.A(Q0), .B(DATA_IN), .sel(s0), .RES(IN0));
   
   // Registers
   reg4 r3(.D(IN3), .clk(clk), .Q(Q3), .QB(QB3));
   reg4 r2(.D(IN2), .clk(clk), .Q(Q2), .QB(QB2));
   reg4 r1(.D(IN1), .clk(clk), .Q(Q1), .QB(QB1));
   reg4 r0(.D(IN0), .clk(clk), .Q(Q0), .QB(QB0));

   // Read
   mux_41_4b mux_41_4b_0(.A(Q0), .B(Q1), .C(Q2), .D(Q3), .sel1(SEL_A[1]), .sel0(SEL_A[0]),
                         .RES(OUT_A));
   mux_41_4b mux_41_4b_1(.A(Q0), .B(Q1), .C(Q2), .D(Q3), .sel1(SEL_B[1]), .sel0(SEL_B[0]),
                         .RES(OUT_B));
endmodule; // reg_file
