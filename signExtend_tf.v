`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:06:08 10/12/2021
// Design Name:   signExtend
// Module Name:   C:/Users/Usuario/MIPS/MIPS/signExtend_tf.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: signExtend
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module signExtend_tf;

	// Inputs
	reg [15:0] in;
	// Output
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	signExtend uut (
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#10 in = 16'hFF00;
		#10 in = 16'h0000;
		#10 in = 16'h0010;
		
	end
      
endmodule

