// Critical path delay: 10 ns
module fa(a, b, c_in, sum, c_out);
   input a;
   input b;
   input c_in;
   output sum;
   output c_out;
   wire   w0;
   xor #(4) xor0(w0, a, b);
   wire   w1;
   and #(3) and0(w1, a, b);
   wire   w2;
   and #(3) and1(w2, w0, c_in);
   xor #(4) xor1(sum, w0, c_in);
   or #(3) or0(c_out, w1, w2);
endmodule
   
