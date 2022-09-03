`include "itype.v"

module memory
(
   input wire clk,
   input wire reset,
   input wire [31:0] y_in,
   input wire [31:0] pass_in,
   output reg [31:0] mem_o,
   input wire we_i,
   input wire [4:0] itype_i,
   input wire [31:0] ir_i
);

   reg [31:0] ram [2*2**24:2**24];

   always @ (posedge we_i) begin
      ram[y_in] = pass_in;
   end

   wire [2:0] op;
   assign op = ir_i[14:12];

   always @ (posedge clk) begin
      if (itype_i == `LTYPE) begin
         if (op == `LB3) begin
         end
         else if (op == `LH3) begin
         end
         else if (op == `LW3) begin
            mem_o <= ram[y_in];
         end
         else if (op == `LBU3) begin
         end
         else if (op == `LHU3) begin
         end
      end
   end

   integer i;
   initial begin
      for (i = 0; i < 2**16; i = i + 1) begin
         ram[i] = 0;
      end
   end
endmodule
