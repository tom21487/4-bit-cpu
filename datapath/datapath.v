// Minimum clock period: 206 ns
module datapath(SEL_A, SEL_B, SEL_W, IMM, clk, sel_data, write_en, alu_op, R3, R2, R1, R0);
   input [1:0] SEL_A;
   input [1:0] SEL_B;
   input [1:0] SEL_W;
   input [3:0] IMM;
   input clk;
   input sel_data;
   input write_en;
   input alu_op;
   output [3:0] R3;
   output [3:0] R2;
   output [3:0] R1;
   output [3:0] R0;

   // Select write data
   wire [3:0]   ALU_RES;
   wire [3:0]   DATA_IN;
   mux_21_4b mux_21_4b_0(.A(ALU_RES), .B(IMM), .sel(sel_data), .RES(DATA_IN));
   // This MUX doesn't work if one of the inputs is undefined, is this normal?
   
   // Register file
   wire [3:0] OUT_A;
   wire [3:0] OUT_B;
   reg_file reg_file_0(.SEL_A(SEL_A), .SEL_B(SEL_B), .write_en(write_en), .SEL_W(SEL_W),
                       .DATA_IN(DATA_IN), .clk(clk), .OUT_A(OUT_A), .OUT_B(OUT_B),
                       .Q3(R3), .Q2(R2), .Q1(R1), .Q0(R0));

   // ALU
   alu alu_0(.A(OUT_A), .B(OUT_B), .sel(alu_op), .RES(ALU_RES));
endmodule;
