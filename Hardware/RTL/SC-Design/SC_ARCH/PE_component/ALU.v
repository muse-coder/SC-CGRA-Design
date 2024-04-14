`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/06 15:53:49
// Design Name: 
// Module Name: ALU
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


module ALU#(parameter DATA_WIDTH=32,
	parameter STREAM_LENGTH=32,
	// parameter CONFIG_WIDTH=16,
	parameter	sobolValidBitwth = 6,
	parameter OUT_WIDTH=32
	)(
		input io_en,
        input [DATA_WIDTH-1:0] io_inputs_a, // a
        input [DATA_WIDTH-1:0] io_inputs_b,  // b
        input [3:0]  io_configuration,
        output [OUT_WIDTH-1:0] io_outs_0

    );
	wire [OUT_WIDTH-1:0] c;
	assign io_outs_0 = io_en ? c : 32'd0;



	wire [5:0] shamt;
	assign shamt = io_inputs_b[5:0];
	wire	[OUT_WIDTH-1 :0] mul_result;
	assign c = io_configuration == 4'b0000 ? io_inputs_a + io_inputs_b:
			   io_configuration == 4'b0001 ? io_inputs_b - io_inputs_a:
			   io_configuration == 4'b0011 ? io_inputs_a << shamt :
			   io_configuration == 4'b0010 ? io_inputs_a >> shamt :
			   io_configuration == 4'b0100 ? io_inputs_a & io_inputs_b :
			   io_configuration == 4'b0101 ? io_inputs_a ^ io_inputs_b :
			   io_configuration == 4'b0110 ? io_inputs_a | io_inputs_b :
			   
			   io_configuration == 4'b1010 ? io_inputs_a >>> shamt :
			   io_configuration[3:1] == 3'b111 ? mul_result : 'b0;
		// The first three bits are regarded as OP codes
	
	SC_Mul_16_top	SC_Mul_u(
		.io_inputs_b			(io_inputs_b[15:0]),
		.io_inputs_a			(io_inputs_a[15:0]),
		.mul_result				(mul_result)
	) ;


endmodule
