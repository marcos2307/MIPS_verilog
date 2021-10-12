`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:58:36 10/12/2021
// Design Name:   adder32
// Module Name:   C:/Users/Usuario/MIPS/MIPS/adder32_tf.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: adder32
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module adder32_tf;

	// Inputs
	reg [31:0] d0;
	reg [31:0] d1;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	adder32 uut (
		.d0(d0), 
		.d1(d1), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		d0 = 0;
		d1 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#10 d0 = 32'hFFFFFFFF;
		#10 d1 = 32'hFFFFFFFF;
		#10 d0 = 32'h00FFFFFF;
		#10 d1 = 32'h00000001;
		#10 d0 = 32'hFFFFFF00;
		#10 d1 = 32'h00000100;
		
	end
      
endmodule

