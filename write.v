module write
(
   input wire clk,
   input wire reset,
   output reg [31:0] wd_o
);

   initial begin
      wd_o = 0;
   end
endmodule
