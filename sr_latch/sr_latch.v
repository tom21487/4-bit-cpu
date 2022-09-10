// Critical path delay = 6ns
module sr_latch(r, s, q, qb);
   input r;
   input s;
   output q;
   output qb;
   nor #(2) nor0(q, r, qb);
   nor #(2) nor1(qb, q, s);
endmodule // sr_latch
