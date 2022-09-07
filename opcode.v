// Register functions
`define DECODE_R_TYPE 32'b0110011
// Immediate 
`define DECODE_I_TYPE 32'b0010011
// Load Immediate
`define DECODE_L_TYPE 32'b0000011
// Store
`define DECODE_S_TYPE 32'b0100011
// Branch
`define DECODE_B_TYPE 32'b1100011
// Upper Immediate
`define DECODE_U_TYPE 32'b0110111
// Upper Immediate to PC
`define DECODE_UPC_TYPE 32'b0010111
// Jump
`define DECODE_J_TYPE 32'b1101111

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


// I Type

// ADDI
`define ADDI3 3'b000

// SLTI
`define SLTI3 3'b010

// SLTIU
`define SLTIU3 3'b011

// XORI
`define XORI3 3'b100

// ORI
`define ORI3 3'b110

// ANDI
`define ANDI3 3'b111

// SLLI
`define SLLI7 7'b0000000
`define SLLI3 3'b001

// SRLI
`define SRLI7 7'b0000000
`define SRLI3 3'b101

// SRAI
`define SRAI7 7'b0100000
`define SRAI3 3'b101

// S Type

// SB
`define SB3 3'b000

// SH
`define SH3 3'b001

// SW
`define SW3 3'b010

// L Type

// LB
`define LB3 3'b000

// LH
`define LH3 3'b001

// LW
`define LW3 3'b010

// LBU
`define LBU3 3'b100

// LHU
`define LHU3 3'b101

// B Type

// BEQ
`define BEQ3 3'b000

// BNE
`define BNE3 3'b001

// BLT
`define BLT3 3'b100

// BGE
`define BGE3 3'b101

// BLTU
`define BLTU3 3'b110

// BGEU
`define BGEU3 3'b111

// J type

// JAL
`define JAL_OP 7'b1101111

// JALR
`define JALR_OP 7'b1100111
