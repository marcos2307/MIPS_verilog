`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:56:11 09/23/2021 
// Design Name: 
// Module Name:    InstMem 
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
module InstMem(
    input [31:0] addr,
    output [31:0] out
    );
   reg [31:0] Mem [1024:0];
   initial
      $readmemh("programa.txt", Mem, 0, 10);
assign out = Mem[addr];
endmodule