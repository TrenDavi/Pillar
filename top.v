module top
(
   input wire clk,
   input wire reset
);
   // RAM
   wire [31:0] cpu_to_ram_addr;
   wire        cpu_to_ram_we;
   wire [31:0] ram_to_cpu_data;
   wire [31:0] cpu_to_ram_data;
   
   // Stage counter
   wire [2:0]  stage_o;
   
   // RAM
   ram ram0 (
	   .clk (clk),
	   .reset (reset),
	   .we (cpu_to_ram_we),
	   .addr (cpu_to_ram_addr),
	   .data_i (cpu_to_ram_data),
	   .data_o (ram_to_cpu_data));

   // Stage counter
   counter stage (
           .clk (clk),
           .reset (reset),
           .out (stage_o));


   // CPU
   riscv_cpu cpu0 (
	   .clk (clk),
	   .reset (reset),
	   .we_o (cpu_to_ram_we),
           .addr_o (cpu_to_ram_addr),
	   .data_i (cpu_to_ram_data),
	   .data_o (cpu_to_ram_data));
   
   always_ff @ (posedge clk) begin
      $display("Stage: %d", stage_o);
   end
endmodule
