`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2025 01:18:05 PM
// Design Name: 
// Module Name: logic_gates
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


module logic_gate(
input a, b,
output reg not_gate,
output reg and_gate,
output reg or_gate,
output reg nand_gate,
output reg nor_gate,
output reg xor_gate,
output reg xnor_gate
    );
    
always @(*) begin
not_gate = ~a;
and_gate = a&b;
or_gate = a|b;
nand_gate = ~(a&b);
nor_gate = ~(a|b);
xor_gate = a^b;
xnor_gate = ~(a^b);
end
endmodule