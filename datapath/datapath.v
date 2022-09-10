// clock period = 2*76 ns = 152 ns
module datapath(clk, set_pc, R3, R2, R1, R0, alu_eq, alu_ovf);
   input clk;
   input set_pc;
   output [3:0] R3;
   output [3:0] R2;
   output [3:0] R1;
   output [3:0] R0;
   output alu_eq;
   output alu_ovf;

   // instruction fetch
   wire [3:0] PC_CURR;
   wire [15:0]   RES_INS;
   pc pc_0(.set_pc(set_pc), .alu_eq(alu_eq), .clk(clk), .INS(RES_INS), .PC_CURR(PC_CURR));
   ins_mem ins_mem_0(.PC(PC_CURR), .RES_INS(RES_INS));

   // instruction decode
   wire sel_data;
   wire write_en;
   wire alu_op;
   wire [1:0] SEL_A;
   wire [1:0] SEL_B;
   wire [1:0] SEL_W;
   wire [3:0] IMM;
   ins_dec ins_dec_0(.INS(RES_INS), .sel_data(sel_data), .write_en(write_en), .alu_op(alu_op),
           .SEL_A(SEL_A), .SEL_B(SEL_B), .SEL_W(SEL_W), .IMM(IMM));
   
   // Select write data
   wire [3:0] ALU_RES;
   wire [3:0] DATA_IN;
   mux_2_1_4b mux_2_1_4b_0(.A(ALU_RES), .B(IMM), .sel(sel_data), .RES(DATA_IN));
   
   // Register file
   wire [3:0] OUT_A;
   wire [3:0] OUT_B;
   reg_file reg_file_0(.SEL_A(SEL_A), .SEL_B(SEL_B), .write_en(write_en),
                       .SEL_W(SEL_W), .DATA_IN(DATA_IN), .clk(clk), .OUT_A(OUT_A),
                       .OUT_B(OUT_B), .Q3(R3), .Q2(R2), .Q1(R1), .Q0(R0));

   // ALU
   alu alu_0(.A(OUT_A), .B(OUT_B), .sel(alu_op), .RES(ALU_RES), .eq(alu_eq), .ovf(alu_ovf));
endmodule;
