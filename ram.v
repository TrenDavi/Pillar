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

   always @(posedge clk)
      begin
         if (we)
            ram[addr] <= data_i;
            q_addr_a <= addr;
   end

   assign data_o = ram[q_addr_a];

   integer i;
   initial begin
      $readmemh("test.bin", ram);
      for (i=0;i<5;i=i+1) begin
         $displayh(ram[i]);
      end
   end

endmodule
