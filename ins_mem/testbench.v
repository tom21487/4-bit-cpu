`timescale 1 ns/1 ns	//time scale for simulation

module testbench;
   reg [3:0] PC;
   wire [8:0] RES_INS;
   ins_mem ins_mem_0(.PC(PC), .RES_INS(RES_INS));
   integer    fd; // file descriptor
   integer    i; // line index
   reg [8:0]  INS_ARR [0:15];
   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0, testbench);
      fd = $fopen("test0.tbin");
      for (i = 0; !$feof(fd); i = i+1) begin
	 // $fgets(INS_ARR[i], fd);
	 // $display("%0b", INS_ARR[i]);
      end
      $fclose(fd);
      $finish;
      // test0
      PC = 4'b0000;
      #28;
      // test1
      PC = 4'b0001;
      #28;
      // test2
      PC = 4'b0010;
      #28;
      // test3
      PC = 4'b0011;
      #28;
      // test4
      PC = 4'b0100;
      #28;
      // test5
      PC = 4'b0101;
      #28;
      
      // test6
      PC = 4'b0110;
      #28;

      // test7
      PC = 4'b0111;
      #28;
      
      // test8
      PC = 4'b1000;
      #28;
      
      // test9
      PC = 4'b1001;
      #28;

      // test10
      PC = 4'b1010;
      #28;
      
      // test 11
      PC = 4'b1011;
      #28;
      
      // test 12
      PC = 4'b1100;
      #28;

      // test 13
      PC = 4'b1101;
      #28;

      // test 14
      PC = 4'b1110;
      #28;
      
      // test 15
      PC = 4'b1111;
      #28;
   end
endmodule
