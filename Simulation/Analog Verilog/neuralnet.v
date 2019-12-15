`include "ReLU.v"
//`include "tanh.v"
module neuralnet(avgn,avgkp,k3,k4);
   //avgn -real-> 0 sign,4 decimal,4 fractional
   //     -act--> 0 sign,2 decimal,6 fractional (div by 4)
   //avgkp-real-> 0 sign,8 decimal,0 fractional
   //     -act--> 0 sign,2 decimal,6 fractional (div by 64)
   input [7:0] avgn,avgkp;
   output [7:0] k3,k4;
   // perceptron in hidden layer
   // 1 sign bit, 3 decimal, 12 fractional
   wire signed [15:0] h1,h2; //sum of weighted input
   // 1 sign bit, 2 decimal, 5 fractional
   wire signed [7:0] ha1,ha2; //output of activation function
   // output layer temporary variable
   wire signed [15:0] t3,t4;
   // weight of input to hidden layer
   // 1 sign bit, 1 decimal, 6 fractional
   // w111=0.1907 , w121=0.1483
   // w112=0.1483 , w122=1.4498
   reg signed [7:0] w111=8'h30, w121=8'h12;
   reg signed [7:0] w112=8'h12, w122=8'h5D;
   // weight of hidden to output layer
   // 1 sign bit, 1 decimal, 6 fractional
   // w211=-0.3214 , w221=-0.3181
   // w212= 0.7176 , w222= 0.7532
   reg signed [7:0] w211=8'hEB, w221=8'hEC; 
   reg signed [7:0] w212=8'h2E, w222=8'h30;
   // calculation input to hidden layer
   assign h1 = w111*avgn + w112*avgkp;
   assign h2 = w121*avgn + w122*avgkp;
   //activation function
   ReLU relu1(h1,ha1);
   ReLU relu2(h2,ha2);
   // calculation hidden to output layer
   assign t3 = w211*ha1 + w212*ha2;
   assign t4 = w221*ha1 + w222*ha2;
   assign k3 = t3[12:5];
   assign k4 = t4[12:5];
endmodule
