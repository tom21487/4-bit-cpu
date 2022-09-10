`timescale 1 ns/1 ns	//time scale for simulation

module testbench;
   reg en;
   wire w0;

   oscillator my_oscillator(.en(en), .w0(w0));

   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, testbench);
      en = 0;
      #140;
      en = 1; // then oscillator will run until $finish
      #560 $finish; // finish simulation
   end
endmodule
