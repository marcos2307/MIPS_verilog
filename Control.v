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
    output reg RegDst,
	 output reg Jump,
    output reg ALUSrc,
    output reg MemtoReg,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg Branch,
    output reg ALUOp1,
    output reg ALUOp0
    );
	 
	 ;
	 
	 reg [2:0] state;

	always@(inst)
		case (inst)
			6'b000000 : state = 3'b000; 	//tipo R
			6'b010000 : state = 3'b001; 	//addi
			6'b100011 : state = 3'b010;	//lw
			6'b101011 : state = 3'b011;	//sw
			6'b000100 : state = 3'b100;	//beq
			6'b000010 : state = 3'b101;	//j
			default : state = 3'b000;
		endcase
			
	//outputs
	always@(state) 
		begin
			if(state == 0) //tipo R
				begin
					RegDst = 1;
					Jump = 0;
					ALUSrc = 0;
					MemtoReg = 0;
					RegWrite = 1;
					MemRead = 0;
					MemWrite = 0;
					Branch = 0;	
					ALUOp1 = 1;
					ALUOp0 = 0;
				end
			else if(state == 1) //addi(corregir estos valores)
				begin 
					RegDst = 1;
					Jump = 0;
					ALUSrc = 0;
					MemtoReg = 0;
					RegWrite = 1;
					MemRead = 0;
					MemWrite = 0;
					Branch = 0;	
					ALUOp1 = 1;
					ALUOp0 = 0;
				end
			else if(state == 2) //lw
				begin
					RegDst = 0;
					Jump = 0;
					ALUSrc = 1;
					MemtoReg = 1;
					RegWrite = 1;
					MemRead = 1;
					MemWrite = 0;
					Branch = 0;	
					ALUOp1 = 0;
					ALUOp0 = 0;
				end
			else if(state == 3) //sw
				begin
					RegDst = 0;
					Jump = 0;
					ALUSrc = 1;
					MemtoReg = 0;
					RegWrite = 0;
					MemRead = 0;
					MemWrite = 1;
					Branch = 0;	
					ALUOp1 = 0;
					ALUOp0 = 0;
				end
			else if(state == 4) //beq
				begin
					RegDst = 0;
					Jump = 0;
					ALUSrc = 0;
					MemtoReg = 0;
					RegWrite = 0;
					MemRead = 0;
					MemWrite = 0;
					Branch = 1;	
					ALUOp1 = 0;
					ALUOp0 = 1;
				end
			else if(state == 5) //j
				begin
					RegDst = 0;
					Jump = 1;
					ALUSrc = 0;
					MemtoReg = 0;
					RegWrite = 0;
					MemRead = 0;
					MemWrite = 0;
					Branch = 0;	
					ALUOp1 = 0;
					ALUOp0 = 0;
				end
			else
				begin
					RegDst = 0;
					Jump = 0;
					ALUSrc = 0;
					MemtoReg = 0;
					RegWrite = 0;
					MemRead = 0;
					MemWrite = 0;
					Branch = 0;	
					ALUOp1 = 0;
					ALUOp0 = 0;
				end
		end
endmodule
