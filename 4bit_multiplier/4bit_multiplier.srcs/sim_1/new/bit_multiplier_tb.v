`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2025 06:21:35 AM
// Design Name: 
// Module Name: bit_multiplier_tb
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

module bit_multiplier_tb;
    reg [3:0] A, B;
    wire [7:0] Product;

    bit_multiplier dut (.A(A), .B(B), .Product(Product));

    initial begin
        $display("Time\tA\tB\tProduct (Binary)\tProduct (Decimal)");
        $monitor("%0t\t%b\t%b\t%b\t\t%d", $time, A, B, Product, Product);

        A = 4'd3;  B = 4'd4;   #10; // 3×4 = 12
        A = 4'd7;  B = 4'd2;   #10; // 7×2 = 14
        A = 4'd15; B = 4'd15;  #10; // 15×15 = 225
        A = 4'd10; B = 4'd5;   #10; // 10×5 = 50
        $finish;
    end
endmodule

