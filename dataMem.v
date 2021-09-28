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
    output reg [31:0] rd,
	 output reg [31:0] salidas  // este registro se agrega para las salidas
    );
	 
	wire zero = 32'h0;
	reg we_reg, we_mem;
	reg [31:0] addr_mem;
	 //RAM
   (* RAM_STYLE="{AUTO | BLOCK |  BLOCK_POWER1 | BLOCK_POWER2}" *)
   reg [31:0] RAM [1023:0];
   always @(posedge clk) begin
      if (we_mem)
			RAM[addr_mem] <= wd;
		rd <= RAM[addr];			
   end

	
	// selector de we de memoria
	always @(addr, we, zero)
		case (addr)
				32'hffff0000 : we_mem <= zero;
				default : we_mem <= we;
		endcase

	// selector de address de memoria	
	always @(addr, zero)
		case (addr)
				32'hffff0000 : addr_mem <= zero;
				default : addr_mem <= addr;
		endcase

	// selector de we de registro	
	always @(addr, we, zero) 
		case (addr)
				32'hffff0000 : we_reg <= we;
				default : we_reg <= zero;
		endcase
	
	//registro de salidas
	always @(posedge clk) begin
      if (we_reg)
			salidas[addr] <= wd;
		end
				
	
endmodule
