`include "itype.v"

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
   input wire [2:0] stage_i,
   input wire [31:0] ir_i,
   input wire [4:0] itype_i,
   output reg [31:0] y_o,
   output reg [31:0] pass_o
);
   reg [31:0] a;
   reg [31:0] b;
   reg [31:0] pass;
   
   // Read in values from decode
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

   // Compute
   always @ (posedge clk) begin
      if (!reset) begin
         // Execute at stage 3
         if (stage_i == 3) begin
            if (itype_i == `RTYPE) begin
            end
            else if (itype_i == `ITYPE) begin
            end
            else if (itype_i == `RTYPE) begin
            end
            else if (itype_i == `UTYPE) begin
            end
         end
      end
   end

   initial begin
      a = 0;
      b = 0;
      pass = 0;
   end
endmodule
