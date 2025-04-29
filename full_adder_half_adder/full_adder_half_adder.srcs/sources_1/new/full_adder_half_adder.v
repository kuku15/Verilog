`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2025 04:41:50 PM
// Design Name: 
// Module Name: full_adder_half_adder
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
module half_adder (
    input a, b,
    output sum, carry
);
    assign sum = a ^ b;
    assign carry = a & b;
endmodule

module full_adder_half_adder (
    input a, b, cin,
    output sum, cout
);
    wire sum1, carry1, carry2;

    // First Half Adder: a + b
    half_adder ha1 (
        .a(a), .b(b),
        .sum(sum1), .carry(carry1)
    );

    // Second Half Adder: sum1 + cin
    half_adder ha2 (
        .a(sum1), .b(cin),
        .sum(sum), .carry(carry2)
    );

    // Final carry-out
    assign cout = carry1 | carry2;
endmodule
