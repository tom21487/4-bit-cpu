module and_exp;
   reg a;
   reg b;
   wire res;
   and #(1) and_0(res, a, b);
   initial begin;
      $dumpfile("test.vcd");
      $dumpvars(0, and_exp);
      a = 0;
      #1;
      a = 1;
      #2 $finish;
   end;
endmodule
