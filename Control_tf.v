`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:16:00 10/12/2021
// Design Name:   Control
// Module Name:   C:/Users/Usuario/MIPS/MIPS/Control_tf.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Control_tf;

	// Inputs
	reg [31:26] inst;

	// Outputs
	wire RegDst;
	wire Jump;
	wire ALUSrc;
	wire MemtoReg;
	wire RegWrite;
	wire MemRead;
	wire MemWrite;
	wire Branch;
	wire ALUOp1;
	wire ALUOp0;

	// Instantiate the Unit Under Test (UUT)
	Control uut (
		.inst(inst), 
		.RegDst(RegDst), 
		.Jump(Jump), 
		.ALUSrc(ALUSrc), 
		.MemtoReg(MemtoReg), 
		.RegWrite(RegWrite), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.Branch(Branch), 
		.ALUOp1(ALUOp1), 
		.ALUOp0(ALUOp0)
	);

	initial begin
		// Initialize Inputs
		inst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		#10 inst = 6'b000000; //tipo R
		#10 inst = 6'b010000; //addi
		#10 inst = 6'b100011; //lw
		#10 inst = 6'b101011; //sw
		#10 inst = 6'b000100; //beq
		#10 inst = 6'b000010;
		#10 inst = 6'b001110;

		
		// Add stimulus here
		
	end
      
endmodule

