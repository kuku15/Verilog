`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2025 11:24:37 PM
// Design Name: 
// Module Name: updown_counter
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
module updown_counter #(parameter N = 4)(
input clk,
input updown,
input reset,
output reg [N-1:0] count
    );
    always @(posedge clk) begin
    if (reset)
    count <= 0 ;
    else if (updown)
        count <= count + 1'b1;
    else
        count <= count - 1'b1;
    end
endmodule
