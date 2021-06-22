`timescale 1ns/1ns

module BancoReg(
	input[4:0]RA1,
	input[4:0]RA2,
	input[31:0]Di,
	input[4:0]Dir,
	input RegWrite,
	output reg[31:0]DR1,
	output reg[31:0]DR2
);

reg [31:0]Banco[0:31];

initial begin
	$readmemb("bancoRegDatos_BinomioAlCuadrado",Banco);
end

always @*
begin
	if(RegWrite==1'b1)begin 
		Banco[Dir]<=Di;
	end
		DR1<=Banco[RA1];
		DR2<=Banco[RA2];
end 

endmodule		 
