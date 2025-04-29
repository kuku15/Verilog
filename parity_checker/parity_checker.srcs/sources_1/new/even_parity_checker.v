`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2025 02:11:34 PM
// Design Name: 
// Module Name: even_parity_checker
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


module even_parity_checker(
input [7:0] data,
input parity,
output error
);
// XOR all 8 bits and the parity bit; result should be 0 if parity is correct
assign error = ^{data, parity};  // Concatenate and reduce-XOR all
endmodule
