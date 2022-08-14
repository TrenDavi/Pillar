module top ();
   // RAM
   wire [31:0] cpu_to_ram_addr;
   wire        cpu_to_ram_we;
   wire [31:0] ram_to_cpu_data;
   wire [31:0] cpu_to_ram_data;
   
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
   ram ram0 (
	   .clk (clk),
	   .reset (reset),
	   .we (cpu_to_ram_we),
	   .addr (cpu_to_ram_addr),
	   .data_i (cpu_to_ram_data),
	   .data_o (ram_to_cpu_data));
   
   // CPU
   riscv_cpu cpu0 (
	   .clk (clk),
	   .reset (reset),
           .we_o (cpu_to_ram_we),
           .addr_o (cpu_to_ram_addr),
	   .data_i (ram_to_cpu_data),
	   .data_o (cpu_to_ram_data));
endmodule
