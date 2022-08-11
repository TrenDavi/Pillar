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
   // Control unit
   control control_unit (
	   .clk (clk),
	   .reset (reset));

   // Fetch unit
   fetch fetch_unit (
	   .clk (clk),
	   .reset (reset));

   always @ (posedge clk) begin
      if (reset) begin
         we_o <= 0;
	 addr_o <= 32'b0;
	 data_o <= 32'b0;
      end
   end   

endmodule
