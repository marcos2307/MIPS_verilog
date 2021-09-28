`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Marco Gomez Redondo
// 
// Create Date:    10:47:17 09/28/2021 
// Design Name: 
// Module Name:    MIPS 
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
module MIPS(
    input clk,
	 input rst,
    output reg [8:0] salidas
    );

wire [31:0] pc, m0, m1, m2, m3, ins, read1, read2, se, add0, add1, sl2, alu, dm;
wire RegDst, Jump, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0;
wire Zero;
wire [3:0] aluctl;
PC pc_1 ( 
		.clk(clk),
		.rst(rst),
		.in(m0), 
		.out(pc1)
	);
	
InstMem im_1 ( 
		.addr(PC),
		.out(im)
	);

Control ctl_1 ( 
		.inst(ins[31:26]),
		.RegDst(RegDst),
		.Jump(Jump),
		.ALUSrc(ALUSrc),
		.MemtoReg(MemtoReg),
		.RegWrite(RegWrite),
		.MemRead(MemRead),
		.MemWrite(MemWrite),
		.Branch(Branch),
		.ALUOp1(ALUOp1),
		.ALUOp0(ALUOp0)
	);

//mux de 5 bits
wire [4:0] mux5;
assign mux5 = RegDst ? ins[15:11] : ins[20:16];

registerfile registers_1 (
			.Read1(ins[25:21]), 
			.Read2(ins[20:16]),
			.WriteReg(mux5),
			.WriteData(m3),
			.RegWrite(RegWrite),
			.clock(clk),
			.Data1(read1), 
			.Data2(read2)
			);
	
signExtend se_1(
	.in(ins[15:0]),
	.out(se)
	);
	
//shift left 2 para JUMP
wire [27:0] sl2jump;
assign sl2jump = {ins[25:0], 2'b00};

shiftLeft2 sl2_1(
.in(se),
.out(sl2)
);

adder32 add_0(
	.d0(pc),
	.d1(32'h0004),
	.out(add0)
	);

adder32 add_1(
	.d0(add0),
	.d1(sl2),
	.out(add1)
	);

//jump address
wire [31:0] ja;
assign ja = {add0[31:28], sl2jump};


mux32 m_0 (
    .d0(m1),
    .d1(ja),
    .sel(jump),
    .out(m0)
	 );
	 
//and para el selector m1
wire andm1;
assign andm1 = (Branch & Zero);
mux32 m_1 (
    .d0(add0),
    .d1(add1),
    .sel(andm1),
    .out(m1)
	 );

mux32 m_2 (
    .d0(read2),
    .d1(se),
    .sel(ALUSrc),
    .out(m2)
	 );

ALUControl aluctl_1(
	.ALUOp({ALUOp1,ALUOp0}),
	.FuncCode(ins[5:0]),
   .ALUCtl(aluctl)
);
 
MIPSALU alu_1(
	.ALUctl(aluctl),
	.A(read1),
	.B(m2),
	.ALUOut(alu),
	.Zero(Zero)
);

dataMem dm_1(
	 .clk(clk),
	 .we(MemWrite),
    .addr(alu),
    .wd(read2), 
    .rd(dm),
	 .salidas(salidas)
);

mux32 m_3 (
    .d0(alu),
    .d1(dm),
    .sel(MemtoReg),
    .out(m3)
	 );
endmodule
