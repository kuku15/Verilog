`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2025 03:56:06 PM
// Design Name: 
// Module Name: frequency_divider_odd_5_tb
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


module frequency_divider_odd_5_tb;

    reg clk;
    reg reset;
    wire clk_by5;

    // DUT instantiation
    frequency_divider_odd_5 uut (
        .clk(clk),
        .reset(reset),
        .clk_by5(clk_by5)
    );

    // 100 MHz clock generation (10 ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Reset and simulation
    initial begin
        reset = 1;
        #20;
        reset = 0;
        #500;
        $finish;
    end

    // Display monitored signals
    initial begin
        $display("Time\tclk\treset\tclk_by5");
        $monitor("%0dns\t%b\t%b\t%b", $time, clk, reset, clk_by5);
    end
endmodule
