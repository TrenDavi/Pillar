module control
(
   input wire clk, 
   input wire reset
);
   // Stage counter output
   wire [2:0] stage_o;

   // Stage counter
   counter stage (
           .clk (clk),
           .reset (reset),
           .out (stage_o));

   always @ (posedge clk) begin
      $display("r: %b, s: %d", reset, stage_o);
   end
endmodule
