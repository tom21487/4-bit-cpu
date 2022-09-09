// Min setup time = 75 ns
// Min hold time = 17 ns
module pc(set_pc, alu_eq, clk, INS, PC_CURR);
   input set_pc;
   input alu_eq;
   input clk;
   input [10:0] INS;
   output [3:0] PC_CURR;
   wire w1;
   not #(1) not_1(w1, INS[9]);
   wire w0;
   not #(1) not_0(w0, INS[8]);
   wire set_next;
   and #(3) and_0(set_next, alu_eq, INS[10], w1, w0);
   wire [3:0]   PC_PLUS_JMP;
   wire [3:0]   PC_PLUS_ONE;
   wire [3:0]   PC_NEXT;
   mux_2_1_4b mux_2_1_4b_0(.A(PC_PLUS_ONE), .B(PC_PLUS_JMP), .sel(set_next), .RES(PC_NEXT));
   wire [3:0]   PC_REG_IN;
   mux_2_1_4b mux_2_1_4b_1(.A(PC_NEXT), .B(4'b0000), .sel(set_pc), .RES(PC_REG_IN));
   wire [3:0] PC_CURR_INV;
   reg4 pc_reg(.D(PC_REG_IN), .clk(clk), .Q(PC_CURR), .QB(PC_CURR_INV));
   rca rca_0(.A(4'b0001), .B(PC_CURR), .SUM(PC_PLUS_ONE));
   rca rca_1(.A(INS[7:4]), .B(PC_CURR), .SUM(PC_PLUS_JMP));
endmodule;
