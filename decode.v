module decode
(
   input wire clk,
   input wire reset
);
// Decode logic

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
      else begin
      end
   end   
endmodule
