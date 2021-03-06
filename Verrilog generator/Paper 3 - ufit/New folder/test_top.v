module test_top(in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10);
   input [5:0] in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12;
   output [7:0] out1,out2,out3,out4,out5,out6,out7,out8,out9,out10;
   wire signed [6:0] s2_1,s2_2,s2_3,s2_4,s2_5,s2_6,s2_7,s2_8,s2_9,s2_10,s2_11,s2_12,s2_13,s2_14,s2_15;
   wire signed [6:0] h2_1,h2_2,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h2_14,h2_15;
   test_layer_1 L1(in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,s2_1,s2_2,s2_3,s2_4,s2_5,s2_6,s2_7,s2_8,s2_9,s2_10,s2_11,s2_12,s2_13,s2_14,s2_15);
   actifunc #(7) AF2_1(s2_1,h2_1);
   actifunc #(7) AF2_2(s2_2,h2_2);
   actifunc #(7) AF2_3(s2_3,h2_3);
   actifunc #(7) AF2_4(s2_4,h2_4);
   actifunc #(7) AF2_5(s2_5,h2_5);
   actifunc #(7) AF2_6(s2_6,h2_6);
   actifunc #(7) AF2_7(s2_7,h2_7);
   actifunc #(7) AF2_8(s2_8,h2_8);
   actifunc #(7) AF2_9(s2_9,h2_9);
   actifunc #(7) AF2_10(s2_10,h2_10);
   actifunc #(7) AF2_11(s2_11,h2_11);
   actifunc #(7) AF2_12(s2_12,h2_12);
   actifunc #(7) AF2_13(s2_13,h2_13);
   actifunc #(7) AF2_14(s2_14,h2_14);
   actifunc #(7) AF2_15(s2_15,h2_15);
   test_layer_2 L2(h2_1[6:0],h2_2[6:0],h2_3[6:0],h2_4[6:0],h2_5[6:0],h2_6[6:0],h2_7[6:0],h2_8[6:0],h2_9[6:0],h2_10[6:0],h2_11[6:0],h2_12[6:0],h2_13[6:0],h2_14[6:0],h2_15[6:0],out1,out2,out3,out4,out5,out6,out7,out8,out9,out10);
endmodule