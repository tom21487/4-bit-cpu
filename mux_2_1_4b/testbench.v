`timescale 1 ns/1 ns	//time scale for simulation

module testbench;
   reg [3:0] A;
   reg [3:0] B;
   reg       sel;
   wire [3:0] RES;

   mux4 my_mux4(.A(A), .B(B), .sel(sel), .RES(RES));

   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, testbench);
      
      A = 4'b0011;
      B = 4'b0101;
      sel = 0;
      #10;
   end
endmodule
