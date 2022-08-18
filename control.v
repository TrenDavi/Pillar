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
   output reg readin_b_o
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
   
   always @ (posedge clk) begin
      if (ir_readin_o) begin
         ir = data_i;
      end
   end

   always @ (posedge clk) begin
      if (!reset) begin
         if(stage_o == 1) begin
            pc_readin_o <= 0;
            addr_o <= pc_i;
            ir_readin_o <= 1;
         end
         else if(stage_o == 2) begin
            addr_o <= 0;
            ir_readin_o <= 0;
         end
         else if(stage_o == 3) begin
         end
         else if(stage_o == 4) begin
         end
         else if(stage_o == 5) begin
         end
      end
   end

   always @ (reset) begin
      we_o <= 0;
      addr_o <= 0;
      data_o <= 0;
      readin_a_o <= 0;
      readin_b_o <= 0;
   end

   initial begin
      pc_readin_o = 1;
      ir_readin_o = 0;
      ir = 0;
      addr_o = 0;
   end
endmodule
