`timescale 1ns / 1ps

module TestPE (

);
    parameter cycle = 10;
    reg clk;
    reg rst;

	reg [11:0]	DataSelect;
	reg [21:0] ContextRegister;
    // wire [31:0] res;

	reg [31:0] din_up;
	reg [31:0] din_down;
	reg [31:0] din_left;
	reg [31:0] din_right;
	reg [31:0] din_bypass_1;
	reg [31:0] din_bypass_2;

	wire [31:0] dout_up;
	wire [31:0] dout_down;
	wire [31:0] dout_left;
	wire [31:0] dout_right;
	wire [31:0] dout_bypass_1;
	wire [31:0] dout_bypass_2;


    always  #(cycle/2)  clk = ~ clk;
    integer i;
    initial begin
		repeat(5)begin
			ConfigInit;		
		end
        repeat (20 )begin
        #10    MUL_test;
        end
    end

 	PE_6_bus PE_6_bus(
		// input io_en,
		.clk(clk),
		.rst(rst),
		.din_up	(din_up),
		.din_down	(din_down),
		.din_left	(din_left),
		.din_right	(din_right),
		.din_bypass_1	(din_bypass_1),
		.din_bypass_2	(din_bypass_2),
		.configuration	(ContextRegister),
		.dout_up		(dout_up),
		.dout_down		(dout_down),
		.dout_left		(dout_left),
		.dout_right		(dout_right),
		.dout_bypass_1		(dout_bypass_1),
		.dout_bypass_2		(dout_bypass_2)
    );


	task  ConfigInit;
		begin
	        clk = 1'b1;
        	rst = 1'b1;
		    #10 rst = 1'b0;
		end 
	    
	endtask //automatic


    task MUL_test;
	
        @(posedge clk)begin//din 左 上   din 右入寄存器
			ContextRegister [3:0] <='b0000;
			ContextRegister [7:4] <='b0010;
			ContextRegister [11:8] <='b0011;
            ContextRegister [15:12] <= 'b1111;
			ContextRegister [21:16]<='b111111;
        end
    endtask

	always@(posedge clk) begin
		if(rst) begin
			din_up	<= 'b0;
			din_down	<= 'b0;
			din_left	<= 'b0;
			din_right	<= 'b0;
			din_bypass_1	<= 'b0;
			din_bypass_2	<= 'b0;			
			DataSelect	<= 'b0;
			ContextRegister	<= 'b0;
        end
		
		else begin
			din_up	<= din_up + 'd5;
			din_down	<= din_down + 'd6;
			din_left	<= din_left + 'd7;
			din_right	<= din_right + 'd8;
			din_bypass_1	<= din_bypass_1 + 'd9;
			din_bypass_2	<= din_bypass_2 + 'd3;			
		end
	end

endmodule