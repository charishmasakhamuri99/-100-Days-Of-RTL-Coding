module or_gate(a,b,y);
  parameter n=8;
  input [(n-1):0] a,b;
  output [(n-1):0] y;
  genvar i;
  generate
    for(i=0;i<n;i++)
      begin:or_loop
        or g1(y[i],a[i],b[i]);
      end
   
  endgenerate
endmodule
