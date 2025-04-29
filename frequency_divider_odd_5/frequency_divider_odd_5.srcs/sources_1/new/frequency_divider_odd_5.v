`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2025 03:51:56 PM
// Design Name: 
// Module Name: frequency_divider_odd_5
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
module frequency_divider_odd_5(
    input clk,
    input reset,
    output wire clk_by5
);

    // 3-bit counter
    reg [2:0] counter = 0;

    // D flip-flop outputs
    reg q1 = 0;
    reg q2 = 0;

    // Counter: counts 0 to 4
    always @(posedge clk) begin
        if (reset)
            counter <= 0;
        else if (counter == 3'd4)
            counter <= 0;
        else
            counter <= counter + 1;
    end

    // First D flip-flop
    always @(posedge clk) begin
        if (reset)
            q1 <= 0;
        else
            q1 <= counter[2];
    end

    // Second D flip-flop
    always @(posedge clk) begin
        if (reset)
            q2 <= 0;
        else
            q2 <= q1;
    end

    // Output clock
    assign clk_by5 = q1 | q2;
endmodule
