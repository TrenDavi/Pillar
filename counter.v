module counter
(
   input clk,
   input reset,
   output wire [2:0] out
);
   reg [2:0] b;
   always @ (posedge clk) begin
      if (!reset)
         if (b != 5)
	         b <= b + 1;
         else
            b <= 1;
      else 
         b <= 0;
   end

   assign out = b;
endmodule
