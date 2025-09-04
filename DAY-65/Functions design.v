// Code your design here
module adder_func(
    input  logic [7:0] a,
    input  logic [7:0] b,
    output logic [7:0] sum
);

    // Function to add two numbers
    function automatic logic [7:0] add(input logic [7:0] x, input logic [7:0] y);
        add = x + y;
    endfunction

    // Use the function in the module
    assign sum = add(a, b);

endmodule
