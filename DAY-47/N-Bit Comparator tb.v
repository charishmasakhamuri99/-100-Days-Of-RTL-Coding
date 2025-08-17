module tb_n_bit_comparator;
  reg [3:0] A;       // 4-bit input A
  reg [3:0] B;       // 4-bit input B
  wire A_gt_B;       // Output for A > B
  wire A_lt_B;       // Output for A < B
  wire A_eq_B;       // Output for A == B

  n_bit_comparator uut (
    .A(A),
    .B(B),
    .A_gt_B(A_gt_B),
    .A_lt_B(A_lt_B),
    .A_eq_B(A_eq_B)
  );

  initial begin
    // Test Case 1: A = 4, B = 3
    A = 4; B = 3;
    #10;
    $display("A = %d, B = %d: A > B = %b, A < B = %b, A == B = %b", A, B, A_gt_B, A_lt_B, A_eq_B);

    // Test Case 2: A = 7, B = 7
    A = 7; B = 7;
    #10;
    $display("A = %d, B = %d: A > B = %b, A < B = %b, A == B = %b", A, B, A_gt_B, A_lt_B, A_eq_B);

    // Test Case 3: A = 2, B = 5
    A = 2; B = 5;
    #10;
    $display("A = %d, B = %d: A > B = %b, A < B = %b, A == B = %b", A, B, A_gt_B, A_lt_B, A_eq_B);

    // Test Case 4: A = 8, B = 0
    A = 8; B = 0;
    #10;
    $display("A = %d, B = %d: A > B = %b, A < B = %b, A == B = %b", A, B, A_gt_B, A_lt_B, A_eq_B);

    // Test Case 5: A = 4, B = 6
    A = 4; B = 6;
    #10;
    $display("A = %d, B = %d: A > B = %b, A < B = %b, A == B = %b", A, B, A_gt_B, A_lt_B, A_eq_B);

    $finish;
  end
endmodule
