module SC_Mul_16_FSM_top#(parameter DATA_WIDTH=16,
	parameter STREAM_LENGTH=32,
	parameter ValidBitwth = 6 ,
	parameter OUT_WIDTH=DATA_WIDTH<<1
	)(
		input [DATA_WIDTH-1:0] io_inputs_a,
		input [DATA_WIDTH-1:0] io_inputs_b,
		output [OUT_WIDTH-1 :0] mul_result
    );
	wire [3:0] a_carry;
	wire [3:0] b_carry;

	leading_zero_16 acarry(
	       .a(io_inputs_a),
	       .y(a_carry)
	 );
	 
	leading_zero_16 bcarry(
           .a(io_inputs_b),
           .y(b_carry)
     );

	wire [DATA_WIDTH-1:0]	scaled_a_in ;
	wire [DATA_WIDTH-1:0]	scaled_b_in ;
	assign	scaled_a_in = io_inputs_a << a_carry;
	assign	scaled_b_in = io_inputs_b << b_carry;
	wire [5:0] mul;
	SC_Mul_16_FSM multiplier(
		.a_in(scaled_a_in[DATA_WIDTH-1:DATA_WIDTH-ValidBitwth]),
		.b_in(scaled_b_in[DATA_WIDTH-1:DATA_WIDTH-ValidBitwth]),
		.sc_result(mul)
	);
	assign mul_result = mul << (2*DATA_WIDTH - 5 -a_carry-b_carry);
endmodule