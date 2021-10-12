`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:07:58 10/12/2021
// Design Name:   mux32
// Module Name:   C:/Users/Usuario/MIPS/MIPS/mux32_tf.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux32
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux32_tf;

	// Inputs
	reg [31:0] d0;
	reg [31:0] d1;
	reg sel;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	mux32 uut (
		.d0(d0), 
		.d1(d1), 
		.sel(sel), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		d0 = 0;
		d1 = 0;
		sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#10 d0 = 100;
		#10 d1 = -100;
		#10 sel = 1;
		#10 sel = 0;		
		#10 sel = 1;
		#10 sel = 0;
				
	end
      
endmodule

