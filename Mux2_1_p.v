`timescale 1ns/1ns

module Mux2_1_32(
	input [31:0]A,
	input [31:0]B,
	input selec,
	output reg [31:0]Resultado
);

always @*
begin
	case(selec)
		1'b0:
		begin
		Resultado = A;
		end
		1'b1:
		begin
		Resultado = B;
		end
	endcase 
end
endmodule
