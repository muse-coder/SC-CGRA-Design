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


module Mul#(parameter DATA_WIDTH=16,
	parameter OUT_WIDTH=32
	)(
	    input [DATA_WIDTH-1:0] io_inputs_1, // a
        input [DATA_WIDTH-1:0] io_inputs_0,  // b
        output [OUT_WIDTH-1:0] io_outs_0
    );
	assign io_outs_0 = io_inputs_1 * io_inputs_0;

endmodule
