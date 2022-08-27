module fetch
(
   input wire clk,
   input wire reset,
   input wire [31:0] data_i,
   input wire pc_readin,
   output wire [31:0] pc_o
);
   reg [31:0] pc; // Program Counter

   always @ (negedge reset) begin
      // Reset Vector is loaded from 0x0 during a reset
      pc <= data_i;
   end   

   always @ (posedge pc_readin) begin
   end

   assign pc_o = pc;

   initial begin
      pc = 0;
   end
endmodule
