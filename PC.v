`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Marcos Gómez Redondo
// 
// Create Date:    08:45:01 09/28/2021 
// Design Name: 
// Module Name:    PC 
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
module PC(
    input clk,
    input rst,
	 input [31:0] in,
    input [31:0] out
    );
	reg [31:0] counter;
   always @(posedge clk)
      if (rst)
         counter <= 0;
      else
         counter <= in;
	assign out = counter;
endmodule
