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
   // PC
   wire pc_readin_o;
   wire [31:0] pc_o;
   
   // IR
   wire [31:0] ir_o;

   // Decode
   wire [31:0] ra_o;
   wire [31:0] rb_o;
   wire [31:0] pass_o;
   wire readin_ra_o;
   wire readin_rb_o;
   wire readin_pass_o;
   
   // Stage counter output
   wire [2:0] stage_o;

   // Control unit
   control control_unit (
      .clk (clk),
      .reset (reset),
      .stage_o (stage_o),
      .we_o (we_o),
      .addr_o (addr_o),
      .data_i (data_i),
      .data_o (data_o),
      .pc_readin_o (pc_readin_o),
      .pc_i (pc_o),
      .ir_o (ir_o));

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
      .reset (reset),
      .ra_o (ra_o),
      .rb_o (rb_o),
      .pass_o (pass_o),
      .stage_i (stage_o),
      .ir_i (ir_o),
      .readin_a_o (readin_ra_o),
      .readin_b_o (readin_rb_o),
      .readin_pass_o (readin_pass_o));
   
   // Arithmetic and logic unit
   alu alu_unit (
      .readd_a_i (ra_o),
      .readd_b_i (rb_o),
      .readd_pass_i (pass_o),
      .readin_a_i (readin_ra_o),
      .readin_b_i (readin_rb_o),
      .readin_pass_i (readin_pass_o),
      .stage_i (stage_o));
endmodule
