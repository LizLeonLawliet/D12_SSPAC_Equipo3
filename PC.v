`timescale 1ns/1ns

module PC(
	input [31:0]entrada,
	input clk,
	output reg [31:0]salida
);

initial begin
	salida=0;
end


always @(posedge clk)
begin 
	salida = entrada;
end
endmodule 
