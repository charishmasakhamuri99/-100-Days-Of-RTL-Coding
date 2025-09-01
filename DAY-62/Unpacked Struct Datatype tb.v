module struct_example;
    struct {
        string name;
        bit [31:0] salary;
        integer id;
    } employee;

    initial begin
        // Waveform dump setup
        $dumpfile("struct_example.vcd"); // Create VCD file for waveforms
        $dumpvars(0, struct_example);    // Dump all signals in this module

        // Struct usage
        employee.name    = "Alex";
        employee.salary  = 'h1_0000;
        employee.id      = 1234;
        $display("Employee: %p", employee);
        $display(" name = %s, salary = 0x%0h, id = %0d",
                 employee.name, employee.salary, employee.id);
    end
endmodule
