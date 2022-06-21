`timescale 1 ns/1 ns	//time scale for simulation

module testbench;
   reg [3:0] A;
   reg [3:0] B;
   reg       sel;
   wire [3:0] RES;

   mux_21_4b my_mux_21_4b(.A(A), .B(B), .sel(sel), .RES(RES));

   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, testbench);

      B = 4'b0000;
      sel = 1;
      #7;
   end
endmodule
