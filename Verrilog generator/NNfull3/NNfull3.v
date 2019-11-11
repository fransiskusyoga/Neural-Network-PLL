`include "actifunc.v"
`include "layer_12.v"
`include "layer_23.v"
module NNfull3(in1,in2,out1);
   input [8:0] in1,in2;
   output [7:0] out1;
   wire signed [16:0] s2_1,s2_2,s2_3;
   wire signed [16:0] h2_1,h2_2,h2_3;
   layer_12 L12(in1,s2_1,s2_2,s2_3);
   actifunc #(17) AF2_1(s2_1,h2_1);
   actifunc #(17) AF2_2(s2_2,h2_2);
   actifunc #(17) AF2_3(s2_3,h2_3);
   layer_23 L23(h2_1[8:0],h2_2[8:0],h2_3[8:0],in2,out1);
endmodule