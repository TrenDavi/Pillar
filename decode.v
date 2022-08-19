module decode
(
   input wire clk,
   input wire reset,
   // Register data output to acc
   output reg [31:0] ra_o,
   output reg [31:0] rb_o,
   output reg [31:0] pass_o,
   // Stage Select
   input wire [2:0] stage_i,
   // IR input
   input wire [31:0] ir_i,
   // ALU register write in
   output reg readin_a_o,
   output reg readin_b_o,
   output reg readin_pass_o
);
   wire [4:0] rs1;
   wire [4:0] rs2;

   always @ (*) begin
      readin_a_o <= 0;
      readin_b_o <= 0;
      readin_pass_o <= 0;
   end

   // Register Fetch
   wire [31:0] r0;
   reg [31:0] r1;
   reg [31:0] r2;
   reg [31:0] r3;
   reg [31:0] r4;
   reg [31:0] r5;
   reg [31:0] r6;
   reg [31:0] r7;
   reg [31:0] r8;
   reg [31:0] r9;
   reg [31:0] r10;
   reg [31:0] r11;
   reg [31:0] r12;
   reg [31:0] r13;
   reg [31:0] r14;
   reg [31:0] r15;
   reg [31:0] r16;
   reg [31:0] r17;
   reg [31:0] r18;
   reg [31:0] r19;
   reg [31:0] r20;
   reg [31:0] r21;
   reg [31:0] r22;
   reg [31:0] r23;
   reg [31:0] r24;
   reg [31:0] r25;
   reg [31:0] r26;
   reg [31:0] r27;
   reg [31:0] r28;
   reg [31:0] r29;
   reg [31:0] r30;
   reg [31:0] r31;
   
   assign r0 = 32'b0;   
 
   always @ (posedge clk) begin
      if (reset) begin
         r1  <= 32'b0;
         r2  <= 32'b0;
         r3  <= 32'b0;
         r4  <= 32'b0;
         r5  <= 32'b0;
         r6  <= 32'b0;
         r7  <= 32'b0;
         r8  <= 32'b0;
         r9  <= 32'b0;
         r10 <= 32'b0;
         r11 <= 32'b0;
         r12 <= 32'b0;
         r13 <= 32'b0;
         r14 <= 32'b0;
         r15 <= 32'b0;
         r16 <= 32'b0;
         r17 <= 32'b0;
         r18 <= 32'b0;
         r19 <= 32'b0;
         r20 <= 32'b0;
         r21 <= 32'b0;
         r22 <= 32'b0;
         r23 <= 32'b0;
         r24 <= 32'b0;
         r25 <= 32'b0;
         r26 <= 32'b0;
         r27 <= 32'b0;
         r28 <= 32'b0;
         r29 <= 32'b0;
         r30 <= 32'b0;
         r31 <= 32'b0;
      end
   end   
   
   always @ (*) begin
      case (rs1)
         'd0: ra_o = 32'b0;
         'd1: ra_o = r1;
         'd2: ra_o = r2;
         'd3: ra_o = r3;
         'd4: ra_o = r4;
         'd5: ra_o = r5;
         'd6: ra_o = r6;
         'd7: ra_o = r7;
         'd8: ra_o = r8;
         'd9: ra_o = r9;
         'd10: ra_o = r10;
         'd11: ra_o = r11;
         'd12: ra_o = r12;
         'd13: ra_o = r13;
         'd14: ra_o = r14;
         'd15: ra_o = r15;
         'd16: ra_o = r16;
         'd17: ra_o = r17;
         'd18: ra_o = r18;
         'd19: ra_o = r19;
         'd20: ra_o = r20;
         'd21: ra_o = r21;
         'd22: ra_o = r22;
         'd23: ra_o = r23;
         'd24: ra_o = r24;
         'd25: ra_o = r25;
         'd26: ra_o = r26;
         'd27: ra_o = r27;
         'd28: ra_o = r28;
         'd29: ra_o = r29;
         'd30: ra_o = r30;
         'd31: ra_o = r31;
         default : ra_o = 32'b0;
      endcase
   end

   always @ (*) begin
      case (rs2)
         'd0: rb_o = 32'b0;
         'd1: rb_o = r1;
         'd2: rb_o = r2;
         'd3: rb_o = r3;
         'd4: rb_o = r4;
         'd5: rb_o = r5;
         'd6: rb_o = r6;
         'd7: rb_o = r7;
         'd8: rb_o = r8;
         'd9: rb_o = r9;
         'd10: rb_o = r10;
         'd11: rb_o = r11;
         'd12: rb_o = r12;
         'd13: rb_o = r13;
         'd14: rb_o = r14;
         'd15: rb_o = r15;
         'd16: rb_o = r16;
         'd17: rb_o = r17;
         'd18: rb_o = r18;
         'd19: rb_o = r19;
         'd20: rb_o = r20;
         'd21: rb_o = r21;
         'd22: rb_o = r22;
         'd23: rb_o = r23;
         'd24: rb_o = r24;
         'd25: rb_o = r25;
         'd26: rb_o = r26;
         'd27: rb_o = r27;
         'd28: rb_o = r28;
         'd29: rb_o = r29;
         'd30: rb_o = r30;
         'd31: rb_o = r31;
         default : rb_o = 32'b0;
      endcase
   end

   initial begin
      readin_a_o = 0;
      readin_b_o = 0;
      readin_pass_o = 0;
   end
endmodule
