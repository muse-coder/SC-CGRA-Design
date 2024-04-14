module Cosaim_8_Top#(parameter DATA_WIDTH=8
	// parameter STREAM_LENGTH=32,
	)(
		input [DATA_WIDTH-1:0] io_inputs_1,
		input [DATA_WIDTH-1:0] io_inputs_0,
		output [DATA_WIDTH*2-1 :0] mul_result
    );
	wire [2:0] a_carry;
	wire [2:0] b_carry;

	leading_zero_8 acarry(
	       .a(io_inputs_1),
	       .y(a_carry)
	 );
	 
	leading_zero_8 bcarry(
           .a(io_inputs_0),
           .y(b_carry)
     );

	wire [DATA_WIDTH-1:0]	scaled_a_in ;
	wire [DATA_WIDTH-1:0]	scaled_b_in ;
	assign	scaled_a_in = io_inputs_1 << a_carry;
	assign	scaled_b_in = io_inputs_0 << b_carry;

	wire [DATA_WIDTH*2-1:0] expandedResult;

	CosaimKernel  #(.DATA_WIDTH(DATA_WIDTH)
	) CosaimKernelIns
	(
		.X(scaled_a_in[7:0]),
		.W(scaled_b_in[7:0]),
		.mul_result(expandedResult)
    );


	assign mul_result = expandedResult>>(a_carry+b_carry);

endmodule


module CosaimKernel#(parameter DATA_WIDTH=8
	)(
		input [DATA_WIDTH-1:0] X,
		input [DATA_WIDTH-1:0] W,
		output [DATA_WIDTH*2-1 :0] mul_result
    );

	wire [7:0] X_Time [7:0]  ; 
	wire [7:0] X_Value [7:0] ;
	wire [7:0] temp[7:0];
	wire [7:0] temp2[7:0];
	genvar i;
	generate

		for (i =0 ; i <8 ; i = i + 1) begin : genTime
			assign temp[i] =  W[DATA_WIDTH-i-1:DATA_WIDTH-i-1];
			assign temp2[i] =  W>>(DATA_WIDTH-i)  ; 
	
			assign X_Time[i] = temp[i] + temp2[i]  ; 
		end

		for (i =0 ; i <8 ; i = i + 1) begin : genValue
			assign X_Value[i] = {8{X[i]}} & X_Time[i]; 
		end
	
	endgenerate

	wire [15:0] subMul_result [5:0]; 
	assign subMul_result[0] = X_Value[0] + X_Value[1] ; 
	assign subMul_result[1] = X_Value[2] + X_Value[3] ;
	assign subMul_result[2] = X_Value[4] + X_Value[5] ;
	assign subMul_result[3] = X_Value[6] + X_Value[7] ;
	
	assign subMul_result[4] = subMul_result[0] + subMul_result[1] ;
	assign subMul_result[5] = subMul_result[2] + subMul_result[3] ;
	
	assign mul_result = (subMul_result[4] + subMul_result[5])<<DATA_WIDTH ;
	

endmodule