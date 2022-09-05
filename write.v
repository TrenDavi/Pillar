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
         ir_i[6:0] == `DECODE_I_TYPE ||
         ir_i[6:0] == `DECODE_U_TYPE) begin
         data <= wd_i;
      end
      else if (ir_i[6:0] == `DECODE_UPC_TYPE) begin
         data <= pc_i + ir_i[31:12];
      end
      else if (ir_i[6:0] == `DECODE_L_TYPE) begin
         data <= mem_i;
      end
   end

   always @ (posedge clk) begin
      if (ir_i[6:0] == `DECODE_R_TYPE || 
      ir_i[6:0] == `DECODE_I_TYPE || ir_i[6:0] == `DECODE_S_TYPE ||
      ir_i[6:0] == `DECODE_L_TYPE || ir_i[6:0] == `DECODE_U_TYPE) begin
         pc_wd_o <= pc_i + 4;
      end
      else if (ir_i[6:0] == `DECODE_UPC_TYPE) begin
         pc_wd_o <= pc_i + ir_i[31:12];
      end
      else if (ir_i[6:0] == `DECODE_B_TYPE) begin
         pc_wd_o <= wd_i + 4;
      end
   end

   assign wd_o = data;

   initial begin
      data = 0;
   end
endmodule
