module tb;
  reg [3:0] datain;
  reg [1:0] shift;
  reg dir;
  wire [3:0] dataout;
  
  bs u1(.datain(datain),.shift(shift),.dir(dir),.dataout(dataout));
  initial begin
    datain=4'b1011;
    for(int i=0;i<2;i++) begin
      dir=i;
      for(int j=0;j<4;j++) begin
        shift=j[1:0];
        #10;
      end
    end
  end
  initial begin
    $monitor("datain=%0b,shift=%0b,dir=%0b,dataout=%0b",datain,shift,dir,dataout);
  end
endmodule
    
