`timescale 1ns/1ns // Tiempo
// 1.- CREACIÓN DEL MÓDULO <ENTRADAS Y SALIDAS> I/O
module buffermem_wb(
	input [31:0] reaData,
	input [31:0] aluresul,
	input [4:0] mux,
	input [1:0] wb,
	input clk,
	output reg [1:0]salidawb,
	output reg [31:0] salidareaData,
	output reg [31:0] salidAluresul,
	output reg [4:0] salidamux
);
// 2.- DEFINICIÓN DE REGISTROS Y CABLES
// 3.- CUERPO DEL MÓDULO, ASIGNACIONES
initial begin
	salidawb=0;
	salidareaData=0;
	salidAluresul=0;
	salidamux=0;
end
always @(posedge clk)
begin
	salidawb = wb;
	salidareaData = reaData;
	salidAluresul = aluresul;
	salidamux = mux;
end
endmodule