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


module APC_31(
		input [30:0]  	APC_stream_31,
		output [4:0] APC_31_sum	
    );

	wire [3:0] apc_1_sum;
	wire [3:0] apc_2_sum;
	wire	fa_4_1_in_a;
	wire	fa_4_1_in_b;
	wire	fa_4_1_in_c;
	wire	fa_4_1_sum;
	wire	fa_4_1_cout;
	 
	wire	fa_4_2_in_a;
	wire	fa_4_2_in_b;
	wire	fa_4_2_in_c;
	wire	fa_4_2_sum;
	wire	fa_4_2_cout;

	wire	fa_4_3_in_a;
	wire	fa_4_3_in_b;
	wire	fa_4_3_in_c;
	wire	fa_4_3_sum;
	wire	fa_4_3_cout;

	wire	fa_4_4_in_a;
	wire	fa_4_4_in_b;
	wire	fa_4_4_in_c;
	wire	fa_4_4_sum;
	wire	fa_4_4_cout;

	assign  fa_4_1_in_a = apc_1_sum[3] ; 
	assign  fa_4_1_in_b = apc_2_sum[3] ; 
	assign  fa_4_1_in_c = fa_4_2_cout; 
	
	assign  fa_4_2_in_a = apc_1_sum[2] ; 
	assign  fa_4_2_in_b = apc_2_sum[2] ; 
	assign  fa_4_2_in_c = fa_4_3_cout; 

	assign  fa_4_3_in_a =  apc_1_sum[1] ; 
	assign  fa_4_3_in_b =  apc_2_sum[1] ; 
	assign  fa_4_3_in_c = fa_4_4_cout; 

	assign  fa_4_4_in_a =  apc_1_sum[0] ; 
	assign  fa_4_4_in_b =  apc_2_sum[0] ; 
	assign  fa_4_4_in_c =  APC_stream_31[30]; 

	assign  APC_31_sum = {fa_4_1_cout ,fa_4_1_sum ,fa_4_2_sum ,fa_4_3_sum ,fa_4_4_sum};
	APC_15 apc_1(
		.APC_stream_15	(APC_stream_31[14:0]),
		.sum			(apc_1_sum)
	);


 	APC_15 apc_2(
		.APC_stream_15	(APC_stream_31[29:15]),
		.sum			(apc_2_sum)
	);


	FA fa_4_1(

		.a		(fa_4_1_in_a),
		.b		(fa_4_1_in_b),
		.cin	(fa_4_1_in_c),
		.sum	(fa_4_1_sum),
		.cout	(fa_4_1_cout)
		);

	FA fa_4_2(

		.a		(fa_4_2_in_a),
		.b		(fa_4_2_in_b),
		.cin	(fa_4_2_in_c),
		.sum	(fa_4_2_sum),
		.cout	(fa_4_2_cout)
		);

	FA fa_4_3(

		.a		(fa_4_3_in_a),
		.b		(fa_4_3_in_b),
		.cin	(fa_4_3_in_c),
		.sum	(fa_4_3_sum),
		.cout	(fa_4_3_cout)
		);

	FA fa_4_4(

		.a		(fa_4_4_in_a),
		.b		(fa_4_4_in_b),
		.cin	(fa_4_4_in_c),
		.sum	(fa_4_4_sum),
		.cout	(fa_4_4_cout)
		);

endmodule
