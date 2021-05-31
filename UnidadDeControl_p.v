`timescale 1ns/1ns

module UnidadDeControl(
	input[5:0]OP,
	output reg RegDst,
	output reg Branch,
	output reg MemRead,
	output reg MemToReg,
	output reg[2:0]ALUOP,
	output reg MemWrite,
	output reg ALUSrc,
	output reg RegWrite
);

always @*
begin
	case(OP)
		5'b00000:
		begin 
		ALUOP = 3'b010;
		MemToReg = 1'b0;
		MemWrite = 1'b0;
		MemRead = 1'b0;
		RegWrite = 1'b1;
		Branch = 1'b0;
		RegDst = 1'b0;
		ALUSrc = 1'b0;
		end 

	endcase
end

endmodule 
