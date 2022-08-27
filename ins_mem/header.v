/* Instruction memory module
 * An application of mux_16_1_9b
 * Machine-code is stored here
 * Critical path delay = 28 ns
 */
module ins_mem(PC, RES_INS);
   input [3:0] PC;
   output [8:0] RES_INS;
   mux_16_1_9b mux_16_1_9b_0(
