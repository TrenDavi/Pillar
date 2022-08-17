module riscv_cpu
(
   input wire clk,
   input wire reset,
   // RAM
   output wire we_o,
   output wire [31:0] addr_o,
   input wire [31:0] data_i,
   output wire [31:0] data_o
);
   wire pc_readin_o;
   wire [31:0] pc_o;

   // Control unit
   control control_unit (
      .clk (clk),
      .reset (reset),
      // RAM
      .we_o (we_o),
      .addr_o (addr_o),
      .data_i (data_i),
      .data_o (data_o),
      .pc_readin_o (pc_readin_o),
      .pc_i (pc_o));

   // Fetch unit
   fetch fetch_unit (
      .clk (clk),
      .reset (reset),
      .data_i (data_i),
      .pc_readin (pc_readin_o),
      .pc_o (pc_o));
   
   // Decode unit
   decode decode_unit (
      .clk (clk),
      .reset (reset));
endmodule
