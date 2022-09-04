module rom
(
   input wire clk,
   input wire reset,
   input wire we,
   input wire [31:0] addr,
   output wire [31:0] data_o
);
   reg [7:0] rom [2**24:0];

   assign data_o = {rom[addr+3], rom[addr+2], rom[addr+1], rom[addr]};

   initial begin
      $readmemh(`FILE, rom, 0, 211);
   end
endmodule
