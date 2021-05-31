`timescale 1ns/1ns

module shift_left2(
	input [31:0]entrada, 
	output [31:0]resultado
);

assign resultado = entrada << 2;

endmodule  
