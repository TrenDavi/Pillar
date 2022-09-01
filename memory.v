module memory
(
   input wire clk,
   input wire reset,
   input wire [31:0] y_in,
   input wire [31:0] pass_in,
   output wire [31:0] mem_o,
   input wire we_i
);

   reg [31:0] ram [2**16:0];

   always @ (posedge we_i) begin
      ram[y_in] = pass_in;
   end

   assign mem_o = ram[y_in];

endmodule
