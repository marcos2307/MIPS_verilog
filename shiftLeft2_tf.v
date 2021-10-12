`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:53:39 10/12/2021
// Design Name:   shiftLeft2
// Module Name:   C:/Users/Usuario/MIPS/MIPS/shiftLeft2_tf.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: shiftLeft2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module shiftLeft2_tf;

	// Inputs
	reg [31:0] in;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	shiftLeft2 uut (
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;

		// Wait 100 ns for global reset to finish
		#100;
       
		#10 in = 1;
		#10 in = 16;
		#10 in = 32'hFFFFFFFF;
		
		// Add stimulus here

	end
      
endmodule

