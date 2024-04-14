module SC_Compress_dev_16_32#(parameter DATA_WIDTH=16,
	parameter STREAM_LENGTH=32,
	parameter sobolValidBitwth = 6 ,
	parameter OUT_WIDTH=32
	)(
		input [DATA_WIDTH-1:0] io_inputs_1,
		input [DATA_WIDTH-1:0] io_inputs_0,
		output [OUT_WIDTH-1 :0] mul_result
    );
	wire [3:0] a_carry;
	wire [3:0] b_carry;

	leading_zero_16 acarry(
	       .a(io_inputs_1),
	       .y(a_carry)
	 );
	 
	leading_zero_16 bcarry(
           .a(io_inputs_0),
           .y(b_carry)
     );

	wire [DATA_WIDTH-1:0]	scaled_a_in ;
	wire [DATA_WIDTH-1:0]	scaled_b_in ;
	assign	scaled_a_in = io_inputs_1 << a_carry;
	assign	scaled_b_in = io_inputs_0 << b_carry;
	wire [4:0] mul;
	Compress_16 multiplier(
		.a_in(scaled_a_in[DATA_WIDTH-1:DATA_WIDTH-sobolValidBitwth]),
		.b_in(scaled_b_in[DATA_WIDTH-1:DATA_WIDTH-sobolValidBitwth]),
		.sc_result(mul)
	);
	assign mul_result = mul << (2*DATA_WIDTH - 5 -a_carry-b_carry);

	
endmodule

module Compress_16#(parameter DATA_WIDTH=16,
	parameter STREAM_LENGTH=16,
	parameter sobolValidBitwth = 6
	)(
		input [sobolValidBitwth-1:0] a_in,
		input [sobolValidBitwth-1:0] b_in,
		output [4:0] sc_result
    );

	// Intermediate results of SNG and PC(APC)
	wire [STREAM_LENGTH-1:0] mul_result;
	wire [4:0] tmp;

	sobol_16 sobol_16(
	  	.a(a_in),
	  	.b(b_in),
		.c(mul_result)
	);
	 	

	APC_16 #(.INPUT_WIDTH(16)) APC_16_u
	(
		.APC_stream_16	(mul_result),
		.sum		(tmp)	
    );

	assign sc_result = tmp + a_in[sobolValidBitwth-1:2] + a_in[1] ;


endmodule



