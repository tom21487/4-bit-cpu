// TODO Update oscillator period
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
   datapath(.clk(clk), .set_pc(set_pc), .R3(R3), .R2(R2), .R1(R1), .R0(R0));
   
   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, testbench);

      // Disable reading from instruction memory
      en_ins_mem = 0;
      
      // Clock init
      osc_en = 0;
      /*clk=x*/ #135;
      osc_en = 1;
      /*clk=1*/ #135;

      // PC init
      set_pc = 1;
      /*clk=0*/ #135;
      /*clk=1*/ #135;
      set_pc = 0;

      // Start reading from instruction memory
      en_ins_mem = 1;
      /*clk=0*/ #135;
      /*clk=1*/ #135;
      // At this point the instruction results should
      // be reflected in the register file!
      $finish;
   end
endmodule
