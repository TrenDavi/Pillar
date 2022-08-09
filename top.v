module top
(
   input wire clk,
   input wire reset
);

   wire [31:0] cpu_to_ram_addr;
   wire        cpu_to_ram_we;
   wire [31:0] ram_to_cpu_data;
   wire [31:0] cpu_to_ram_data;
   
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
	   .data_i (cpu_to_ram_data),
	   .data_o (cpu_to_ram_data));
   
endmodule
