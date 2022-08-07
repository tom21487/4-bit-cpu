// Critical path delay = period/2 = 57 ns
module oscillator(en, w0);
   input en;
   output w0;
   wire   r = 0;
   wire   [55:0] w;
   and #(3) and_0(w[55], en, w[0]);
   genvar i;
   generate
      for (i = 54; i >= 0; i = i-1) begin
         not #(1) not_i(/*输出*/w[i], /*输入*/w[i+1]);
      end
   endgenerate
   buf buf_0(w0, w[0]);
endmodule;
