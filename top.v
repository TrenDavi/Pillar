module top
  (input logic clk,
   input logic reset);

   reg [31:0] count_c;
   always_ff @ (posedge clk) begin
      $display("[%0t] clk=%b reset=%b", $time, clk, reset);
      if (reset) begin
	 count_c <= 0;
      end
      else begin
	 count_c <= count_c + 1;
	 if (count_c >= 99) begin
            $write("*-* All Finished *-*\n");
            $finish;
	 end
      end
   end
endmodule
