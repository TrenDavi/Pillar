module riscv_cpu
(
   input wire clk,
   input wire reset,
   // RAM
   output reg we_o,
   output wire [31:0] addr_o,
   input wire [31:0] data_i,
   output wire [31:0] data_o
);

   assign addr_o = 32'b0;
   assign data_o = 32'b1;
   assign we_o = 1'b0;

   always_ff @ (posedge clk) begin
   end   

endmodule
