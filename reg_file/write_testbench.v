`timescale 1 ns/1 ns	//time scale for simulation

module testbench;
   reg [:] INPUTS;
   wire [:] OUTPUTS;

   COMP my_comp(.params());

   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, testbench);

      INPUTS = ;
      #DELAY;
   end
endmodule
