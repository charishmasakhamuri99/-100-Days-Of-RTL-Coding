module tb;
  reg [2:0] a,b;
  wire [2:0] biit,art,shi;
  wire [5:0] rep,con;
  wire log, red,rea;
  
  operators u1(.a(a),.b(b),.biit(biit),.log(log),.rep(rep),.con(con),.red(red),.art(art),.shi(shi),.rea(rea));
  
  initial begin
    a=3'b101; b=3'b110;
  end
  initial begin
    $monitor("a=%0b,b=%0b,biin=%0b,log=%0b,rep=%0b,con=%0b,red=%0b,art=%0b,shi=%0b,rea=%0b",a,b,biit,log,rep,con,red,art,shi,rea);
  end
endmodule
