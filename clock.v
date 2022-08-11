module clock
(
   output clk_o
);
   reg clk;
   initial begin
     clk <= 0;
   end
  
   initial begin
      forever begin
         #1 clk = 0;
         #1 clk = 1;
      end
   end 

   assign clk_o = clk;
endmodule
