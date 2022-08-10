module riscv_cpu
(
   input wire clk,
   input wire reset,
   // RAM
   output reg we_o,
   output reg [31:0] addr_o,
   input wire [31:0] data_i,
   output reg [31:0] data_o
);
   // Stage counter 
   wire [2:0]  stage_o;

   // Stage counter
   counter stage (
           .clk (clk),
           .reset (reset),
           .out (stage_o));


   always_ff @ (posedge clk) begin
      if (reset) begin
         we_o <= 0;
	 addr_o <= 32'b0;
	 data_o <= 32'b0;
      end

      $display("stage: %b", stage_o);
   end   

endmodule
