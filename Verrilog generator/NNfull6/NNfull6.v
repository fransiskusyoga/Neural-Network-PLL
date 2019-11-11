`include "actifunc.v"
`include "layer_12.v"
`include "layer_23.v"
module NNfull6(in1,in2,out1);
   input [8:0] in1,in2;
   output [7:0] out1;
   wire signed [15:0] s2_1,s2_2,s2_3,s2_4,s2_5,s2_6;
   wire signed [15:0] h2_1,h2_2,h2_3,h2_4,h2_5,h2_6;
   layer_12 L12(in1,s2_1,s2_2,s2_3,s2_4,s2_5,s2_6);
   actifunc #(16) AF2_1(s2_1,h2_1);
   actifunc #(16) AF2_2(s2_2,h2_2);
   actifunc #(16) AF2_3(s2_3,h2_3);
   actifunc #(16) AF2_4(s2_4,h2_4);
   actifunc #(16) AF2_5(s2_5,h2_5);
   actifunc #(16) AF2_6(s2_6,h2_6);
   layer_23 L23(h2_1[8:0],h2_2[8:0],h2_3[8:0],h2_4[8:0],h2_5[8:0],h2_6[8:0],in2,out1);
endmodule