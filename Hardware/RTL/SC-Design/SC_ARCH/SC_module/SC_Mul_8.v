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


module SC_Mul_8#(parameter DATA_WIDTH=8,
	parameter STREAM_LENGTH=16,
	parameter sobolValidBitwth = 5
	)(
		input [sobolValidBitwth-1:0] a_in,
		input [sobolValidBitwth-1:0] b_in,
		output [4:0] sc_result

    );

	// Intermediate results of SNG and PC(APC)
	wire [STREAM_LENGTH-1:0] and_result;


	sobol_16 #(
	.DATA_WIDTH(DATA_WIDTH),
	.OUT_WIDTH(STREAM_LENGTH)
	) sobol_16_u (
	  	.a(a_in),
	  	.b(b_in),
		.c(and_result)
	);
	 	
	wire[3:0] partialSum ;
	APC_15	APC_adder_15_u(
		.APC_stream_15	(and_result[15:1]),
		.sum		(partialSum)	
    );
	assign sc_result = partialSum +1'b1;


endmodule
