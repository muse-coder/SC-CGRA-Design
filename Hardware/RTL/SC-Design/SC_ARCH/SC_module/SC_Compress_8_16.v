module SC_Compress_dev_8_16#(parameter DATA_WIDTH=8,
	parameter STREAM_LENGTH=8,
	parameter sobolValidBitwth = 5 ,
	parameter OUT_WIDTH=DATA_WIDTH<<1
	)(
		input [DATA_WIDTH-1:0] io_inputs_a,
		input [DATA_WIDTH-1:0] io_inputs_b,
		output [OUT_WIDTH-1 :0] mul_result
    );
	wire [2:0] a_carry;
	wire [2:0] b_carry;

	leading_zero_8 acarry(
	       .a(io_inputs_a),
	       .y(a_carry)
	 );
	 
	leading_zero_8 bcarry(
           .a(io_inputs_b),
           .y(b_carry)
     );

	wire [DATA_WIDTH-1:0]	scaled_a_in ;
	wire [DATA_WIDTH-1:0]	scaled_b_in ;
	assign	scaled_a_in = io_inputs_a << a_carry;
	assign	scaled_b_in = io_inputs_b << b_carry;
	wire [4:0] mul;
	Compress_8 multiplier(
		.a_in(scaled_a_in[DATA_WIDTH-1:DATA_WIDTH-sobolValidBitwth]),
		.b_in(scaled_b_in[DATA_WIDTH-1:DATA_WIDTH-sobolValidBitwth]),
		.sc_result(mul)
	);
	assign mul_result = mul << (2*DATA_WIDTH - 4 -a_carry-b_carry);

	
endmodule

module Compress_8#(parameter DATA_WIDTH=8,
	parameter STREAM_LENGTH=16,
	parameter sobolValidBitwth = 5
	)(
		input [sobolValidBitwth-1:0] a_in,
		input [sobolValidBitwth-1:0] b_in,
		output [4:0] sc_result
    );

	// Intermediate results of SNG and PC(APC)
	wire [3:0] half_1;
	wire [3:0] half_2;
	wire [(STREAM_LENGTH>>1)-1:0] subBitstream;
	wire [sobolValidBitwth:0] quantedA_tmp  = (a_in + 1'b1 ); 
	wire [4:0] quantedA = (quantedA_tmp>>1); 
	assign half_1 = quantedA[4:1] + quantedA[0];
	sobol_8 sobol_8_u(
	  	.a(a_in),
	  	.b(b_in),
		.c(subBitstream)
	);
	 	

	APC_8 #(.INPUT_WIDTH(8)) APC_8_u
	(
		.APC_stream_8	(subBitstream),
		.sum		(half_2)	
    );

	assign sc_result =  half_1 +  half_2 ;


endmodule



