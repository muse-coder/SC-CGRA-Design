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


module APC_15#(
	parameter INPUT_WIDTH=8
	)(
		// input clk,
		// input rst_n,
		// input [INPUT_WIDTH-1:0] a,
		// input [INPUT_WIDTH-1:0] b,
		input [14:0] APC_stream_15,

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

	wire	fa_1_3_a;
	wire	fa_1_3_b;
	wire	fa_1_3_cin;
	wire	fa_1_3_sum;
	wire	fa_1_3_cout;

	wire	fa_1_4_a;
	wire	fa_1_4_b;
	wire	fa_1_4_cin;
	wire	fa_1_4_sum;
	wire	fa_1_4_cout;
	
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

	wire	fa_2_3_a;
	wire	fa_2_3_b;
	wire	fa_2_3_cin;
	wire	fa_2_3_sum;
	wire	fa_2_3_cout;

	wire	fa_2_4_a;
	wire	fa_2_4_b;
	wire	fa_2_4_cin;
	wire	fa_2_4_sum;
	wire	fa_2_4_cout;


	wire	fa_3_1_a;
	wire	fa_3_1_b;
	wire	fa_3_1_cin;
	wire	fa_3_1_sum;
	wire	fa_3_1_cout;

	wire	fa_3_2_a;
	wire	fa_3_2_b;
	wire	fa_3_2_cin;
	wire	fa_3_2_sum;
	wire	fa_3_2_cout;

	wire	fa_3_3_a;
	wire	fa_3_3_b;
	wire	fa_3_3_cin;
	wire	fa_3_3_sum;
	wire	fa_3_3_cout;

	assign fa_1_1_a   =  APC_stream_15[0];
	assign fa_1_1_b   =  APC_stream_15[1];
	assign fa_1_1_cin =  APC_stream_15[2];

	assign fa_1_2_a   =  APC_stream_15[3];
	assign fa_1_2_b   =  APC_stream_15[4];
	assign fa_1_2_cin =  APC_stream_15[5];

	assign fa_1_3_a   =  APC_stream_15[7];
	assign fa_1_3_b   =  APC_stream_15[8];
	assign fa_1_3_cin =  APC_stream_15[9];

	assign fa_1_4_a   =  APC_stream_15[10];
	assign fa_1_4_b   =  APC_stream_15[11];
	assign fa_1_4_cin =  APC_stream_15[12];

	assign fa_2_1_a   =  fa_1_1_cout;
	assign fa_2_1_b   =  fa_1_2_cout;
	assign fa_2_1_cin =  fa_2_2_cout;

	assign fa_2_2_a   =  fa_1_1_sum;
	assign fa_2_2_b   =  fa_1_2_sum;
	assign fa_2_2_cin =  APC_stream_15[6];

	assign fa_2_3_a   =  fa_1_3_cout;
	assign fa_2_3_b   =  fa_1_4_cout;
	assign fa_2_3_cin =  fa_2_4_cout;

	assign fa_2_4_a   =  fa_1_3_sum;
	assign fa_2_4_b   =  fa_1_4_sum;
	assign fa_2_4_cin =  APC_stream_15[13];


	assign fa_3_1_a   =  fa_2_1_cout;
	assign fa_3_1_b   =  fa_2_3_cout;
	assign fa_3_1_cin =  fa_3_2_cout;
	
	assign fa_3_2_a   =  fa_2_1_sum;
	assign fa_3_2_b   =  fa_2_3_sum;
	assign fa_3_2_cin =  fa_3_3_cout;

	assign fa_3_3_a   =  fa_2_2_sum;
	assign fa_3_3_b   =  fa_2_4_sum;
	assign fa_3_3_cin =  APC_stream_15[14];


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

	FA fa_1_3(
		.a			(fa_1_3_a),
		.b			(fa_1_3_b),
		.cin		(fa_1_3_cin),
		.sum		(fa_1_3_sum),
		.cout		(fa_1_3_cout)
		);

	FA fa_1_4(
		.a			(fa_1_4_a),
		.b			(fa_1_4_b),
		.cin		(fa_1_4_cin),
		.sum		(fa_1_4_sum),
		.cout		(fa_1_4_cout)
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

	FA fa_2_3(
		.a			(fa_2_3_a),
		.b			(fa_2_3_b),
		.cin		(fa_2_3_cin),
		.sum		(fa_2_3_sum),
		.cout		(fa_2_3_cout)
		);

	FA fa_2_4(
		.a			(fa_2_4_a),
		.b			(fa_2_4_b),
		.cin		(fa_2_4_cin),
		.sum		(fa_2_4_sum),
		.cout		(fa_2_4_cout)
		);

	FA fa_3_1(
		.a			(fa_3_1_a),
		.b			(fa_3_1_b),
		.cin		(fa_3_1_cin),
		.sum		(fa_3_1_sum),
		.cout		(fa_3_1_cout)
		);

	FA fa_3_2(
		.a			(fa_3_2_a),
		.b			(fa_3_2_b),
		.cin		(fa_3_2_cin),
		.sum		(fa_3_2_sum),
		.cout		(fa_3_2_cout)
		);

	FA fa_3_3(
		.a			(fa_3_3_a),
		.b			(fa_3_3_b),
		.cin		(fa_3_3_cin),
		.sum		(fa_3_3_sum),
		.cout		(fa_3_3_cout)
		);

	assign sum = {fa_3_1_cout , fa_3_1_sum , fa_3_2_sum ,fa_3_3_sum} ;
	
endmodule
