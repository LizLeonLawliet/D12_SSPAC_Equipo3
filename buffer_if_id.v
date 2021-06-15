`timescale 1ns/1ns // Tiempo
// 1.- CREACIÓN DEL MÓDULO <ENTRADAS Y SALIDAS> I/O
module bufferif_id(
	input [31:0] add1,
	input [31:0] instruccionMem,
	input clk,
	output reg [31:0] salidAdd1,
	output reg [31:0] salidaIM
);
// 2.- DEFINICIÓN DE REGISTROS Y CABLES
// 3.- CUERPO DEL MÓDULO, ASIGNACIONES
initial begin
	salidAdd1=0;
	salidaIM=0;
end
always @(posedge clk)
begin 
	salidaIM = instruccionMem;
	salidAdd1 = add1;
end
endmodule