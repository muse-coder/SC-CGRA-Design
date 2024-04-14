`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/25 17:11:37
// Design Name: 
// Module Name: mux2_4_1
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


module mux2_4_1(
    input [1:0] A,B,C,D,
    input [1:0] S,
    output [1:0] Y
    
    );

wire [1:0] Y1,Y2;
mux2 m1(A,B,S[0],Y1);
mux2 m2(C,D,S[0],Y2);
mux2 m3(Y1,Y2,S[1],Y);
endmodule
