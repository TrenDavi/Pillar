module riscv_cpu
  (input logic clk,
   input logic reset);

   always_ff @ (posedge clk) begin
      $finish;
   end   

endmodule
