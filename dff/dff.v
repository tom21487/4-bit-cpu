// Setup delay = hold delay = 17ns
module dff(d, clk, q, qb);
   input d;
   input clk;
   output q;
   output qb;
   
   wire nclk;
   not #(1) not0(nclk, clk);
   wire q_tmp;
   wire qb_tmp;
   d_latch d_latch_0(.d(d), .g(nclk), .q(q_tmp), .qb(qb_tmp));
   d_latch d_latch_1(.d(q_tmp), .g(clk), .q(q), .qb(qb));
endmodule; // dff

