module ram
(
   input wire clk,
   input wire reset,
   input wire we,
   input wire [31:0] addr,
   input wire [31:0] data_i,
   output wire [31:0] data_o
);

   reg [31:0] ram [2**16:0] /*verilator public*/;
   reg [31:0] q_addr_a; 

   always @(posedge clk) begin
      if (we) begin
            ram[addr] <= data_i;
            q_addr_a <= addr;
      end
   end

   assign data_o = ram[q_addr_a];

   initial begin
      // Load program into memory
      $readmemh("test.bin", ram);
   end

endmodule
