`include "common.vh"
module ENCODER(in,out);
//encoder:n bits(only one bit equals one) --> log_n bits
parameter n=8,log_n = `C_LOG_2(n),k=4;

input  wire [n-1:0] in;
output reg  [log_n-1:0] out;

integer i;
always @(*) 
  begin
    out = k-1; // default value if 'in' is 0
    for (i=n-1; i>k-1; i=i-1)
      if (in[i]) out = i[3:0];
  end
  
endmodule


module LOD(in,out);
//leading one detector
parameter n=8;//length
input  [n-1:0] in;
output [n-1:0] out;
genvar i;
generate
	wire [n-1:0] in_r;
    for (i=0; i<n; i=i+1) begin: ReverseIn
        assign in_r[i] = in[n-1-i];
    end
endgenerate

wire [n-1:0] in_r_change;
wire [n-1:0] out_r;
assign in_r_change  = (~in_r) + 1;
assign out_r = in_r & in_r_change;

genvar j;
generate
    for (j=0; j<n; j=j+1) begin: ReverseResult
        assign out[j] = out_r[n-1-j];
    end
endgenerate

endmodule


module Shifter #(
	parameter DATA_WIDTH =8 ,
	parameter log_n = `C_LOG_2(DATA_WIDTH)
)
(
	input [DATA_WIDTH-1 : 0  ] din,
	output [log_n-1 : 0 ] dout	
);

	wire [DATA_WIDTH-1 : 0 ] pos;
	LOD lod(
		.in(din),
		.out(pos)
	);

	ENCODER encoder(
		.in(pos),
		.out(dout)
	);
	
endmodule