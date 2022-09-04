module top ();
   // RAM
   wire [31:0] cpu_to_rom_addr;
   wire        cpu_to_rom_we;
   wire [31:0] rom_to_cpu_data;
   
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
   
   // RAM
   rom rom0 (
	   .clk (clk),
	   .reset (reset),
	   .we (cpu_to_rom_we),
	   .addr (cpu_to_rom_addr),
	   .data_o (rom_to_cpu_data));
   
   // CPU
   cpu cpu0 (
	   .clk (clk),
	   .reset (reset),
      .we_o (cpu_to_rom_we),
      .addr_o (cpu_to_rom_addr),
	   .data_i (rom_to_cpu_data));
endmodule
