module full_adder_n_tb;
  parameter N = 8;

  reg  [N-1:0] a, b;
  reg          cin;
  wire [N-1:0] sum;
  wire         cout;

  // Instantiate DUT
  full_adder_n #(N) dut (.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));

  initial begin
    // Test case 1
    a   = 8'b0000_0001;
    b   = 8'b0000_0010;
    cin = 1'b0;
    #10;
    $display("a=%b b=%b cin=%b => sum=%b cout=%b", a, b, cin, sum, cout);

    // Test case 2
    a   = 8'b1111_1111;
    b   = 8'b0000_0001;
    cin = 1'b0;
    #10;
    $display("a=%b b=%b cin=%b => sum=%b cout=%b", a, b, cin, sum, cout);

    // Test case 3
    a   = 8'b1010_1010;
    b   = 8'b0101_0101;
    cin = 1'b1;
    #10;
    $display("a=%b b=%b cin=%b => sum=%b cout=%b", a, b, cin, sum, cout);

    $finish;
  end
endmodule
