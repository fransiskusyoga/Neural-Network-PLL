module test_top(in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,in16,in17,in18,in19,in20,in21,in22,in23,in24,in25,in26,in27,in28,in29,in30,in31,in32,in33,in34,in35,in36,in37,in38,in39,in40,in41,in42,in43,in44,in45,in46,in47,in48,in49,in50,in51,in52,in53,in54,in55,in56,in57,in58,in59,in60,in61,in62,in63,in64,in65,in66,in67,in68,in69,in70,in71,in72,in73,in74,in75,in76,in77,in78,in79,in80,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10);
   input [5:0] in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,in16,in17,in18,in19,in20,in21,in22,in23,in24,in25,in26,in27,in28,in29,in30,in31,in32,in33,in34,in35,in36,in37,in38,in39,in40,in41,in42,in43,in44,in45,in46,in47,in48,in49,in50,in51,in52,in53,in54,in55,in56,in57,in58,in59,in60,in61,in62,in63,in64,in65,in66,in67,in68,in69,in70,in71,in72,in73,in74,in75,in76,in77,in78,in79,in80;
   output [7:0] out1,out2,out3,out4,out5,out6,out7,out8,out9,out10;
   wire signed [6:0] s2_1,s2_2,s2_3,s2_4,s2_5,s2_6,s2_7,s2_8,s2_9,s2_10,s2_11,s2_12,s2_13,s2_14,s2_15,s2_16,s2_17,s2_18,s2_19,s2_20,s2_21,s2_22,s2_23,s2_24,s2_25,s2_26,s2_27;
   wire signed [6:0] h2_1,h2_2,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h2_14,h2_15,h2_16,h2_17,h2_18,h2_19,h2_20,h2_21,h2_22,h2_23,h2_24,h2_25,h2_26,h2_27;
   test_layer_1 L1(in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,in16,in17,in18,in19,in20,in21,in22,in23,in24,in25,in26,in27,in28,in29,in30,in31,in32,in33,in34,in35,in36,in37,in38,in39,in40,in41,in42,in43,in44,in45,in46,in47,in48,in49,in50,in51,in52,in53,in54,in55,in56,in57,in58,in59,in60,in61,in62,in63,in64,in65,in66,in67,in68,in69,in70,in71,in72,in73,in74,in75,in76,in77,in78,in79,in80,s2_1,s2_2,s2_3,s2_4,s2_5,s2_6,s2_7,s2_8,s2_9,s2_10,s2_11,s2_12,s2_13,s2_14,s2_15,s2_16,s2_17,s2_18,s2_19,s2_20,s2_21,s2_22,s2_23,s2_24,s2_25,s2_26,s2_27);
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
   actifunc #(7) AF2_16(s2_16,h2_16);
   actifunc #(7) AF2_17(s2_17,h2_17);
   actifunc #(7) AF2_18(s2_18,h2_18);
   actifunc #(7) AF2_19(s2_19,h2_19);
   actifunc #(7) AF2_20(s2_20,h2_20);
   actifunc #(7) AF2_21(s2_21,h2_21);
   actifunc #(7) AF2_22(s2_22,h2_22);
   actifunc #(7) AF2_23(s2_23,h2_23);
   actifunc #(7) AF2_24(s2_24,h2_24);
   actifunc #(7) AF2_25(s2_25,h2_25);
   actifunc #(7) AF2_26(s2_26,h2_26);
   actifunc #(7) AF2_27(s2_27,h2_27);
   test_layer_2 L2(h2_1[6:0],h2_2[6:0],h2_3[6:0],h2_4[6:0],h2_5[6:0],h2_6[6:0],h2_7[6:0],h2_8[6:0],h2_9[6:0],h2_10[6:0],h2_11[6:0],h2_12[6:0],h2_13[6:0],h2_14[6:0],h2_15[6:0],h2_16[6:0],h2_17[6:0],h2_18[6:0],h2_19[6:0],h2_20[6:0],h2_21[6:0],h2_22[6:0],h2_23[6:0],h2_24[6:0],h2_25[6:0],h2_26[6:0],h2_27[6:0],out1,out2,out3,out4,out5,out6,out7,out8,out9,out10);
endmodule