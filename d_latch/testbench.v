`timescale 1 ns/1 ns	//time scale for simulation

module testbench;
   reg d;
   reg g;
   wire q;
   wire qb;

   d_latch d_latch_0(.d(d), .g(g), .q(q), .qb(qb));

   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, testbench);

      // UPDATE pattern = reset, hold, hold; set, hold, hold
      // Reset - q = 0, qb = 1
      d = 0;
      g = 1;
      #8;

      // Hold - q = 0, qb = 1
      d = 0;
      g = 0;
      #8;

      // Hold - q = 0, qb = 1
      d = 1;
      g = 0;
      #8;

      // Set - q = 1, qb = 0
      d = 1;
      g = 1;
      #8;

      // Hold - q = 1, qb = 0
      d = 0;
      g = 0;
      #8;

      // Hold - q = 1, qb = 0
      d = 1;
      g = 0;
      #8;
   end
endmodule
