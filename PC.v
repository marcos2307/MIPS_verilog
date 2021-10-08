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
    output reg [31:0] out
    );
   always @(posedge clk or posedge rst)
      if (rst) begin
			out <= 32'b0;
      end else begin
			out <= in;
      end
endmodule
