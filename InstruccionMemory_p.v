`timescale 1ns/1ns

module InstruccionMemory(
	input [31:0]Adress,
	output reg [31:0]Instruccion
);
	
reg [7:0]InsMem[0:399];

// cargamos las instrucciones
initial begin
    $readmemb("binarioBinomioAlCuadrado.txt",InsMem);
end

assign Instruccion = {InsMem[Adress],InsMem[Adress+1],InsMem[Adress+2],InsMem[Adress+3]};

endmodule