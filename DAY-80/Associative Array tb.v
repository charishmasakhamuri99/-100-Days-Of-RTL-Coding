module associative_array_example;

// Declare an associative array with integer indices and 8-bit data
bit [7:0] array_int [int];

// Declare an associative array with string indices
int array_string [string];

initial begin
    // Assign values using integer keys
    array_int[10] = 100;
    array_int[5]  = 50;
    array_int[20] = 200;

    // Assign values using string keys
    array_string["apple"]  = 10;
    array_string["banana"] = 20;
    array_string["cherry"] = 30;

    // Print the integer-indexed associative array
    $display("Integer-indexed associative array contents:");
    foreach (array_int[i]) begin
        $display("array_int[%0d] = %0d", i, array_int[i]);
    end

    // Print the string-indexed associative array
    $display("\nString-indexed associative array contents:");
    foreach (array_string[key]) begin
        $display("array_string[%s] = %0d", key, array_string[key]);
    end

    // Check existence of a key
    if (array_int.exists(10))
        $display("\nKey 10 exists in array_int with value %0d", array_int[10]);

    if (!array_string.exists("orange"))
        $display("Key 'orange' does not exist in array_string");

    // Size and number of entries
    $display("\narray_int size: %0d, number of entries: %0d",
        array_int.size(), array_int.num());
    $display("array_string size: %0d, number of entries: %0d",
        array_string.size(), array_string.num());
end

endmodule
