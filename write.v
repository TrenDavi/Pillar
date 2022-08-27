module write
(
   input wire clk,
   input wire reset,
   input wire wd_q_readin_i,
   input wire [31:0] wd_i,
   output wire [31:0] wd_o
);
   reg [31:0] data;
   
   always @ (posedge wd_q_readin_i) begin
      data <= wd_i;
   end

   assign wd_o = data;

   initial begin
      data = 0;
   end
endmodule
