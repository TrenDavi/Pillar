module fetch
(
   input wire clk,
   input wire reset
);
   reg [31:0] pc; // Program Counter
   
   always @ (posedge clk) begin
      if (reset) begin
	 // Reset Vector is placed at 0
	 // during a reset
         pc <= 0;
      end
   end
endmodule
