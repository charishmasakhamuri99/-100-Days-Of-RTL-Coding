// Testbench: tb_case_equality.v
module tb_case_equality;
    reg  [1:0] a, b;
    wire       eq, neq;

    case_equality uut (
        .a(a),
        .b(b),
        .eq(eq),
        .neq(neq)
    );

    initial begin
        // Test 1: Both 2'b00
        a = 2'b00; b = 2'b00; #10;
        $display("a=%b, b=%b, eq=%b, neq=%b", a, b, eq, neq);

        // Test 2: a = 2'b01, b = 2'b01
        a = 2'b01; b = 2'b01; #10;
        $display("a=%b, b=%b, eq=%b, neq=%b", a, b, eq, neq);

        // Test 3: a = 2'b10, b = 2'bx1
        a = 2'b10; b = 2'bx1; #10;
        $display("a=%b, b=%b, eq=%b, neq=%b", a, b, eq, neq);

        // Test 4: a = 2'bxx, b = 2'bxx
        a = 2'bxx; b = 2'bxx; #10;
        $display("a=%b, b=%b, eq=%b, neq=%b", a, b, eq, neq);

        // Finish Simulation
        $finish;
    end
endmodule
