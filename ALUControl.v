`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: LSPyC
// Engineer: Marcos Gomez Redondo
// 
// Create Date:    09:43:44 09/23/2021 
// Design Name: 
// Module Name:    ALUControl 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
// 	Obtenido del libro David A. Patterson, John L. Hennessy - Computer Organization and Design_ The Hardware_Software Interface 5th Edition 
// 	- With all appendices and advanced material. 5-Elsevier (2013)
// 	Apendice B. (En el libro esta mal la salida, pone ALUOp donde debe ser ALUCtl)
// Se agrega la funcionalidad para instrucciones de acceso a memoria y branch. Se verifica además 6 funciones tipo R.
// Dependencies: 
//	
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
	module ALUControl(
    input [1:0] ALUOp,
    input [5:0] FuncCode,
    output reg [3:0] ALUCtl
    );
	 
/*	always case (FuncCode)
	32: ALUCtl <=2; //add
	34: ALUCtl <=6; //substract
	36: ALUCtl <=0; //and
	37: ALUCtl <=1; //or
	39: ALUCtl <=12; //nor
	42: ALUCtl <=7; //stl
	default: ALUCtl <=15; //should not happen
	endcase*/
	always@(ALUOp, FuncCode) begin
	if (ALUOp == 2'b00) //mem
		ALUCtl = 4'b0010; 
	else if (ALUOp[0] == 1) //branch
		ALUCtl = 4'b0110;
	else if (ALUOp[1] == 1)  //R-type
		case(FuncCode[3:0])
			4'b0000: ALUCtl = 4'b0010; //add
			4'b0010: ALUCtl = 4'b0110; //substract
			4'b0100: ALUCtl = 4'b0000; //and
			4'b0101: ALUCtl = 4'b0001; //or
			4'b0111: ALUCtl = 4'b1100; //nor
			4'b1010: ALUCtl = 4'b0111; //set on less than
			default: ALUCtl = 4'b1111; //should not happen
		endcase
	else 
		ALUCtl = 4'b0010; //should not happen
	end
endmodule