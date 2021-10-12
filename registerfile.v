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
    output reg [31:0] Data1, Data2
    );
   
   reg [31:0] RF [31:1];
	
	always @(Read1, RF) begin
      if (Read1==0)
			Data1 = 32'h0000;
		else
			Data1 = RF[Read1];
   end
	
	always @(Read2, RF) begin
      if (Read2==0)
			Data2 = 32'h0000;
		else
			Data2 = RF[Read2];
   end
	
	
   always @(posedge clock) begin
      if (RegWrite)
			RF[WriteReg] = WriteData;
   end
endmodule