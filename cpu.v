module cpu
(
   input wire clk,
   input wire reset
);
   // RAM
   wire [31:0] addr_o;
   wire [31:0] data_o;

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
   
   // ALU
   wire [4:0] itype_o;
   wire [31:0] y_o;
   wire [31:0] passd_o;
   
   // Stage counter output
   wire [2:0] stage_o;

   // Memory access output
   wire mem_we_o;
   wire [31:0] mem_o;
   
   // Register file write back
   wire [31:0] wd_o;
   wire wd_q_o;
   wire wd_q_readin_o;
   wire [31:0] pc_wd_o;

   // Control unit
   control control_unit (
      .clk (clk),
      .reset (reset),
      .stage_o (stage_o),
      .we_o (we_o),
      .addr_o (addr_o),
      .data_i (data_o),
      .pc_readin_o (pc_readin_o),
      .pc_i (pc_o),
      .ir_o (ir_o),
      .readin_a_o (readin_ra_o),
      .readin_b_o (readin_rb_o),
      .readin_pass_o (readin_pass_o),
      .itype_i (itype_o),
      .mem_we_o (mem_we_o),
      .wd_q_o (wd_q_o),
      .wd_q_readin_o (wd_q_readin_o));

   // Fetch unit
   fetch fetch_unit (
      .clk (clk),
      .reset (reset),
      .data_i (data_o),
      .pc_readin (pc_readin_o),
      .pc_wd_i (pc_wd_o),
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
      .itype_o (itype_o),
      .wd_i (wd_o),
      .wd_q_i (wd_q_o));
   
   // Arithmetic and logic unit
   alu alu_unit (
      .clk (clk),
      .reset (reset),
      .readd_a_i (ra_o),
      .readd_b_i (rb_o),
      .readd_pass_i (pass_o),
      .readin_a_i (readin_ra_o),
      .readin_b_i (readin_rb_o),
      .readin_pass_i (readin_pass_o),
      .stage_i (stage_o),
      .ir_i (ir_o),
      .itype_i (itype_o),
      .y_o (y_o),
      .pass_o (passd_o),
      .pc_i (pc_o));
   
   // Memory access unit
   memory memory_unit (
   .clk (clk),
   .reset (reset),
   .y_in (y_o),
   .pass_in (passd_o),
   .mem_o (mem_o),
   .we_i (mem_we_o),
   .itype_i (itype_o),
   .ir_i (ir_o),
   .addr_i (addr_o),
   .data_o (data_o),
   .stage_i (stage_o));
   
   // Write back unit
   write write_unit(
      .clk (clk),
      .reset (reset),
      .wd_q_readin_i (wd_q_readin_o),
      .wd_i (y_o),
      .wd_o (wd_o),
      .pc_i (pc_o),
      .ir_i (ir_o),
      .pc_wd_o (pc_wd_o),
      .mem_i (mem_o),
      .stage_i (stage_o));
endmodule
