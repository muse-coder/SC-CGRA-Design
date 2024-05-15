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


module sobol_32_extend#(parameter DATA_WIDTH=16,
	parameter OUT_WIDTH=32,
	parameter sobolValidBitwth = 6
    )(
		// input clk,
		// input rst_n,
		// input en,
		input extend,
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
	
	
	localparam s2_1  =  6'd0<<1;
	localparam s2_2  =  6'd1<<1; 
	localparam s2_3  =  6'd2<<1; 
	localparam s2_4  =  6'd3<<1; 
	localparam s2_5  =  6'd4<<1; 
	localparam s2_6  =  6'd5<<1; 
	localparam s2_7  =  6'd6<<1; 
	localparam s2_8  =  6'd7<<1; 
	localparam s2_9  =  6'd8<<1; 
	localparam s2_10 =  6'd9<<1;
	localparam s2_11 =  6'd10<<1;
	localparam s2_12 =  6'd11<<1;
	localparam s2_13 =  6'd12<<1;
	localparam s2_14 =  6'd13<<1;
	localparam s2_15 =  6'd14<<1;
	localparam s2_16 =  6'd15<<1;
	localparam s2_17 =  6'd16<<1;
	localparam s2_18 =  6'd17<<1;
	localparam s2_19 =  6'd18<<1;
	localparam s2_20 =  6'd19<<1;
	localparam s2_21 =  6'd20<<1;
	localparam s2_22 =  6'd21<<1;
	localparam s2_23 =  6'd22<<1;
	localparam s2_24 =  6'd23<<1;
	localparam s2_25 =  6'd24<<1;
	localparam s2_26 =  6'd25<<1;
	localparam s2_27 =  6'd26<<1;
	localparam s2_28 =  6'd27<<1;
	localparam s2_29 =  6'd28<<1;
	localparam s2_30 =  6'd29<<1;
	localparam s2_31 =  6'd30<<1;
	localparam s2_32 =  6'd31<<1;

	wire [OUT_WIDTH-1:0] a_bs;
	wire [OUT_WIDTH-1:0] b_bs;



	assign a_bs[0]  = a > (extend? (s1_1 ^ 6'b111100) : s1_1 )  ;
	assign a_bs[1]  = a > (extend? (s1_2 ^ 6'b111100) : s1_2 )  ;
	assign a_bs[2]  = a > (extend? (s1_3 ^ 6'b111100) : s1_3 )  ;
	assign a_bs[3]  = a > (extend? (s1_4 ^ 6'b111100) : s1_4 )  ;
	assign a_bs[4]  = a > (extend? (s1_5 ^ 6'b111100) : s1_5 )  ;
	assign a_bs[5]  = a > (extend? (s1_6 ^ 6'b111100) : s1_6 )  ;
	assign a_bs[6]  = a > (extend? (s1_7 ^ 6'b111100) : s1_7 )  ;
	assign a_bs[7]  = a > (extend? (s1_8 ^ 6'b111100) : s1_8 )  ;
	assign a_bs[8]  = a > (extend? (s1_9 ^ 6'b111100) : s1_9 )  ;
	assign a_bs[9]  = a > (extend? (s1_10 ^ 6'b111100) : s1_10 ) ;
	assign a_bs[10] = a > (extend? (s1_11 ^ 6'b111100) : s1_11 ) ;
	assign a_bs[11] = a > (extend? (s1_12 ^ 6'b111100) : s1_12 ) ;
	assign a_bs[12] = a > (extend? (s1_13 ^ 6'b111100) : s1_13 ) ;
	assign a_bs[13] = a > (extend? (s1_14 ^ 6'b111100) : s1_14 ) ;
	assign a_bs[14] = a > (extend? (s1_15 ^ 6'b111100) : s1_15 ) ;
	assign a_bs[15] = a > (extend? (s1_16 ^ 6'b111100) : s1_16 ) ;
	assign a_bs[16] = a > (extend? (s1_17 ^ 6'b111100) : s1_17 ) ;
	assign a_bs[17] = a > (extend? (s1_18 ^ 6'b111100) : s1_18 ) ;
	assign a_bs[18] = a > (extend? (s1_19 ^ 6'b111100) : s1_19 ) ;
	assign a_bs[19] = a > (extend? (s1_20 ^ 6'b111100) : s1_20 ) ;
	assign a_bs[20] = a > (extend? (s1_21 ^ 6'b111100) : s1_21 ) ;
	assign a_bs[21] = a > (extend? (s1_22 ^ 6'b111100) : s1_22 ) ;
	assign a_bs[22] = a > (extend? (s1_23 ^ 6'b111100) : s1_23 ) ;
	assign a_bs[23] = a > (extend? (s1_24 ^ 6'b111100) : s1_24 ) ;
	assign a_bs[24] = a > (extend? (s1_25 ^ 6'b111100) : s1_25 ) ;
	assign a_bs[25] = a > (extend? (s1_26 ^ 6'b111100) : s1_26 ) ;
	assign a_bs[26] = a > (extend? (s1_27 ^ 6'b111100) : s1_27 ) ;
	assign a_bs[27] = a > (extend? (s1_28 ^ 6'b111100) : s1_28 ) ;
	assign a_bs[28] = a > (extend? (s1_29 ^ 6'b111100) : s1_29 ) ;
	assign a_bs[29] = a > (extend? (s1_30 ^ 6'b111100) : s1_30 ) ;
	assign a_bs[30] = a > (extend? (s1_31 ^ 6'b111100) : s1_31 ) ;
	assign a_bs[31] = a > (extend? (s1_32 ^ 6'b111100) : s1_32 ) ;
	// assign a_bs[31] = a > (expand ? (s1_32 ^ directionVector) : s1_32) ;


	assign b_bs[0]  = b >  (extend ? (s2_1 ^ 6'b100000) : s2_1 )   ;
	assign b_bs[1]  = b >  (extend ? (s2_2 ^ 6'b100000) : s2_2 )   ;
	assign b_bs[2]  = b >  (extend ? (s2_3 ^ 6'b100000) : s2_3 )   ;
	assign b_bs[3]  = b >  (extend ? (s2_4 ^ 6'b100000) : s2_4 )   ;
	assign b_bs[4]  = b >  (extend ? (s2_5 ^ 6'b100000) : s2_5 )   ;
	assign b_bs[5]  = b >  (extend ? (s2_6 ^ 6'b100000) : s2_6 )   ;
	assign b_bs[6]  = b >  (extend ? (s2_7 ^ 6'b100000) : s2_7 )   ;
	assign b_bs[7]  = b >  (extend ? (s2_8 ^ 6'b100000) : s2_8 )   ;
	assign b_bs[8]  = b >  (extend ? (s2_9 ^ 6'b100000) : s2_9 )   ;
	assign b_bs[9]  = b >  (extend ? (s2_10 ^ 6'b100000) : s2_10 )  ;
	assign b_bs[10] = b >  (extend ? (s2_11 ^ 6'b100000) : s2_11 )  ;
	assign b_bs[11] = b >  (extend ? (s2_12 ^ 6'b100000) : s2_12 )  ;
	assign b_bs[12] = b >  (extend ? (s2_13 ^ 6'b100000) : s2_13 )  ;
	assign b_bs[13] = b >  (extend ? (s2_14 ^ 6'b100000) : s2_14 )  ;
	assign b_bs[14] = b >  (extend ? (s2_15 ^ 6'b100000) : s2_15 )  ;
	assign b_bs[15] = b >  (extend ? (s2_16 ^ 6'b100000) : s2_16 )  ;
	assign b_bs[16] = b >  (extend ? (s2_17 ^ 6'b100000) : s2_17 )  ;
	assign b_bs[17] = b >  (extend ? (s2_18 ^ 6'b100000) : s2_18 )  ;
	assign b_bs[18] = b >  (extend ? (s2_19 ^ 6'b100000) : s2_19 )  ;
	assign b_bs[19] = b >  (extend ? (s2_20 ^ 6'b100000) : s2_20 )  ;
	assign b_bs[20] = b >  (extend ? (s2_21 ^ 6'b100000) : s2_21 )  ;
	assign b_bs[21] = b >  (extend ? (s2_22 ^ 6'b100000) : s2_22 )  ;
	assign b_bs[22] = b >  (extend ? (s2_23 ^ 6'b100000) : s2_23 )  ;
	assign b_bs[23] = b >  (extend ? (s2_24 ^ 6'b100000) : s2_24 )  ;
	assign b_bs[24] = b >  (extend ? (s2_25 ^ 6'b100000) : s2_25 )  ;
	assign b_bs[25] = b >  (extend ? (s2_26 ^ 6'b100000) : s2_26 )  ;
	assign b_bs[26] = b >  (extend ? (s2_27 ^ 6'b100000) : s2_27 )  ;
	assign b_bs[27] = b >  (extend ? (s2_28 ^ 6'b100000) : s2_28 )  ;
	assign b_bs[28] = b >  (extend ? (s2_29 ^ 6'b100000) : s2_29 )  ;
	assign b_bs[29] = b >  (extend ? (s2_30 ^ 6'b100000) : s2_30 )  ;
	assign b_bs[30] = b >  (extend ? (s2_31 ^ 6'b100000) : s2_31 )  ;
	assign b_bs[31] = b >  (extend ? (s2_32 ^ 6'b100000) : s2_32 )  ;
	// assign b_bs[31] = b > (expand ? (s2_32 ^ directionVector) : s2_32) ;

	assign c = a_bs & b_bs;


endmodule
