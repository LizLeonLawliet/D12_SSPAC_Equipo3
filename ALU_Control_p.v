`timescale 1ns/1ns

module ALU_Control(
	input [2:0]ALUOP,
	input [5:0]Function,
	output reg [3:0]selecOP
);

always @*
begin 
	case(ALUOP)
		3'b010:
		begin
		case(Function)
			6'b100000://ADD
			begin 
			selecOP=4'b0000;
			end
			6'b100010://SUB
			begin 
			selecOP=4'b0001;
			end
			6'b100100://AND
			begin 
			selecOP=4'b0100;
			end
			6'b100101://OR
			begin 
			selecOP=4'b0101;
			end
			6'b101010://SLT
			begin 
			selecOP=4'b0011;
			end
			6'b000000://NOP
			begin 
			selecOP=4'b1000;
			end
		endcase
		end
	endcase 

end
endmodule	
