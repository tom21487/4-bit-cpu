module decoder_24_1b(w1, w0, d3, d2, d1, d0);
   input w1;
   input w0;
   output d3;
   output d2;
   output d1;
   output d0;
   
   wire nw0;
   not #(1) not0(nw0, w0);
   wire nw1;
   not #(1) not1(nw1, w1);

   and #(3) and0(d0, nw0, nw1);
   and #(3) and1(d1, w0, nw1);
   and #(3) and2(d2, w1, nw0);
   and #(3) and3(d3, w1, w0);
endmodule
