// Critical path delay = 6ns
module d_latch(d, g, q, qb);
   input d;
   input g;
   output q;
   output qb;
   wire   nd;
   not #(1) not0(nd, d);
   wire   r;
   and #(3) and0(r, nd, g);
   wire   s;
   and #(3) and1(s, d, g);
   sr_latch sr_latch_0(.r(r), .s(s), .q(q), .qb(qb));
endmodule; // d_latch
