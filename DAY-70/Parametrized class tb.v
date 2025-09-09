class stack #(type T = int);
  T item;
  function T add_any(T a);
    return item + a;
  endfunction
endclass

module tb_type_param;
  stack         st  = new();              // default int
  stack #(bit[3:0]) bs = new();           // 4-bit vector
  stack #(real)     rs = new();           // real

  initial begin
    st.item = -5;    $display("st.add_any(3) = %0d", st.add_any(3));
    bs.item = 8'hA;  $display("bs.add_any(3) = %0d", bs.add_any(3));
    rs.item = 2.7;   $display("rs.add_any(3) = %0.2f", rs.add_any(3.0));
  end
endmodule
