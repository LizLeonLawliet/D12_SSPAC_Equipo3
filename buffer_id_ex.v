`timescale 1ns/1ns // Tiempo
// 1.- CREACIÓN DEL MÓDULO <ENTRADAS Y SALIDAS> I/O
module bufferid_ex(
	input [31:0] add1,
	input [31:0] rd1,
	input [31:0] rd2,
	input [31:0] signext,
	input [4:0] inst20_16,
	input [4:0] inst15_11,
	input RegWrite,
	input MemtoReg,
	input Branch,
	input MemRead,
	input MemWrite,
	input Reg_Dst,
	input [3:0]Alu_Op,
	input Alu_Src,
	input Jump,
	input [25:0]inst25_0,
	input clk,
	output reg [5:0]EX,
	output reg [3:0]M,
	output reg [1:0]WB,
	output reg [31:0] salidAdd1,
	output reg [31:0] salidard1,
	output reg [31:0] salidard2,
	output reg [31:0] salidasignext,
	output reg [4:0] salidainst20_16,
	output reg [4:0] salidainst15_11,
	output reg [25:0] salidainst25_0
);
// 2.- DEFINICIÓN DE REGISTROS Y CABLES
// 3.- CUERPO DEL MÓDULO, ASIGNACIONES
initial begin
	EX=0;
	M=0;
	WB=0;
	salidAdd1=0;
	salidard1=0;
	salidard2=0;
	salidasignext=0;
	salidainst20_16=0;
	salidainst15_11=0;
	salidainst25_0=0;
end

always @(posedge clk)
begin
	WB = {MemtoReg,RegWrite};
	M = {Jump,MemWrite,MemRead,Branch};
	EX = {Alu_Src,Alu_Op,Reg_Dst};
	salidAdd1 = add1;
	salidard1 = rd1;
	salidard2 = rd2;
	salidasignext = signext;
	salidainst20_16 = inst20_16;
	salidainst15_11 = inst15_11;
	salidainst25_0 = inst25_0;
end
endmodule