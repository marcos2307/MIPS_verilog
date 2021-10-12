`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:55:10 10/12/2021
// Design Name:   MIPSALU
// Module Name:   C:/Users/Usuario/MIPS/MIPS/MIPSALU_tf.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MIPSALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MIPSALU_tf;

	// Inputs
	reg [3:0] ALUctl;
	reg [31:0] A;
	reg [31:0] B;

	// Outputs
	wire [31:0] ALUOut;
	wire Zero;

	// Instantiate the Unit Under Test (UUT)
	MIPSALU uut (
		.ALUctl(ALUctl), 
		.A(A), 
		.B(B), 
		.ALUOut(ALUOut), 
		.Zero(Zero)
	);

	initial begin
		// Initialize Inputs
		ALUctl = 0;
		A = 100;
		B = 50;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#10 ALUctl = 0; //and
		#10 ALUctl = 1; //or
		#10 ALUctl = 2; //sum
		#10 ALUctl = 6; //substract
		#10 ALUctl = 7; //slt
		#10 ALUctl = 12; //nor

		
	end
      
endmodule

