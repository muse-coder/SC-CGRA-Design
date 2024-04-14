module CrossbarIn (
	input [31:0]  din_up,
	input [31:0]  din_down,
	input [31:0]  din_left,
	input [31:0]  din_right,
	input [31:0] din_NE,
	input [31:0] din_NW,
	input [31:0] din_SE,
	input [31:0] din_SW,
	input [31:0]  RegisterFile,
	input [11:0]  DataSelect,
	output [31:0] AluIn_1,
	output [31:0] AluIn_2,
	output [31:0] ToRegisterFile
	);
		assign AluIn_1 = DataSelect[3:0] == 'b0000 ? din_up 			: 
						 DataSelect[3:0] == 'b0001 ? din_down	 		: 
						 DataSelect[3:0] == 'b0010 ? din_left	 		: 
						 DataSelect[3:0] == 'b0011 ? din_right	 		: 
						 DataSelect[3:0] == 'b0100 ? din_NE			:
						 DataSelect[3:0] == 'b0101 ? din_NW			:
						 DataSelect[3:0] == 'b0110 ? din_SE			:
						 DataSelect[3:0] == 'b0111 ? din_SW			:
						 							 RegisterFile	;

		assign AluIn_2 = DataSelect[7:4] == 'b0000 ? din_up 			: 
						 DataSelect[7:4] == 'b0001 ? din_down	 		: 
						 DataSelect[7:4] == 'b0010 ? din_left	 		: 
						 DataSelect[7:4] == 'b0011 ? din_right	 		: 
						 DataSelect[7:4] == 'b0100 ? din_NE			:
						 DataSelect[7:4] == 'b0101 ? din_NW			:
						 DataSelect[7:4] == 'b0110 ? din_SE			:
						 DataSelect[7:4] == 'b0111 ? din_SW			:
						 							 RegisterFile	;


		assign ToRegisterFile = DataSelect[11:8] == 'b0000 ? din_up 			: 
						 		DataSelect[11:8] == 'b0001 ? din_down	 		: 
						 		DataSelect[11:8] == 'b0010 ? din_left	 		: 
						 		DataSelect[11:8] == 'b0011 ? din_right	 		: 
						 		DataSelect[11:8] == 'b0100 ? din_NE			:
						 		DataSelect[11:8] == 'b0101 ? din_NW			:
						 		DataSelect[11:8] == 'b0110 ? din_SE			:
						 		DataSelect[11:8] == 'b0111 ? din_SW			:
						 							 RegisterFile	;

endmodule