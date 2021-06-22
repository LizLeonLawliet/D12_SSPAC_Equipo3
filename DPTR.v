/*DPTR*/
`timescale 1ns/1ns

//1. declaraciond emodulo y puertos
module DPTR(
    input clk
);

//2. wires y regs
wire [31:0]c1;
wire [31:0]c2;
wire [31:0]c3;
wire [31:0]c4;
wire [31:0]c5;
wire [31:0]c6;
wire c7;
wire [31:0]c8;
wire [31:0]c9;
wire [31:0]c10;
wire [31:0]c11;
wire [31:0]c12;
wire [31:0]c13;
wire [31:0]c14;
wire [4:0]c15;
wire [4:0]c16;
wire c17;
wire [3:0]c18;
wire [31:0]c19;
wire [31:0]c20;
wire [31:0]c21;
wire c22;
wire [31:0]c23;
wire [3:0]c24; 
wire [4:0]c25;
wire [31:0]c26;
wire c27;
wire [31:0]c28;
wire [31:0]c29;
wire [4:0]c30;
wire c31;
wire c32;
wire c33;
wire c34;
wire [31:0]c35;
wire c36;
wire [31:0]c37;
wire [31:0]c38;
wire [4:0]c39;
wire [31:0]c40;
wire c41;
wire [1:0]c42;
wire [3:0]c43;
wire [5:0]c44;
wire [1:0]c45;
wire [3:0]c46;
wire [1:0]c47;
wire [25:0]c48;
wire [27:0]c49;
wire [31:0]c50;
wire [31:0]c51;
wire c52;

//3 asig y Cuerpo del modulo
//instancias



bufferif_id bufferif_id(
	.add1(c2),
	.instruccionMem(c4),
	.clk(clk),
	.salidAdd1(c5),
	.salidaIM(c6)
);

PC PC(
    .entrada(c51),
	.clk(clk),
	.salida(c1)
);

InstruccionMemory MemInst(
    .Adress(c1),
	.Instruccion(c4)
);

ADD_1 add1(
    .A(c1),
    .result(c2)
);

bufferid_ex bufferid_ex(
	.add1(c5),
	.rd1(c8),
	.rd2(c9),
	.signext(c10),
	.inst20_16(c6[20:16]),
	.inst15_11(c6[15:11]),
	.RegWrite(c7),
	.MemtoReg(c41),
	.Branch(c31),
	.MemRead(c34),
	.MemWrite(c33),
	.Reg_Dst(c36),
	.Alu_Op(c18),
	.Alu_Src(c17),
	.Jump(c52),
	.inst25_0(c6[25:0]),
	.clk(clk),
	.EX(c44),
	.M(c43),
	.WB(c42),
	.salidAdd1(c11),
	.salidard1(c12),
	.salidard2(c13),
	.salidasignext(c14),
	.salidainst20_16(c15),
	.salidainst15_11(c16),
	.salidainst25_0(c48)
);

shift_left2_InstruccionesJ shift_left2_InstruccionesJ(
	.entrada(c48), 
	.resultado(c49)
);

// multiplexor de Instrucciones tipo J o Tipo  R e I a pc
Mux2_1_32 muxInstTipoJtoPC(
    .A(c3),
	.B(c50),
	.selec(c46[3]),
	.Resultado(c51)
);

bufferex_mem  bufferex_mem(
	.add2(c21),
	.resulalu(c23),
	.rd2(c13),
	.mux(c25),
	.zero(c22),
	.wb(c42),
	.m(c43),
	.instTipoJ(c49),
	.add131_28(c11[31:28]),
	.clk(clk),
	.salida_wb(c45),
	.salida_m(c46),
	.salidAdd2(c26),
	.salidard2(c29),
	.salidaresulalu(c28),
	.salidamux(c30),
	.salidaZero(c27),
	.salidainstTipoJ(c50)
);

buffermem_wb buffermem_wb(
	.reaData(c35),
	.aluresul(c28),
	.mux(c30),
	.wb(c45),
	.clk(clk),
	.salidawb(c47),
	.salidareaData(c37),
	.salidAluresul(c38),
	.salidamux(c39)
);

// multiplexor de add1 a pc
Mux2_1_32 muxAdd1toPC(
    .A(c2),
	.B(c26),
	.selec(c32),
	.Resultado(c3)
);


UnidadDeControl UnidadDeControl(
	.OP(c6[31:26]),
	.RegDst(c36),
	.Branch(c31),
	.MemRead(c34),
	.MemToReg(c41),
	.ALUOP(c18),
	.MemWrite(c33),
	.ALUSrc(c17),
	.RegWrite(c7),
	.Jump(c52)
);

// multiplexor de MemInst a BR //
Mux2_1_5 muxMemInsttoBR(
    .A(c15),
	.B(c16),
	.selec(c44[0]),
	.Resultado(c25)
);

ALU_Control aluControl(
	.ALUOP(c44[4:1]),
	.Function(c14[5:0]),
	.selecOP(c24)
);

//And de UC a Mux2 
assign c32 = c46[0] & c27;



BancoReg BancoReg(
	.RA1(c6[25:21]),
	.RA2(c6[20:16]),
	.Di(c40),
	.Dir(c39),
	.RegWrite(c47[0]),
	.DR1(c8),
	.DR2(c9)
);

// multiplexor de BR a ALU 
Mux2_1_32 muxBRtoALU(
    .A(c13),
	.B(c14),
	.selec(c44[5]),
	.Resultado(c20)
);

SignExtend SignExtend(
    .entrada(c6[15:0]),
	.salida(c10) 
);

ALU ALU(
 	.A(c12),
	.B(c20),
	.Selector_op(c24),
	.resultado(c23),
    .ZeroFlag(c22)
);

mem32x32 Mem(
	.MemRead(c46[1]),
	.MemWrite(c46[2]),
	.direc(c28),
	.WriteData(c29),
	.ReadData(c35)
);

// multiplexor de Memoria a BR 
Mux2_1_32 muxMemtoBR(
    .A(c38),
	.B(c37),
	.selec(c47[1]),
	.Resultado(c40)
);

shift_left2 shift_left2(
    .entrada(c14), 
	.resultado(c19)
);

ADD_2 ADD_2(
    .A(c11),
	.B(c19),
	.result(c21)
);

endmodule 


