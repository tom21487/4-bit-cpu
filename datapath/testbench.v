`timescale 1 ns/1 ns	//time scale for simulation

module testbench;
   parameter N = 16; // # of instructions to read
   reg osc_en;
   wire clk;
   oscillator my_oscillator(.en(osc_en), .w0(clk));
   
   reg       set_pc;
   wire [3:0] R3;
   wire [3:0] R2;
   wire [3:0] R1;
   wire [3:0] R0;
   wire alu_eq;
   wire alu_ovf;
   datapath my_datapath(.clk(clk), .set_pc(set_pc), .R3(R3), .R2(R2), .R1(R1), .R0(R0), .alu_eq(alu_eq), .alu_ovf(alu_ovf));

   integer i;
   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, testbench);

      // Clock init
      osc_en = 0;
      /*clk=x*/ #140;
      osc_en = 1;
      /*clk=1*/ #140;

      // PC init
      set_pc = 1;
      /*clk=0*/ #140;
      /*clk=1*/ #140;

      // Read the first N instructions
      for (i = 0; i < N; i = i+1) begin
	 /*clk=0*/
         #54; // wait for alu_eq to resolve before releasing pc
         set_pc = 0; // after instruction 0 set_pc will always be 0
         #86; // now we can set the PC
	 /*clk=1*/ #140;
      end
      // At this point the results of instruction0 should
      // be reflected in the register file!
      $finish;
   end
endmodule
