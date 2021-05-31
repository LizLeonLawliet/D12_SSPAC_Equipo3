/*DPTR*/
`timescale 1ns/1ns

//1. declaraciond emodulo y puertos
module DPTR(
    input clk
);

//2. wires y regs
wire [31:0]c1;
wire [31:0]c2;
wire c3;
wire c4;
wire c5;
wire c6;
wire [2:0]c7;
wire c8;
wire c9;
wire c10;
wire [31:0]c11;
wire [31:0]c12;
wire [31:0]c13;
wire c14;
wire [31:0]c15;
wire [31:0]c16;
wire [31:0]c17;
wire [31:0]c18;
wire [31:0]c19;
wire [4:0]c20;
wire [3:0]c21;
wire [31:0]c22;
wire [31:0]c23;
wire [31:0]c24; //pendiente
wire c25;


//3 asig y Cuerpo del modulo
//instancias


PC PC(
    .entrada(c24),
	.clk(clk),
	.salida(c1)
);

InstruccionMemory MemInst(
    .Adress(c1),
	.Instruccion(c2)
);

ADD_1 add1(
    .A(c1),
    .result(c23)
);

// multiplexor de add1 a pc
Mux2_1_32 muxAdd1toPC(
    .A(c23),
	.B(c22),
	.selec(c25),
	.Resultado(c24)
);


UnidadDeControl UnidadDeControl(
	.OP(c2[31:26]),
	.RegDst(c3),
	.Branch(c4),
	.MemRead(c5),
	.MemToReg(c6),
	.ALUOP(c7),
	.MemWrite(c8),
	.ALUSrc(c9),
	.RegWrite(c10)
);

// multiplexor de MemInst a BR //
Mux2_1_5 muxMemInsttoBR(
    .A(c2[20:16]),
	.B(c2[15:11]),
	.selec(c3),
	.Resultado(c20)
);

ALU_Control aluControl(
	.ALUOP(c7),
	.Function(c2[5:0]),
	.selecOP(c21)
);

//And de UC a Mux2 
assign c25 = c4 & c14;



BancoReg BancoReg(
	.RA1(c2[25:21]),
	.RA2(c2[20:16]),
	.Di(c17),
	.Dir(c20),
	.RegWrite(c10),
	.DR1(c11),
	.DR2(c12)
);

// multiplexor de BR a ALU //pendeinte
Mux2_1_32 muxBRtoALU(
    .A(c12),
	.B(c18),
	.selec(c9),
	.Resultado(c13)
);

SignExtend SignExtend(
    .entrada(c2[15:0]),
	.salida(c18) 
);

ALU ALU(
 	.A(c11),
	.B(c13),
	.Selector_op(c21),
	.resultado(c15),
    .ZeroFlag(c14)
);

mem32x32 Mem(
	.MemRead(c5),
	.MemWrite(c8),
	.direc(c15),
	.WriteData(c12),
	.ReadData(c16)
);

// multiplexor de Memoria a BR 
Mux2_1_32 muxMemtoBR(
    .A(c15),
	.B(c16),
	.selec(c6),
	.Resultado(c17)
);

shift_left2 shift_left2(
    .entrada(c18), 
	.resultado(c19)
);

ADD_2 ADD_2(
    .A(c23),
	.B(c19),
	.result(c22)
);

endmodule 


