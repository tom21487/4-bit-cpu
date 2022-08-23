`timescale 1 ns/1 ns	//time scale for simulation

module testbench;
   reg osc_en;
   wire clk;
   oscillator my_oscillator(.en(osc_en), .w0(clk));
   
   reg       set_pc;
   wire [3:0] R3;
   wire [3:0] R2;
   wire [3:0] R1;
   wire [3:0] R0;
   datapath my_datapath(.clk(clk), .set_pc(set_pc), .R3(R3), .R2(R2), .R1(R1), .R0(R0));

   integer i;
   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, testbench);

      // Clock init
      osc_en = 0;
      /*clk=x*/ #136;
      osc_en = 1;
      /*clk=1*/ #136;

      // PC init
      set_pc = 1;
      /*clk=0*/ #136;
      /*clk=1*/ #136;
      set_pc = 0;

      // Read first 6 instructions
      for (i = 0; i < 6; i = i+1) begin
	 /*clk=0*/ #136;
	 /*clk=1*/ #136;
      end
      // At this point the results of instruction0 should
      // be reflected in the register file!
      $finish;
   end
endmodule
