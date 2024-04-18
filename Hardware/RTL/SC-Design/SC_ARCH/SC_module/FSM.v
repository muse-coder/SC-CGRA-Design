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


module FSM#(parameter DATA_WIDTH=16,
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
	genvar i;
	generate
		for( i = 31 ; i>0;i = i- 2)begin:genX4
			assign a_bs[i] = a[5];
		end
		for( i = 30 ; i>0;i = i- 4)begin:genX3
			assign a_bs[i] = a[4];
		end
		for( i = 28 ; i>0;i = i- 8)begin:genX2
			assign a_bs[i] = a[3];
		end
		for( i = 24 ; i>0;i = i- 16)begin:genX1
			assign a_bs[i] = a[2];
		end

		assign a_bs[16] = a[1];
		assign a_bs[0] = 'b0;
	endgenerate


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
