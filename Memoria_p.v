`timescale 1ns/1ns

module mem32x32(
	input MemRead,
	input MemWrite,
	input [31:0]direc,
	input [31:0]WriteData,
	output reg [31:0]ReadData
);

reg [31:0]mem1[0:31];
 
always @*
begin
	if(MemRead==1'b1)begin
		ReadData=mem1[direc];
	end 
	if(MemWrite==1'b1)begin
		mem1[direc]=WriteData;
	end
end

endmodule
