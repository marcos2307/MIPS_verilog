`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Marcos Gomez Redondo
// 
// Create Date:    09:56:57 09/23/2021 
// Design Name: 
// Module Name:    registerfile 
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
module registerfile(
    input [4:0] Read1, Read2, WriteReg,
    input [31:0] WriteData,
    input RegWrite,
    input clock,
    output [31:0] Data1, Data2
    );
   (* RAM_STYLE="{AUTO | BLOCK |  BLOCK_POWER1 | BLOCK_POWER2}" *)
   reg [31:0] RF [31:0];
	assign Data1 = RF[Read1];
	assign Data2 = RF[Read2];
   always @(posedge clock) begin
      if (RegWrite)
			RF[Read1] <= WriteData;
   end
endmodule