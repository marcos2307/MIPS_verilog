`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:18:42 10/08/2021
// Design Name:   PC
// Module Name:   C:/Users/Usuario/MIPS/MIPS/pc_tf.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pc_tf;

	// Inputs
	reg clk;
	reg rst;
	reg [31:0] in;
	
	//Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	PC uut (
		.clk(clk), 
		.rst(rst), 
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		in = 0;
		#10;
		rst = 0;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#10 clk =1;
		#5  in = 10;
		#5  clk =0;
		#10 clk =1;
		#10 clk =0;
		#10 clk =1;
		#10 clk =0;
		
				
	end
      
endmodule

