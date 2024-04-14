`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/06 31:53:49
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


module NormalPE#(
	parameter ContextWidth = 22,
	// parameter RegCapacity = 1,
	parameter RegWidth = 2
	
	) 
	(
		// input io_en,
		input clk,
		input rst,
		input [31:0] din_up,
		input [31:0] din_down,
		input [31:0] din_left,
		input [31:0] din_right,
		input [31:0] din_bypass_1,
		input [31:0] din_bypass_2,
		input [ContextWidth-1:0] configuration,
		output [31:0] dout_up,
		output [31:0] dout_down,
		output [31:0] dout_left,
		output [31:0] dout_right,
		output [31:0] dout_bypass_1,
		output [31:0] dout_bypass_2
    );
		reg [ContextWidth-1:0] ContextRegister ;
		reg [31:0]	RegisterFile ;
		wire [3:0]  AluInst ;
		wire [31:0] AluIn_1 ;
		wire [31:0] AluIn_2 ;
		wire [31:0] AluRes;
        wire [31:0]	ToRegisterFile;
		wire [11:0]	DataSelect;
		reg  [31:0] AluResReg;

		assign DataSelect 	= ContextRegister[11:0];
		assign AluInst 		= ContextRegister[15:12];
		assign dout_up   		= (ContextRegister[16] ? AluResReg : RegisterFile);
		assign dout_down   		= (ContextRegister[17] ? AluResReg : RegisterFile);
		assign dout_left   		= (ContextRegister[18] ? AluResReg : RegisterFile);
		assign dout_right   	= (ContextRegister[19] ? AluResReg : RegisterFile);
		assign dout_bypass_1   	= (ContextRegister[20] ? AluResReg : RegisterFile);
		assign dout_bypass_2   	= (ContextRegister[21] ? AluResReg : RegisterFile);

 		CrossbarIn CrossbarIn_u(
		.din_up						(din_up			),
		.din_down					(din_down		),
		.din_left					(din_left		),
		.din_right					(din_right		),
		.din_bypass_1				(din_bypass_1	),
		.din_bypass_2				(din_bypass_2	),
		.RegisterFile				(RegisterFile	),
		.DataSelect					(DataSelect		),	
		.AluIn_1					(AluIn_1		),
		.AluIn_2					(AluIn_2		),
		.ToRegisterFile				(ToRegisterFile )
		);

		Alu	Alu_u(
			.io_en				(1'b1),
        	.io_inputs_1		(AluIn_1), // a
        	.io_inputs_0		(AluIn_2),  // b
        	.io_configuration	(AluInst),
        	.io_outs_0			(AluRes)	
    	);



		always @(posedge clk ) begin
			if(rst) begin
				ContextRegister <= 'b0;
				RegisterFile <= 'b0;
			end
			else begin
				ContextRegister <= configuration;
				RegisterFile <= ToRegisterFile;
				AluResReg <= AluRes;
			end
		end
		
	endmodule
