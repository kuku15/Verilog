`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2025 03:17:31 PM
// Design Name: 
// Module Name: frequency_divider_odd_3
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
module frequency_divider_odd_3 (
    input clk,          // positive edge
    input reset,
    output wire clk_div3
);

    reg QA = 0;
    reg QB = 0;
    reg QC = 0;

    wire dA, dB, dC;

    // D flip-flop A (positive edge)
    always @(posedge clk) begin
        if (reset)
            QA <= 0;
        else
            QA <= ~(QA & QB);  // dA = ~(QA & QB)
    end

    // D flip-flop B (positive edge)
    always @(posedge clk) begin
        if (reset)
            QB <= 0;
        else
            QB <= QA;
    end

    // D flip-flop C (negative edge)
    always @(negedge clk) begin
        if (reset)
            QC <= 0;
        else
            QC <= QB;
    end

    assign clk_div3 = QB | QC;

endmodule
