// Register functions
`define DECODE_R_TYPE 32'b0110011
// Immediate 
`define DECODE_I_TYPE 32'b0010111
// Store
`define DECODE_S_TYPE 32'b0100011
// Upper Immediate
`define DECODE_U_TYPE 32'b0110111

// Instruction operation decoding

// R Type

// ADD
`define ADD7 7'b0000000
`define ADD3 3'b000

// SUB
`define SUB7 7'b0100000
`define SUB3 3'b000

// SLL
`define SLL7 7'b0000000
`define SLL3 3'b001

// SLT
`define SLT7 7'b0000000
`define SLT3 3'b010

// SLTU
`define SLTU7 7'b0000000
`define SLTU3 3'b011

// XOR
`define XOR7 7'b0000000
`define XOR3 3'b100

// SRL
`define SRL7 7'b0000000
`define SRL3 3'b101

// SRA
`define SRA7 7'b0100000
`define SRA3 3'b101

// OR
`define OR7 7'b0000000
`define OR3 3'b110

// AND
`define AND7 7'b0000000
`define AND3 3'b111
