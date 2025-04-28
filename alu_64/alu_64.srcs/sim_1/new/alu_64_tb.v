`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2025 09:31:47 PM
// Design Name: 
// Module Name: alu_64_tb
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
module alu_64_full_tb;

    reg  [63:0] a_tb, b_tb;
    reg  [4:0]  sel_tb;
    wire [63:0] result_tb;
    wire        flag_tb;

    // DUT instantiation
    alu_64 dut (
        .a(a_tb),
        .b(b_tb),
        .sel(sel_tb),
        .result(result_tb),
        .flag(flag_tb)
    );

    // Monitor changes
    initial begin
        $display("Time\tsel\ta\t\tb\t\tresult\t\t\tflag");
        $monitor("%0dns\t%05b\t%d\t%d\t%d\t\t%b",
            $time, sel_tb, a_tb, b_tb, result_tb, flag_tb);
    end

    initial begin
        // Test 1: ADD (signed)
        a_tb = 64'd10; b_tb = 64'd20; sel_tb = 5'b00000; #10;

        // Test 2: SUB
        a_tb = 64'd100; b_tb = 64'd25; sel_tb = 5'b00001; #10;

        // Test 3: MUL
        a_tb = 64'd3; b_tb = 64'd5; sel_tb = 5'b00010; #10;

        // Test 4: DIV (signed)
        a_tb = 64'sd100; b_tb = -64'sd4; sel_tb = 5'b00011; #10;

        // Test 5: REM (mod)
        a_tb = 64'sd101; b_tb = 64'sd6; sel_tb = 5'b00100; #10;

        // Test 6: AND
        a_tb = 64'hFF00FF00; b_tb = 64'h00FF00FF; sel_tb = 5'b00101; #10;

        // Test 7: OR
        sel_tb = 5'b00110; #10;

        // Test 8: XOR
        sel_tb = 5'b00111; #10;

        // Test 9: SLT (signed <)
        a_tb = -64'sd5; b_tb = 64'd2; sel_tb = 5'b01011; #10;

        // Test 10: SLTU (unsigned <)
        a_tb = 64'h00000000FFFFFFFF; b_tb = 64'h0000000100000000; sel_tb = 5'b01100; #10;

        // Test 11: SEQ (==)
        a_tb = 64'd55; b_tb = 64'd55; sel_tb = 5'b01101; #10;

        // Test 12: SNE (!=)
        a_tb = 64'd55; b_tb = 64'd99; sel_tb = 5'b01110; #10;

        // Test 13: SGT (signed >)
        a_tb = 64'd99; b_tb = 64'sd33; sel_tb = 5'b01111; #10;

        // Test 14: SGTU (unsigned >)
        a_tb = 64'hFFFFFFFFFFFFFFFE; b_tb = 64'h0000000000000001; sel_tb = 5'b10000; #10;

        // Test 15: SLL (logical left shift)
        a_tb = 64'h000000000000000F; b_tb = 64'd4; sel_tb = 5'b10001; #10;

        // Test 16: SRL (logical right shift)
        sel_tb = 5'b10010; #10;

        // Test 17: SRA (arithmetic right shift)
        a_tb = -64'sd64; sel_tb = 5'b10011; #10;

        // Test 18: ROL (rotate left)
        a_tb = 64'h8000000000000001; sel_tb = 5'b10100; #10;

        // Test 19: ROR (rotate right)
        sel_tb = 5'b10101; #10;

        // Test 20: NEG (2's complement)
        a_tb = 64'd42; sel_tb = 5'b10110; #10;

        // Test 21: NOT (1's complement)
        sel_tb = 5'b10111; #10;

        $finish;
    end

endmodule