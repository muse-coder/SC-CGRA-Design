`timescale 1ns / 1ps

module simTest (

);
	parameter DATA_WIDTH =8;
    parameter cycle = 10;
    reg clk;
    reg rst;
    reg [DATA_WIDTH -1 :0] io_inputs_a; // a
    reg [DATA_WIDTH -1 :0] io_inputs_b;  // b
    // wire [(DATA_WIDTH<<1) - 1:0] mul_result_1;  // b
	// wire [(DATA_WIDTH<<1) - 1:0] mul_result_2;  // b
	wire [(DATA_WIDTH<<1) - 1:0] mul_result;  

    always  #(cycle/2)  clk = ~ clk;
    integer i;
    initial begin
        clk = 1'b1;
        rst = 1'b1;
    #10 rst = 1'b0;
        repeat (100000 )begin
        #10    MUL_test;
        // #10    add;
        // #10    sub;
        end
    end

	Mul #(
		.DATA_WIDTH(8),
		.OUT_WIDTH(16)
	)
	Mul_u	(
	    .io_inputs_1(io_inputs_a), // a
        .io_inputs_0(io_inputs_b),  // b
        .io_outs_0(mul_result)
    );

 	//  SC_Mul_8_top #(
	//  	.DATA_WIDTH(8),
	//  	.STREAM_LENGTH(16),
	//  	.ValidBitwth(5)
	//  ) SC_Mul_top (
	//  	.io_inputs_a	(io_inputs_a),
	//  	.io_inputs_b	(io_inputs_b),
	//  	.mul_result	(mul_result_1)
    //  );
	// SC_Compress_dev_8_16#(
	// 	.DATA_WIDTH(8),
	// 	.STREAM_LENGTH(8),
	// 	.sobolValidBitwth(5)
	// )SC_Compress_dev_8_16_u(
	// 	.io_inputs_a(io_inputs_a),
	// 	.io_inputs_b(io_inputs_b),
	// 	.mul_result(mul_result_2)
    // );

	// SC_Mul_16_FSM_top SC_Mul_16_top (
	// 	.io_inputs_a(io_inputs_a),
	// 	.io_inputs_b(io_inputs_b),
	// 	.mul_result(mul_result)
	// );

// 	CosaimTop_16_top #(
// 		.DATA_WIDTH(DATA_WIDTH)
// 	) CosaimTop_16_top_u
// 	(
// 		.io_inputs_a(io_inputs_a),
// 		.io_inputs_b(io_inputs_b),
// 		.mul_result(mul_result)
//    );
    task MUL_test;
        @(posedge clk)begin
            io_inputs_a <=io_inputs_a + 8'd3;
            io_inputs_b <=io_inputs_b + 8'd3;
        end
    endtask

	always@(posedge clk) begin
		if(rst) begin
            io_inputs_a <='d11;
            io_inputs_b <='d12;			
		end
	end

endmodule