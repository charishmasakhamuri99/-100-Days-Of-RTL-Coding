`timescale 1ns/1ps
module tb_parallel_adder;
  reg [1:0] a, b;
  wire [2:0] c;

  // Instantiate the design
  parallel_adder uut (
    .a(a),
    .b(b),
    .c(c)
  );

  // Generate VCD file for waveform
  initial begin
    $dumpfile("parallel_adder.vcd"); // VCD output file
    $dumpvars(0, tb_parallel_adder); // Dump all variables in this module
  end

  // Apply test inputs
  initial begin
    $display("Time\t a\t b\t c");
    $monitor("%0t\t %b\t %b\t %b", $time, a, b, c);

    a = 2'b00; b = 2'b00; #10;
    a = 2'b01; b = 2'b01; #10;
    a = 2'b10; b = 2'b10; #10;
    a = 2'b11; b = 2'b01; #10;
    a = 2'b11; b = 2'b11; #10;

    $finish;
  end
endmodule


module tb;
  reg [3:0] a,b;
  reg cin;
  wire [3:0] s;
  wire carry;
  
  pa u1(.a(a),.b(b),.cin(cin),.s(s),.carry(carry));
  initial begin
    cin=0;
    for(int i=0;i<16;i++) begin
      a=i;
      for(int j=0;j<16;j++) begin
        b=j;
        #10;
      end
    end
  end
  initial begin
    $monitor("time=%0t,a=%0b,b=%0b,cin=%0b,s=%0b,carry=%0b",$time,a,b,cin,s,carry);
  end
endmodule
