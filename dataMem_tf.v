`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Marcos Gòmez
//
// Create Date:   09:23:14 10/14/2021
// Design Name:   dataMem
// Module Name:   C:/Users/Usuario/MIPS/MIPS/dataMem_tf.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
// Este bloque incluye memoria de datos, una entrada de 32 bits en paralelo y una salida paralela de 32 bits.
// Verilog Test Fixture created by ISE for module: dataMem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module dataMem_tf;

	// Inputs
	reg clk;
	reg we;
	reg [31:0] addr;
	reg [31:0] wd;
	reg [31:0] entradas;

	// Outputs
	wire [31:0] rd;
	wire [31:0] salidas;

	// Instantiate the Unit Under Test (UUT)
	dataMem uut (
		.clk(clk), 
		.we(we), 
		.addr(addr), 
		.wd(wd),
		.entradas(entradas),
		.rd(rd), 
		.salidas(salidas)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		we = 0;
		addr = 0;
		wd = 0;
		entradas = 32'hCAFE;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#10 addr = 100;
		we = 1;
		wd = -100;
		#10 addr = 101;
		wd = -50;
		#10 addr = 102;
		wd = -1;
		#10 addr = 103;
		wd = 0;
		#10 addr = 104;
		wd = 1;
		#10 addr = 105;
		wd = 50;
		#10 addr = 106;
		wd = 100;
		
		#10 addr = 32'hFFFF0000;
		wd = 500;
		
		#10 we = 0;
		addr = 100;
		#10 addr = 101;
		#10 addr = 102;
		#10 addr = 103;
		#10 addr = 104;
		#10 addr = 105;
		#10 addr = 106;
		
		#10 addr = 32'hFFFF0001;
	end
     
	always begin
		#2 clk = ~clk;
	end
endmodule

