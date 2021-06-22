`timescale 1ns/1ns

module UnidadDeControl(
	input[5:0]OP,
	output reg RegDst,
	output reg Branch,
	output reg MemRead,
	output reg MemToReg,
	output reg[3:0]ALUOP,
	output reg MemWrite,
	output reg ALUSrc,
	output reg RegWrite,
	output reg Jump
);

always @*
begin
	case(OP)
	// instrucciones tipo R
		6'b000000: 
		begin 
		ALUOP = 4'b0010;
		MemToReg = 1'b0;
		MemWrite = 1'b0;
		MemRead = 1'b0;
		RegWrite = 1'b1;
		Branch = 1'b0;
		RegDst = 1'b1;
		ALUSrc = 1'b0;
		Jump = 1'b0;
		end
	// instrucciones tipo I
		6'b001000: // instruccion addi
		begin
		ALUOP = 4'b0000;	
		MemToReg = 1'b0;
		MemWrite = 1'b0;
		MemRead = 1'b0;
		RegWrite = 1'b1;
		Branch = 1'b0;
		RegDst = 1'b0;
		ALUSrc = 1'b1;
		Jump = 1'b0;
		end
		6'b001101: // instruccion ori
		begin
		ALUOP = 4'b0001;	
		MemToReg = 1'b0;
		MemWrite = 1'b0;
		MemRead = 1'b0;
		RegWrite = 1'b1;
		Branch = 1'b0;
		RegDst = 1'b0;
		ALUSrc = 1'b1;
		Jump = 1'b0;
		end
		6'b001100: // instruccion andi
		begin
		ALUOP = 4'b0011;	
		MemToReg = 1'b0;
		MemWrite = 1'b0;
		MemRead = 1'b0;
		RegWrite = 1'b1;
		Branch = 1'b0;
		RegDst = 1'b0;
		ALUSrc = 1'b1;
		Jump = 1'b0;
		end
		6'b100011: // instruccion lw
		begin
		ALUOP = 4'b0100;	
		MemToReg = 1'b1;
		MemWrite = 1'b0;
		MemRead = 1'b1;
		RegWrite = 1'b1;
		Branch = 1'b0;
		RegDst = 1'b0;
		ALUSrc = 1'b1;
		Jump = 1'b0;
		end
		6'b101011: // instruccion sw
		begin
		ALUOP = 4'b0101;	
		MemToReg = 1'b0;
		MemWrite = 1'b1;
		MemRead = 1'b0;
		RegWrite = 1'b0;
		Branch = 1'b0;
		RegDst = 1'b0;
		ALUSrc = 1'b1;
		Jump = 1'b0;
		end
		6'b001010: // instruccion slti
		begin
		ALUOP = 4'b0110;	
		MemToReg = 1'b0;
		MemWrite = 1'b0;
		MemRead = 1'b0;
		RegWrite = 1'b1;
		Branch = 1'b0;
		RegDst = 1'b0;
		ALUSrc = 1'b1;
		Jump = 1'b0;
		end
		6'b000100: // instruccion beq
		begin
		ALUOP = 4'b0111;	
		MemToReg = 1'b0;
		MemWrite = 1'b0;
		MemRead = 1'b0;
		RegWrite = 1'b0;
		Branch = 1'b1;
		RegDst = 1'b0;
		ALUSrc = 1'b0;
		Jump = 1'b0;
		end
		6'b000101: // instruccion bne
		begin
		ALUOP = 4'b1000;	
		MemToReg = 1'b0;
		MemWrite = 1'b0;
		MemRead = 1'b0;
		RegWrite = 1'b0;
		Branch = 1'b1;
		RegDst = 1'b0;
		ALUSrc = 1'b0;
		Jump = 1'b0;
		end
		6'b000111: // instruccion bgtz
		begin
		ALUOP = 4'b1001;	
		MemToReg = 1'b0;
		MemWrite = 1'b0;
		MemRead = 1'b0;
		RegWrite = 1'b0;
		Branch = 1'b1;
		RegDst = 1'b0;
		ALUSrc = 1'b0;
		Jump = 1'b0;
		end
		6'b000010: // instruccion tipo j
		begin
		ALUOP = 4'b0000;	
		MemToReg = 1'b0;
		MemWrite = 1'b0;
		MemRead = 1'b0;
		RegWrite = 1'b0;
		Branch = 1'b0;
		RegDst = 1'b0;
		ALUSrc = 1'b0;
		Jump = 1'b1;
		end
	endcase
end

endmodule 