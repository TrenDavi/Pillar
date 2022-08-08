module top
  (input logic clk,
   input logic reset);

   riscv_cpu cpu (
	   .clk (clk),
	   .reset (reset));
   
endmodule
