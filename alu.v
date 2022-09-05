`include "itype.v"
`include "opcode.v"

module alu
(
   input wire clk,
   input wire reset,
   input wire [31:0] readd_a_i,
   input wire [31:0] readd_b_i,
   input wire [31:0] readd_pass_i,
   input wire readin_a_i,
   input wire readin_b_i,
   input wire readin_pass_i,
   input wire [2:0] stage_i,
   input wire [31:0] ir_i,
   input wire [4:0] itype_i,
   output reg [31:0] y_o,
   output reg [31:0] pass_o,
   input wire [31:0] pc_i
);
   reg [31:0] a;
   reg [31:0] b;
   reg [31:0] pass;
   
   // Read in values from decode
   always @ (posedge readin_a_i) begin
      if (reset) begin
         a <= 0;
      end
      else begin
         if (readin_a_i) begin
            a <= readd_a_i;
         end
      end
   end

   always @ (posedge readin_b_i) begin
      if (reset) begin
         b <= 0;
      end
      else begin
         if (readin_b_i) begin
            b <= readd_b_i;
         end
      end
   end

   always @ (posedge readin_pass_i) begin
      if (reset) begin
         pass <= 0;
      end
      else begin
         if (readin_pass_i) begin
            pass <= readd_pass_i;
         end
      end
   end

   wire [6:0] r7 = ir_i[31:25];
   wire [2:0] r3 = ir_i[14:12];

   // Compute
   always @ (posedge clk) begin
      if (!reset) begin
         // Execute at stage 3
         if (stage_i == 3) begin
            if (itype_i == `RTYPE) begin
               // ADD
               if (r7 == `ADD7 && r3 == `ADD3) begin
                     y_o <= a + b;
               end
               // SUB
               else if (r7 == `SUB7 && r3 == `SUB3) begin
                     y_o <= a - b;
               end
               // SLL
               else if (r7 == `SLL7 && r3 == `SLL3) begin
                     y_o <= a << b;
               end
               // SLT
               else if (r7 == `SLT7 && r3 == `SLT3) begin
                     if (a < b) begin
                        y_o <= 1;
                     end
                     else begin
                        y_o <= 0;
                     end
               end
               // SLTU
               else if (r7 == `SLTU7 && r3 == `SLTU3) begin
                     if (a < b) begin
                        y_o <= 1;
                     end
                     else begin
                        y_o <= 0;
                     end
               end
               // XOR
               else if (r7 == `XOR7 && r3 == `XOR3) begin
                     y_o <= a ^ b;
               end
               // SRL
               else if (r7 == `SRL7 && r3 == `SRL3) begin
                     y_o <= a >> b;
               end
               // SRA
               else if (r7 == `SRA7 && r3 == `SRA3) begin
                     y_o <= a >>> b;
               end
               // OR
               else if (r7 == `OR7 && r3 == `OR3) begin
                     y_o <= a | b;
               end
               // AND
               else if (r7 == `AND7 && r3 == `AND3) begin
                     y_o <= a & b;
               end
            end
            else if (itype_i == `ITYPE) begin
               // ADDI
               if (r3 == `ADDI3) begin
                     y_o <= a + b;
               end
               // SLTI
               else if (r3 == `SLTI3) begin
                     if (a < b) begin
                        y_o <= 1;
                     end
                     else begin
                        y_o <= 0;
                     end
               end
               // SLTIU
               else if (r3 == `SLTIU3) begin
                     if (a < b) begin
                        y_o <= 1;
                     end
                     else begin
                        y_o <= 0;
                     end
               end
               // XORI
               else if (r3 == `XORI3) begin
                     y_o <= a ^ b;
               end
               // ORI
               else if (r3 == `ORI3) begin
                     y_o <= a | b;
               end
               // ANDI
               else if (r3 == `ANDI3) begin
                     y_o <= a & b;
               end
               // SLLI
               else if (r7 == `SLLI7 && r3 == `SLLI3) begin
                     y_o <= a << b;
               end
               // SRLI
               else if (r7 == `SRLI7 && r3 == `SRLI3) begin
                     y_o <= a >> b;
               end
               // SRAI
               else if (r7 == `SRAI7 && r3 == `SRAI3) begin
                     y_o <= a >>> b;
               end
            end
            else if (itype_i == `STYPE) begin
               y_o <= a + b;
               pass_o <= pass;
            end
            else if (itype_i == `BTYPE) begin
               // BEQ
               if (r3 == `BEQ3) begin
                  if (a == b) begin
                     y_o <= pc_i + pass;
                  end
               end
               // BNE
               if (r3 == `BNE3) begin
                  if (a != b) begin
                     y_o <= pc_i + pass;
                  end
               end
               // BLT
               if (r3 == `BLT3) begin
                  if (a < b) begin
                     y_o <= pc_i + pass;
                  end
               end
               // BGE
               if (r3 == `BGE3) begin
                  if (a >= b) begin
                     y_o <= pc_i + pass;
                  end
               end
               // BLTU
               if (r3 == `BLTU3) begin
                  if (a < b) begin
                     y_o <= pc_i + pass;
                  end
               end
               // BGEU
               if (r3 == `BGEU3) begin
                  if (a > b) begin
                     y_o <= pc_i + pass;
                  end
               end
            end
            else if (itype_i == `UTYPE) begin
               y_o <= a;
            end
            else if (itype_i == `LTYPE) begin
               y_o <= a + b;
            end
         end
      end
   end

   initial begin
      a = 0;
      b = 0;
      pass = 0;
      y_o = 0;
      pass_o = 0;
   end
endmodule
