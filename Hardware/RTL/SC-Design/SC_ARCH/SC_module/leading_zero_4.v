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


module leading_zero_4(
    input  [3:0] a,
    output [2:0] y
    );

	// assign all = ~(a[3] | a[2] | a[1] | a[0]);
	// assign y[1] = ~(a[3] | a[2]);
	// assign y[0] = ~((~a[2] & a[1]) | a[3]);

	assign y = a[3:3] == 1'b1 ? 'd0:
			   a[2:2] == 1'b1 ? 'd1:
			   a[1:1] == 1'b1 ? 'd2:
			   a[0:0] == 1'b1 ? 'd3: 'd4;
endmodule




