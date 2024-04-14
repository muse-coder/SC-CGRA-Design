`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/30 10:15:57
// Design Name: 
// Module Name: FA
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


module FA(
	input a,
	input b,
	input cin,
	output sum,
	output cout
    );

	assign cout = (a&b) | (b&cin) | (cin&a);
	assign sum = a ^ b ^ cin;

endmodule