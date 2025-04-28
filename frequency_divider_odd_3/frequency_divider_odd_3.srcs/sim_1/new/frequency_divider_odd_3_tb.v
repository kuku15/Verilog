`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2025 03:20:10 PM
// Design Name: 
// Module Name: frequency_divider_odd_3_tb
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


module frequency_divider_odd_3_tb;
    reg clk;
    reg reset;
    wire clk_div3;

    // Instantiate the DUT
    frequency_divider_odd_3 uut (
        .clk(clk),
        .reset(reset),
        .clk_div3(clk_div3)
    );

    // Generate a 10ns clock (100 MHz)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Apply reset and run simulation
    initial begin
        reset = 1;
        #20;
        reset = 0;

        #500;
        $finish;
    end

    // Monitor values in console
    initial begin
        $display("Time\tclk\treset\tclk_div3");
        $monitor("%0dns\t%b\t%b\t%b", $time, clk, reset, clk_div3);
   end
endmodule
