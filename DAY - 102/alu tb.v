// Code your testbench here
`timescale 1ns/1ps
`include "alu.v"       

module tb_alu;

reg  [7:0] a, b;
reg  [3:0] sel;
wire [15:0] y;

alu dut (.a(a),.b(b),.sel(sel),.y(y));

initial begin
  $monitor("TIME=%0t | sel=%b | a=%d b=%d | y=%d",
              $time, sel, a, b, y);
end

initial begin
    
    a = 8'd10;
    b = 8'd3;

    sel = `ADD;   #10;   
    sel = `SUB;   #10;   
    sel = `MUL;   #10;   
    sel = `DIV;   #10;  
    sel = `INC;   #10;   
    sel = `DEC;   #10;   
    sel = `AND;   #10;   
    sel = `OR;    #10;   
    sel = `NOT;   #10;   
    sel = `BUF;   #10; 
    sel = `XOR;   #10;   
    sel = `XNOR;  #10;   
    sel = `NAND;  #10;   
    sel = `NOR;   #10;   
    sel = `MOD;   #10;  
    sel = `RSH;   #10;   
    $finish;
end

endmodule
