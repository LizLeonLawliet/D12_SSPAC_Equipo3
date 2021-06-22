`timescale 1ns/1ns

module shift_left2_InstruccionesJ(
	input [25:0]entrada, 
	output [27:0]resultado
);

assign resultado = entrada << 2;

endmodule  

