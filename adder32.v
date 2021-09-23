`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Marcos Gomez Redondo
// 
// Create Date:    11:51:38 09/23/2021 
// Design Name: 
// Module Name:    adder32 
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
module adder32(
    input [31:0] d0,
    input [31:0] d1,
    output [31:0] out
    );
assign out = d0 + d1;
endmodule