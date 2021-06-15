`timescale 1ns/1ns // Tiempo
// 1.- CREACIÓN DEL MÓDULO <ENTRADAS Y SALIDAS> I/O
module bufferex_mem(
	input [31:0] add2,
	input [31:0] resulalu,
	input [31:0] rd2,
	input [4:0] mux,
	input zero,
	input [1:0]wb,
	input [2:0]m,
	input clk,
	output reg [1:0]salida_wb,
	output reg [2:0]salida_m,
	output reg [31:0] salidAdd2,
	output reg [31:0] salidard2,
	output reg [31:0] salidaresulalu,
	output reg [4:0] salidamux,
	output reg salidaZero
);
// 2.- DEFINICIÓN DE REGISTROS Y CABLES
// 3.- CUERPO DEL MÓDULO, ASIGNACIONES

initial begin
	salida_wb=0;
	salida_m=0;
	salidAdd2=0;
	salidard2=0;
	salidaresulalu=0;
	salidamux=0;
	salidaZero=0;
end

always @(posedge clk)
begin
	salida_wb = wb;
	salida_m = m;
	salidAdd2 = add2;
	salidaresulalu = resulalu;
	salidard2 = rd2;
	salidamux = mux;
	salidaZero = zero;
end
endmodule