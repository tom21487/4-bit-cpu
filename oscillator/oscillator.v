// Critical path = period/2 = 76 ns
module oscillator(en, w0);
   parameter N = 73; // # of not gates
   input en;
   output w0;
   wire   [N:0] w;
   and #(3) and_0(w[N], en, w[0]);
   genvar i;
   generate
      for (i = N-1; i >= 0; i = i-1) begin
         not #(1) not_i(/*输出*/w[i], /*输入*/w[i+1]);
      end
   endgenerate
   buf buf_0(w0, w[0]);
endmodule;
