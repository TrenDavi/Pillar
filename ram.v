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

   always @(posedge clk) begin
      if (we) begin
         ram[addr] <= data_i;
      end
   end

   assign data_o = ram[addr];

   initial begin
      $readmemh("tests/prog.hex", ram, 1, 1626);
      ram[0] = 6;
   end
endmodule
