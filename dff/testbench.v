`timescale 1 ns/1 ns	//time scale for simulation

module testbench;
   reg d;
   reg clk;
   
   wire q;
   wire qb;

   dff dff_0(.d(d), .clk(clk), .q(q), .qb(qb));

   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, testbench);

      // reset [setup time]
      clk = 0;
      d = 0;
      #17;

      // reset [hold time]
      clk = 1;
      d = 0;
      #17;
      
      // hold 0 [setup time]
      clk = 0;
      d = 0;
      #17;
      
      // hold 0 [hold time]
      clk = 1;
      d = 0;
      #17;
      
      // set [setup time]
      clk = 0;
      d = 1;
      #17;
      
      // set [hold time]
      clk = 1;
      d = 1;
      #17;
      
      // hold 1 [setup time]
      clk = 0;
      d = 1;
      #17;
      
      // hold 1 [hold time]
      clk = 1;
      d = 1;
      #17;
   end
endmodule
