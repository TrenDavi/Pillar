module top ();
   // Clock
   wire clk;
   reg reset = 1;
   
   initial begin
      // GTKwave debug output
      $dumpfile("wave.vcd");
      $dumpvars(0,top);

      // Reset CPU
      #10 reset = 0;
      #1000 $finish;
   end
   
   // Clock
   clock clock0 (
	   .clk_o (clk));
   
   // CPU
   cpu cpu0 (
	   .clk (clk),
	   .reset (reset));
endmodule
