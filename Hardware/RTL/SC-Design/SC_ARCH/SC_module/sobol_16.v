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


module sobol_16#(parameter DATA_WIDTH=16,
	parameter OUT_WIDTH=16,
	parameter sobolValidBitwth = 5
    )(
		input [sobolValidBitwth-1:0] a,
		input [sobolValidBitwth-1:0] b,
        output [OUT_WIDTH-1:0] c
    );
	
	localparam s1_0  = 5'b00000 ;
	localparam s1_1  = 5'b10000 ;
	localparam s1_2  = 5'b11000 ;
	localparam s1_3  = 5'b01000 ;
	localparam s1_4  = 5'b01100 ;
	localparam s1_5  = 5'b11100 ;
	localparam s1_6  = 5'b10100 ;
	localparam s1_7  = 5'b00100 ;
	localparam s1_8  = 5'b00110 ;
	localparam s1_9  = 5'b10110 ;
	localparam s1_10 = 5'b11110 ;
	localparam s1_11 = 5'b01110 ;
	localparam s1_12 = 5'b01010 ;
	localparam s1_13 = 5'b11010 ;
	localparam s1_14 = 5'b10010 ;
	localparam s1_15 = 5'b00010 ;

	localparam s2_0  = (5'd0 )<<1 ;
	localparam s2_1  = (5'd1 )<<1 ;
	localparam s2_2  = (5'd2 )<<1 ;
	localparam s2_3  = (5'd3 )<<1 ;
	localparam s2_4  = (5'd4 )<<1 ;
	localparam s2_5  = (5'd5 )<<1 ;
	localparam s2_6  = (5'd6 )<<1 ;
	localparam s2_7  = (5'd7 )<<1 ;
	localparam s2_8  = (5'd8 )<<1 ;
	localparam s2_9  = (5'd9 )<<1 ;
	localparam s2_10 = (5'd10)<<1 ;
	localparam s2_11 = (5'd11)<<1 ;
	localparam s2_12 = (5'd12)<<1 ;
	localparam s2_13 = (5'd13)<<1 ;
	localparam s2_14 = (5'd14)<<1 ;
	localparam s2_15 = (5'd15)<<1 ;


	wire [OUT_WIDTH-1:0] a_bs;
	wire [OUT_WIDTH-1:0] b_bs;

	assign a_bs[0]  = a >  s1_0  ;
	assign a_bs[1]  = a >  s1_1  ;
	assign a_bs[2]  = a >  s1_2  ;
	assign a_bs[3]  = a >  s1_3  ;
	assign a_bs[4]  = a >  s1_4  ;
	assign a_bs[5]  = a >  s1_5  ;
	assign a_bs[6]  = a >  s1_6  ;
	assign a_bs[7]  = a >  s1_7  ;
	assign a_bs[8]  = a >  s1_8  ;
	assign a_bs[9]  = a >  s1_9  ;
	assign a_bs[10] = a >  s1_10  ;
	assign a_bs[11] = a >  s1_11  ;
	assign a_bs[12] = a >  s1_12  ;
	assign a_bs[13] = a >  s1_13  ;
	assign a_bs[14] = a >  s1_14  ;
	assign a_bs[15] = a >  s1_15  ;

	assign b_bs[0]  = b >  s2_0  ;
	assign b_bs[1]  = b >  s2_1  ;
	assign b_bs[2]  = b >  s2_2  ;
	assign b_bs[3]  = b >  s2_3  ;
	assign b_bs[4]  = b >  s2_4  ;
	assign b_bs[5]  = b >  s2_5  ;
	assign b_bs[6]  = b >  s2_6  ;
	assign b_bs[7]  = b >  s2_7  ;
	assign b_bs[8]  = b >  s2_8  ;
	assign b_bs[9]  = b >  s2_9  ;
	assign b_bs[10] = b >  s2_10  ;
	assign b_bs[11] = b >  s2_11  ;
	assign b_bs[12] = b >  s2_12  ;
	assign b_bs[13] = b >  s2_13  ;
	assign b_bs[14] = b >  s2_14  ;
	assign b_bs[15] = b >  s2_15  ;

	assign c = a_bs & b_bs;


endmodule
