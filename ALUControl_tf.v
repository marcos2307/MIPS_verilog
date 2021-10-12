`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:19:12 10/12/2021
// Design Name:   ALUControl
// Module Name:   C:/Users/Usuario/MIPS/MIPS/ALUControl_tf.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALUControl
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALUControl_tf;

	// Inputs
	reg [1:0] ALUOp;
	reg [5:0] FuncCode;

	// Outputs
	wire [3:0] ALUCtl;

	// Instantiate the Unit Under Test (UUT)
	ALUControl uut (
		.ALUOp(ALUOp), 
		.FuncCode(FuncCode), 
		.ALUCtl(ALUCtl)
	);

	initial begin
		// Initialize Inputs
		ALUOp = 0;
		FuncCode = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#10 ALUOp=2'b00;
		#10 ALUOp=2'b01;
		#10 ALUOp=2'b10;
		#10 FuncCode = 6'h20; //add
		#10 FuncCode = 6'h22; //substract
		#10 FuncCode = 6'h24; //and
		#10 FuncCode = 6'h25; //or
		#10 FuncCode = 6'h27; //nor
		#10 FuncCode = 6'h2a; //slt		
	end
      
endmodule

