`include "neuralnet.v"
module neuralnet_tb();
   reg [7:0] avgn, avgkp;
   wire [7:0] k3,k4;
   neuralnet NN(avgn,avgkp,k3,k4);
   initial begin
      avgn=8'd87; avgkp=4;          //k3=2 ;k4=3
      #100 avgn=8'd87; avgkp=8'd09; //k3=7 ;k4=8
      #100 avgn=8'd88; avgkp=8'd12; //k3=9 ;k4=11
      #100 avgn=8'd84; avgkp=8'd31; //k3=29 ;k4=31
      #100 avgn=8'd83; avgkp=8'd20; //k3=18 ;k4=20
      #100 avgn=8'd95; avgkp=8'd05; //k3=3 ;k4=4
      #100 avgn=8'd81; avgkp=8'd33; //k3=30 ;k4=32
   end
endmodule
