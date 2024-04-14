`timescale 1ns / 1ps

module simTest (

);
	parameter DATA_WIDTH =8;
    parameter cycle = 10;
    reg clk;
    reg rst;
    reg [DATA_WIDTH -1 :0] io_inputs_a; // a
    reg [DATA_WIDTH -1 :0] io_inputs_b;  // b
    wire [(DATA_WIDTH<<1) - 1:0] mul_result;  // b


    always  #(cycle/2)  clk = ~ clk;
    integer i;
    initial begin
        clk = 1'b1;
        rst = 1'b1;
    #10 rst = 1'b0;
        repeat (10000 )begin
        #10    MUL_test;
        // #10    add;
        // #10    sub;
        end
    end

 	// DeBAM_top DeBAM_top(
    // 	.A(io_inputs_a),
    // 	.B(io_inputs_b),
	// 	.PRODUCT(mul_result)
	// 	);

	top DRUMTOP  (
   	.a(io_inputs_a),
   	.b(io_inputs_b),
   	.result(mul_result));


 	// SC_Mul_8_top #(
	// 	.DATA_WIDTH(8),
	// 	.STREAM_LENGTH(16),
	// 	.ValidBitwth(5)
	// ) SC_Mul_top (
	// 	.io_inputs_a	(io_inputs_a),
	// 	.io_inputs_b	(io_inputs_b),
	// 	.mul_result	(mul_result)
    // );

	// SC_Mul_16_top SC_Mul_16_top (
	// 	.io_inputs_a(io_inputs_a),
	// 	.io_inputs_b(io_inputs_b),
	// 	.mul_result(mul_result)
	// );

	// CosaimTop_16_top #(
	// 	.DATA_WIDTH(DATA_WIDTH)
	// ) CosaimTop_16_top_u
	// (
	// 	.io_inputs_a(io_inputs_a),
	// 	.io_inputs_b(io_inputs_b),
	// 	.mul_result(mul_result)
    // );
    task MUL_test;
        @(posedge clk)begin
            io_inputs_a <=io_inputs_a + 8'd1;
            io_inputs_b <=io_inputs_b + 8'd1;
        end
    endtask

	always@(posedge clk) begin
		if(rst) begin
            io_inputs_a <='d11;
            io_inputs_b <='d12;			
		end
	end

endmodule