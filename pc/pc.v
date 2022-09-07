// Min setup time = 17 ns
// Min hold time = 40 ns
module pc(set_pc, clk, INS, PC_CURR);
   input set_pc;
   input clk;
   input [8:0] INS;
   output [3:0] PC_CURR;
   wire         set_next;
   // TODO put not gates here, update the setup and hold times
   and #(3) and_0(set_next, INS[8], INS[7], INS[6]);
   wire [3:0]   PC_PLUS_JMP;
   wire [3:0]   PC_PLUS_ONE;
   wire [3:0]   PC_NEXT;
   mux_2_1_4b mux_2_1_4b_0(.A(PC_PLUS_JMP), .B(PC_PLUS_ONE), .sel(set_next), .RES(PC_NEXT));
   wire [3:0]   PC_REG_IN;
   mux_2_1_4b mux_2_1_4b_1(.A(PC_NEXT), .B(4'b0000), .sel(set_pc), .RES(PC_REG_IN));
   wire [3:0] PC_CURR_INV;
   reg4 pc_reg(.D(PC_REG_IN), .clk(clk), .Q(PC_CURR), .QB(PC_CURR_INV));
   rca rca_0(.A(4'b0001), .B(PC_CURR), .SUM(PC_PLUS_ONE));
   rca rca_1(.A(INS[5:4]), .B(PC_CURR), .SUM(PC_PLUS_JMP));
endmodule;
