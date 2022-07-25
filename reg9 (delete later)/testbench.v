`timescale 1 ns/1 ns	//time scale for simulation

module testbench;
   reg [8:0] D;
   reg       clk;
   wire [8:0] Q;
   wire [8:0] QB;

   reg9 reg9_0(.D(D), .clk(clk), .Q(Q), .QB(QB));

   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, testbench);

      // Test one hot encodings
      // test 0: setup
      D = 9'b000000001;
      clk = 0;
      #17;
      // test 0: hold
      clk = 1;
      #17;
        
      // test 1: setup
      D = 9'b000000010;
      clk = 0;
      #17;
      // test 1: hold
      clk = 1;
      #17;

      // test 2: setup
      D = 9'b000000100;
      clk = 0;
      #17;
      // test 2: hold
      clk = 1;
      #17;


      // test 3: setup
      D = 9'b000001000;
      clk = 0;
      #17;
      // test 3: hold
      clk = 1;
      #17;
      
      // test 4: setup
      D = 9'b000010000;
      clk = 0;
      #17;
      // test 4: hold
      clk = 1;
      #17;
      
      // test 5: setup
      D = 9'b000100000;
      clk = 0;
      #17;
      // test 5: hold
      clk = 1;
      #17;
      
      // test 6: setup
      D = 9'b001000000;
      clk = 0;
      #17;
      // test 6: hold
      clk = 1;
      #17;
      
      // test 7: setup
      D = 9'b010000000;
      clk = 0;
      #17;
      // test 7: hold
      clk = 1;
      #17;
      
      // test 8: setup
      D = 9'b100000000;
      clk = 0;
      #17;
      // test 8: hold
      clk = 1;
      #17;
   end
endmodule
