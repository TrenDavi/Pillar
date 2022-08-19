module alu
(
   input wire clk,
   input wire reset,
   input wire [31:0] readd_a_i,
   input wire [31:0] readd_b_i,
   input wire [31:0] readd_pass_i,
   input wire readin_a_i,
   input wire readin_b_i,
   input wire readin_pass_i,
   input wire [2:0] stage_i
);
   reg a;
   reg b;
   reg pass;

   always @ (posedge clk) begin
      if (reset) begin
         a <= 0;
         b <= 0;
         pass <= 0;
      end
      else begin
         if (readin_a_i) begin
            a <= readd_a_i;
         end
         if (readin_b_i) begin
            b <= readd_b_i;
         end
         if (readin_pass_i) begin
            pass <= readd_pass_i;
         end
      end
   end

   initial begin
      a = 0;
      b = 0;
      pass = 0;
   end
endmodule
