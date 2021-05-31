`timescale 1ns/1ns

module SignExtend(
	input [15:0]entrada,
	output reg[31:0]salida 
);
always @*
begin
 	if(entrada[15] == 1'b1)
  	begin
  	 	salida[31:16] <= 16'b1111111111111111;
  	 	salida[15:0] <= entrada[15:0];
 	end
 	else if(entrada[15] == 1'b0)
  	begin
   		salida[31:16] <= 16'b0000000000000000;	
		salida[15:0] <= entrada[15:0];
  	end
 	else
  	begin
   		salida[31:16] <= 16'bxxxxxxxxxxxxxxxx;
   		salida[15:0] <= entrada[15:0];
  	end
end
endmodule

		
