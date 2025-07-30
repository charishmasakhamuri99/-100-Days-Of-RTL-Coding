module concat_example_tb;
  reg [1:0] A;
  reg [2:0] B;
  reg       bit_in;
  wire [6:0] result;

  concat_example UUT (
    .A(A),
    .B(B),
    .bit_in(bit_in),
    .result(result)
  );

  initial begin
    $display("A B bit_in | result");
    $monitor("%b %b   %b    | %b", A, B, bit_in, result);

    for (integer i=0; i< (4*8*2); i=i+1) begin
      // Decompose `i` into A(2 bits), B(3 bits), bit_in(1 bit)
      {A, B, bit_in} = i;  // concatenation used for assignment :contentReference[oaicite:5]{index=5}
      #1;
    end

    $finish;
  end
endmodule
