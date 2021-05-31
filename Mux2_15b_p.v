`timescale 1ns/1ns

module Mux2_1_5(
	input [4:0]A,
	input [4:0]B,
	input selec,
	output reg [4:0]Resultado
);

always @*
begin
	case(selec)
		1'b1:
		begin
		Resultado = A;
		end
		1'b0:
		begin
		Resultado = B;
		end
	endcase 
end
endmodule
