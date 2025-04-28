`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2025 01:25:56 PM
// Design Name: 
// Module Name: logic_gate_tb
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


module logic_gate_tb;
reg a ,b;
wire not_gate, and_gate, or_gate, nand_gate, nor_gate, xor_gate, xnor_gate;
logic_gate dut(.a(a), .b(b), .not_gate(not_gate), .and_gate(and_gate), .or_gate(or_gate), .nand_gate(nand_gate), .nor_gate(nor_gate), .xor_gate(xor_gate), .xnor_gate(xnor_gate));
initial begin
        a = 0; b = 0;
        #10 a= 1'b0; b= 1'b0;
        #10 a= 1'b0; b= 1'b1;
        #10 a= 1'b1; b= 1'b0;
        #10 a= 1'b1; b= 1'b1;  
end
initial begin
        $monitor("Time=%0t | a=%b b=%b | NOT=%b AND=%b OR=%b NAND=%b NOR=%b XOR=%b XNOR=%b",
                 $time, a, b, not_gate, and_gate, or_gate, nand_gate, nor_gate, xor_gate, xnor_gate);
    end
endmodule
