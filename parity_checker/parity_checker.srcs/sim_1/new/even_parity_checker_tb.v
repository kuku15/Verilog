`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2025 02:12:48 PM
// Design Name: 
// Module Name: even_parity_checker_tb
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
module even_parity_checker_tb;
reg [7:0] data;
reg parity;
wire error;

    even_parity_checker dut(
        .data(data),
        .parity(parity),
        .error(error)
    );

    initial begin
        $display("Time\tData\t\tParity\tError");
        $monitor("%0t\t%b\t%b\t%b", $time, data, parity, error);

        // Valid even parity cases
        data = 8'b00000000; parity = 1'b0; #10; // even ? correct
        data = 8'b00000001; parity = 1'b1; #10; // even ? correct
        data = 8'b10101010; parity = 1'b0; #10; // even ? correct

        // Inject parity errors (invalid parity)
        data = 8'b00000001; parity = 1'b0; #10; // odd ? error
        data = 8'b10101010; parity = 1'b1; #10; // even data, wrong parity
        data = 8'b11111111; parity = 1'b1; #10; // 8 ones + 1 ? 9 ? error

        $finish;
    end
endmodule