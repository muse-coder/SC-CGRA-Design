`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/25 16:59:02
// Design Name: 
// Module Name: leading_zero_16
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


module leading_zero_8(
    input [7:0] a,
    output [3:0] y
    );

	wire [2:0] high4Zero;
	wire [2:0] low4Zero;
	leading_zero_4 high4(
    .a(a[7:4]),
    .y(high4Zero)
    );

	leading_zero_4 low4(
    .a(a[3:0]),
    .y(low4Zero)
    );
	
	assign y = high4Zero== 'd4 ? 3'd4 + low4Zero : high4Zero; 
	
endmodule




