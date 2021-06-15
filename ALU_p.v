`timescale 1ns/1ns

module ALU(
	input [31:0]A,
	input [31:0]B,
	input [3:0]Selector_op,
	output reg [31:0]resultado,
    output reg ZeroFlag
);

always @*
begin
	case (Selector_op)
		4'b0000: // SUMA
		begin
			resultado = A + B;
		end
		4'b0001: // RESTA
		begin
			resultado = A - B;
		end
        4'b0010: // MULT
		begin
			resultado = A * B;
		end
        4'b0011: // SLT
		begin
			resultado = (A < B) ? 1 : 0;
		end
        4'b0100: // AND
		begin
			resultado = A & B;
		end
        4'b0101: // OR
		begin
			resultado = A | B;
		end
        4'b0110: // Corrimiento 1 bit izquierda
		begin
			resultado = A << 1;
		end
        4'b0111: // XOR
		begin
			resultado = A ^ B;
		end
		4'b1000: // NOP
		begin
			resultado = 0;
		end
		4'b1001: // BNE
		begin
			resultado = (A != B) ? 0 : 1;
		end
		4'b1010: // BGTZ
		begin
			resultado = (A > 0) ? 0 : 1;
		end
	endcase
    if (resultado==32'd0) begin
        ZeroFlag = 1'b1;
    end else begin
        ZeroFlag = 1'b0;
    end
end
endmodule