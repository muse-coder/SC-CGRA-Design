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


// module Mul#(parameter DATA_WIDTH=16,
// 	parameter OUT_WIDTH=32
// 	)(
// 	    input [DATA_WIDTH-1:0] io_inputs_1, // a
//         input [DATA_WIDTH-1:0] io_inputs_0,  // b
//         output [OUT_WIDTH-1:0] io_outs_0
//     );
// 	assign io_outs_0 = io_inputs_1 * io_inputs_0;

// endmodule

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


// module Mul#(parameter DATA_WIDTH=8,
// 	parameter OUT_WIDTH=16
// 	)(
// 	    input [DATA_WIDTH-1:0] io_inputs_1, // a
//         input [DATA_WIDTH-1:0] io_inputs_0,  // b
//         output [OUT_WIDTH-1:0] io_outs_0
//     );
// 	wire [DATA_WIDTH-2:0] tmp_1; // a
//     wire [DATA_WIDTH-2:0] tmp_0;  // b
//     wire [OUT_WIDTH-3:0] res_tmp;  // b
//     wire shift_1;
// 	wire shift_0;
// 	assign shift_0 = io_inputs_0[7:7]==1'b1 ? 1'b1 : 1'b0;
// 	assign shift_1 = io_inputs_1[7:7]==1'b1 ? 1'b1 : 1'b0;
 
// 	assign tmp_0 = shift_0 ? io_inputs_0[7:1] : io_inputs_0[6:0]; 
// 	assign tmp_1 = shift_1 ? io_inputs_1[7:1] : io_inputs_1[6:0]; 
// 	assign res_tmp = tmp_1 * tmp_0;
// 	wire [1:0] shiftAll = shift_1 + shift_0 ; 	

// 	assign io_outs_0 = res_tmp << shiftAll ;
// endmodule


module Mul#(parameter DATA_WIDTH=8,
	parameter OUT_WIDTH=16
	)(
	    input [DATA_WIDTH-1:0] io_inputs_1, // a
        input [DATA_WIDTH-1:0] io_inputs_0,  // b
        output [OUT_WIDTH-1:0] io_outs_0
    );
 

	assign io_outs_0 = io_inputs_1[7:1] * io_inputs_0[7:1] << 2 ;

endmodule
