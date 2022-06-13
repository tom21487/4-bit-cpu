`timescale 1 ns/1 ns	//time scale for simulation

module testbench;
   reg [3:0] D;
   reg       clk;
   wire [3:0] Q;
   wire [3:0] QB;

   reg4 reg4_0(.D(D), .clk(clk), .Q(Q), .QB(QB));

   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, testbench);

      // Test one hot encodings
      // test 0: setup
      D = 4'b0001;
      clk = 0;
      #17;
      // test 0: hold
      D = 4'b0001;
      clk = 1;
      #17;
        
      // test 1: setup
      D = 4'b0010;
      clk = 0;
      #17;
      // test 1: hold
      D = 4'b0010;
      clk = 1;
      #17;

      // test 2: setup
      D = 4'b0100;
      clk = 0;
      #17;
      // test 2: hold
      D = 4'b0100;
      clk = 1;
      #17;


      // test 3: setup
      D = 4'b1000;
      clk = 0;
      #17;
      // test 3: hold
      D = 4'b1000;
      clk = 1;
      #17;
   end
endmodule
