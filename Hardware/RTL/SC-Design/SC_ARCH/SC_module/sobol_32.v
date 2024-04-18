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


module sobol_32#(parameter DATA_WIDTH=16,
	parameter OUT_WIDTH=32,
	parameter sobolValidBitwth = 6
    )(
		// input clk,
		// input rst_n,
		// input en,
		input [sobolValidBitwth-1:0] a,
		input [sobolValidBitwth-1:0] b,
        output [OUT_WIDTH-1:0] c
    );
	localparam s1_1 =  6'b000000 ;
	localparam s1_2 =  6'b100000 ;
	localparam s1_3 =  6'b110000 ;
	localparam s1_4 =  6'b010000 ;
	localparam s1_5 =  6'b011000 ;
	localparam s1_6 =  6'b111000 ;
	localparam s1_7 =  6'b101000 ;
	localparam s1_8 =  6'b001000 ;
	localparam s1_9 =  6'b001100 ;
	localparam s1_10 = 6'b101100 ;
	localparam s1_11 = 6'b111100 ;
	localparam s1_12 = 6'b011100 ;
	localparam s1_13 = 6'b010100 ;
	localparam s1_14 = 6'b110100 ;
	localparam s1_15 = 6'b100100 ;
	localparam s1_16 = 6'b000100 ;
	localparam s1_17 = 6'b000110 ;
	localparam s1_18 = 6'b100110 ;
	localparam s1_19 = 6'b110110 ;
	localparam s1_20 = 6'b010110 ;
	localparam s1_21 = 6'b011110 ;
	localparam s1_22 = 6'b111110 ;
	localparam s1_23 = 6'b101110 ;
	localparam s1_24 = 6'b001110 ;
	localparam s1_25 = 6'b001010 ;
	localparam s1_26 = 6'b101010 ;
	localparam s1_27 = 6'b111010 ;
	localparam s1_28 = 6'b011010 ;
	localparam s1_29 = 6'b010010 ;
	localparam s1_30 = 6'b110010 ;
	localparam s1_31 = 6'b100010 ;
	localparam s1_32 = 6'b000010 ;
	
	
	localparam s2_1  =  5'd0;
	localparam s2_2  =  5'd1; 
	localparam s2_3  =  5'd2; 
	localparam s2_4  =  5'd3; 
	localparam s2_5  =  5'd4; 
	localparam s2_6  =  5'd5; 
	localparam s2_7  =  5'd6; 
	localparam s2_8  =  5'd7; 
	localparam s2_9  =  5'd8; 
	localparam s2_10 =  5'd9;
	localparam s2_11 =  5'd10;
	localparam s2_12 =  5'd11;
	localparam s2_13 =  5'd12;
	localparam s2_14 =  5'd13;
	localparam s2_15 =  5'd14;
	localparam s2_16 =  5'd15;
	localparam s2_17 =  5'd16;
	localparam s2_18 =  5'd17;
	localparam s2_19 =  5'd18;
	localparam s2_20 =  5'd19;
	localparam s2_21 =  5'd20;
	localparam s2_22 =  5'd21;
	localparam s2_23 =  5'd22;
	localparam s2_24 =  5'd23;
	localparam s2_25 =  5'd24;
	localparam s2_26 =  5'd25;
	localparam s2_27 =  5'd26;
	localparam s2_28 =  5'd27;
	localparam s2_29 =  5'd28;
	localparam s2_30 =  5'd29;
	localparam s2_31 =  5'd30;
	localparam s2_32 =  5'd31;

	wire [OUT_WIDTH-1:0] a_bs;
	wire [OUT_WIDTH-1:0] b_bs;



	assign a_bs[0]  = a > s1_1  ;
	assign a_bs[1]  = a > s1_2  ;
	assign a_bs[2]  = a > s1_3  ;
	assign a_bs[3]  = a > s1_4  ;
	assign a_bs[4]  = a > s1_5  ;
	assign a_bs[5]  = a > s1_6  ;
	assign a_bs[6]  = a > s1_7  ;
	assign a_bs[7]  = a > s1_8  ;
	assign a_bs[8]  = a > s1_9  ;
	assign a_bs[9]  = a > s1_10 ;
	assign a_bs[10] = a > s1_11 ;
	assign a_bs[11] = a > s1_12 ;
	assign a_bs[12] = a > s1_13 ;
	assign a_bs[13] = a > s1_14 ;
	assign a_bs[14] = a > s1_15 ;
	assign a_bs[15] = a > s1_16 ;
	assign a_bs[16] = a > s1_17 ;
	assign a_bs[17] = a > s1_18 ;
	assign a_bs[18] = a > s1_19 ;
	assign a_bs[19] = a > s1_20 ;
	assign a_bs[20] = a > s1_21 ;
	assign a_bs[21] = a > s1_22 ;
	assign a_bs[22] = a > s1_23 ;
	assign a_bs[23] = a > s1_24 ;
	assign a_bs[24] = a > s1_25 ;
	assign a_bs[25] = a > s1_26 ;
	assign a_bs[26] = a > s1_27 ;
	assign a_bs[27] = a > s1_28 ;
	assign a_bs[28] = a > s1_29 ;
	assign a_bs[29] = a > s1_30 ;
	assign a_bs[30] = a > s1_31 ;
	assign a_bs[31] = a > s1_32 ;
	// assign a_bs[31] = a > (expand ? (s1_32 ^ directionVector) : s1_32) ;


	assign b_bs[0]  = b >  s2_1  ;
	assign b_bs[1]  = b >  s2_2  ;
	assign b_bs[2]  = b >  s2_3  ;
	assign b_bs[3]  = b >  s2_4  ;
	assign b_bs[4]  = b >  s2_5  ;
	assign b_bs[5]  = b >  s2_6  ;
	assign b_bs[6]  = b >  s2_7  ;
	assign b_bs[7]  = b >  s2_8  ;
	assign b_bs[8]  = b >  s2_9  ;
	assign b_bs[9]  = b >  s2_10 ;
	assign b_bs[10] = b >  s2_11 ;
	assign b_bs[11] = b >  s2_12 ;
	assign b_bs[12] = b >  s2_13 ;
	assign b_bs[13] = b >  s2_14 ;
	assign b_bs[14] = b >  s2_15 ;
	assign b_bs[15] = b >  s2_16 ;
	assign b_bs[16] = b >  s2_17 ;
	assign b_bs[17] = b >  s2_18 ;
	assign b_bs[18] = b >  s2_19 ;
	assign b_bs[19] = b >  s2_20 ;
	assign b_bs[20] = b >  s2_21 ;
	assign b_bs[21] = b >  s2_22 ;
	assign b_bs[22] = b >  s2_23 ;
	assign b_bs[23] = b >  s2_24 ;
	assign b_bs[24] = b >  s2_25 ;
	assign b_bs[25] = b >  s2_26 ;
	assign b_bs[26] = b >  s2_27 ;
	assign b_bs[27] = b >  s2_28 ;
	assign b_bs[28] = b >  s2_29 ;
	assign b_bs[29] = b >  s2_30 ;
	assign b_bs[30] = b >  s2_31 ;
	assign b_bs[31] = b >  s2_32 ;
	// assign b_bs[31] = b > (expand ? (s2_32 ^ directionVector) : s2_32) ;

	assign c = a_bs & b_bs;


endmodule
