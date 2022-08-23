`timescale 1 ns/1 ns	//time scale for simulation

module testbench;
   reg osc_en;
   wire clk;
   oscillator my_oscillator(.en(osc_en), .w0(clk));
   
   reg       set_pc;
   wire [3:0] PC_CURR;
   pc my_pc(.set_pc(set_pc), .clk(clk), .PC_CURR(PC_CURR));

   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, testbench);

      // Clock init
      osc_en = 0;
      #136;
      osc_en = 1;
      #136;
      
      /*
       test 0
       time: 116 ns
       PC_CURR = 4'bxxxx
       */
      // clk = 0
      set_pc = 1;
      #136; // mux_21_4b + pc_reg_set
      // clk = 1
      #136; // pc_reg_hold + rca
      
      /*
       test 1
       time: 232
       PC_CURR = 4'b0000
       */
      // clk = 0
      set_pc = 0;
      #136; // mux_21_4b + pc_reg_set
      // clk = 1;
      #136; // pc_reg_hold + rca

      #4352; // range
      $finish;
   end
endmodule
