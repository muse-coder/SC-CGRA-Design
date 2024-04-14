`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/15 15:56:04
// Design Name: 
// Module Name: sobol32
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


module sobol_8#(parameter DATA_WIDTH=8,
	parameter OUT_WIDTH=8,
	parameter sobolValidBitwth = 5
    )(
		input [sobolValidBitwth-1:0] a,
		input [sobolValidBitwth-1:0] b,
        output [OUT_WIDTH-1:0] c
    );
	
	localparam s1_8  = 5'b00110 ;
	localparam s1_9  = 5'b10110 ;
	localparam s1_10 = 5'b11110 ;
	localparam s1_11 = 5'b01110 ;
	localparam s1_12 = 5'b01010 ;
	localparam s1_13 = 5'b11010 ;
	localparam s1_14 = 5'b10010 ;
	localparam s1_15 = 5'b00010 ;

	localparam s2_8  = (5'd8 )<<1;
	localparam s2_9  = (5'd9 )<<1;
	localparam s2_10 = (5'd10)<<1;
	localparam s2_11 = (5'd11)<<1;
	localparam s2_12 = (5'd12)<<1;
	localparam s2_13 = (5'd13)<<1;
	localparam s2_14 = (5'd14)<<1;
	localparam s2_15 = (5'd15)<<1;


	wire [OUT_WIDTH-1:0] a_bs;
	wire [OUT_WIDTH-1:0] b_bs;


	assign a_bs[0]  = a >  s1_8  ;
	assign a_bs[1]  = a >  s1_9  ;
	assign a_bs[2] = a >  s1_10  ;
	assign a_bs[3] = a >  s1_11  ;
	assign a_bs[4] = a >  s1_12  ;
	assign a_bs[5] = a >  s1_13  ;
	assign a_bs[6] = a >  s1_14  ;
	assign a_bs[7] = a >  s1_15  ;

	assign b_bs[0]  = b >  s2_8  ;
	assign b_bs[1]  = b >  s2_9  ;
	assign b_bs[2]  = b >  s2_10  ;
	assign b_bs[3]  = b >  s2_11  ;
	assign b_bs[4]  = b >  s2_12  ;
	assign b_bs[5]  = b >  s2_13  ;
	assign b_bs[6]  = b >  s2_14  ;
	assign b_bs[7]  = b >  s2_15  ;

	assign c = a_bs & b_bs;


endmodule
