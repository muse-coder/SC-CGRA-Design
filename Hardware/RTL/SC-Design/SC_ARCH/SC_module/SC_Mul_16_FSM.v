`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/06 16:22:25
// Design Name: 
// Module Name: SC_Mul
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


module SC_Mul_16_FSM#(parameter DATA_WIDTH=16,
	parameter STREAM_LENGTH=32,
	parameter sobolValidBitwth = 6
	)(
		input [sobolValidBitwth-1:0] a_in,
		input [sobolValidBitwth-1:0] b_in,
		output [5:0] sc_result

    );

	// Intermediate results of SNG and PC(APC)
	wire [STREAM_LENGTH-1:0] and_result;


	FSM #(
	.DATA_WIDTH(DATA_WIDTH),
	.OUT_WIDTH(STREAM_LENGTH)
	) SNG_u (
	  	.a(a_in),
	  	.b(b_in),
		.c(and_result)
	);
	 	
	wire[4:0] partialSum ;
	APC_31	APC_adder_31_u(
		.APC_stream_31	(and_result[STREAM_LENGTH-1:1]),
		.APC_31_sum		(partialSum)	
    );
	assign sc_result = partialSum +1'b1;


endmodule
