`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Marcos Gomez Redondo
// 
// Create Date:    11:49:04 09/23/2021 
// Design Name: 
// Module Name:    mux32 
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
module mux32(
    input [31:0] d0,
    input [31:0] d1,
    input sel,
    output [31:0] out
    );
   assign out = sel ? d1 : d0;			
endmodule