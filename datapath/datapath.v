// Minimum clock period: ??? ns
module datapath(clk, set_pc, PC_CURR, sel_data, write_en, alu_op, R3, R2, R1, R0);
   input clk;
   input set_pc;
   output [3:0] R3;
   output [3:0] R2;
   output [3:0] R1;
   output [3:0] R0;

   // instruction fetch
   wire [3:0] PC_CURR;
   pc pc_0(.PC_INIT(4'b0000), .set_pc(set_pc), .clk(clk), .PC_CURR(PC_CURR));
   wire [8:0]   RES_INS;
   ins_mem ins_mem_0(.PC(PC_CURR), .RES_INS(RES_INS));

   // instruction decode
   wire sel_data;
   wire write_en;
   wire alu_op;
   wire [1:0] SEL_A;
   wire [1:0] SEL_B;
   wire [1:0] SEL_W;
   wire [3:0] IMM;
   ins_dec(.INS(RES_INS), .sel_data(sel_data), .write_en(write_en), .alu_op(alu_op),
           .SEL_A(SEL_A), .SEL_B(SEL_B), .SEL_W(SEL_W), .IMM(IMM));
   
   // Select write data
   wire [3:0] ALU_RES;
   wire [3:0] DATA_IN;
   mux_21_4b mux_21_4b_0(.A(ALU_RES), .B(IMM), .sel(sel_data), .RES(DATA_IN));
   // This MUX doesn't work if one of the inputs is undefined, is this normal?
   // (Remove comment if datapath works)
   
   // Register file
   wire [3:0] OUT_A;
   wire [3:0] OUT_B;
   reg_file reg_file_0(.SEL_A(SEL_A), .SEL_B(SEL_B), .write_en(write_en),
                       .SEL_W(SEL_W), .DATA_IN(DATA_IN), .clk(clk), .OUT_A(OUT_A),
                       .OUT_B(OUT_B), .Q3(R3), .Q2(R2), .Q1(R1), .Q0(R0));

   // ALU
   alu alu_0(.A(OUT_A), .B(OUT_B), .sel(alu_op), .RES(ALU_RES));
endmodule;
