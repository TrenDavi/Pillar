module fetch
(
   input wire clk,
   input wire reset,
   input wire [31:0] data_i,
   input wire pc_readin
);
   reg [31:0] pc; // Program Counter
   
   always @ (posedge clk) begin
      if (pc_readin) begin
         // Reset Vector is placed at 0
	 // during a reset
	 pc <= data_i;
      end
   end

   initial begin
      pc = 0;
   end
endmodule
