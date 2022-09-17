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
   input wire [31:0] mem_i,
   input wire [2:0] stage_i
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
      else if (ir_i[6:0] == `JAL_OP || ir_i[6:0] == `JALR_OP) begin
         data <= pc_i + 4;
      end
      else if (ir_i[6:0] == `DECODE_L_TYPE) begin
         data <= mem_i;
      end
   end

   always @ (posedge stage_i) begin
      if (stage_i == 5) begin
         if (ir_i[6:0] == `DECODE_R_TYPE || 
         ir_i[6:0] == `DECODE_I_TYPE || ir_i[6:0] == `DECODE_S_TYPE ||
         ir_i[6:0] == `DECODE_L_TYPE || ir_i[6:0] == `DECODE_U_TYPE) begin
            pc_wd_o <= pc_i + 4;
         end
         else if (ir_i[6:0] == `DECODE_UPC_TYPE) begin
            pc_wd_o <= pc_i + 4;
         end
         else if (ir_i[6:0] == `DECODE_B_TYPE) begin
            pc_wd_o = wd_i + pc_i;
         end
      end
   end

   always @ (stage_i) begin
      if (stage_i == 5 && ir_i[6:0] == `JAL_OP) begin
         if (ir_i[31] == 1) begin
            pc_wd_o <= {~20'b0, ir_i[19:12], ir_i[20], ir_i[30:21], 1'b0} + pc_i;
         end
         else begin
            pc_wd_o <= {20'b0, ir_i[19:12], ir_i[20], ir_i[30:21], 1'b0} + pc_i;
         end
      end
      else if (stage_i == 5 && ir_i[6:0] == `JALR_OP) begin
         if (ir_i[31] == 1) begin
            pc_wd_o <= wd_i + {~20'b0, ir_i[31:20]};
         end
         else begin
            pc_wd_o <= wd_i + {20'b0, ir_i[31:20]};
         end
      end
   end

   assign wd_o = data;

   initial begin
      data = 0;
   end
endmodule
