// Base class with virtual method
class Shape;
    string name;
    function new(string name_in);
        name = name_in;
    endfunction

    virtual function void draw();
        $display("[Shape] Drawing generic shape '%s'", name);
    endfunction
endclass

class Circle extends Shape;
    real radius;
    function new(string name_in, real r);
        super.new(name_in);
        radius = r;
    endfunction

    function void draw();
        $display("[Circle] Drawing circle '%s' with radius=%0.2f", name, radius);
    endfunction
endclass

class Square extends Shape;
    real side;
    function new(string name_in, real s);
        super.new(name_in);
        side = s;
    endfunction

    function void draw();
        $display("[Square] Drawing square '%s' side=%0.2f", name, side);
    endfunction
endclass

module tb_polymorphism;
    Shape sb; // Base-class handle
    Circle c = new("C1", 2.5);
    Square s = new("S1", 4.0);

    Shape shapes[$] = {c, s};

    initial begin
        foreach (shapes[i]) begin
            sb = shapes[i];     // handle points to either Circle or Square
            sb.draw();          // dynamic dispatch to proper draw()
        end
    end
endmodule
