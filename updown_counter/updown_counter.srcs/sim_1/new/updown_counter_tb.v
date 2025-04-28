`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2025 11:30:18 PM
// Design Name: 
// Module Name: updown_counter_tb
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
module updown_counter_tb;

    parameter N = 4;

    reg clk, reset, updown;
    wire [N-1:0] count;

    // Instantiate the counter
    updown_counter #(N) dut (
        .clk(clk),
        .reset(reset),
        .updown(updown),
        .count(count)
    );

    // Clock: 10ns period
    always #5 clk = ~clk;

    initial begin
        $display("Time\tReset\tUpDown\tCount (Decimal)");
        $monitor("%0t\t%b\t%b\t%d", $time, reset, updown, count);

        // Start test
        clk = 0;
        reset = 1; updown = 1; #10; // Reset active
        reset = 0;             #50; // Count up for 5 cycles

        updown = 0;           #50; // Count down for 5 cycles

        $finish;
    end
endmodule
