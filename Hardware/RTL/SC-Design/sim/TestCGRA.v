`timescale 1ns / 1ps

module TestCGRA (

);
    parameter cycle = 10;
    reg clk;
    reg rst;

	// reg [11:0]	DataSelect;
	// reg [21:0] ContextRegister;
    // wire [31:0] res;

  reg  [21:0] io_PErowConfig_0;
  reg  [21:0] io_PErowConfig_1;
  reg  [21:0] io_PErowConfig_2;
  reg  [21:0] io_PErowConfig_3;
  reg  [31:0] io_dataMemoryIn_0;
  reg  [31:0] io_dataMemoryIn_1;
  reg  [31:0] io_dataMemoryIn_2;
  reg  [31:0] io_dataMemoryIn_3;
  reg  [31:0] io_ArrayInRight_0;
  reg  [31:0] io_ArrayInRight_1;
  reg  [31:0] io_ArrayInRight_2;
  reg  [31:0] io_ArrayInRight_3;
  reg  [31:0] io_ArrayInDown_0;
  reg  [31:0] io_ArrayInDown_1;
  reg  [31:0] io_ArrayInDown_2;
  reg  [31:0] io_ArrayInDown_3;
  reg  [31:0] io_ArrayInUp_0;
  reg  [31:0] io_ArrayInUp_1;
  reg  [31:0] io_ArrayInUp_2;
  reg  [31:0] io_ArrayInUp_3;
  wire [31:0] io_ArrayOutDown_0;
  wire [31:0] io_ArrayOutDown_1;
  wire [31:0] io_ArrayOutDown_2;
  wire [31:0] io_ArrayOutDown_3;
  wire [31:0] io_ArrayOutUp_0;
  wire [31:0] io_ArrayOutUp_1;
  wire [31:0] io_ArrayOutUp_2;
  wire [31:0] io_ArrayOutUp_3;
  wire [31:0] io_ArrayOutLeft_0;
  wire [31:0] io_ArrayOutLeft_1;
  wire [31:0] io_ArrayOutLeft_2;
  wire [31:0] io_ArrayOutLeft_3;
  wire [31:0] io_ArrayOutRight_0;
  wire [31:0] io_ArrayOutRight_1;
  wire [31:0] io_ArrayOutRight_2;
  wire [31:0] io_ArrayOutRight_3;


    always  #(cycle/2)  clk = ~ clk;
    initial begin
		clk = 'b1;
		repeat(1)begin
			ConfigInit;		
		end
		$dumpfile("_4x4_.vcd");
		$dumpvars;
		$dumpon;
		
        repeat (20) begin
			repeat (10)begin
	        #10    MUL_test;
    	    end
			ConfigInit;
		end
		$dumpoff;
    end



	_4x4_ _4x4_(
  		.clock	(clk),
  		.reset	(rst),
  		.io_PErowConfig_0		(io_PErowConfig_0),
  		.io_PErowConfig_1		(io_PErowConfig_1),
  		.io_PErowConfig_2		(io_PErowConfig_2),
  		.io_PErowConfig_3		(io_PErowConfig_3),
  		.io_dataMemoryIn_0		(io_dataMemoryIn_0),
  		.io_dataMemoryIn_1		(io_dataMemoryIn_1),
  		.io_dataMemoryIn_2		(io_dataMemoryIn_2),
  		.io_dataMemoryIn_3		(io_dataMemoryIn_3),
  		.io_ArrayInRight_0		(io_ArrayInRight_0),
  		.io_ArrayInRight_1		(io_ArrayInRight_1),
  		.io_ArrayInRight_2		(io_ArrayInRight_2),
  		.io_ArrayInRight_3		(io_ArrayInRight_3),
  		.io_ArrayInDown_0		(io_ArrayInDown_0),
  		.io_ArrayInDown_1		(io_ArrayInDown_1),
  		.io_ArrayInDown_2		(io_ArrayInDown_2),
  		.io_ArrayInDown_3		(io_ArrayInDown_3),
  		.io_ArrayInUp_0		(io_ArrayInUp_0),
  		.io_ArrayInUp_1		(io_ArrayInUp_1),
  		.io_ArrayInUp_2		(io_ArrayInUp_2),
  		.io_ArrayInUp_3		(io_ArrayInUp_3),
  		.io_ArrayOutDown_0		(io_ArrayOutDown_0),
  		.io_ArrayOutDown_1		(io_ArrayOutDown_1),
  		.io_ArrayOutDown_2		(io_ArrayOutDown_2),
  		.io_ArrayOutDown_3		(io_ArrayOutDown_3),
  		.io_ArrayOutUp_0		(io_ArrayOutUp_0),
  		.io_ArrayOutUp_1		(io_ArrayOutUp_1),
  		.io_ArrayOutUp_2		(io_ArrayOutUp_2),
  		.io_ArrayOutUp_3		(io_ArrayOutUp_3),
  		.io_ArrayOutLeft_0		(io_ArrayOutLeft_0),
  		.io_ArrayOutLeft_1		(io_ArrayOutLeft_1),
  		.io_ArrayOutLeft_2		(io_ArrayOutLeft_2),
  		.io_ArrayOutLeft_3		(io_ArrayOutLeft_3),
  		.io_ArrayOutRight_0		(io_ArrayOutRight_0),
  		.io_ArrayOutRight_1		(io_ArrayOutRight_1),
  		.io_ArrayOutRight_2		(io_ArrayOutRight_2),
  		.io_ArrayOutRight_3		(io_ArrayOutRight_3)
	);


	task  ConfigInit;
		begin
	        // clk = 1'b1;
        	rst = 1'b1;
		    #10 rst = 1'b0;
		end 
	    
	endtask //automatic


    task MUL_test;
	
        @(posedge clk)begin
			//第一行  左 上 作为输入 所有输出都为 乘法结果
			io_PErowConfig_0 [3:0] <='b0110;
			io_PErowConfig_0 [7:4] <='b0010;
			io_PErowConfig_0 [11:8] <='b0111;
            io_PErowConfig_0 [15:12] <= 'b1111;
			io_PErowConfig_0 [21:16]<='b111111;
			//第二行 左 寄存器 作为输入 所有输出都为乘法结果 
			io_PErowConfig_1 [3:0] <='b0110;
			io_PErowConfig_1 [7:4] <='b0010;
			io_PErowConfig_1 [11:8] <='b0111;
            io_PErowConfig_1 [15:12] <= 'b1111;
			io_PErowConfig_1 [21:16]<='b111111;
			
			//第三行  左 寄存器 作为输入 所有输出都为 乘法结果
			io_PErowConfig_2 [3:0] <='b0110;
			io_PErowConfig_2 [7:4] <='b0010;
			io_PErowConfig_2 [11:8] <='b0111;
            io_PErowConfig_2 [15:12] <= 'b1111;
			io_PErowConfig_2 [21:16]<='b111111;

			io_PErowConfig_3 [3:0] <='b0110;
			io_PErowConfig_3 [7:4] <='b0010;
			io_PErowConfig_3 [11:8] <='b0111;
            io_PErowConfig_3 [15:12] <= 'b1111;
			io_PErowConfig_3 [21:16]<='b111111;

        end
    endtask

	always@(posedge clk) begin
		if(rst) begin
  			io_PErowConfig_0	<= 'b0;
  			io_PErowConfig_1	<= 'b0;
  			io_PErowConfig_2	<= 'b0;
  			io_PErowConfig_3	<= 'b0;
			// $urandom_seed(0);
  			io_dataMemoryIn_0	<= ({$random} %20)+1'b1;
  			io_dataMemoryIn_1	<= ({$random} %20)+1'b1;
  			io_dataMemoryIn_2	<= ({$random} %20)+1'b1;
  			io_dataMemoryIn_3	<= ({$random} %20)+1'b1;
  			io_ArrayInRight_0	<= ({$random} %20)+1'b1;
  			io_ArrayInRight_1	<= ({$random} %20)+1'b1;
  			io_ArrayInRight_2	<= ({$random} %20)+1'b1;
  			io_ArrayInRight_3	<= ({$random} %20)+1'b1;
  			io_ArrayInDown_0	<= ({$random} %20)+1'b1;
  			io_ArrayInDown_1	<= ({$random} %20)+1'b1;
  			io_ArrayInDown_2	<= ({$random} %20)+1'b1;
  			io_ArrayInDown_3	<= ({$random} %20)+1'b1;
  			io_ArrayInUp_0	<= ({$random} %20)+1'b1;
  			io_ArrayInUp_1	<= ({$random} %20)+1'b1;
  			io_ArrayInUp_2	<= ({$random} %20)+1'b1;
  			io_ArrayInUp_3	<= ({$random} %20)+1'b1;
        end
		
		else  begin

  			io_dataMemoryIn_0	<= io_dataMemoryIn_0 +'b0;
  			io_dataMemoryIn_1	<= io_dataMemoryIn_1 +'b0;
  			io_dataMemoryIn_2	<= io_dataMemoryIn_2 +'b0;
  			io_dataMemoryIn_3	<= io_dataMemoryIn_3 +'b0;
  			io_ArrayInRight_0	<= io_ArrayInRight_0 +'b0;
  			io_ArrayInRight_1	<= io_ArrayInRight_1 +'b0;
  			io_ArrayInRight_2	<= io_ArrayInRight_2 +'b0;
  			io_ArrayInRight_3	<= io_ArrayInRight_3 +'b0;
  			io_ArrayInDown_0	<= io_ArrayInDown_0 +'b0;
  			io_ArrayInDown_1	<= io_ArrayInDown_1 +'b0;
  			io_ArrayInDown_2	<= io_ArrayInDown_2 +'b0;
  			io_ArrayInDown_3	<= io_ArrayInDown_3 +'b0;
  			io_ArrayInUp_0	<= io_ArrayInUp_0 +'b0;
  			io_ArrayInUp_1	<= io_ArrayInUp_1 +'b0;
  			io_ArrayInUp_2	<= io_ArrayInUp_2 +'b0;
  			io_ArrayInUp_3	<= io_ArrayInUp_3 +'b0;
		end
	end

endmodule