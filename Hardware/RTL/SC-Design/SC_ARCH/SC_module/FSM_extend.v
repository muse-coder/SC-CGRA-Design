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


module FSM_extend#(parameter DATA_WIDTH=16,
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
	wire [OUT_WIDTH-1:0] a_bs_1;
	wire [OUT_WIDTH-1:0] a_bs_2;
	wire [OUT_WIDTH-1:0] a_bs;
	wire [OUT_WIDTH-1:0] b_bs;
	genvar i;
	generate
		for( i = 31 ; i>0;i = i- 2)begin:genX4_1
			assign a_bs_1[i] = a[5];
		end
		for( i = 30 ; i>0;i = i- 4)begin:genX3_1
			assign a_bs_1[i] = a[4];
		end
		for( i = 28 ; i>0;i = i- 8)begin:genX2_1
			assign a_bs_1[i] = a[3];
		end
		for( i = 24 ; i>0;i = i- 16)begin:genX1_1
			assign a_bs_1[i] = a[2];
		end

		assign a_bs_1[16] = a[1];
		assign a_bs_1[0] = 'b0;
	endgenerate


	generate
		for( i = 31 ; i>0;i = i- 2)begin:genX4_2
			assign a_bs_2[i] = a[5];
		end
		for( i = 30 ; i>0;i = i- 4)begin:genX3_2
			assign a_bs_2[i] = a[4];
		end
		for( i = 28 ; i>0;i = i- 8)begin:genX2_2
			assign a_bs_2[i] = a[3];
		end
		for( i = 24 ; i>0;i = i- 16)begin:genX1_2
			assign a_bs_2[i] = a[2];
		end

		assign a_bs_2[16] = a[1];
		assign a_bs_2[0] = 'b0;
	endgenerate

	assign a_bs = extend? a_bs_1 : a_bs_2 ;


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
