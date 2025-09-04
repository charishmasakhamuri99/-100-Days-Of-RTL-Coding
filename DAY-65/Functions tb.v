// Code your testbench here
// or browse Examples
module tb_adder_func;
    logic [7:0] a, b, sum;
    
    // Instantiate the design module
    adder_func uut (
        .a(a),
        .b(b),
        .sum(sum)
    );
    
    initial begin
        // Test case 1
        a = 8'h05;
        b = 8'h03;
        #1;
        $display("Test Case 1: a=%0d b=%0d sum=%0d", a, b, sum);

        // Test case 2
        a = 8'hFF;
        b = 8'h01;
        #1;
        $display("Test Case 2: a=%0d b=%0d sum=%0d", a, b, sum);

        // Test case 3
        a = 8'hAA;
        b = 8'h55;
        #1;
        $display("Test Case 3: a=%0d b=%0d sum=%0d", a, b, sum);

        $finish;
    end
endmodule
