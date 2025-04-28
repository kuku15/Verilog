`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2025 06:17:55 AM
// Design Name: 
// Module Name: 4bit_multiplier
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
//////////////////////////////////////////////////////////////////////////////////
module bit_multiplier(
    input [3:0] A, B,
    output [7:0] Product
);
    wire [3:0] pp0, pp1, pp2, pp3;

    // Step 1: Partial Products
    assign pp0 = A & {4{B[0]}};
    assign pp1 = A & {4{B[1]}};
    assign pp2 = A & {4{B[2]}};
    assign pp3 = A & {4{B[3]}};

    // Intermediate wires for sums and carries
    wire s1, s2, s3, s4, s5, s6, s7, s8, s9, s10;
    wire c1, c2, c3, c4, c5, c6, c7, c8, c9, c10;

    // P0 is direct (LSB)
    assign Product[0] = pp0[0];

    // --- P1 ---
    full_adder fa1 (
        .a(pp0[1]), .b(pp1[0]), .cin(1'b0),
        .sum(Product[1]), .cout(c1)
    );

    // --- P2 ---
    full_adder fa2 (
        .a(pp0[2]), .b(pp1[1]), .cin(c1),
        .sum(s1), .cout(c2)
    );
    full_adder fa3 (
        .a(s1), .b(pp2[0]), .cin(1'b0),
        .sum(Product[2]), .cout(c3)
    );

    // --- P3 ---
    full_adder fa4 (.a(pp0[3]), .b(pp1[2]), .cin(c2), .sum(s2), .cout(c4));
    full_adder fa5 (.a(s2), .b(pp2[1]), .cin(c3), .sum(s3), .cout(c5));
    full_adder fa6 (.a(s3), .b(pp3[0]), .cin(1'b0), .sum(Product[3]), .cout(c6));

    // --- P4 ---
    full_adder fa7 (.a(pp1[3]), .b(pp2[2]), .cin(c4), .sum(s4), .cout(c7));
    full_adder fa8 (.a(s4), .b(pp3[1]), .cin(c5), .sum(s5), .cout(c8));
    full_adder fa9 (.a(s5), .b(c6),      .cin(1'b0), .sum(Product[4]), .cout(c9));

    // --- P5 ---
    full_adder fa10 (.a(pp2[3]), .b(pp3[2]), .cin(c7), .sum(s6), .cout(c10));
    full_adder fa11 (.a(s6), .b(c8), .cin(c9), .sum(Product[5]), .cout(s7));

    // --- P6 ---
    full_adder fa12 (.a(pp3[3]), .b(c10), .cin(s7), .sum(Product[6]), .cout(Product[7]));

endmodule

