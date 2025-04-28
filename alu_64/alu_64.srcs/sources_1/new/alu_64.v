`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2025 04:41:10 PM
// Design Name: 
// Module Name: alu_64
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
module alu_64 (
    input  [63:0] a,
    input  [63:0] b,
    input  [4:0]  sel,         // 5 bits to support 32 ops if needed
    output reg [63:0] result,
    output reg        flag     // EQ / MSB carry or overflow flag
);

    wire signed [63:0] sa = a;
    wire signed [63:0] sb = b;

    always @(*) begin
        case (sel)

        // Arithmetic
        5'b00000: begin result = sa + sb;              flag = 0; end  // ADD
        5'b00001: begin result = sa - sb;              flag = 0; end  // SUB
        5'b00010: begin result = sa * sb;              flag = 0; end  // MUL
        5'b00011: begin result = (sb != 0) ? sa / sb : 64'd0; flag = 0; end // DIV
        5'b00100: begin result = (sb != 0) ? sa % sb : 64'd0; flag = 0; end // REM (mod)

        // Logical
        5'b00101: begin result = a & b;                flag = 0; end  // AND
        5'b00110: begin result = a | b;                flag = 0; end  // OR
        5'b00111: begin result = a ^ b;                flag = 0; end  // XOR
        5'b01000: begin result = ~(a & b);             flag = 0; end  // NAND
        5'b01001: begin result = ~(a | b);             flag = 0; end  // NOR
        5'b01010: begin result = ~(a ^ b);             flag = 0; end  // XNOR

        // Comparison
        5'b01011: begin result = (sa < sb);            flag = result; end // SLT (signed)
        5'b01100: begin result = (a < b);              flag = result; end // SLTU (unsigned)
        5'b01101: begin result = (sa == sb);           flag = result; end // SEQ (equal)
        5'b01110: begin result = (sa != sb);           flag = result; end // SNE (not equal)
        5'b01111: begin result = (sa > sb);            flag = result; end // SGT (signed greater)
        5'b10000: begin result = (a > b);              flag = result; end // SGTU (unsigned greater)

        // Shift and rotate
        5'b10001: begin result = a << b[5:0];          flag = 0; end  // SLL
        5'b10010: begin result = a >> b[5:0];          flag = 0; end  // SRL (logical)
        5'b10011: begin result = sa >>> b[5:0];        flag = 0; end  // SRA (arithmetic)
        5'b10100: begin result = (a << 1) | (a >> 63); flag = 0; end  // ROL (1-bit)
        5'b10101: begin result = (a >> 1) | (a << 63); flag = 0; end  // ROR (1-bit)

        // Complements
        5'b10110: begin result = -sa;                  flag = 0; end  // NEG (2's complement)
        5'b10111: begin result = ~a;                   flag = 0; end  // NOT (1's complement)

        default:  begin result = 64'd0;                flag = 0; end  // default: zero

        endcase
    end

endmodule