`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:35:20 10/12/2021
// Design Name:   registerfile
// Module Name:   C:/Users/Usuario/MIPS/MIPS/registerfile_tf.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: registerfile
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module registerfile_tf;

	// Inputs
	reg [4:0] Read1;
	reg [4:0] Read2;
	reg [4:0] WriteReg;
	reg [31:0] WriteData;
	reg RegWrite;
	reg clock;

	// Outputs
	wire [31:0] Data1;
	wire [31:0] Data2;

	// Instantiate the Unit Under Test (UUT)
	registerfile uut (
		.Read1(Read1), 
		.Read2(Read2), 
		.WriteReg(WriteReg), 
		.WriteData(WriteData), 
		.RegWrite(RegWrite), 
		.clock(clock), 
		.Data1(Data1), 
		.Data2(Data2)
	);

	initial begin
		// Initialize Inputs
		Read1 = 1;
		Read2 = 1;
		WriteReg = 0;
		WriteData = 32'hFFFFFFFF;
		RegWrite = 1;
		clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
      
		#50 WriteReg = 1;
		Read1 = 1;
		Read2 = 1;
		WriteReg = 1;
		#50 WriteReg = 0;
		
		#100 Read1 = 1;
		Read2 = 2;
		
		#100 Read1 = 2;
		Read2 = 1;
		
		#100 RegWrite = 2;
		Read2 = 2;
		Read1 = 2;
		// Add stimulus here

	end
	
	always begin 
		#10 clock = ~clock;
	end
      
endmodule

