`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: LSPyC
// Engineer: Marcos Gomez Redondo
// 
// Create Date:    09:13:58 09/23/2021 
// Design Name: 
// Module Name:    MIPSALU 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
// 	Obtenido del libro David A. Patterson, John L. Hennessy - Computer Organization and Design_ The Hardware_Software Interface 5th Edition 
// 	- With all appendices and advanced material. 5-Elsevier (2013)
// 	Apendice B.
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module MIPSALU(
	input [3:0] ALUctl,
	input [31:0] A, B,
	output reg [31:0] ALUOut,
	output Zero
	);
	assign Zero = (ALUOut==0); //Zero is true if ALUOut is 0
	always @(ALUctl, A, B) begin // reevaluate if these change
		case (ALUctl)
			0: ALUOut <= A & B;
			1: ALUOut <= A | B;
			2: ALUOut <= A + B;
			6: ALUOut <= A - B;
			7: ALUOut <= A < B? 1 : 0;
			12: ALUOut <= ~(A | B);  //nor
			default: ALUOut <= 0;	
		endcase
	end
endmodule