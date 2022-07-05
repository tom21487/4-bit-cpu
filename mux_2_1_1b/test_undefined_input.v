`timescale 1 ns/1 ns	//time scale for simulation

module testbench;
   reg a;
   reg b;
   reg sel;
   wire res;

   mux_21_1b my_mux_21_1b(.a(a), .b(b), .sel(sel), .res(res));

   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, testbench);

      b = 0;
      sel = 1;
      #7;
   end
endmodule
