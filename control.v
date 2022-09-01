`include "itype.v"

module control
(
   input wire clk, 
   input wire reset,
   output wire [2:0] stage_o,
   // RAM
   output reg we_o,
   output reg [31:0] addr_o,
   input wire [31:0] data_i,
   output reg [31:0] data_o,
   // Fetch
   output reg pc_readin_o,
   input wire [31:0] pc_i,
   // Decode
   output wire [31:0] ir_o,
   // ALU
   output reg readin_a_o,
   output reg readin_b_o,
   output reg readin_pass_o,
   input wire [4:0] itype_i,
   // Memory access
   output reg mem_we_o,
   output wire [31:0] mem_o,
   // Write back
   output reg wd_q_o,
   output reg wd_q_readin_o
);
   // Instruction register
   reg [31:0] ir; 
   assign ir_o = ir;

   // Control
   reg ir_readin_o;

   // Stage counter
   counter stage (
           .clk (clk),
           .reset (reset),
           .out (stage_o));
   
   always @ (posedge ir_readin_o) begin
      ir = data_i;
   end

   always @ (posedge clk) begin
      if (!reset) begin
         if(stage_o == 1) begin
            wd_q_readin_o <= 0;
            wd_q_o <= 0;

            // Fetch
            pc_readin_o <= 0;
            addr_o <= pc_i;
            ir_readin_o <= 1;
         end
         else if(stage_o == 2) begin
            // Decode
            addr_o <= 0;
            ir_readin_o <= 0;

            if (itype_i == `RTYPE) begin
               readin_a_o <= 1;
               readin_b_o <= 1;
               readin_pass_o <= 0;
            end
            else if (itype_i == `ITYPE) begin
               readin_a_o <= 1;
               readin_b_o <= 1;
               readin_pass_o <= 0;
            end
            else if (itype_i == `STYPE) begin
               readin_a_o <= 1;
               readin_b_o <= 1;
               readin_pass_o <= 1;
            end
            else if (itype_i == `UTYPE) begin
               readin_a_o <= 0;
               readin_b_o <= 0;
               readin_pass_o <= 1;
            end
            else if (itype_i == `HOLD) begin
               readin_a_o <= 0;
               readin_b_o <= 0;
               readin_pass_o <= 0;
            end
         end
         else if(stage_o == 3) begin
            // Execute
            readin_a_o <= 0;
            readin_b_o <= 0;
            readin_pass_o <= 0;
         end
         else if(stage_o == 4) begin
            // Memory access
            if (itype_i == `STYPE) begin
               mem_we_o <= 1;
            end
         end
         else if(stage_o == 5) begin
            mem_we_o <= 0;
            // Write back
            if (itype_i == `RTYPE || itype_i == `ITYPE
               || itype_i == `UTYPE || itype_i == `STYPE) begin
               wd_q_readin_o <= 1;
               wd_q_o <= 1;
            end
   
            pc_readin_o <= 1;
         end
      end
   end

   always @ (reset) begin
      we_o <= 0;
      addr_o <= 0;
      data_o <= 0;
      pc_readin_o = 1;
      ir_readin_o = 0;
      ir = 0;
      addr_o = 0;
      readin_a_o = 0;
      readin_b_o = 0;
      readin_pass_o = 0;
      wd_q_o = 0;
      wd_q_readin_o = 0;
      mem_we_o = 0;
   end

   initial begin
      pc_readin_o = 1;
      ir_readin_o = 0;
      ir = 0;
      addr_o = 0;
      readin_a_o = 0;
      readin_b_o = 0;
      readin_pass_o = 0;
      wd_q_o = 0;
      wd_q_readin_o = 0;
      mem_we_o = 0;
   end
endmodule
