`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/30 10:15:42
// Design Name: 
// Module Name: APC
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


module APC_8#(
	parameter INPUT_WIDTH=8
	)(
		// input clk,
		// input rst_n,
		// input [INPUT_WIDTH-1:0] a,
		// input [INPUT_WIDTH-1:0] b,
		input [7:0] APC_stream_8,

		// input mode,//0->APC 1->adder
		output [INPUT_WIDTH/2-1:0] sum
    
	);


	wire	fa_1_1_a;
	wire	fa_1_1_b;
	wire	fa_1_1_cin;
	wire	fa_1_1_sum;
	wire	fa_1_1_cout;

	wire	fa_1_2_a;
	wire	fa_1_2_b;
	wire	fa_1_2_cin;
	wire	fa_1_2_sum;
	wire	fa_1_2_cout;

	
	wire	fa_2_1_a;
	wire	fa_2_1_b;
	wire	fa_2_1_cin;
	wire	fa_2_1_sum;
	wire	fa_2_1_cout;

	wire	fa_2_2_a;
	wire	fa_2_2_b;
	wire	fa_2_2_cin;
	wire	fa_2_2_sum;
	wire	fa_2_2_cout;


	assign fa_1_1_a   =  APC_stream_8[0];
	assign fa_1_1_b   =  APC_stream_8[1];
	assign fa_1_1_cin =  APC_stream_8[2];

	assign fa_1_2_a   =  APC_stream_8[3];
	assign fa_1_2_b   =  APC_stream_8[4];
	assign fa_1_2_cin =  APC_stream_8[5];



	assign fa_2_1_a   =  fa_1_1_cout;
	assign fa_2_1_b   =  fa_1_2_cout;
	assign fa_2_1_cin =  fa_2_2_cout;

	assign fa_2_2_a   =  fa_1_1_sum;
	assign fa_2_2_b   =  fa_1_2_sum;
	assign fa_2_2_cin =  APC_stream_8[6];





	FA fa_1_1(
		.a			(fa_1_1_a),
		.b			(fa_1_1_b),
		.cin		(fa_1_1_cin),
		.sum		(fa_1_1_sum),
		.cout		(fa_1_1_cout)
		);

	FA fa_1_2(
		.a			(fa_1_2_a),
		.b			(fa_1_2_b),
		.cin		(fa_1_2_cin),
		.sum		(fa_1_2_sum),
		.cout		(fa_1_2_cout)
		);


	FA fa_2_1(
		.a			(fa_2_1_a),
		.b			(fa_2_1_b),
		.cin		(fa_2_1_cin),
		.sum		(fa_2_1_sum),
		.cout		(fa_2_1_cout)
		);

	FA fa_2_2(
		.a			(fa_2_2_a),
		.b			(fa_2_2_b),
		.cin		(fa_2_2_cin),
		.sum		(fa_2_2_sum),
		.cout		(fa_2_2_cout)
		);

	assign sum = {fa_2_1_cout , fa_2_1_sum , fa_2_2_sum} + APC_stream_8[7] ;
	
endmodule
