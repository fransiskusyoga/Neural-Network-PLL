module multiply_tb();
  reg [9:0] in1;
  reg [7:0] in2;
  wire [15:0] ou;
  
  multiply #(10,8) M1(.in1(in1),.in2(in2),.ou(ou));
  
  initial begin
    in1 = -100; in2 = 37;
    #100 in1 = 10; in2 = -24;
    #100 in1 = -100; in2 = -17;
    #100 in1 = 10; in2 = 123;
  end
  
endmodule
