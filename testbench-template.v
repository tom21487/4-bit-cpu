`timescale 1 ns/1 ns	//time scale for simulation
`define DELAY 10
module testbench;
   reg [:] INPUTS;
   wire [:] OUTPUTS;

   COMP my_comp(.params());

   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, tesbench);

      INPUTS = ;
      #DELAY;
   end
endmodule
