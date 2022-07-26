// Min setup time = 17 ns
// Min hold time = 40 ns
module pc(PC_INIT, set_pc, clk, PC_CURR);
   input [3:0] PC_INIT;
   input       set_pc;
   input clk;
   output [3:0] PC_CURR;
   wire [3:0]   PC_PLUS_1;
   wire [3:0]   PC_REG_IN;
   mux_2_1_4b mux_2_1_4b_0(.A(PC_PLUS_1), .B(PC_INIT), .sel(set_pc), .RES(PC_REG_IN));
   wire [3:0] PC_CURR_INV;
   reg4 pc_reg(.D(PC_REG_IN), .clk(clk), .Q(PC_CURR), .QB(PC_CURR_INV));
   rca pc_adder(.A(4'b0001), .B(PC_CURR), .SUM(PC_PLUS_1));
endmodule;
