`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:35:05 09/28/2021 
// Design Name: 
// Module Name:    shiftLeft2 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module shiftLeft2(
    input [31:0] in,
    output [31:0] out
    );

assign out = in << 2;
endmodule
