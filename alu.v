module alu
(
   input wire clk,
   input wire reset,
   input wire [31:0] readd_a_i,
   input wire [31:0] readd_b_i,
   input wire readin_a_i,
   input wire readin_b_i,
   input wire [2:0] stage_i
);
   reg a;
   reg b;

   always @ (posedge clk) begin
      if (reset) begin
         a <= 0;
         b <= 0;
      end
      else if (readin_a_i) begin
         a <= readd_a_i;
      end
      else if (readin_b_i) begin
         b <= readd_b_i;
      end
   end
endmodule
