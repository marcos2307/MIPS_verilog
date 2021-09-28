`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:57:17 09/28/2021 
// Design Name: 
// Module Name:    Control 
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
module Control(
    input [31:26] inst,
    output RegDst,
	 output Jump,
    output ALUSrc,
    output MemtoReg,
    output RegWrite,
    output MemRead,
    output MemWrite,
    output Branch,
    output ALUOp1,
    output ALUOp0
    );
	 
	 ;
	 
	 reg [2:0] state;
   
	always@(inst)
		case (inst)
			6'b000000 : state = 2'b000; 	//tipo R
			6'b010000 : state = 2'b001; 	//addi
			6'b100011 : state = 2'b010;	//lw
			6'b101011 : state = 2'b011;	//sw
			6'b000100 : state = 2'b100;	//beq
			6'b000010 : state = 2'b101;	//j
			default : state = 2'b000;
		endcase
			
	
	always@(state) begin
		if(state == 0) //tipo R
			RegDst <= 1;
			Jump <= 0;
			ALUSrc <= 0;
			MemtoReg <= 0;
			RegWrite <= 1;
			MemRead <= 0;
			MemWrite <= 0;
			Branch <= 0;	
			ALUOp1 <= 1;
			ALUOp0 <= 0;
		else if(state == 1) //addi(corregir estos valores)
			RegDst <= 1;
			Jump <= 0;
			ALUSrc <= 0;
			MemtoReg <= 0;
			RegWrite <= 1;
			MemRead <= 0;
			MemWrite <= 0;
			Branch <= 0;	
			ALUOp1 <= 1;
			ALUOp0 <= 0;
		else if(state == 2) //lw
			RegDst <= 0;
			Jump <= 0;
			ALUSrc <= 1;
			MemtoReg <= 1;
			RegWrite <= 1;
			MemRead <= 1;
			MemWrite <= 0;
			Branch <= 0;	
			ALUOp1 <= 0;
			ALUOp0 <= 0;
		else if(state == 2) //sw
			RegDst <= 0;
			Jump <= 0;
			ALUSrc <= 1;
			MemtoReg <= 0;
			RegWrite <= 0;
			MemRead <= 0;
			MemWrite <= 1;
			Branch <= 0;	
			ALUOp1 <= 0;
			ALUOp0 <= 0;
		else if(state == 2) //beq
			RegDst <= 0;
			Jump <= 0;
			ALUSrc <= 0;
			MemtoReg <= 0;
			RegWrite <= 0;
			MemRead <= 0;
			MemWrite <= 0;
			Branch <= 1;	
			ALUOp1 <= 0;
			ALUOp0 <= 1;
		else
			RegDst <= 1;
			Jump <= 0;
			ALUSrc <= 0;
			MemtoReg <= 0;
			RegWrite <= 1;
			MemRead <= 0;
			MemWrite <= 0;
			Branch <= 0;	
			ALUOp1 <= 1;
			ALUOp0 <= 0;
		end
endmodule
