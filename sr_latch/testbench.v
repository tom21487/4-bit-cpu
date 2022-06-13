`timescale 1 ns/1 ns	//time scale for simulation

module testbench;
   reg r;
   reg s;
   wire q;
   wire qb;

   sr_latch sr_latch_0(.r(r), .s(s), .q(q), .qb(qb));

   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, testbench);

      // test 0: reset (delay = 4ns)
      r = 1;
      s = 0;
      #4;

      // test 1: hold 0 (delay = none)
      r = 0;
      s = 0;
      #4;

      // test 2: set (delay = 4 ns)
      r = 0;
      s = 1;
      #4;

      // test 3: hold 1 (delay = none)
      r = 0;
      s = 0;
      #4;
   end
endmodule
