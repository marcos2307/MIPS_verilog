`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Marcos Gomez Redondo
// 
// Create Date:    09:48:16 09/28/2021 
// Design Name: 
// Module Name:    dataMem 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module dataMem(
	 input clk, we,
    input [31:0] addr,
    input [31:0] wd,
	 input [31:0] entradas, // se agrega para las entradas
    output[31:0] rd,
	 output reg [31:0] salidas  // este registro se agrega para las salidas
    );
	 
	reg we_reg, we_mem;
	reg [31:0] addr_mem;
	 //RAM
   (* RAM_STYLE="{AUTO | BLOCK |  BLOCK_POWER1 | BLOCK_POWER2}" *)
   reg [31:0] RAM [12'hFFF:0];
   always @(posedge clk) begin
      if (we_mem)
			RAM[addr_mem] <= wd;
			
   end
	
	//selector de salida de datos (al MIPS)
	assign rd = (addr==32'hFFFF0001)? entradas : RAM[addr_mem];
	
	// selector de we de memoria de datos
	always @(addr, we)
		case (addr)
				32'hffff0000 : we_mem = 0;
				32'hffff0001 : we_mem = 0;
				default : we_mem = we;
		endcase

	// selector de address de memoria de datos
	always @(addr)
		case (addr)
				32'hffff0000 : addr_mem = 12'h000;
				32'hffff0001 : addr_mem = 12'h000;
				default : addr_mem = addr[11:0];
		endcase

	// selector de we de registro	
	always @(addr, we) 
		case (addr)
				32'hffff0000 : we_reg = we;
				default : we_reg = 0;
		endcase
	
	//registro de salidas
	always @(posedge clk) begin
      if (we_reg)
			salidas = wd;
		end
				
	
endmodule
