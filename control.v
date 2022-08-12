module control
(
   input wire clk, 
   input wire reset,
   // RAM
   output reg we_o,
   output reg [31:0] addr_o,
   input wire [31:0] data_i,
   output reg [31:0] data_o,
   // Fetch
   output reg pc_readin_o
);
   // Stage counter output
   wire [2:0] stage_o;

   // Stage counter
   counter stage (
           .clk (clk),
           .reset (reset),
           .out (stage_o));

   always @ (posedge clk) begin
      if (!reset) begin
         if(stage_o == 1) begin
            pc_readin_o <= 1;
         end
         else if(stage_o == 2) begin
            pc_readin_o <= 0;
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
      addr_o <= 0; // Reset Vector is at 0x0
      data_o <= 0;
   end

   initial begin
      pc_readin_o = 0;
   end
endmodule
