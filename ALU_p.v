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
		4'b0000:
		begin
			resultado = A + B;
		end
		4'b0001:
		begin
			resultado = A - B;
		end
        4'b0010:
		begin
			resultado = A * B;
		end
        4'b0011: 
		begin
			resultado = (A < B) ? 1 : 0;
		end
        4'b0100:
		begin
			resultado = A & B;
		end
        4'b0101:
		begin
			resultado = A | B;
		end
        4'b0110:
		begin
			resultado = A << 1;
		end
        4'b0111:
		begin
			resultado = A ^ B;
		end
		4'b1000:
		begin
			resultado = 0;
		end
	endcase
    if (resultado==32'd0) begin
        ZeroFlag = 1'b1;
    end else begin
        ZeroFlag = 1'b0;
    end
end
endmodule
