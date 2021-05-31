/*tb_DPTR*/
`timescale 1ns/1ns

//1. declaracion de modulo y puertos
module tb_DPTR();

//2. wires and regs
reg clk = 1'b0;


//3 asig y Cuerpo del modulo
//instancias
// asignaciones, instancias y always/initial(secuenciales)
//instanciar el modulo a evaluar (DUV)
DPTR DUV(
    .clk(clk)
);



always #100 clk = ~clk;

initial begin
    // señales del testbench
    #1200
    $stop;

end

endmodule 


