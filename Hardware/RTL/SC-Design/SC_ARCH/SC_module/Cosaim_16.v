module CosaimTop_16_top#(parameter DATA_WIDTH=16
	// parameter STREAM_LENGTH=32,
	)(
		input [DATA_WIDTH-1:0] io_inputs_a,
		input [DATA_WIDTH-1:0] io_inputs_b,
		output [DATA_WIDTH*2-1 :0] mul_result
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
	wire [4:0] shiftNum;
	assign	scaled_a_in = io_inputs_a << a_carry;
	assign	scaled_b_in = io_inputs_b << b_carry;
	assign  shiftNum 	= a_carry + b_carry;
	wire [DATA_WIDTH*2-1:0] expandedResult;

	CosaimKernel_16  #(.DATA_WIDTH(DATA_WIDTH)
	) CosaimKernelIns
	(
		.X(scaled_a_in),
		.W(scaled_b_in),
		.mul_result(expandedResult)
    );


	assign mul_result = expandedResult>> shiftNum;

endmodule


module CosaimKernel_16#(parameter DATA_WIDTH=16
	)(
		input [DATA_WIDTH-1:0] X,
		input [DATA_WIDTH-1:0] W,
		output [DATA_WIDTH*2-1 :0] mul_result
    );

	wire [DATA_WIDTH-1:0] X_Time 	[DATA_WIDTH-1:0] ; 
	wire [DATA_WIDTH-1:0] X_Value 	[DATA_WIDTH-1:0] ;
	wire [DATA_WIDTH-1:0] temp		[DATA_WIDTH-1:0] ;
	wire [DATA_WIDTH-1:0] temp2		[DATA_WIDTH-1:0] ;

	genvar i;
	generate

		for (i =0 ; i < DATA_WIDTH ; i = i + 1) begin : genTime
			assign temp[i] = {{(DATA_WIDTH-1){1'b0}} , W[DATA_WIDTH-i-1:DATA_WIDTH-i-1]};
			assign temp2[i] =  W>>(DATA_WIDTH-i)  ; 
	
			assign X_Time[i] = temp[i] + temp2[i]  ; 
		end

		for (i =0 ; i <DATA_WIDTH ; i = i + 1) begin : genValue
			assign X_Value[i] = {(DATA_WIDTH){X[i]}} & X_Time[i]; 
		end
	
	endgenerate

	wire [DATA_WIDTH*2-1:0] subMul_result [14:0]; 
	assign subMul_result[0]  = X_Value[0] + X_Value[1] ; 
	assign subMul_result[1]  = X_Value[2] + X_Value[3] ;
	assign subMul_result[2]  = X_Value[4] + X_Value[5] ;
	assign subMul_result[3]  = X_Value[6] + X_Value[7] ;
	assign subMul_result[4]  = X_Value[8] + X_Value[9] ;
	assign subMul_result[5]  = X_Value[10] + X_Value[11] ;
	assign subMul_result[6]  = X_Value[12] + X_Value[13] ;
	assign subMul_result[7]  = X_Value[14] + X_Value[15] ;

	assign subMul_result[8]  = subMul_result[0] + subMul_result[1] ;
	assign subMul_result[9]  = subMul_result[2] + subMul_result[3] ;
	assign subMul_result[10] = subMul_result[4] + subMul_result[5] ;
	assign subMul_result[11] = subMul_result[6] + subMul_result[7] ;
	
	assign subMul_result[12] = subMul_result[8] + subMul_result[9] ;
	assign subMul_result[13] = subMul_result[10] + subMul_result[11] ;
	assign subMul_result[14] = subMul_result[12] + subMul_result[13] ;
	
	assign mul_result = (subMul_result[14])<<DATA_WIDTH ;

endmodule