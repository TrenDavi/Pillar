`include "opcode.v"

module write
(
   input wire clk,
   input wire reset,
   input wire wd_q_readin_i,
   input wire [31:0] wd_i,
   output wire [31:0] wd_o,
   input wire [31:0] pc_i,
   input wire [31:0] ir_i,
   output reg [31:0] pc_wd_o,
   input wire [31:0] mem_i
);
   reg [31:0] data;
   
   always @ (posedge wd_q_readin_i) begin
      if (ir_i[6:0] == `DECODE_R_TYPE || 
         ir_i[6:0] == `DECODE_I_TYPE) begin
         data <= wd_i;
      end
   end

   always @ (posedge clk) begin
      if (ir_i[6:0] == `DECODE_R_TYPE || 
      ir_i[6:0] == `DECODE_I_TYPE || ir_i[6:0] == `DECODE_S_TYPE) begin
         pc_wd_o <= pc_i + 1;
      end
      else begin
         pc_wd_o <= 0;
      end
   end

   assign wd_o = data;

   initial begin
      data = 0;
   end
endmodule
