`timescale 1ns / 1ps
module tb_alu;
  reg  [7:0] A, B;
  reg  [3:0] ALU_Sel;
  wire [7:0] ALU_Out;
  wire       CarryOut;

  integer i;
  alu uut (
    .A(A),
    .B(B),
    .ALU_Sel(ALU_Sel),
    .ALU_Out(ALU_Out),
    .CarryOut(CarryOut)
  );

  initial begin
    // Test initial configuration
    A = 8'h0A; B = 8'h02; ALU_Sel = 4'h0;
    for (i = 0; i < 16; i = i + 1) begin
      ALU_Sel = i[3:0];
      #10;
      $display("Sel=%b: A=%d, B=%d => Out=%d, Carry=%b",
               ALU_Sel, A, B, ALU_Out, CarryOut);
    end

    // Test a second operand set
    A = 8'hF6; B = 8'h0A;
    for (i = 0; i < 16; i = i + 1) begin
      ALU_Sel = i[3:0];
      #10;
      $display("Sel=%b: A=%d, B=%d => Out=%d, Carry=%b",
               ALU_Sel, A, B, ALU_Out, CarryOut);
    end
    $finish;
  end
endmodule
