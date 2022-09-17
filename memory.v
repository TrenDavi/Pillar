`include "itype.v"

`define RAMADDRSPACE 20

module memory
(
   input wire clk,
   input wire reset,
   input wire [31:0] y_in,
   input wire [31:0] pass_in,
   output reg [31:0] mem_o,
   input wire we_i,
   input wire [4:0] itype_i,
   input wire [31:0] ir_i,
   input wire [31:0] addr_i,
   output wire [31:0] data_o,
   input wire [2:0] stage_i
);

   assign data_o = {ram[addr_i+3], ram[addr_i+2], ram[addr_i+1], ram[addr_i]};

   reg [7:0] ram [2 * 2**`RAMADDRSPACE:0];

   always @ (posedge we_i) begin
      $display("Store %d at 0x%h", pass_in, y_in);
      ram[y_in] = pass_in[7:0];
      ram[y_in+1] = pass_in[15:8];
      ram[y_in+2] = pass_in[23:16];
      ram[y_in+3] = pass_in[31:24];
   end

   wire [2:0] op;
   assign op = ir_i[14:12];

   always @ (stage_i) begin
      if (itype_i == `LTYPE && stage_i == 4) begin
         if (op == `LB3) begin
         end
         else if (op == `LH3) begin
         end
         else if (op == `LW3) begin
            mem_o[7:0] = ram[y_in];
            mem_o[15:8] = ram[y_in+1];
            mem_o[23:16] = ram[y_in+2];
            mem_o[31:24] = ram[y_in+3];
            $display("Load %d at %h", mem_o, y_in);
         end
         else if (op == `LBU3) begin
         end
         else if (op == `LHU3) begin
         end
      end
   end

   integer i;
   initial begin
      mem_o = 0;
      for (i = 0; i < 2*2**`RAMADDRSPACE; i = i + 1) begin
         ram[i] = 0;
      end
      $readmemh(`FILE, ram, 0, 2**`RAMADDRSPACE);
   end
endmodule
