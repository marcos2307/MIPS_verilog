`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:12:54 09/28/2021
// Design Name:   MIPS
// Module Name:   C:/Users/Usuario/MIPS/MIPS/MIPS_tf.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MIPS
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MIPS_tf;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [8:0] salidas;

	// Instantiate the Unit Under Test (UUT)
	MIPS uut (
		.clk(clk), 
		.rst(rst), 
		.salidas(salidas)
	);

	initial begin
		// Initialize Inputs
		rst = 1;
		// Wait 100 ns for global reset to finish
		#10;
	   rst = 0;
		#10;
		// Add stimulus here
	end
	
	always
	begin
		#10 clk = ~clk;
	end
      
endmodule

