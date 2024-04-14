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


module leading_zero_16(
    input [15:0] a,
    output [3:0] y
    );

	wire[3:0] high8Zero;
	wire[3:0] low8Zero;
	leading_zero_8 high_8(
	    .a(a[15:8]),
	    .y(high8Zero)
	);
	
	leading_zero_8 low_8(
    	.a(a[7:0]),
    	.y(low8Zero)
    	);
	
	
	assign y = high8Zero=='d8 ? 'd8 + low8Zero : high8Zero;

endmodule




