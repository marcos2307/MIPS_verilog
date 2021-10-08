`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:51:02 10/08/2021
// Design Name:   InstMem
// Module Name:   C:/Users/Usuario/MIPS/MIPS/InstMem_tf.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: InstMem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module InstMem_tf;

	// Inputs
	reg [31:0] addr;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	InstMem uut (
		.addr(addr), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		addr = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#10 addr = 0;
		#10 addr = 1;
		#10 addr = 2;
		#10 addr = 3;
		#10 addr = 4;
		#10 addr = 5;
		#10 addr = 6;
		#10 addr = 7;
		#10 addr = 8;
		#10 addr = 9;
	end
      
endmodule

