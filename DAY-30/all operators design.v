module operators(
  input [2:0] a,
  input [2:0] b,
  output [2:0] biit,
  output  log,
  output [5:0] rep,
  output [5:0] con,
  output  red,
  output [2:0] art,
  output [2:0] shi,
  output  rea
);
  assign biit=a&b;
  assign log=a&&b;
  assign rep={2{a}};
  assign con={a,b};
  assign red=&a;
  assign art=(a>>>2);
    assign shi=(a>>2);
  assign rea=(a>b);
endmodule
  
  
  
