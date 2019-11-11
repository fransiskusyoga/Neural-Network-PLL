module lenet5_layer_3(clk,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,in16,in17,in18,in19,in20,in21,in22,in23,in24,in25,in26,in27,in28,in29,in30,in31,in32,in33,in34,in35,in36,in37,in38,in39,in40,in41,in42,in43,in44,in45,in46,in47,in48,in49,in50,in51,in52,in53,in54,in55,in56,in57,in58,in59,in60,in61,in62,in63,in64,in65,in66,in67,in68,in69,in70,in71,in72,in73,in74,in75,in76,in77,in78,in79,in80,in81,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10);
   input clk;
   input signed [5:0] in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,in16,in17,in18,in19,in20,in21,in22,in23,in24,in25,in26,in27,in28,in29,in30,in31,in32,in33,in34,in35,in36,in37,in38,in39,in40,in41,in42,in43,in44,in45,in46,in47,in48,in49,in50,in51,in52,in53,in54,in55,in56,in57,in58,in59,in60,in61,in62,in63,in64,in65,in66,in67,in68,in69,in70,in71,in72,in73,in74,in75,in76,in77,in78,in79,in80,in81;
   output reg signed [9:0] out1,out2,out3,out4,out5,out6,out7,out8,out9,out10;
   wire signed [5:0] neg1,neg2,neg3,neg4,neg5,neg6,neg7,neg8,neg9,neg10,neg11,neg12,neg13,neg14,neg15,neg16,neg17,neg18,neg19,neg20,neg21,neg22,neg23,neg24,neg25,neg26,neg27,neg28,neg29,neg30,neg31,neg32,neg33,neg34,neg35,neg36,neg37,neg38,neg39,neg40,neg41,neg42,neg43,neg44,neg45,neg46,neg47,neg48,neg49,neg50,neg51,neg52,neg53,neg54,neg55,neg56,neg57,neg58,neg59,neg60,neg61,neg62,neg63,neg64,neg65,neg66,neg67,neg68,neg69,neg70,neg71,neg72,neg73,neg74,neg75,neg76,neg77,neg78,neg79,neg80,neg81;

   //Bias value
   wire signed [9:0] b1 = $signed(10'h1);
   wire signed [9:0] b2 = $signed(10'h1);
   wire signed [9:0] b3 = $signed(10'h3FF);
   wire signed [9:0] b4 = $signed(10'h0);
   wire signed [9:0] b5 = $signed(10'h0);
   wire signed [9:0] b6 = $signed(10'h0);
   wire signed [9:0] b7 = $signed(10'h3FE);
   wire signed [9:0] b8 = $signed(10'h1);
   wire signed [9:0] b9 = $signed(10'h1);
   wire signed [9:0] b10 = $signed(10'h3FF);

   //Negation modules
   negate #(6) N1(in1,neg1);
   negate #(6) N2(in2,neg2);
   negate #(6) N3(in3,neg3);
   negate #(6) N4(in4,neg4);
   negate #(6) N5(in5,neg5);
   negate #(6) N6(in6,neg6);
   negate #(6) N7(in7,neg7);
   negate #(6) N8(in8,neg8);
   negate #(6) N9(in9,neg9);
   negate #(6) N10(in10,neg10);
   negate #(6) N11(in11,neg11);
   negate #(6) N12(in12,neg12);
   negate #(6) N13(in13,neg13);
   negate #(6) N14(in14,neg14);
   negate #(6) N15(in15,neg15);
   negate #(6) N16(in16,neg16);
   negate #(6) N17(in17,neg17);
   negate #(6) N18(in18,neg18);
   negate #(6) N19(in19,neg19);
   negate #(6) N20(in20,neg20);
   negate #(6) N21(in21,neg21);
   negate #(6) N22(in22,neg22);
   negate #(6) N23(in23,neg23);
   negate #(6) N24(in24,neg24);
   negate #(6) N25(in25,neg25);
   negate #(6) N26(in26,neg26);
   negate #(6) N27(in27,neg27);
   negate #(6) N28(in28,neg28);
   negate #(6) N29(in29,neg29);
   negate #(6) N30(in30,neg30);
   negate #(6) N31(in31,neg31);
   negate #(6) N32(in32,neg32);
   negate #(6) N33(in33,neg33);
   negate #(6) N34(in34,neg34);
   negate #(6) N35(in35,neg35);
   negate #(6) N36(in36,neg36);
   negate #(6) N37(in37,neg37);
   negate #(6) N38(in38,neg38);
   negate #(6) N39(in39,neg39);
   negate #(6) N40(in40,neg40);
   negate #(6) N41(in41,neg41);
   negate #(6) N42(in42,neg42);
   negate #(6) N43(in43,neg43);
   negate #(6) N44(in44,neg44);
   negate #(6) N45(in45,neg45);
   negate #(6) N46(in46,neg46);
   negate #(6) N47(in47,neg47);
   negate #(6) N48(in48,neg48);
   negate #(6) N49(in49,neg49);
   negate #(6) N50(in50,neg50);
   negate #(6) N51(in51,neg51);
   negate #(6) N52(in52,neg52);
   negate #(6) N53(in53,neg53);
   negate #(6) N54(in54,neg54);
   negate #(6) N55(in55,neg55);
   negate #(6) N56(in56,neg56);
   negate #(6) N57(in57,neg57);
   negate #(6) N58(in58,neg58);
   negate #(6) N59(in59,neg59);
   negate #(6) N60(in60,neg60);
   negate #(6) N61(in61,neg61);
   negate #(6) N62(in62,neg62);
   negate #(6) N63(in63,neg63);
   negate #(6) N64(in64,neg64);
   negate #(6) N65(in65,neg65);
   negate #(6) N66(in66,neg66);
   negate #(6) N67(in67,neg67);
   negate #(6) N68(in68,neg68);
   negate #(6) N69(in69,neg69);
   negate #(6) N70(in70,neg70);
   negate #(6) N71(in71,neg71);
   negate #(6) N72(in72,neg72);
   negate #(6) N73(in73,neg73);
   negate #(6) N74(in74,neg74);
   negate #(6) N75(in75,neg75);
   negate #(6) N76(in76,neg76);
   negate #(6) N77(in77,neg77);
   negate #(6) N78(in78,neg78);
   negate #(6) N79(in79,neg79);
   negate #(6) N80(in80,neg80);
   negate #(6) N81(in81,neg81);

   // m1_1 = W*in
   wire signed [9:0] m1_1;
   assign m1_1 ={ {5{in1[5]}} , in1[5:1] };

   // m1_2 = W*in
   wire signed [9:0] m1_2;
   assign m1_2 ={ {5{in1[5]}} , in1[5:1] };

   // m1_3 = W*in
   wire signed [9:0] m1_3;
   assign m1_3 ={ {5{neg1[5]}} , neg1[5:1] };

   // m1_4 = W*in
   wire signed [9:0] m1_4;
   assign m1_4 ={ {4{neg1[5]}} , neg1[5:0] };

   // m1_5 = W*in
   wire signed [9:0] m1_5;
   assign m1_5 =10'b0;

   // m1_6 = W*in
   wire signed [9:0] m1_6;
   assign m1_6 ={ {5{in1[5]}} , in1[5:1] };

   // m1_7 = W*in
   wire signed [9:0] m1_7;
   assign m1_7 ={ {4{in1[5]}} , in1[5:0] };

   // m1_8 = W*in
   wire signed [9:0] m1_8;
   assign m1_8 ={ {5{neg1[5]}} , neg1[5:1] };

   // m1_9 = W*in
   wire signed [9:0] m1_9;
   assign m1_9 ={ {4{in1[5]}} , in1[5:0] };

   // m1_10 = W*in
   wire signed [9:0] m1_10;
   assign m1_10 ={ {4{neg1[5]}} , neg1[5:0] };

   // m2_1 = W*in
   wire signed [9:0] m2_1;
   assign m2_1 ={ {5{neg2[5]}} , neg2[5:1] };

   // m2_2 = W*in
   wire signed [9:0] m2_2;
   assign m2_2 ={ {5{neg2[5]}} , neg2[5:1] };

   // m2_3 = W*in
   wire signed [9:0] m2_3;
   assign m2_3 ={ {5{neg2[5]}} , neg2[5:1] };

   // m2_4 = W*in
   wire signed [9:0] m2_4;
   assign m2_4 ={ {5{neg2[5]}} , neg2[5:1] };

   // m2_5 = W*in
   wire signed [9:0] m2_5;
   assign m2_5 ={ {4{in2[5]}} , in2[5:0] };

   // m2_6 = W*in
   wire signed [9:0] m2_6;
   assign m2_6 ={ {5{neg2[5]}} , neg2[5:1] };

   // m2_7 = W*in
   wire signed [9:0] m2_7;
   assign m2_7 ={ {5{neg2[5]}} , neg2[5:1] };

   // m2_8 = W*in
   wire signed [9:0] m2_8;
   assign m2_8 ={ {5{in2[5]}} , in2[5:1] };

   // m2_9 = W*in
   wire signed [9:0] m2_9;
   assign m2_9 ={ {5{in2[5]}} , in2[5:1] };

   // m2_10 = W*in
   wire signed [9:0] m2_10;
   assign m2_10 ={ {5{in2[5]}} , in2[5:1] };

   // m3_1 = W*in
   wire signed [9:0] m3_1;
   assign m3_1 ={ {5{neg3[5]}} , neg3[5:1] };

   // m3_2 = W*in
   wire signed [9:0] m3_2;
   assign m3_2 ={ {5{neg3[5]}} , neg3[5:1] };

   // m3_3 = W*in
   wire signed [9:0] m3_3;
   assign m3_3 ={ {5{neg3[5]}} , neg3[5:1] };

   // m3_4 = W*in
   wire signed [9:0] m3_4;
   assign m3_4 ={ {4{neg3[5]}} , neg3[5:0] };

   // m3_5 = W*in
   wire signed [9:0] m3_5;
   assign m3_5 ={ {4{in3[5]}} , in3[5:0] };

   // m3_6 = W*in
   wire signed [9:0] m3_6;
   assign m3_6 ={ {4{in3[5]}} , in3[5:0] };

   // m3_7 = W*in
   wire signed [9:0] m3_7;
   assign m3_7 ={ {4{in3[5]}} , in3[5:0] };

   // m3_8 = W*in
   wire signed [9:0] m3_8;
   assign m3_8 ={ {5{in3[5]}} , in3[5:1] };

   // m3_9 = W*in
   wire signed [9:0] m3_9;
   assign m3_9 ={ {5{neg3[5]}} , neg3[5:1] };

   // m3_10 = W*in
   wire signed [9:0] m3_10;
   assign m3_10 ={ {5{neg3[5]}} , neg3[5:1] };

   // m4_1 = W*in
   wire signed [9:0] m4_1;
   assign m4_1 =10'b0;

   // m4_2 = W*in
   wire signed [9:0] m4_2;
   assign m4_2 =10'b0;

   // m4_3 = W*in
   wire signed [9:0] m4_3;
   assign m4_3 =10'b0;

   // m4_4 = W*in
   wire signed [9:0] m4_4;
   assign m4_4 ={ {4{in4[5]}} , in4[5:0] };

   // m4_5 = W*in
   wire signed [9:0] m4_5;
   assign m4_5 ={ {5{neg4[5]}} , neg4[5:1] };

   // m4_6 = W*in
   wire signed [9:0] m4_6;
   assign m4_6 ={ {4{in4[5]}} , in4[5:0] };

   // m4_7 = W*in
   wire signed [9:0] m4_7;
   assign m4_7 ={ {5{neg4[5]}} , neg4[5:1] };

   // m4_8 = W*in
   wire signed [9:0] m4_8;
   assign m4_8 =10'b0;

   // m4_9 = W*in
   wire signed [9:0] m4_9;
   assign m4_9 ={ {5{neg4[5]}} , neg4[5:1] };

   // m4_10 = W*in
   wire signed [9:0] m4_10;
   assign m4_10 ={ {5{in4[5]}} , in4[5:1] };

   // m5_1 = W*in
   wire signed [9:0] m5_1;
   assign m5_1 =10'b0;

   // m5_2 = W*in
   wire signed [9:0] m5_2;
   assign m5_2 ={ {5{in5[5]}} , in5[5:1] };

   // m5_3 = W*in
   wire signed [9:0] m5_3;
   assign m5_3 ={ {5{neg5[5]}} , neg5[5:1] };

   // m5_4 = W*in
   wire signed [9:0] m5_4;
   assign m5_4 ={ {5{neg5[5]}} , neg5[5:1] };

   // m5_5 = W*in
   wire signed [9:0] m5_5;
   assign m5_5 ={ {5{neg5[5]}} , neg5[5:1] };

   // m5_6 = W*in
   wire signed [9:0] m5_6;
   assign m5_6 =10'b0;

   // m5_7 = W*in
   wire signed [9:0] m5_7;
   assign m5_7 =10'b0;

   // m5_8 = W*in
   wire signed [9:0] m5_8;
   assign m5_8 =10'b0;

   // m5_9 = W*in
   wire signed [9:0] m5_9;
   assign m5_9 ={ {5{in5[5]}} , in5[5:1] };

   // m5_10 = W*in
   wire signed [9:0] m5_10;
   assign m5_10 ={ {5{in5[5]}} , in5[5:1] };

   // m6_1 = W*in
   wire signed [9:0] m6_1;
   assign m6_1 ={ {5{neg6[5]}} , neg6[5:1] };

   // m6_2 = W*in
   wire signed [9:0] m6_2;
   assign m6_2 =10'b0;

   // m6_3 = W*in
   wire signed [9:0] m6_3;
   assign m6_3 ={ {5{in6[5]}} , in6[5:1] };

   // m6_4 = W*in
   wire signed [9:0] m6_4;
   assign m6_4 ={ {5{in6[5]}} , in6[5:1] };

   // m6_5 = W*in
   wire signed [9:0] m6_5;
   assign m6_5 ={ {5{neg6[5]}} , neg6[5:1] };

   // m6_6 = W*in
   wire signed [9:0] m6_6;
   assign m6_6 ={ {4{neg6[5]}} , neg6[5:0] };

   // m6_7 = W*in
   wire signed [9:0] m6_7;
   assign m6_7 ={ {5{neg6[5]}} , neg6[5:1] };

   // m6_8 = W*in
   wire signed [9:0] m6_8;
   assign m6_8 =10'b0;

   // m6_9 = W*in
   wire signed [9:0] m6_9;
   assign m6_9 ={ {4{in6[5]}} , in6[5:0] };

   // m6_10 = W*in
   wire signed [9:0] m6_10;
   assign m6_10 ={ {4{in6[5]}} , in6[5:0] };

   // m7_1 = W*in
   wire signed [9:0] m7_1;
   assign m7_1 ={ {5{neg7[5]}} , neg7[5:1] };

   // m7_2 = W*in
   wire signed [9:0] m7_2;
   assign m7_2 =10'b0;

   // m7_3 = W*in
   wire signed [9:0] m7_3;
   assign m7_3 ={ {5{in7[5]}} , in7[5:1] };

   // m7_4 = W*in
   wire signed [9:0] m7_4;
   assign m7_4 ={ {4{in7[5]}} , in7[5:0] };

   // m7_5 = W*in
   wire signed [9:0] m7_5;
   assign m7_5 =10'b0;

   // m7_6 = W*in
   wire signed [9:0] m7_6;
   assign m7_6 ={ {5{neg7[5]}} , neg7[5:1] };

   // m7_7 = W*in
   wire signed [9:0] m7_7;
   assign m7_7 =10'b0;

   // m7_8 = W*in
   wire signed [9:0] m7_8;
   assign m7_8 ={ {4{in7[5]}} , in7[5:0] };

   // m7_9 = W*in
   wire signed [9:0] m7_9;
   assign m7_9 =10'b0;

   // m7_10 = W*in
   wire signed [9:0] m7_10;
   assign m7_10 ={ {5{neg7[5]}} , neg7[5:1] };

   // m8_1 = W*in
   wire signed [9:0] m8_1;
   assign m8_1 =10'b0;

   // m8_2 = W*in
   wire signed [9:0] m8_2;
   assign m8_2 ={ {4{neg8[5]}} , neg8[5:0] };

   // m8_3 = W*in
   wire signed [9:0] m8_3;
   assign m8_3 =10'b0;

   // m8_4 = W*in
   wire signed [9:0] m8_4;
   assign m8_4 =10'b0;

   // m8_5 = W*in
   wire signed [9:0] m8_5;
   assign m8_5 ={ {4{in8[5]}} , in8[5:0] };

   // m8_6 = W*in
   wire signed [9:0] m8_6;
   assign m8_6 ={ {4{neg8[5]}} , neg8[5:0] };

   // m8_7 = W*in
   wire signed [9:0] m8_7;
   assign m8_7 ={ {4{neg8[5]}} , neg8[5:0] };

   // m8_8 = W*in
   wire signed [9:0] m8_8;
   assign m8_8 ={ {5{in8[5]}} , in8[5:1] };

   // m8_9 = W*in
   wire signed [9:0] m8_9;
   assign m8_9 ={ {4{in8[5]}} , in8[5:0] };

   // m8_10 = W*in
   wire signed [9:0] m8_10;
   assign m8_10 ={ {4{in8[5]}} , in8[5:0] };

   // m9_1 = W*in
   wire signed [9:0] m9_1;
   assign m9_1 =10'b0;

   // m9_2 = W*in
   wire signed [9:0] m9_2;
   assign m9_2 ={ {5{in9[5]}} , in9[5:1] };

   // m9_3 = W*in
   wire signed [9:0] m9_3;
   assign m9_3 =10'b0;

   // m9_4 = W*in
   wire signed [9:0] m9_4;
   assign m9_4 ={ {5{neg9[5]}} , neg9[5:1] };

   // m9_5 = W*in
   wire signed [9:0] m9_5;
   assign m9_5 ={ {5{in9[5]}} , in9[5:1] };

   // m9_6 = W*in
   wire signed [9:0] m9_6;
   assign m9_6 =10'b0;

   // m9_7 = W*in
   wire signed [9:0] m9_7;
   assign m9_7 ={ {4{in9[5]}} , in9[5:0] };

   // m9_8 = W*in
   wire signed [9:0] m9_8;
   assign m9_8 ={ {5{neg9[5]}} , neg9[5:1] };

   // m9_9 = W*in
   wire signed [9:0] m9_9;
   assign m9_9 =10'b0;

   // m9_10 = W*in
   wire signed [9:0] m9_10;
   assign m9_10 ={ {5{neg9[5]}} , neg9[5:1] };

   // m10_1 = W*in
   wire signed [9:0] m10_1;
   assign m10_1 =10'b0;

   // m10_2 = W*in
   wire signed [9:0] m10_2;
   assign m10_2 =10'b0;

   // m10_3 = W*in
   wire signed [9:0] m10_3;
   assign m10_3 =10'b0;

   // m10_4 = W*in
   wire signed [9:0] m10_4;
   assign m10_4 ={ {4{in10[5]}} , in10[5:0] };

   // m10_5 = W*in
   wire signed [9:0] m10_5;
   assign m10_5 ={ {5{neg10[5]}} , neg10[5:1] };

   // m10_6 = W*in
   wire signed [9:0] m10_6;
   assign m10_6 ={ {4{in10[5]}} , in10[5:0] };

   // m10_7 = W*in
   wire signed [9:0] m10_7;
   assign m10_7 ={ {5{neg10[5]}} , neg10[5:1] };

   // m10_8 = W*in
   wire signed [9:0] m10_8;
   assign m10_8 ={ {5{neg10[5]}} , neg10[5:1] };

   // m10_9 = W*in
   wire signed [9:0] m10_9;
   assign m10_9 ={ {5{neg10[5]}} , neg10[5:1] };

   // m10_10 = W*in
   wire signed [9:0] m10_10;
   assign m10_10 ={ {5{in10[5]}} , in10[5:1] };

   // m11_1 = W*in
   wire signed [9:0] m11_1;
   assign m11_1 ={ {4{neg11[5]}} , neg11[5:0] };

   // m11_2 = W*in
   wire signed [9:0] m11_2;
   assign m11_2 ={ {5{neg11[5]}} , neg11[5:1] };

   // m11_3 = W*in
   wire signed [9:0] m11_3;
   assign m11_3 ={ {4{in11[5]}} , in11[5:0] };

   // m11_4 = W*in
   wire signed [9:0] m11_4;
   assign m11_4 ={ {5{in11[5]}} , in11[5:1] };

   // m11_5 = W*in
   wire signed [9:0] m11_5;
   assign m11_5 ={ {5{neg11[5]}} , neg11[5:1] };

   // m11_6 = W*in
   wire signed [9:0] m11_6;
   assign m11_6 =10'b0;

   // m11_7 = W*in
   wire signed [9:0] m11_7;
   assign m11_7 ={ {5{in11[5]}} , in11[5:1] };

   // m11_8 = W*in
   wire signed [9:0] m11_8;
   assign m11_8 =10'b0;

   // m11_9 = W*in
   wire signed [9:0] m11_9;
   assign m11_9 ={ {4{in11[5]}} , in11[5:0] };

   // m11_10 = W*in
   wire signed [9:0] m11_10;
   assign m11_10 ={ {4{neg11[5]}} , neg11[5:0] };

   // m12_1 = W*in
   wire signed [9:0] m12_1;
   assign m12_1 ={ {5{neg12[5]}} , neg12[5:1] };

   // m12_2 = W*in
   wire signed [9:0] m12_2;
   assign m12_2 ={ {5{neg12[5]}} , neg12[5:1] };

   // m12_3 = W*in
   wire signed [9:0] m12_3;
   assign m12_3 ={ {5{neg12[5]}} , neg12[5:1] };

   // m12_4 = W*in
   wire signed [9:0] m12_4;
   assign m12_4 ={ {5{in12[5]}} , in12[5:1] };

   // m12_5 = W*in
   wire signed [9:0] m12_5;
   assign m12_5 ={ {5{in12[5]}} , in12[5:1] };

   // m12_6 = W*in
   wire signed [9:0] m12_6;
   assign m12_6 =10'b0;

   // m12_7 = W*in
   wire signed [9:0] m12_7;
   assign m12_7 =10'b0;

   // m12_8 = W*in
   wire signed [9:0] m12_8;
   assign m12_8 ={ {5{in12[5]}} , in12[5:1] };

   // m12_9 = W*in
   wire signed [9:0] m12_9;
   assign m12_9 ={ {5{neg12[5]}} , neg12[5:1] };

   // m12_10 = W*in
   wire signed [9:0] m12_10;
   assign m12_10 ={ {5{in12[5]}} , in12[5:1] };

   // m13_1 = W*in
   wire signed [9:0] m13_1;
   assign m13_1 ={ {5{in13[5]}} , in13[5:1] };

   // m13_2 = W*in
   wire signed [9:0] m13_2;
   assign m13_2 =10'b0;

   // m13_3 = W*in
   wire signed [9:0] m13_3;
   assign m13_3 =10'b0;

   // m13_4 = W*in
   wire signed [9:0] m13_4;
   assign m13_4 =10'b0;

   // m13_5 = W*in
   wire signed [9:0] m13_5;
   assign m13_5 ={ {5{neg13[5]}} , neg13[5:1] };

   // m13_6 = W*in
   wire signed [9:0] m13_6;
   assign m13_6 =10'b0;

   // m13_7 = W*in
   wire signed [9:0] m13_7;
   assign m13_7 =10'b0;

   // m13_8 = W*in
   wire signed [9:0] m13_8;
   assign m13_8 ={ {5{neg13[5]}} , neg13[5:1] };

   // m13_9 = W*in
   wire signed [9:0] m13_9;
   assign m13_9 ={ {5{in13[5]}} , in13[5:1] };

   // m13_10 = W*in
   wire signed [9:0] m13_10;
   assign m13_10 ={ {5{in13[5]}} , in13[5:1] };

   // m14_1 = W*in
   wire signed [9:0] m14_1;
   assign m14_1 ={ {4{in14[5]}} , in14[5:0] };

   // m14_2 = W*in
   wire signed [9:0] m14_2;
   assign m14_2 =10'b0;

   // m14_3 = W*in
   wire signed [9:0] m14_3;
   assign m14_3 ={ {5{in14[5]}} , in14[5:1] };

   // m14_4 = W*in
   wire signed [9:0] m14_4;
   assign m14_4 =10'b0;

   // m14_5 = W*in
   wire signed [9:0] m14_5;
   assign m14_5 =10'b0;

   // m14_6 = W*in
   wire signed [9:0] m14_6;
   assign m14_6 =10'b0;

   // m14_7 = W*in
   wire signed [9:0] m14_7;
   assign m14_7 =10'b0;

   // m14_8 = W*in
   wire signed [9:0] m14_8;
   assign m14_8 ={ {5{neg14[5]}} , neg14[5:1] };

   // m14_9 = W*in
   wire signed [9:0] m14_9;
   assign m14_9 =10'b0;

   // m14_10 = W*in
   wire signed [9:0] m14_10;
   assign m14_10 =10'b0;

   // m15_1 = W*in
   wire signed [9:0] m15_1;
   assign m15_1 ={ {4{neg15[5]}} , neg15[5:0] };

   // m15_2 = W*in
   wire signed [9:0] m15_2;
   assign m15_2 ={ {4{in15[5]}} , in15[5:0] };

   // m15_3 = W*in
   wire signed [9:0] m15_3;
   assign m15_3 ={ {5{in15[5]}} , in15[5:1] };

   // m15_4 = W*in
   wire signed [9:0] m15_4;
   assign m15_4 =10'b0;

   // m15_5 = W*in
   wire signed [9:0] m15_5;
   assign m15_5 ={ {4{in15[5]}} , in15[5:0] };

   // m15_6 = W*in
   wire signed [9:0] m15_6;
   assign m15_6 =10'b0;

   // m15_7 = W*in
   wire signed [9:0] m15_7;
   assign m15_7 =10'b0;

   // m15_8 = W*in
   wire signed [9:0] m15_8;
   assign m15_8 ={ {5{in15[5]}} , in15[5:1] };

   // m15_9 = W*in
   wire signed [9:0] m15_9;
   assign m15_9 ={ {4{neg15[5]}} , neg15[5:0] };

   // m15_10 = W*in
   wire signed [9:0] m15_10;
   assign m15_10 ={ {4{neg15[5]}} , neg15[5:0] };

   // m16_1 = W*in
   wire signed [9:0] m16_1;
   assign m16_1 =10'b0;

   // m16_2 = W*in
   wire signed [9:0] m16_2;
   assign m16_2 =10'b0;

   // m16_3 = W*in
   wire signed [9:0] m16_3;
   assign m16_3 ={ {5{in16[5]}} , in16[5:1] };

   // m16_4 = W*in
   wire signed [9:0] m16_4;
   assign m16_4 =10'b0;

   // m16_5 = W*in
   wire signed [9:0] m16_5;
   assign m16_5 ={ {5{neg16[5]}} , neg16[5:1] };

   // m16_6 = W*in
   wire signed [9:0] m16_6;
   assign m16_6 =10'b0;

   // m16_7 = W*in
   wire signed [9:0] m16_7;
   assign m16_7 ={ {4{in16[5]}} , in16[5:0] };

   // m16_8 = W*in
   wire signed [9:0] m16_8;
   assign m16_8 ={ {5{neg16[5]}} , neg16[5:1] };

   // m16_9 = W*in
   wire signed [9:0] m16_9;
   assign m16_9 ={ {5{neg16[5]}} , neg16[5:1] };

   // m16_10 = W*in
   wire signed [9:0] m16_10;
   assign m16_10 =10'b0;

   // m17_1 = W*in
   wire signed [9:0] m17_1;
   assign m17_1 =10'b0;

   // m17_2 = W*in
   wire signed [9:0] m17_2;
   assign m17_2 ={ {4{in17[5]}} , in17[5:0] };

   // m17_3 = W*in
   wire signed [9:0] m17_3;
   assign m17_3 ={ {5{neg17[5]}} , neg17[5:1] };

   // m17_4 = W*in
   wire signed [9:0] m17_4;
   assign m17_4 ={ {4{in17[5]}} , in17[5:0] };

   // m17_5 = W*in
   wire signed [9:0] m17_5;
   assign m17_5 ={ {5{neg17[5]}} , neg17[5:1] };

   // m17_6 = W*in
   wire signed [9:0] m17_6;
   assign m17_6 =10'b0;

   // m17_7 = W*in
   wire signed [9:0] m17_7;
   assign m17_7 =10'b0;

   // m17_8 = W*in
   wire signed [9:0] m17_8;
   assign m17_8 ={ {5{neg17[5]}} , neg17[5:1] };

   // m17_9 = W*in
   wire signed [9:0] m17_9;
   assign m17_9 ={ {5{neg17[5]}} , neg17[5:1] };

   // m17_10 = W*in
   wire signed [9:0] m17_10;
   assign m17_10 ={ {4{in17[5]}} , in17[5:0] };

   // m18_1 = W*in
   wire signed [9:0] m18_1;
   assign m18_1 ={ {5{neg18[5]}} , neg18[5:1] };

   // m18_2 = W*in
   wire signed [9:0] m18_2;
   assign m18_2 ={ {4{in18[5]}} , in18[5:0] };

   // m18_3 = W*in
   wire signed [9:0] m18_3;
   assign m18_3 =10'b0;

   // m18_4 = W*in
   wire signed [9:0] m18_4;
   assign m18_4 ={ {5{neg18[5]}} , neg18[5:1] };

   // m18_5 = W*in
   wire signed [9:0] m18_5;
   assign m18_5 ={ {5{neg18[5]}} , neg18[5:1] };

   // m18_6 = W*in
   wire signed [9:0] m18_6;
   assign m18_6 ={ {4{in18[5]}} , in18[5:0] };

   // m18_7 = W*in
   wire signed [9:0] m18_7;
   assign m18_7 ={ {4{in18[5]}} , in18[5:0] };

   // m18_8 = W*in
   wire signed [9:0] m18_8;
   assign m18_8 ={ {5{neg18[5]}} , neg18[5:1] };

   // m18_9 = W*in
   wire signed [9:0] m18_9;
   assign m18_9 ={ {4{in18[5]}} , in18[5:0] };

   // m18_10 = W*in
   wire signed [9:0] m18_10;
   assign m18_10 ={ {5{neg18[5]}} , neg18[5:1] };

   // m19_1 = W*in
   wire signed [9:0] m19_1;
   assign m19_1 =10'b0;

   // m19_2 = W*in
   wire signed [9:0] m19_2;
   assign m19_2 ={ {4{in19[5]}} , in19[5:0] };

   // m19_3 = W*in
   wire signed [9:0] m19_3;
   assign m19_3 =10'b0;

   // m19_4 = W*in
   wire signed [9:0] m19_4;
   assign m19_4 ={ {4{neg19[5]}} , neg19[5:0] };

   // m19_5 = W*in
   wire signed [9:0] m19_5;
   assign m19_5 ={ {5{neg19[5]}} , neg19[5:1] };

   // m19_6 = W*in
   wire signed [9:0] m19_6;
   assign m19_6 =10'b0;

   // m19_7 = W*in
   wire signed [9:0] m19_7;
   assign m19_7 =10'b0;

   // m19_8 = W*in
   wire signed [9:0] m19_8;
   assign m19_8 =10'b0;

   // m19_9 = W*in
   wire signed [9:0] m19_9;
   assign m19_9 ={ {5{in19[5]}} , in19[5:1] };

   // m19_10 = W*in
   wire signed [9:0] m19_10;
   assign m19_10 ={ {5{neg19[5]}} , neg19[5:1] };

   // m20_1 = W*in
   wire signed [9:0] m20_1;
   assign m20_1 =10'b0;

   // m20_2 = W*in
   wire signed [9:0] m20_2;
   assign m20_2 ={ {5{neg20[5]}} , neg20[5:1] };

   // m20_3 = W*in
   wire signed [9:0] m20_3;
   assign m20_3 ={ {5{neg20[5]}} , neg20[5:1] };

   // m20_4 = W*in
   wire signed [9:0] m20_4;
   assign m20_4 ={ {4{in20[5]}} , in20[5:0] };

   // m20_5 = W*in
   wire signed [9:0] m20_5;
   assign m20_5 ={ {5{neg20[5]}} , neg20[5:1] };

   // m20_6 = W*in
   wire signed [9:0] m20_6;
   assign m20_6 ={ {4{in20[5]}} , in20[5:0] };

   // m20_7 = W*in
   wire signed [9:0] m20_7;
   assign m20_7 =10'b0;

   // m20_8 = W*in
   wire signed [9:0] m20_8;
   assign m20_8 ={ {4{in20[5]}} , in20[5:0] };

   // m20_9 = W*in
   wire signed [9:0] m20_9;
   assign m20_9 ={ {4{neg20[5]}} , neg20[5:0] };

   // m20_10 = W*in
   wire signed [9:0] m20_10;
   assign m20_10 ={ {4{in20[5]}} , in20[5:0] };

   // m21_1 = W*in
   wire signed [9:0] m21_1;
   assign m21_1 =10'b0;

   // m21_2 = W*in
   wire signed [9:0] m21_2;
   assign m21_2 ={ {4{in21[5]}} , in21[5:0] };

   // m21_3 = W*in
   wire signed [9:0] m21_3;
   assign m21_3 =10'b0;

   // m21_4 = W*in
   wire signed [9:0] m21_4;
   assign m21_4 ={ {5{neg21[5]}} , neg21[5:1] };

   // m21_5 = W*in
   wire signed [9:0] m21_5;
   assign m21_5 ={ {4{neg21[5]}} , neg21[5:0] };

   // m21_6 = W*in
   wire signed [9:0] m21_6;
   assign m21_6 =10'b0;

   // m21_7 = W*in
   wire signed [9:0] m21_7;
   assign m21_7 =10'b0;

   // m21_8 = W*in
   wire signed [9:0] m21_8;
   assign m21_8 ={ {5{neg21[5]}} , neg21[5:1] };

   // m21_9 = W*in
   wire signed [9:0] m21_9;
   assign m21_9 ={ {5{in21[5]}} , in21[5:1] };

   // m21_10 = W*in
   wire signed [9:0] m21_10;
   assign m21_10 ={ {5{in21[5]}} , in21[5:1] };

   // m22_1 = W*in
   wire signed [9:0] m22_1;
   assign m22_1 ={ {5{neg22[5]}} , neg22[5:1] };

   // m22_2 = W*in
   wire signed [9:0] m22_2;
   assign m22_2 ={ {4{in22[5]}} , in22[5:0] };

   // m22_3 = W*in
   wire signed [9:0] m22_3;
   assign m22_3 ={ {4{neg22[5]}} , neg22[5:0] };

   // m22_4 = W*in
   wire signed [9:0] m22_4;
   assign m22_4 ={ {5{in22[5]}} , in22[5:1] };

   // m22_5 = W*in
   wire signed [9:0] m22_5;
   assign m22_5 ={ {5{neg22[5]}} , neg22[5:1] };

   // m22_6 = W*in
   wire signed [9:0] m22_6;
   assign m22_6 ={ {4{in22[5]}} , in22[5:0] };

   // m22_7 = W*in
   wire signed [9:0] m22_7;
   assign m22_7 =10'b0;

   // m22_8 = W*in
   wire signed [9:0] m22_8;
   assign m22_8 =10'b0;

   // m22_9 = W*in
   wire signed [9:0] m22_9;
   assign m22_9 =10'b0;

   // m22_10 = W*in
   wire signed [9:0] m22_10;
   assign m22_10 ={ {5{neg22[5]}} , neg22[5:1] };

   // m23_1 = W*in
   wire signed [9:0] m23_1;
   assign m23_1 ={ {5{in23[5]}} , in23[5:1] };

   // m23_2 = W*in
   wire signed [9:0] m23_2;
   assign m23_2 ={ {5{neg23[5]}} , neg23[5:1] };

   // m23_3 = W*in
   wire signed [9:0] m23_3;
   assign m23_3 ={ {5{neg23[5]}} , neg23[5:1] };

   // m23_4 = W*in
   wire signed [9:0] m23_4;
   assign m23_4 =10'b0;

   // m23_5 = W*in
   wire signed [9:0] m23_5;
   assign m23_5 ={ {4{in23[5]}} , in23[5:0] };

   // m23_6 = W*in
   wire signed [9:0] m23_6;
   assign m23_6 =10'b0;

   // m23_7 = W*in
   wire signed [9:0] m23_7;
   assign m23_7 =10'b0;

   // m23_8 = W*in
   wire signed [9:0] m23_8;
   assign m23_8 ={ {5{neg23[5]}} , neg23[5:1] };

   // m23_9 = W*in
   wire signed [9:0] m23_9;
   assign m23_9 =10'b0;

   // m23_10 = W*in
   wire signed [9:0] m23_10;
   assign m23_10 ={ {4{in23[5]}} , in23[5:0] };

   // m24_1 = W*in
   wire signed [9:0] m24_1;
   assign m24_1 ={ {4{in24[5]}} , in24[5:0] };

   // m24_2 = W*in
   wire signed [9:0] m24_2;
   assign m24_2 =10'b0;

   // m24_3 = W*in
   wire signed [9:0] m24_3;
   assign m24_3 =10'b0;

   // m24_4 = W*in
   wire signed [9:0] m24_4;
   assign m24_4 ={ {5{neg24[5]}} , neg24[5:1] };

   // m24_5 = W*in
   wire signed [9:0] m24_5;
   assign m24_5 ={ {5{neg24[5]}} , neg24[5:1] };

   // m24_6 = W*in
   wire signed [9:0] m24_6;
   assign m24_6 =10'b0;

   // m24_7 = W*in
   wire signed [9:0] m24_7;
   assign m24_7 =10'b0;

   // m24_8 = W*in
   wire signed [9:0] m24_8;
   assign m24_8 ={ {4{in24[5]}} , in24[5:0] };

   // m24_9 = W*in
   wire signed [9:0] m24_9;
   assign m24_9 =10'b0;

   // m24_10 = W*in
   wire signed [9:0] m24_10;
   assign m24_10 ={ {4{in24[5]}} , in24[5:0] };

   // m25_1 = W*in
   wire signed [9:0] m25_1;
   assign m25_1 ={ {5{in25[5]}} , in25[5:1] };

   // m25_2 = W*in
   wire signed [9:0] m25_2;
   assign m25_2 ={ {5{in25[5]}} , in25[5:1] };

   // m25_3 = W*in
   wire signed [9:0] m25_3;
   assign m25_3 ={ {5{in25[5]}} , in25[5:1] };

   // m25_4 = W*in
   wire signed [9:0] m25_4;
   assign m25_4 ={ {5{neg25[5]}} , neg25[5:1] };

   // m25_5 = W*in
   wire signed [9:0] m25_5;
   assign m25_5 ={ {4{in25[5]}} , in25[5:0] };

   // m25_6 = W*in
   wire signed [9:0] m25_6;
   assign m25_6 ={ {5{neg25[5]}} , neg25[5:1] };

   // m25_7 = W*in
   wire signed [9:0] m25_7;
   assign m25_7 ={ {4{neg25[5]}} , neg25[5:0] };

   // m25_8 = W*in
   wire signed [9:0] m25_8;
   assign m25_8 ={ {5{neg25[5]}} , neg25[5:1] };

   // m25_9 = W*in
   wire signed [9:0] m25_9;
   assign m25_9 ={ {5{neg25[5]}} , neg25[5:1] };

   // m25_10 = W*in
   wire signed [9:0] m25_10;
   assign m25_10 ={ {5{in25[5]}} , in25[5:1] };

   // m26_1 = W*in
   wire signed [9:0] m26_1;
   assign m26_1 =10'b0;

   // m26_2 = W*in
   wire signed [9:0] m26_2;
   assign m26_2 =10'b0;

   // m26_3 = W*in
   wire signed [9:0] m26_3;
   assign m26_3 =10'b0;

   // m26_4 = W*in
   wire signed [9:0] m26_4;
   assign m26_4 =10'b0;

   // m26_5 = W*in
   wire signed [9:0] m26_5;
   assign m26_5 =10'b0;

   // m26_6 = W*in
   wire signed [9:0] m26_6;
   assign m26_6 =10'b0;

   // m26_7 = W*in
   wire signed [9:0] m26_7;
   assign m26_7 =10'b0;

   // m26_8 = W*in
   wire signed [9:0] m26_8;
   assign m26_8 =10'b0;

   // m26_9 = W*in
   wire signed [9:0] m26_9;
   assign m26_9 ={ {5{in26[5]}} , in26[5:1] };

   // m26_10 = W*in
   wire signed [9:0] m26_10;
   assign m26_10 =10'b0;

   // m27_1 = W*in
   wire signed [9:0] m27_1;
   assign m27_1 ={ {4{in27[5]}} , in27[5:0] };

   // m27_2 = W*in
   wire signed [9:0] m27_2;
   assign m27_2 =10'b0;

   // m27_3 = W*in
   wire signed [9:0] m27_3;
   assign m27_3 ={ {5{neg27[5]}} , neg27[5:1] };

   // m27_4 = W*in
   wire signed [9:0] m27_4;
   assign m27_4 ={ {5{neg27[5]}} , neg27[5:1] };

   // m27_5 = W*in
   wire signed [9:0] m27_5;
   assign m27_5 =10'b0;

   // m27_6 = W*in
   wire signed [9:0] m27_6;
   assign m27_6 ={ {5{neg27[5]}} , neg27[5:1] };

   // m27_7 = W*in
   wire signed [9:0] m27_7;
   assign m27_7 ={ {4{in27[5]}} , in27[5:0] };

   // m27_8 = W*in
   wire signed [9:0] m27_8;
   assign m27_8 ={ {5{neg27[5]}} , neg27[5:1] };

   // m27_9 = W*in
   wire signed [9:0] m27_9;
   assign m27_9 ={ {5{in27[5]}} , in27[5:1] };

   // m27_10 = W*in
   wire signed [9:0] m27_10;
   assign m27_10 =10'b0;

   // m28_1 = W*in
   wire signed [9:0] m28_1;
   assign m28_1 ={ {4{in28[5]}} , in28[5:0] };

   // m28_2 = W*in
   wire signed [9:0] m28_2;
   assign m28_2 =10'b0;

   // m28_3 = W*in
   wire signed [9:0] m28_3;
   assign m28_3 =10'b0;

   // m28_4 = W*in
   wire signed [9:0] m28_4;
   assign m28_4 =10'b0;

   // m28_5 = W*in
   wire signed [9:0] m28_5;
   assign m28_5 ={ {5{neg28[5]}} , neg28[5:1] };

   // m28_6 = W*in
   wire signed [9:0] m28_6;
   assign m28_6 ={ {5{neg28[5]}} , neg28[5:1] };

   // m28_7 = W*in
   wire signed [9:0] m28_7;
   assign m28_7 =10'b0;

   // m28_8 = W*in
   wire signed [9:0] m28_8;
   assign m28_8 ={ {5{in28[5]}} , in28[5:1] };

   // m28_9 = W*in
   wire signed [9:0] m28_9;
   assign m28_9 =10'b0;

   // m28_10 = W*in
   wire signed [9:0] m28_10;
   assign m28_10 ={ {5{in28[5]}} , in28[5:1] };

   // m29_1 = W*in
   wire signed [9:0] m29_1;
   assign m29_1 ={ {5{neg29[5]}} , neg29[5:1] };

   // m29_2 = W*in
   wire signed [9:0] m29_2;
   assign m29_2 ={ {5{neg29[5]}} , neg29[5:1] };

   // m29_3 = W*in
   wire signed [9:0] m29_3;
   assign m29_3 ={ {4{neg29[5]}} , neg29[5:0] };

   // m29_4 = W*in
   wire signed [9:0] m29_4;
   assign m29_4 ={ {4{in29[5]}} , in29[5:0] };

   // m29_5 = W*in
   wire signed [9:0] m29_5;
   assign m29_5 ={ {5{neg29[5]}} , neg29[5:1] };

   // m29_6 = W*in
   wire signed [9:0] m29_6;
   assign m29_6 ={ {4{in29[5]}} , in29[5:0] };

   // m29_7 = W*in
   wire signed [9:0] m29_7;
   assign m29_7 =10'b0;

   // m29_8 = W*in
   wire signed [9:0] m29_8;
   assign m29_8 ={ {4{in29[5]}} , in29[5:0] };

   // m29_9 = W*in
   wire signed [9:0] m29_9;
   assign m29_9 ={ {4{neg29[5]}} , neg29[5:0] };

   // m29_10 = W*in
   wire signed [9:0] m29_10;
   assign m29_10 ={ {4{in29[5]}} , in29[5:0] };

   // m30_1 = W*in
   wire signed [9:0] m30_1;
   assign m30_1 ={ {4{in30[5]}} , in30[5:0] };

   // m30_2 = W*in
   wire signed [9:0] m30_2;
   assign m30_2 ={ {4{neg30[5]}} , neg30[5:0] };

   // m30_3 = W*in
   wire signed [9:0] m30_3;
   assign m30_3 ={ {4{in30[5]}} , in30[5:0] };

   // m30_4 = W*in
   wire signed [9:0] m30_4;
   assign m30_4 ={ {5{neg30[5]}} , neg30[5:1] };

   // m30_5 = W*in
   wire signed [9:0] m30_5;
   assign m30_5 ={ {4{in30[5]}} , in30[5:0] };

   // m30_6 = W*in
   wire signed [9:0] m30_6;
   assign m30_6 ={ {5{neg30[5]}} , neg30[5:1] };

   // m30_7 = W*in
   wire signed [9:0] m30_7;
   assign m30_7 ={ {4{in30[5]}} , in30[5:0] };

   // m30_8 = W*in
   wire signed [9:0] m30_8;
   assign m30_8 ={ {5{neg30[5]}} , neg30[5:1] };

   // m30_9 = W*in
   wire signed [9:0] m30_9;
   assign m30_9 ={ {5{neg30[5]}} , neg30[5:1] };

   // m30_10 = W*in
   wire signed [9:0] m30_10;
   assign m30_10 =10'b0;

   // m31_1 = W*in
   wire signed [9:0] m31_1;
   assign m31_1 ={ {5{in31[5]}} , in31[5:1] };

   // m31_2 = W*in
   wire signed [9:0] m31_2;
   assign m31_2 ={ {5{neg31[5]}} , neg31[5:1] };

   // m31_3 = W*in
   wire signed [9:0] m31_3;
   assign m31_3 =10'b0;

   // m31_4 = W*in
   wire signed [9:0] m31_4;
   assign m31_4 ={ {5{in31[5]}} , in31[5:1] };

   // m31_5 = W*in
   wire signed [9:0] m31_5;
   assign m31_5 ={ {5{neg31[5]}} , neg31[5:1] };

   // m31_6 = W*in
   wire signed [9:0] m31_6;
   assign m31_6 ={ {5{in31[5]}} , in31[5:1] };

   // m31_7 = W*in
   wire signed [9:0] m31_7;
   assign m31_7 =10'b0;

   // m31_8 = W*in
   wire signed [9:0] m31_8;
   assign m31_8 ={ {4{neg31[5]}} , neg31[5:0] };

   // m31_9 = W*in
   wire signed [9:0] m31_9;
   assign m31_9 ={ {5{in31[5]}} , in31[5:1] };

   // m31_10 = W*in
   wire signed [9:0] m31_10;
   assign m31_10 ={ {4{neg31[5]}} , neg31[5:0] };

   // m32_1 = W*in
   wire signed [9:0] m32_1;
   assign m32_1 ={ {4{in32[5]}} , in32[5:0] };

   // m32_2 = W*in
   wire signed [9:0] m32_2;
   assign m32_2 ={ {4{in32[5]}} , in32[5:0] };

   // m32_3 = W*in
   wire signed [9:0] m32_3;
   assign m32_3 ={ {5{in32[5]}} , in32[5:1] };

   // m32_4 = W*in
   wire signed [9:0] m32_4;
   assign m32_4 ={ {5{neg32[5]}} , neg32[5:1] };

   // m32_5 = W*in
   wire signed [9:0] m32_5;
   assign m32_5 ={ {5{neg32[5]}} , neg32[5:1] };

   // m32_6 = W*in
   wire signed [9:0] m32_6;
   assign m32_6 ={ {5{neg32[5]}} , neg32[5:1] };

   // m32_7 = W*in
   wire signed [9:0] m32_7;
   assign m32_7 ={ {4{in32[5]}} , in32[5:0] };

   // m32_8 = W*in
   wire signed [9:0] m32_8;
   assign m32_8 ={ {5{neg32[5]}} , neg32[5:1] };

   // m32_9 = W*in
   wire signed [9:0] m32_9;
   assign m32_9 ={ {5{neg32[5]}} , neg32[5:1] };

   // m32_10 = W*in
   wire signed [9:0] m32_10;
   assign m32_10 =10'b0;

   // m33_1 = W*in
   wire signed [9:0] m33_1;
   assign m33_1 =10'b0;

   // m33_2 = W*in
   wire signed [9:0] m33_2;
   assign m33_2 ={ {5{neg33[5]}} , neg33[5:1] };

   // m33_3 = W*in
   wire signed [9:0] m33_3;
   assign m33_3 ={ {4{in33[5]}} , in33[5:0] };

   // m33_4 = W*in
   wire signed [9:0] m33_4;
   assign m33_4 =10'b0;

   // m33_5 = W*in
   wire signed [9:0] m33_5;
   assign m33_5 =10'b0;

   // m33_6 = W*in
   wire signed [9:0] m33_6;
   assign m33_6 ={ {5{neg33[5]}} , neg33[5:1] };

   // m33_7 = W*in
   wire signed [9:0] m33_7;
   assign m33_7 =10'b0;

   // m33_8 = W*in
   wire signed [9:0] m33_8;
   assign m33_8 ={ {5{neg33[5]}} , neg33[5:1] };

   // m33_9 = W*in
   wire signed [9:0] m33_9;
   assign m33_9 ={ {4{in33[5]}} , in33[5:0] };

   // m33_10 = W*in
   wire signed [9:0] m33_10;
   assign m33_10 ={ {4{in33[5]}} , in33[5:0] };

   // m34_1 = W*in
   wire signed [9:0] m34_1;
   assign m34_1 ={ {5{in34[5]}} , in34[5:1] };

   // m34_2 = W*in
   wire signed [9:0] m34_2;
   assign m34_2 ={ {5{neg34[5]}} , neg34[5:1] };

   // m34_3 = W*in
   wire signed [9:0] m34_3;
   assign m34_3 ={ {5{in34[5]}} , in34[5:1] };

   // m34_4 = W*in
   wire signed [9:0] m34_4;
   assign m34_4 ={ {4{in34[5]}} , in34[5:0] };

   // m34_5 = W*in
   wire signed [9:0] m34_5;
   assign m34_5 ={ {4{neg34[5]}} , neg34[5:0] };

   // m34_6 = W*in
   wire signed [9:0] m34_6;
   assign m34_6 ={ {5{in34[5]}} , in34[5:1] };

   // m34_7 = W*in
   wire signed [9:0] m34_7;
   assign m34_7 =10'b0;

   // m34_8 = W*in
   wire signed [9:0] m34_8;
   assign m34_8 ={ {5{neg34[5]}} , neg34[5:1] };

   // m34_9 = W*in
   wire signed [9:0] m34_9;
   assign m34_9 ={ {5{in34[5]}} , in34[5:1] };

   // m34_10 = W*in
   wire signed [9:0] m34_10;
   assign m34_10 =10'b0;

   // m35_1 = W*in
   wire signed [9:0] m35_1;
   assign m35_1 ={ {4{in35[5]}} , in35[5:0] };

   // m35_2 = W*in
   wire signed [9:0] m35_2;
   assign m35_2 =10'b0;

   // m35_3 = W*in
   wire signed [9:0] m35_3;
   assign m35_3 =10'b0;

   // m35_4 = W*in
   wire signed [9:0] m35_4;
   assign m35_4 =10'b0;

   // m35_5 = W*in
   wire signed [9:0] m35_5;
   assign m35_5 =10'b0;

   // m35_6 = W*in
   wire signed [9:0] m35_6;
   assign m35_6 =10'b0;

   // m35_7 = W*in
   wire signed [9:0] m35_7;
   assign m35_7 ={ {4{in35[5]}} , in35[5:0] };

   // m35_8 = W*in
   wire signed [9:0] m35_8;
   assign m35_8 =10'b0;

   // m35_9 = W*in
   wire signed [9:0] m35_9;
   assign m35_9 ={ {5{neg35[5]}} , neg35[5:1] };

   // m35_10 = W*in
   wire signed [9:0] m35_10;
   assign m35_10 =10'b0;

   // m36_1 = W*in
   wire signed [9:0] m36_1;
   assign m36_1 ={ {5{neg36[5]}} , neg36[5:1] };

   // m36_2 = W*in
   wire signed [9:0] m36_2;
   assign m36_2 ={ {4{neg36[5]}} , neg36[5:0] };

   // m36_3 = W*in
   wire signed [9:0] m36_3;
   assign m36_3 ={ {5{neg36[5]}} , neg36[5:1] };

   // m36_4 = W*in
   wire signed [9:0] m36_4;
   assign m36_4 ={ {5{neg36[5]}} , neg36[5:1] };

   // m36_5 = W*in
   wire signed [9:0] m36_5;
   assign m36_5 ={ {4{in36[5]}} , in36[5:0] };

   // m36_6 = W*in
   wire signed [9:0] m36_6;
   assign m36_6 ={ {5{in36[5]}} , in36[5:1] };

   // m36_7 = W*in
   wire signed [9:0] m36_7;
   assign m36_7 ={ {4{in36[5]}} , in36[5:0] };

   // m36_8 = W*in
   wire signed [9:0] m36_8;
   assign m36_8 ={ {5{neg36[5]}} , neg36[5:1] };

   // m36_9 = W*in
   wire signed [9:0] m36_9;
   assign m36_9 ={ {5{in36[5]}} , in36[5:1] };

   // m36_10 = W*in
   wire signed [9:0] m36_10;
   assign m36_10 ={ {5{in36[5]}} , in36[5:1] };

   // m37_1 = W*in
   wire signed [9:0] m37_1;
   assign m37_1 ={ {4{in37[5]}} , in37[5:0] };

   // m37_2 = W*in
   wire signed [9:0] m37_2;
   assign m37_2 =10'b0;

   // m37_3 = W*in
   wire signed [9:0] m37_3;
   assign m37_3 ={ {4{in37[5]}} , in37[5:0] };

   // m37_4 = W*in
   wire signed [9:0] m37_4;
   assign m37_4 ={ {5{neg37[5]}} , neg37[5:1] };

   // m37_5 = W*in
   wire signed [9:0] m37_5;
   assign m37_5 ={ {5{neg37[5]}} , neg37[5:1] };

   // m37_6 = W*in
   wire signed [9:0] m37_6;
   assign m37_6 =10'b0;

   // m37_7 = W*in
   wire signed [9:0] m37_7;
   assign m37_7 =10'b0;

   // m37_8 = W*in
   wire signed [9:0] m37_8;
   assign m37_8 ={ {4{in37[5]}} , in37[5:0] };

   // m37_9 = W*in
   wire signed [9:0] m37_9;
   assign m37_9 ={ {4{in37[5]}} , in37[5:0] };

   // m37_10 = W*in
   wire signed [9:0] m37_10;
   assign m37_10 =10'b0;

   // m38_1 = W*in
   wire signed [9:0] m38_1;
   assign m38_1 ={ {5{neg38[5]}} , neg38[5:1] };

   // m38_2 = W*in
   wire signed [9:0] m38_2;
   assign m38_2 ={ {5{neg38[5]}} , neg38[5:1] };

   // m38_3 = W*in
   wire signed [9:0] m38_3;
   assign m38_3 ={ {5{neg38[5]}} , neg38[5:1] };

   // m38_4 = W*in
   wire signed [9:0] m38_4;
   assign m38_4 ={ {5{neg38[5]}} , neg38[5:1] };

   // m38_5 = W*in
   wire signed [9:0] m38_5;
   assign m38_5 ={ {4{in38[5]}} , in38[5:0] };

   // m38_6 = W*in
   wire signed [9:0] m38_6;
   assign m38_6 ={ {4{in38[5]}} , in38[5:0] };

   // m38_7 = W*in
   wire signed [9:0] m38_7;
   assign m38_7 =10'b0;

   // m38_8 = W*in
   wire signed [9:0] m38_8;
   assign m38_8 ={ {5{neg38[5]}} , neg38[5:1] };

   // m38_9 = W*in
   wire signed [9:0] m38_9;
   assign m38_9 ={ {4{in38[5]}} , in38[5:0] };

   // m38_10 = W*in
   wire signed [9:0] m38_10;
   assign m38_10 ={ {4{in38[5]}} , in38[5:0] };

   // m39_1 = W*in
   wire signed [9:0] m39_1;
   assign m39_1 ={ {4{in39[5]}} , in39[5:0] };

   // m39_2 = W*in
   wire signed [9:0] m39_2;
   assign m39_2 ={ {4{neg39[5]}} , neg39[5:0] };

   // m39_3 = W*in
   wire signed [9:0] m39_3;
   assign m39_3 ={ {5{neg39[5]}} , neg39[5:1] };

   // m39_4 = W*in
   wire signed [9:0] m39_4;
   assign m39_4 ={ {5{neg39[5]}} , neg39[5:1] };

   // m39_5 = W*in
   wire signed [9:0] m39_5;
   assign m39_5 ={ {4{in39[5]}} , in39[5:0] };

   // m39_6 = W*in
   wire signed [9:0] m39_6;
   assign m39_6 ={ {5{in39[5]}} , in39[5:1] };

   // m39_7 = W*in
   wire signed [9:0] m39_7;
   assign m39_7 ={ {4{neg39[5]}} , neg39[5:0] };

   // m39_8 = W*in
   wire signed [9:0] m39_8;
   assign m39_8 =10'b0;

   // m39_9 = W*in
   wire signed [9:0] m39_9;
   assign m39_9 ={ {5{neg39[5]}} , neg39[5:1] };

   // m39_10 = W*in
   wire signed [9:0] m39_10;
   assign m39_10 ={ {4{in39[5]}} , in39[5:0] };

   // m40_1 = W*in
   wire signed [9:0] m40_1;
   assign m40_1 ={ {5{neg40[5]}} , neg40[5:1] };

   // m40_2 = W*in
   wire signed [9:0] m40_2;
   assign m40_2 ={ {4{in40[5]}} , in40[5:0] };

   // m40_3 = W*in
   wire signed [9:0] m40_3;
   assign m40_3 ={ {4{in40[5]}} , in40[5:0] };

   // m40_4 = W*in
   wire signed [9:0] m40_4;
   assign m40_4 ={ {5{neg40[5]}} , neg40[5:1] };

   // m40_5 = W*in
   wire signed [9:0] m40_5;
   assign m40_5 =10'b0;

   // m40_6 = W*in
   wire signed [9:0] m40_6;
   assign m40_6 =10'b0;

   // m40_7 = W*in
   wire signed [9:0] m40_7;
   assign m40_7 =10'b0;

   // m40_8 = W*in
   wire signed [9:0] m40_8;
   assign m40_8 ={ {4{in40[5]}} , in40[5:0] };

   // m40_9 = W*in
   wire signed [9:0] m40_9;
   assign m40_9 ={ {5{neg40[5]}} , neg40[5:1] };

   // m40_10 = W*in
   wire signed [9:0] m40_10;
   assign m40_10 =10'b0;

   // m41_1 = W*in
   wire signed [9:0] m41_1;
   assign m41_1 ={ {4{neg41[5]}} , neg41[5:0] };

   // m41_2 = W*in
   wire signed [9:0] m41_2;
   assign m41_2 ={ {5{neg41[5]}} , neg41[5:1] };

   // m41_3 = W*in
   wire signed [9:0] m41_3;
   assign m41_3 ={ {4{in41[5]}} , in41[5:0] };

   // m41_4 = W*in
   wire signed [9:0] m41_4;
   assign m41_4 ={ {5{in41[5]}} , in41[5:1] };

   // m41_5 = W*in
   wire signed [9:0] m41_5;
   assign m41_5 ={ {5{neg41[5]}} , neg41[5:1] };

   // m41_6 = W*in
   wire signed [9:0] m41_6;
   assign m41_6 ={ {4{in41[5]}} , in41[5:0] };

   // m41_7 = W*in
   wire signed [9:0] m41_7;
   assign m41_7 ={ {4{in41[5]}} , in41[5:0] };

   // m41_8 = W*in
   wire signed [9:0] m41_8;
   assign m41_8 ={ {5{neg41[5]}} , neg41[5:1] };

   // m41_9 = W*in
   wire signed [9:0] m41_9;
   assign m41_9 ={ {4{in41[5]}} , in41[5:0] };

   // m41_10 = W*in
   wire signed [9:0] m41_10;
   assign m41_10 ={ {4{neg41[5]}} , neg41[5:0] };

   // m42_1 = W*in
   wire signed [9:0] m42_1;
   assign m42_1 ={ {5{neg42[5]}} , neg42[5:1] };

   // m42_2 = W*in
   wire signed [9:0] m42_2;
   assign m42_2 ={ {4{in42[5]}} , in42[5:0] };

   // m42_3 = W*in
   wire signed [9:0] m42_3;
   assign m42_3 ={ {5{neg42[5]}} , neg42[5:1] };

   // m42_4 = W*in
   wire signed [9:0] m42_4;
   assign m42_4 ={ {4{neg42[5]}} , neg42[5:0] };

   // m42_5 = W*in
   wire signed [9:0] m42_5;
   assign m42_5 ={ {5{in42[5]}} , in42[5:1] };

   // m42_6 = W*in
   wire signed [9:0] m42_6;
   assign m42_6 =10'b0;

   // m42_7 = W*in
   wire signed [9:0] m42_7;
   assign m42_7 ={ {5{in42[5]}} , in42[5:1] };

   // m42_8 = W*in
   wire signed [9:0] m42_8;
   assign m42_8 ={ {4{neg42[5]}} , neg42[5:0] };

   // m42_9 = W*in
   wire signed [9:0] m42_9;
   assign m42_9 =10'b0;

   // m42_10 = W*in
   wire signed [9:0] m42_10;
   assign m42_10 =10'b0;

   // m43_1 = W*in
   wire signed [9:0] m43_1;
   assign m43_1 ={ {4{in43[5]}} , in43[5:0] };

   // m43_2 = W*in
   wire signed [9:0] m43_2;
   assign m43_2 ={ {5{in43[5]}} , in43[5:1] };

   // m43_3 = W*in
   wire signed [9:0] m43_3;
   assign m43_3 ={ {4{in43[5]}} , in43[5:0] };

   // m43_4 = W*in
   wire signed [9:0] m43_4;
   assign m43_4 ={ {5{neg43[5]}} , neg43[5:1] };

   // m43_5 = W*in
   wire signed [9:0] m43_5;
   assign m43_5 ={ {4{in43[5]}} , in43[5:0] };

   // m43_6 = W*in
   wire signed [9:0] m43_6;
   assign m43_6 =10'b0;

   // m43_7 = W*in
   wire signed [9:0] m43_7;
   assign m43_7 =10'b0;

   // m43_8 = W*in
   wire signed [9:0] m43_8;
   assign m43_8 ={ {5{neg43[5]}} , neg43[5:1] };

   // m43_9 = W*in
   wire signed [9:0] m43_9;
   assign m43_9 ={ {5{neg43[5]}} , neg43[5:1] };

   // m43_10 = W*in
   wire signed [9:0] m43_10;
   assign m43_10 =10'b0;

   // m44_1 = W*in
   wire signed [9:0] m44_1;
   assign m44_1 =10'b0;

   // m44_2 = W*in
   wire signed [9:0] m44_2;
   assign m44_2 =10'b0;

   // m44_3 = W*in
   wire signed [9:0] m44_3;
   assign m44_3 =10'b0;

   // m44_4 = W*in
   wire signed [9:0] m44_4;
   assign m44_4 ={ {5{neg44[5]}} , neg44[5:1] };

   // m44_5 = W*in
   wire signed [9:0] m44_5;
   assign m44_5 ={ {3{in44[5]}} , in44 , {1{1'b0}} };

   // m44_6 = W*in
   wire signed [9:0] m44_6;
   assign m44_6 =10'b0;

   // m44_7 = W*in
   wire signed [9:0] m44_7;
   assign m44_7 =10'b0;

   // m44_8 = W*in
   wire signed [9:0] m44_8;
   assign m44_8 ={ {4{in44[5]}} , in44[5:0] };

   // m44_9 = W*in
   wire signed [9:0] m44_9;
   assign m44_9 =10'b0;

   // m44_10 = W*in
   wire signed [9:0] m44_10;
   assign m44_10 =10'b0;

   // m45_1 = W*in
   wire signed [9:0] m45_1;
   assign m45_1 ={ {4{in45[5]}} , in45[5:0] };

   // m45_2 = W*in
   wire signed [9:0] m45_2;
   assign m45_2 ={ {5{neg45[5]}} , neg45[5:1] };

   // m45_3 = W*in
   wire signed [9:0] m45_3;
   assign m45_3 ={ {5{neg45[5]}} , neg45[5:1] };

   // m45_4 = W*in
   wire signed [9:0] m45_4;
   assign m45_4 =10'b0;

   // m45_5 = W*in
   wire signed [9:0] m45_5;
   assign m45_5 ={ {5{neg45[5]}} , neg45[5:1] };

   // m45_6 = W*in
   wire signed [9:0] m45_6;
   assign m45_6 =10'b0;

   // m45_7 = W*in
   wire signed [9:0] m45_7;
   assign m45_7 =10'b0;

   // m45_8 = W*in
   wire signed [9:0] m45_8;
   assign m45_8 ={ {4{in45[5]}} , in45[5:0] };

   // m45_9 = W*in
   wire signed [9:0] m45_9;
   assign m45_9 =10'b0;

   // m45_10 = W*in
   wire signed [9:0] m45_10;
   assign m45_10 ={ {4{in45[5]}} , in45[5:0] };

   // m46_1 = W*in
   wire signed [9:0] m46_1;
   assign m46_1 ={ {4{in46[5]}} , in46[5:0] };

   // m46_2 = W*in
   wire signed [9:0] m46_2;
   assign m46_2 =10'b0;

   // m46_3 = W*in
   wire signed [9:0] m46_3;
   assign m46_3 =10'b0;

   // m46_4 = W*in
   wire signed [9:0] m46_4;
   assign m46_4 =10'b0;

   // m46_5 = W*in
   wire signed [9:0] m46_5;
   assign m46_5 =10'b0;

   // m46_6 = W*in
   wire signed [9:0] m46_6;
   assign m46_6 ={ {5{neg46[5]}} , neg46[5:1] };

   // m46_7 = W*in
   wire signed [9:0] m46_7;
   assign m46_7 ={ {4{in46[5]}} , in46[5:0] };

   // m46_8 = W*in
   wire signed [9:0] m46_8;
   assign m46_8 ={ {5{neg46[5]}} , neg46[5:1] };

   // m46_9 = W*in
   wire signed [9:0] m46_9;
   assign m46_9 ={ {5{neg46[5]}} , neg46[5:1] };

   // m46_10 = W*in
   wire signed [9:0] m46_10;
   assign m46_10 =10'b0;

   // m47_1 = W*in
   wire signed [9:0] m47_1;
   assign m47_1 =10'b0;

   // m47_2 = W*in
   wire signed [9:0] m47_2;
   assign m47_2 ={ {5{in47[5]}} , in47[5:1] };

   // m47_3 = W*in
   wire signed [9:0] m47_3;
   assign m47_3 ={ {4{in47[5]}} , in47[5:0] };

   // m47_4 = W*in
   wire signed [9:0] m47_4;
   assign m47_4 ={ {5{in47[5]}} , in47[5:1] };

   // m47_5 = W*in
   wire signed [9:0] m47_5;
   assign m47_5 ={ {5{neg47[5]}} , neg47[5:1] };

   // m47_6 = W*in
   wire signed [9:0] m47_6;
   assign m47_6 ={ {5{neg47[5]}} , neg47[5:1] };

   // m47_7 = W*in
   wire signed [9:0] m47_7;
   assign m47_7 =10'b0;

   // m47_8 = W*in
   wire signed [9:0] m47_8;
   assign m47_8 ={ {4{in47[5]}} , in47[5:0] };

   // m47_9 = W*in
   wire signed [9:0] m47_9;
   assign m47_9 ={ {5{neg47[5]}} , neg47[5:1] };

   // m47_10 = W*in
   wire signed [9:0] m47_10;
   assign m47_10 ={ {5{neg47[5]}} , neg47[5:1] };

   // m48_1 = W*in
   wire signed [9:0] m48_1;
   assign m48_1 ={ {5{neg48[5]}} , neg48[5:1] };

   // m48_2 = W*in
   wire signed [9:0] m48_2;
   assign m48_2 ={ {4{in48[5]}} , in48[5:0] };

   // m48_3 = W*in
   wire signed [9:0] m48_3;
   assign m48_3 ={ {4{neg48[5]}} , neg48[5:0] };

   // m48_4 = W*in
   wire signed [9:0] m48_4;
   assign m48_4 ={ {5{in48[5]}} , in48[5:1] };

   // m48_5 = W*in
   wire signed [9:0] m48_5;
   assign m48_5 ={ {5{neg48[5]}} , neg48[5:1] };

   // m48_6 = W*in
   wire signed [9:0] m48_6;
   assign m48_6 ={ {5{neg48[5]}} , neg48[5:1] };

   // m48_7 = W*in
   wire signed [9:0] m48_7;
   assign m48_7 =10'b0;

   // m48_8 = W*in
   wire signed [9:0] m48_8;
   assign m48_8 ={ {4{in48[5]}} , in48[5:0] };

   // m48_9 = W*in
   wire signed [9:0] m48_9;
   assign m48_9 ={ {5{neg48[5]}} , neg48[5:1] };

   // m48_10 = W*in
   wire signed [9:0] m48_10;
   assign m48_10 ={ {4{in48[5]}} , in48[5:0] };

   // m49_1 = W*in
   wire signed [9:0] m49_1;
   assign m49_1 ={ {5{neg49[5]}} , neg49[5:1] };

   // m49_2 = W*in
   wire signed [9:0] m49_2;
   assign m49_2 ={ {4{in49[5]}} , in49[5:0] };

   // m49_3 = W*in
   wire signed [9:0] m49_3;
   assign m49_3 ={ {4{neg49[5]}} , neg49[5:0] };

   // m49_4 = W*in
   wire signed [9:0] m49_4;
   assign m49_4 =10'b0;

   // m49_5 = W*in
   wire signed [9:0] m49_5;
   assign m49_5 ={ {4{in49[5]}} , in49[5:0] };

   // m49_6 = W*in
   wire signed [9:0] m49_6;
   assign m49_6 ={ {4{neg49[5]}} , neg49[5:0] };

   // m49_7 = W*in
   wire signed [9:0] m49_7;
   assign m49_7 ={ {5{neg49[5]}} , neg49[5:1] };

   // m49_8 = W*in
   wire signed [9:0] m49_8;
   assign m49_8 ={ {4{in49[5]}} , in49[5:0] };

   // m49_9 = W*in
   wire signed [9:0] m49_9;
   assign m49_9 ={ {5{in49[5]}} , in49[5:1] };

   // m49_10 = W*in
   wire signed [9:0] m49_10;
   assign m49_10 ={ {4{in49[5]}} , in49[5:0] };

   // m50_1 = W*in
   wire signed [9:0] m50_1;
   assign m50_1 ={ {5{neg50[5]}} , neg50[5:1] };

   // m50_2 = W*in
   wire signed [9:0] m50_2;
   assign m50_2 ={ {5{neg50[5]}} , neg50[5:1] };

   // m50_3 = W*in
   wire signed [9:0] m50_3;
   assign m50_3 ={ {5{neg50[5]}} , neg50[5:1] };

   // m50_4 = W*in
   wire signed [9:0] m50_4;
   assign m50_4 ={ {4{neg50[5]}} , neg50[5:0] };

   // m50_5 = W*in
   wire signed [9:0] m50_5;
   assign m50_5 ={ {4{in50[5]}} , in50[5:0] };

   // m50_6 = W*in
   wire signed [9:0] m50_6;
   assign m50_6 ={ {4{in50[5]}} , in50[5:0] };

   // m50_7 = W*in
   wire signed [9:0] m50_7;
   assign m50_7 ={ {4{in50[5]}} , in50[5:0] };

   // m50_8 = W*in
   wire signed [9:0] m50_8;
   assign m50_8 ={ {5{neg50[5]}} , neg50[5:1] };

   // m50_9 = W*in
   wire signed [9:0] m50_9;
   assign m50_9 ={ {4{in50[5]}} , in50[5:0] };

   // m50_10 = W*in
   wire signed [9:0] m50_10;
   assign m50_10 ={ {5{in50[5]}} , in50[5:1] };

   // m51_1 = W*in
   wire signed [9:0] m51_1;
   assign m51_1 =10'b0;

   // m51_2 = W*in
   wire signed [9:0] m51_2;
   assign m51_2 ={ {5{neg51[5]}} , neg51[5:1] };

   // m51_3 = W*in
   wire signed [9:0] m51_3;
   assign m51_3 ={ {4{in51[5]}} , in51[5:0] };

   // m51_4 = W*in
   wire signed [9:0] m51_4;
   assign m51_4 ={ {4{in51[5]}} , in51[5:0] };

   // m51_5 = W*in
   wire signed [9:0] m51_5;
   assign m51_5 ={ {5{neg51[5]}} , neg51[5:1] };

   // m51_6 = W*in
   wire signed [9:0] m51_6;
   assign m51_6 ={ {5{neg51[5]}} , neg51[5:1] };

   // m51_7 = W*in
   wire signed [9:0] m51_7;
   assign m51_7 ={ {5{neg51[5]}} , neg51[5:1] };

   // m51_8 = W*in
   wire signed [9:0] m51_8;
   assign m51_8 ={ {4{in51[5]}} , in51[5:0] };

   // m51_9 = W*in
   wire signed [9:0] m51_9;
   assign m51_9 ={ {4{in51[5]}} , in51[5:0] };

   // m51_10 = W*in
   wire signed [9:0] m51_10;
   assign m51_10 ={ {4{neg51[5]}} , neg51[5:0] };

   // m52_1 = W*in
   wire signed [9:0] m52_1;
   assign m52_1 =10'b0;

   // m52_2 = W*in
   wire signed [9:0] m52_2;
   assign m52_2 ={ {4{in52[5]}} , in52[5:0] };

   // m52_3 = W*in
   wire signed [9:0] m52_3;
   assign m52_3 ={ {5{neg52[5]}} , neg52[5:1] };

   // m52_4 = W*in
   wire signed [9:0] m52_4;
   assign m52_4 ={ {4{in52[5]}} , in52[5:0] };

   // m52_5 = W*in
   wire signed [9:0] m52_5;
   assign m52_5 =10'b0;

   // m52_6 = W*in
   wire signed [9:0] m52_6;
   assign m52_6 ={ {4{in52[5]}} , in52[5:0] };

   // m52_7 = W*in
   wire signed [9:0] m52_7;
   assign m52_7 ={ {5{neg52[5]}} , neg52[5:1] };

   // m52_8 = W*in
   wire signed [9:0] m52_8;
   assign m52_8 ={ {5{neg52[5]}} , neg52[5:1] };

   // m52_9 = W*in
   wire signed [9:0] m52_9;
   assign m52_9 ={ {5{neg52[5]}} , neg52[5:1] };

   // m52_10 = W*in
   wire signed [9:0] m52_10;
   assign m52_10 =10'b0;

   // m53_1 = W*in
   wire signed [9:0] m53_1;
   assign m53_1 =10'b0;

   // m53_2 = W*in
   wire signed [9:0] m53_2;
   assign m53_2 ={ {4{in53[5]}} , in53[5:0] };

   // m53_3 = W*in
   wire signed [9:0] m53_3;
   assign m53_3 ={ {5{neg53[5]}} , neg53[5:1] };

   // m53_4 = W*in
   wire signed [9:0] m53_4;
   assign m53_4 ={ {4{in53[5]}} , in53[5:0] };

   // m53_5 = W*in
   wire signed [9:0] m53_5;
   assign m53_5 ={ {5{neg53[5]}} , neg53[5:1] };

   // m53_6 = W*in
   wire signed [9:0] m53_6;
   assign m53_6 ={ {5{neg53[5]}} , neg53[5:1] };

   // m53_7 = W*in
   wire signed [9:0] m53_7;
   assign m53_7 ={ {5{neg53[5]}} , neg53[5:1] };

   // m53_8 = W*in
   wire signed [9:0] m53_8;
   assign m53_8 =10'b0;

   // m53_9 = W*in
   wire signed [9:0] m53_9;
   assign m53_9 ={ {4{in53[5]}} , in53[5:0] };

   // m53_10 = W*in
   wire signed [9:0] m53_10;
   assign m53_10 =10'b0;

   // m54_1 = W*in
   wire signed [9:0] m54_1;
   assign m54_1 =10'b0;

   // m54_2 = W*in
   wire signed [9:0] m54_2;
   assign m54_2 =10'b0;

   // m54_3 = W*in
   wire signed [9:0] m54_3;
   assign m54_3 ={ {4{in54[5]}} , in54[5:0] };

   // m54_4 = W*in
   wire signed [9:0] m54_4;
   assign m54_4 ={ {4{in54[5]}} , in54[5:0] };

   // m54_5 = W*in
   wire signed [9:0] m54_5;
   assign m54_5 =10'b0;

   // m54_6 = W*in
   wire signed [9:0] m54_6;
   assign m54_6 ={ {5{in54[5]}} , in54[5:1] };

   // m54_7 = W*in
   wire signed [9:0] m54_7;
   assign m54_7 =10'b0;

   // m54_8 = W*in
   wire signed [9:0] m54_8;
   assign m54_8 ={ {4{neg54[5]}} , neg54[5:0] };

   // m54_9 = W*in
   wire signed [9:0] m54_9;
   assign m54_9 ={ {5{neg54[5]}} , neg54[5:1] };

   // m54_10 = W*in
   wire signed [9:0] m54_10;
   assign m54_10 =10'b0;

   // m55_1 = W*in
   wire signed [9:0] m55_1;
   assign m55_1 ={ {5{neg55[5]}} , neg55[5:1] };

   // m55_2 = W*in
   wire signed [9:0] m55_2;
   assign m55_2 ={ {4{in55[5]}} , in55[5:0] };

   // m55_3 = W*in
   wire signed [9:0] m55_3;
   assign m55_3 ={ {5{in55[5]}} , in55[5:1] };

   // m55_4 = W*in
   wire signed [9:0] m55_4;
   assign m55_4 ={ {4{neg55[5]}} , neg55[5:0] };

   // m55_5 = W*in
   wire signed [9:0] m55_5;
   assign m55_5 ={ {4{in55[5]}} , in55[5:0] };

   // m55_6 = W*in
   wire signed [9:0] m55_6;
   assign m55_6 ={ {5{neg55[5]}} , neg55[5:1] };

   // m55_7 = W*in
   wire signed [9:0] m55_7;
   assign m55_7 ={ {5{neg55[5]}} , neg55[5:1] };

   // m55_8 = W*in
   wire signed [9:0] m55_8;
   assign m55_8 ={ {4{in55[5]}} , in55[5:0] };

   // m55_9 = W*in
   wire signed [9:0] m55_9;
   assign m55_9 ={ {5{neg55[5]}} , neg55[5:1] };

   // m55_10 = W*in
   wire signed [9:0] m55_10;
   assign m55_10 =10'b0;

   // m56_1 = W*in
   wire signed [9:0] m56_1;
   assign m56_1 ={ {5{neg56[5]}} , neg56[5:1] };

   // m56_2 = W*in
   wire signed [9:0] m56_2;
   assign m56_2 ={ {5{neg56[5]}} , neg56[5:1] };

   // m56_3 = W*in
   wire signed [9:0] m56_3;
   assign m56_3 ={ {4{in56[5]}} , in56[5:0] };

   // m56_4 = W*in
   wire signed [9:0] m56_4;
   assign m56_4 ={ {4{in56[5]}} , in56[5:0] };

   // m56_5 = W*in
   wire signed [9:0] m56_5;
   assign m56_5 ={ {4{neg56[5]}} , neg56[5:0] };

   // m56_6 = W*in
   wire signed [9:0] m56_6;
   assign m56_6 ={ {4{neg56[5]}} , neg56[5:0] };

   // m56_7 = W*in
   wire signed [9:0] m56_7;
   assign m56_7 ={ {5{neg56[5]}} , neg56[5:1] };

   // m56_8 = W*in
   wire signed [9:0] m56_8;
   assign m56_8 =10'b0;

   // m56_9 = W*in
   wire signed [9:0] m56_9;
   assign m56_9 ={ {4{in56[5]}} , in56[5:0] };

   // m56_10 = W*in
   wire signed [9:0] m56_10;
   assign m56_10 ={ {5{in56[5]}} , in56[5:1] };

   // m57_1 = W*in
   wire signed [9:0] m57_1;
   assign m57_1 =10'b0;

   // m57_2 = W*in
   wire signed [9:0] m57_2;
   assign m57_2 ={ {4{in57[5]}} , in57[5:0] };

   // m57_3 = W*in
   wire signed [9:0] m57_3;
   assign m57_3 ={ {5{in57[5]}} , in57[5:1] };

   // m57_4 = W*in
   wire signed [9:0] m57_4;
   assign m57_4 ={ {5{in57[5]}} , in57[5:1] };

   // m57_5 = W*in
   wire signed [9:0] m57_5;
   assign m57_5 =10'b0;

   // m57_6 = W*in
   wire signed [9:0] m57_6;
   assign m57_6 ={ {5{neg57[5]}} , neg57[5:1] };

   // m57_7 = W*in
   wire signed [9:0] m57_7;
   assign m57_7 ={ {5{neg57[5]}} , neg57[5:1] };

   // m57_8 = W*in
   wire signed [9:0] m57_8;
   assign m57_8 ={ {5{neg57[5]}} , neg57[5:1] };

   // m57_9 = W*in
   wire signed [9:0] m57_9;
   assign m57_9 ={ {5{neg57[5]}} , neg57[5:1] };

   // m57_10 = W*in
   wire signed [9:0] m57_10;
   assign m57_10 =10'b0;

   // m58_1 = W*in
   wire signed [9:0] m58_1;
   assign m58_1 ={ {5{neg58[5]}} , neg58[5:1] };

   // m58_2 = W*in
   wire signed [9:0] m58_2;
   assign m58_2 ={ {5{in58[5]}} , in58[5:1] };

   // m58_3 = W*in
   wire signed [9:0] m58_3;
   assign m58_3 ={ {4{in58[5]}} , in58[5:0] };

   // m58_4 = W*in
   wire signed [9:0] m58_4;
   assign m58_4 ={ {4{in58[5]}} , in58[5:0] };

   // m58_5 = W*in
   wire signed [9:0] m58_5;
   assign m58_5 ={ {5{in58[5]}} , in58[5:1] };

   // m58_6 = W*in
   wire signed [9:0] m58_6;
   assign m58_6 ={ {5{neg58[5]}} , neg58[5:1] };

   // m58_7 = W*in
   wire signed [9:0] m58_7;
   assign m58_7 ={ {4{neg58[5]}} , neg58[5:0] };

   // m58_8 = W*in
   wire signed [9:0] m58_8;
   assign m58_8 ={ {4{in58[5]}} , in58[5:0] };

   // m58_9 = W*in
   wire signed [9:0] m58_9;
   assign m58_9 ={ {5{in58[5]}} , in58[5:1] };

   // m58_10 = W*in
   wire signed [9:0] m58_10;
   assign m58_10 ={ {4{neg58[5]}} , neg58[5:0] };

   // m59_1 = W*in
   wire signed [9:0] m59_1;
   assign m59_1 =10'b0;

   // m59_2 = W*in
   wire signed [9:0] m59_2;
   assign m59_2 ={ {5{neg59[5]}} , neg59[5:1] };

   // m59_3 = W*in
   wire signed [9:0] m59_3;
   assign m59_3 ={ {4{in59[5]}} , in59[5:0] };

   // m59_4 = W*in
   wire signed [9:0] m59_4;
   assign m59_4 ={ {5{in59[5]}} , in59[5:1] };

   // m59_5 = W*in
   wire signed [9:0] m59_5;
   assign m59_5 ={ {5{neg59[5]}} , neg59[5:1] };

   // m59_6 = W*in
   wire signed [9:0] m59_6;
   assign m59_6 ={ {4{in59[5]}} , in59[5:0] };

   // m59_7 = W*in
   wire signed [9:0] m59_7;
   assign m59_7 ={ {5{neg59[5]}} , neg59[5:1] };

   // m59_8 = W*in
   wire signed [9:0] m59_8;
   assign m59_8 ={ {4{in59[5]}} , in59[5:0] };

   // m59_9 = W*in
   wire signed [9:0] m59_9;
   assign m59_9 ={ {5{neg59[5]}} , neg59[5:1] };

   // m59_10 = W*in
   wire signed [9:0] m59_10;
   assign m59_10 ={ {5{neg59[5]}} , neg59[5:1] };

   // m60_1 = W*in
   wire signed [9:0] m60_1;
   assign m60_1 =10'b0;

   // m60_2 = W*in
   wire signed [9:0] m60_2;
   assign m60_2 =10'b0;

   // m60_3 = W*in
   wire signed [9:0] m60_3;
   assign m60_3 ={ {4{in60[5]}} , in60[5:0] };

   // m60_4 = W*in
   wire signed [9:0] m60_4;
   assign m60_4 ={ {5{in60[5]}} , in60[5:1] };

   // m60_5 = W*in
   wire signed [9:0] m60_5;
   assign m60_5 ={ {4{neg60[5]}} , neg60[5:0] };

   // m60_6 = W*in
   wire signed [9:0] m60_6;
   assign m60_6 ={ {5{neg60[5]}} , neg60[5:1] };

   // m60_7 = W*in
   wire signed [9:0] m60_7;
   assign m60_7 =10'b0;

   // m60_8 = W*in
   wire signed [9:0] m60_8;
   assign m60_8 ={ {5{in60[5]}} , in60[5:1] };

   // m60_9 = W*in
   wire signed [9:0] m60_9;
   assign m60_9 ={ {5{in60[5]}} , in60[5:1] };

   // m60_10 = W*in
   wire signed [9:0] m60_10;
   assign m60_10 ={ {4{neg60[5]}} , neg60[5:0] };

   // m61_1 = W*in
   wire signed [9:0] m61_1;
   assign m61_1 ={ {4{in61[5]}} , in61[5:0] };

   // m61_2 = W*in
   wire signed [9:0] m61_2;
   assign m61_2 ={ {5{neg61[5]}} , neg61[5:1] };

   // m61_3 = W*in
   wire signed [9:0] m61_3;
   assign m61_3 ={ {5{neg61[5]}} , neg61[5:1] };

   // m61_4 = W*in
   wire signed [9:0] m61_4;
   assign m61_4 ={ {5{in61[5]}} , in61[5:1] };

   // m61_5 = W*in
   wire signed [9:0] m61_5;
   assign m61_5 ={ {5{neg61[5]}} , neg61[5:1] };

   // m61_6 = W*in
   wire signed [9:0] m61_6;
   assign m61_6 ={ {5{in61[5]}} , in61[5:1] };

   // m61_7 = W*in
   wire signed [9:0] m61_7;
   assign m61_7 ={ {4{in61[5]}} , in61[5:0] };

   // m61_8 = W*in
   wire signed [9:0] m61_8;
   assign m61_8 ={ {4{neg61[5]}} , neg61[5:0] };

   // m61_9 = W*in
   wire signed [9:0] m61_9;
   assign m61_9 ={ {5{in61[5]}} , in61[5:1] };

   // m61_10 = W*in
   wire signed [9:0] m61_10;
   assign m61_10 ={ {4{neg61[5]}} , neg61[5:0] };

   // m62_1 = W*in
   wire signed [9:0] m62_1;
   assign m62_1 ={ {5{neg62[5]}} , neg62[5:1] };

   // m62_2 = W*in
   wire signed [9:0] m62_2;
   assign m62_2 ={ {4{in62[5]}} , in62[5:0] };

   // m62_3 = W*in
   wire signed [9:0] m62_3;
   assign m62_3 ={ {4{in62[5]}} , in62[5:0] };

   // m62_4 = W*in
   wire signed [9:0] m62_4;
   assign m62_4 ={ {5{neg62[5]}} , neg62[5:1] };

   // m62_5 = W*in
   wire signed [9:0] m62_5;
   assign m62_5 ={ {4{in62[5]}} , in62[5:0] };

   // m62_6 = W*in
   wire signed [9:0] m62_6;
   assign m62_6 ={ {5{neg62[5]}} , neg62[5:1] };

   // m62_7 = W*in
   wire signed [9:0] m62_7;
   assign m62_7 ={ {4{in62[5]}} , in62[5:0] };

   // m62_8 = W*in
   wire signed [9:0] m62_8;
   assign m62_8 ={ {4{neg62[5]}} , neg62[5:0] };

   // m62_9 = W*in
   wire signed [9:0] m62_9;
   assign m62_9 ={ {5{neg62[5]}} , neg62[5:1] };

   // m62_10 = W*in
   wire signed [9:0] m62_10;
   assign m62_10 ={ {5{neg62[5]}} , neg62[5:1] };

   // m63_1 = W*in
   wire signed [9:0] m63_1;
   assign m63_1 ={ {4{in63[5]}} , in63[5:0] };

   // m63_2 = W*in
   wire signed [9:0] m63_2;
   assign m63_2 ={ {5{neg63[5]}} , neg63[5:1] };

   // m63_3 = W*in
   wire signed [9:0] m63_3;
   assign m63_3 ={ {4{in63[5]}} , in63[5:0] };

   // m63_4 = W*in
   wire signed [9:0] m63_4;
   assign m63_4 =10'b0;

   // m63_5 = W*in
   wire signed [9:0] m63_5;
   assign m63_5 ={ {5{neg63[5]}} , neg63[5:1] };

   // m63_6 = W*in
   wire signed [9:0] m63_6;
   assign m63_6 ={ {4{neg63[5]}} , neg63[5:0] };

   // m63_7 = W*in
   wire signed [9:0] m63_7;
   assign m63_7 ={ {5{in63[5]}} , in63[5:1] };

   // m63_8 = W*in
   wire signed [9:0] m63_8;
   assign m63_8 ={ {5{neg63[5]}} , neg63[5:1] };

   // m63_9 = W*in
   wire signed [9:0] m63_9;
   assign m63_9 ={ {5{in63[5]}} , in63[5:1] };

   // m63_10 = W*in
   wire signed [9:0] m63_10;
   assign m63_10 =10'b0;

   // m64_1 = W*in
   wire signed [9:0] m64_1;
   assign m64_1 =10'b0;

   // m64_2 = W*in
   wire signed [9:0] m64_2;
   assign m64_2 =10'b0;

   // m64_3 = W*in
   wire signed [9:0] m64_3;
   assign m64_3 ={ {5{neg64[5]}} , neg64[5:1] };

   // m64_4 = W*in
   wire signed [9:0] m64_4;
   assign m64_4 ={ {4{neg64[5]}} , neg64[5:0] };

   // m64_5 = W*in
   wire signed [9:0] m64_5;
   assign m64_5 ={ {5{in64[5]}} , in64[5:1] };

   // m64_6 = W*in
   wire signed [9:0] m64_6;
   assign m64_6 ={ {5{in64[5]}} , in64[5:1] };

   // m64_7 = W*in
   wire signed [9:0] m64_7;
   assign m64_7 ={ {5{neg64[5]}} , neg64[5:1] };

   // m64_8 = W*in
   wire signed [9:0] m64_8;
   assign m64_8 ={ {5{in64[5]}} , in64[5:1] };

   // m64_9 = W*in
   wire signed [9:0] m64_9;
   assign m64_9 ={ {5{neg64[5]}} , neg64[5:1] };

   // m64_10 = W*in
   wire signed [9:0] m64_10;
   assign m64_10 ={ {5{in64[5]}} , in64[5:1] };

   // m65_1 = W*in
   wire signed [9:0] m65_1;
   assign m65_1 ={ {4{in65[5]}} , in65[5:0] };

   // m65_2 = W*in
   wire signed [9:0] m65_2;
   assign m65_2 ={ {5{in65[5]}} , in65[5:1] };

   // m65_3 = W*in
   wire signed [9:0] m65_3;
   assign m65_3 ={ {5{neg65[5]}} , neg65[5:1] };

   // m65_4 = W*in
   wire signed [9:0] m65_4;
   assign m65_4 ={ {5{neg65[5]}} , neg65[5:1] };

   // m65_5 = W*in
   wire signed [9:0] m65_5;
   assign m65_5 =10'b0;

   // m65_6 = W*in
   wire signed [9:0] m65_6;
   assign m65_6 ={ {4{in65[5]}} , in65[5:0] };

   // m65_7 = W*in
   wire signed [9:0] m65_7;
   assign m65_7 ={ {5{neg65[5]}} , neg65[5:1] };

   // m65_8 = W*in
   wire signed [9:0] m65_8;
   assign m65_8 ={ {5{in65[5]}} , in65[5:1] };

   // m65_9 = W*in
   wire signed [9:0] m65_9;
   assign m65_9 ={ {5{neg65[5]}} , neg65[5:1] };

   // m65_10 = W*in
   wire signed [9:0] m65_10;
   assign m65_10 =10'b0;

   // m66_1 = W*in
   wire signed [9:0] m66_1;
   assign m66_1 ={ {5{neg66[5]}} , neg66[5:1] };

   // m66_2 = W*in
   wire signed [9:0] m66_2;
   assign m66_2 ={ {4{in66[5]}} , in66[5:0] };

   // m66_3 = W*in
   wire signed [9:0] m66_3;
   assign m66_3 ={ {5{neg66[5]}} , neg66[5:1] };

   // m66_4 = W*in
   wire signed [9:0] m66_4;
   assign m66_4 =10'b0;

   // m66_5 = W*in
   wire signed [9:0] m66_5;
   assign m66_5 ={ {4{in66[5]}} , in66[5:0] };

   // m66_6 = W*in
   wire signed [9:0] m66_6;
   assign m66_6 =10'b0;

   // m66_7 = W*in
   wire signed [9:0] m66_7;
   assign m66_7 ={ {5{in66[5]}} , in66[5:1] };

   // m66_8 = W*in
   wire signed [9:0] m66_8;
   assign m66_8 ={ {5{neg66[5]}} , neg66[5:1] };

   // m66_9 = W*in
   wire signed [9:0] m66_9;
   assign m66_9 =10'b0;

   // m66_10 = W*in
   wire signed [9:0] m66_10;
   assign m66_10 =10'b0;

   // m67_1 = W*in
   wire signed [9:0] m67_1;
   assign m67_1 ={ {5{neg67[5]}} , neg67[5:1] };

   // m67_2 = W*in
   wire signed [9:0] m67_2;
   assign m67_2 =10'b0;

   // m67_3 = W*in
   wire signed [9:0] m67_3;
   assign m67_3 ={ {5{neg67[5]}} , neg67[5:1] };

   // m67_4 = W*in
   wire signed [9:0] m67_4;
   assign m67_4 =10'b0;

   // m67_5 = W*in
   wire signed [9:0] m67_5;
   assign m67_5 ={ {4{in67[5]}} , in67[5:0] };

   // m67_6 = W*in
   wire signed [9:0] m67_6;
   assign m67_6 ={ {5{neg67[5]}} , neg67[5:1] };

   // m67_7 = W*in
   wire signed [9:0] m67_7;
   assign m67_7 =10'b0;

   // m67_8 = W*in
   wire signed [9:0] m67_8;
   assign m67_8 ={ {4{in67[5]}} , in67[5:0] };

   // m67_9 = W*in
   wire signed [9:0] m67_9;
   assign m67_9 =10'b0;

   // m67_10 = W*in
   wire signed [9:0] m67_10;
   assign m67_10 ={ {4{in67[5]}} , in67[5:0] };

   // m68_1 = W*in
   wire signed [9:0] m68_1;
   assign m68_1 =10'b0;

   // m68_2 = W*in
   wire signed [9:0] m68_2;
   assign m68_2 =10'b0;

   // m68_3 = W*in
   wire signed [9:0] m68_3;
   assign m68_3 ={ {5{neg68[5]}} , neg68[5:1] };

   // m68_4 = W*in
   wire signed [9:0] m68_4;
   assign m68_4 ={ {4{in68[5]}} , in68[5:0] };

   // m68_5 = W*in
   wire signed [9:0] m68_5;
   assign m68_5 ={ {5{neg68[5]}} , neg68[5:1] };

   // m68_6 = W*in
   wire signed [9:0] m68_6;
   assign m68_6 ={ {5{neg68[5]}} , neg68[5:1] };

   // m68_7 = W*in
   wire signed [9:0] m68_7;
   assign m68_7 =10'b0;

   // m68_8 = W*in
   wire signed [9:0] m68_8;
   assign m68_8 ={ {5{neg68[5]}} , neg68[5:1] };

   // m68_9 = W*in
   wire signed [9:0] m68_9;
   assign m68_9 ={ {4{in68[5]}} , in68[5:0] };

   // m68_10 = W*in
   wire signed [9:0] m68_10;
   assign m68_10 ={ {4{in68[5]}} , in68[5:0] };

   // m69_1 = W*in
   wire signed [9:0] m69_1;
   assign m69_1 ={ {5{neg69[5]}} , neg69[5:1] };

   // m69_2 = W*in
   wire signed [9:0] m69_2;
   assign m69_2 =10'b0;

   // m69_3 = W*in
   wire signed [9:0] m69_3;
   assign m69_3 ={ {4{in69[5]}} , in69[5:0] };

   // m69_4 = W*in
   wire signed [9:0] m69_4;
   assign m69_4 ={ {4{in69[5]}} , in69[5:0] };

   // m69_5 = W*in
   wire signed [9:0] m69_5;
   assign m69_5 ={ {5{neg69[5]}} , neg69[5:1] };

   // m69_6 = W*in
   wire signed [9:0] m69_6;
   assign m69_6 ={ {5{neg69[5]}} , neg69[5:1] };

   // m69_7 = W*in
   wire signed [9:0] m69_7;
   assign m69_7 =10'b0;

   // m69_8 = W*in
   wire signed [9:0] m69_8;
   assign m69_8 ={ {4{in69[5]}} , in69[5:0] };

   // m69_9 = W*in
   wire signed [9:0] m69_9;
   assign m69_9 =10'b0;

   // m69_10 = W*in
   wire signed [9:0] m69_10;
   assign m69_10 ={ {5{neg69[5]}} , neg69[5:1] };

   // m70_1 = W*in
   wire signed [9:0] m70_1;
   assign m70_1 =10'b0;

   // m70_2 = W*in
   wire signed [9:0] m70_2;
   assign m70_2 ={ {4{in70[5]}} , in70[5:0] };

   // m70_3 = W*in
   wire signed [9:0] m70_3;
   assign m70_3 ={ {5{neg70[5]}} , neg70[5:1] };

   // m70_4 = W*in
   wire signed [9:0] m70_4;
   assign m70_4 ={ {5{neg70[5]}} , neg70[5:1] };

   // m70_5 = W*in
   wire signed [9:0] m70_5;
   assign m70_5 ={ {5{neg70[5]}} , neg70[5:1] };

   // m70_6 = W*in
   wire signed [9:0] m70_6;
   assign m70_6 =10'b0;

   // m70_7 = W*in
   wire signed [9:0] m70_7;
   assign m70_7 =10'b0;

   // m70_8 = W*in
   wire signed [9:0] m70_8;
   assign m70_8 ={ {4{in70[5]}} , in70[5:0] };

   // m70_9 = W*in
   wire signed [9:0] m70_9;
   assign m70_9 ={ {5{neg70[5]}} , neg70[5:1] };

   // m70_10 = W*in
   wire signed [9:0] m70_10;
   assign m70_10 ={ {5{neg70[5]}} , neg70[5:1] };

   // m71_1 = W*in
   wire signed [9:0] m71_1;
   assign m71_1 =10'b0;

   // m71_2 = W*in
   wire signed [9:0] m71_2;
   assign m71_2 =10'b0;

   // m71_3 = W*in
   wire signed [9:0] m71_3;
   assign m71_3 =10'b0;

   // m71_4 = W*in
   wire signed [9:0] m71_4;
   assign m71_4 =10'b0;

   // m71_5 = W*in
   wire signed [9:0] m71_5;
   assign m71_5 ={ {4{in71[5]}} , in71[5:0] };

   // m71_6 = W*in
   wire signed [9:0] m71_6;
   assign m71_6 =10'b0;

   // m71_7 = W*in
   wire signed [9:0] m71_7;
   assign m71_7 =10'b0;

   // m71_8 = W*in
   wire signed [9:0] m71_8;
   assign m71_8 =10'b0;

   // m71_9 = W*in
   wire signed [9:0] m71_9;
   assign m71_9 =10'b0;

   // m71_10 = W*in
   wire signed [9:0] m71_10;
   assign m71_10 ={ {4{in71[5]}} , in71[5:0] };

   // m72_1 = W*in
   wire signed [9:0] m72_1;
   assign m72_1 ={ {5{in72[5]}} , in72[5:1] };

   // m72_2 = W*in
   wire signed [9:0] m72_2;
   assign m72_2 ={ {5{in72[5]}} , in72[5:1] };

   // m72_3 = W*in
   wire signed [9:0] m72_3;
   assign m72_3 ={ {4{neg72[5]}} , neg72[5:0] };

   // m72_4 = W*in
   wire signed [9:0] m72_4;
   assign m72_4 ={ {5{neg72[5]}} , neg72[5:1] };

   // m72_5 = W*in
   wire signed [9:0] m72_5;
   assign m72_5 ={ {5{neg72[5]}} , neg72[5:1] };

   // m72_6 = W*in
   wire signed [9:0] m72_6;
   assign m72_6 ={ {5{in72[5]}} , in72[5:1] };

   // m72_7 = W*in
   wire signed [9:0] m72_7;
   assign m72_7 ={ {5{in72[5]}} , in72[5:1] };

   // m72_8 = W*in
   wire signed [9:0] m72_8;
   assign m72_8 ={ {5{in72[5]}} , in72[5:1] };

   // m72_9 = W*in
   wire signed [9:0] m72_9;
   assign m72_9 ={ {5{neg72[5]}} , neg72[5:1] };

   // m72_10 = W*in
   wire signed [9:0] m72_10;
   assign m72_10 ={ {5{neg72[5]}} , neg72[5:1] };

   // m73_1 = W*in
   wire signed [9:0] m73_1;
   assign m73_1 ={ {5{neg73[5]}} , neg73[5:1] };

   // m73_2 = W*in
   wire signed [9:0] m73_2;
   assign m73_2 ={ {5{neg73[5]}} , neg73[5:1] };

   // m73_3 = W*in
   wire signed [9:0] m73_3;
   assign m73_3 ={ {5{neg73[5]}} , neg73[5:1] };

   // m73_4 = W*in
   wire signed [9:0] m73_4;
   assign m73_4 ={ {5{neg73[5]}} , neg73[5:1] };

   // m73_5 = W*in
   wire signed [9:0] m73_5;
   assign m73_5 ={ {4{in73[5]}} , in73[5:0] };

   // m73_6 = W*in
   wire signed [9:0] m73_6;
   assign m73_6 =10'b0;

   // m73_7 = W*in
   wire signed [9:0] m73_7;
   assign m73_7 ={ {5{neg73[5]}} , neg73[5:1] };

   // m73_8 = W*in
   wire signed [9:0] m73_8;
   assign m73_8 ={ {5{in73[5]}} , in73[5:1] };

   // m73_9 = W*in
   wire signed [9:0] m73_9;
   assign m73_9 ={ {4{in73[5]}} , in73[5:0] };

   // m73_10 = W*in
   wire signed [9:0] m73_10;
   assign m73_10 ={ {4{in73[5]}} , in73[5:0] };

   // m74_1 = W*in
   wire signed [9:0] m74_1;
   assign m74_1 ={ {5{neg74[5]}} , neg74[5:1] };

   // m74_2 = W*in
   wire signed [9:0] m74_2;
   assign m74_2 ={ {4{in74[5]}} , in74[5:0] };

   // m74_3 = W*in
   wire signed [9:0] m74_3;
   assign m74_3 ={ {5{in74[5]}} , in74[5:1] };

   // m74_4 = W*in
   wire signed [9:0] m74_4;
   assign m74_4 ={ {5{neg74[5]}} , neg74[5:1] };

   // m74_5 = W*in
   wire signed [9:0] m74_5;
   assign m74_5 ={ {5{neg74[5]}} , neg74[5:1] };

   // m74_6 = W*in
   wire signed [9:0] m74_6;
   assign m74_6 =10'b0;

   // m74_7 = W*in
   wire signed [9:0] m74_7;
   assign m74_7 =10'b0;

   // m74_8 = W*in
   wire signed [9:0] m74_8;
   assign m74_8 ={ {5{in74[5]}} , in74[5:1] };

   // m74_9 = W*in
   wire signed [9:0] m74_9;
   assign m74_9 ={ {5{neg74[5]}} , neg74[5:1] };

   // m74_10 = W*in
   wire signed [9:0] m74_10;
   assign m74_10 ={ {5{in74[5]}} , in74[5:1] };

   // m75_1 = W*in
   wire signed [9:0] m75_1;
   assign m75_1 ={ {5{neg75[5]}} , neg75[5:1] };

   // m75_2 = W*in
   wire signed [9:0] m75_2;
   assign m75_2 =10'b0;

   // m75_3 = W*in
   wire signed [9:0] m75_3;
   assign m75_3 =10'b0;

   // m75_4 = W*in
   wire signed [9:0] m75_4;
   assign m75_4 =10'b0;

   // m75_5 = W*in
   wire signed [9:0] m75_5;
   assign m75_5 =10'b0;

   // m75_6 = W*in
   wire signed [9:0] m75_6;
   assign m75_6 =10'b0;

   // m75_7 = W*in
   wire signed [9:0] m75_7;
   assign m75_7 =10'b0;

   // m75_8 = W*in
   wire signed [9:0] m75_8;
   assign m75_8 ={ {4{in75[5]}} , in75[5:0] };

   // m75_9 = W*in
   wire signed [9:0] m75_9;
   assign m75_9 =10'b0;

   // m75_10 = W*in
   wire signed [9:0] m75_10;
   assign m75_10 ={ {4{in75[5]}} , in75[5:0] };

   // m76_1 = W*in
   wire signed [9:0] m76_1;
   assign m76_1 ={ {5{in76[5]}} , in76[5:1] };

   // m76_2 = W*in
   wire signed [9:0] m76_2;
   assign m76_2 =10'b0;

   // m76_3 = W*in
   wire signed [9:0] m76_3;
   assign m76_3 =10'b0;

   // m76_4 = W*in
   wire signed [9:0] m76_4;
   assign m76_4 ={ {4{in76[5]}} , in76[5:0] };

   // m76_5 = W*in
   wire signed [9:0] m76_5;
   assign m76_5 =10'b0;

   // m76_6 = W*in
   wire signed [9:0] m76_6;
   assign m76_6 ={ {5{in76[5]}} , in76[5:1] };

   // m76_7 = W*in
   wire signed [9:0] m76_7;
   assign m76_7 ={ {5{neg76[5]}} , neg76[5:1] };

   // m76_8 = W*in
   wire signed [9:0] m76_8;
   assign m76_8 ={ {5{neg76[5]}} , neg76[5:1] };

   // m76_9 = W*in
   wire signed [9:0] m76_9;
   assign m76_9 ={ {5{neg76[5]}} , neg76[5:1] };

   // m76_10 = W*in
   wire signed [9:0] m76_10;
   assign m76_10 ={ {5{in76[5]}} , in76[5:1] };

   // m77_1 = W*in
   wire signed [9:0] m77_1;
   assign m77_1 ={ {5{neg77[5]}} , neg77[5:1] };

   // m77_2 = W*in
   wire signed [9:0] m77_2;
   assign m77_2 ={ {5{neg77[5]}} , neg77[5:1] };

   // m77_3 = W*in
   wire signed [9:0] m77_3;
   assign m77_3 ={ {5{neg77[5]}} , neg77[5:1] };

   // m77_4 = W*in
   wire signed [9:0] m77_4;
   assign m77_4 ={ {4{in77[5]}} , in77[5:0] };

   // m77_5 = W*in
   wire signed [9:0] m77_5;
   assign m77_5 ={ {5{neg77[5]}} , neg77[5:1] };

   // m77_6 = W*in
   wire signed [9:0] m77_6;
   assign m77_6 ={ {4{in77[5]}} , in77[5:0] };

   // m77_7 = W*in
   wire signed [9:0] m77_7;
   assign m77_7 ={ {5{neg77[5]}} , neg77[5:1] };

   // m77_8 = W*in
   wire signed [9:0] m77_8;
   assign m77_8 ={ {5{neg77[5]}} , neg77[5:1] };

   // m77_9 = W*in
   wire signed [9:0] m77_9;
   assign m77_9 ={ {5{in77[5]}} , in77[5:1] };

   // m77_10 = W*in
   wire signed [9:0] m77_10;
   assign m77_10 ={ {4{in77[5]}} , in77[5:0] };

   // m78_1 = W*in
   wire signed [9:0] m78_1;
   assign m78_1 ={ {4{in78[5]}} , in78[5:0] };

   // m78_2 = W*in
   wire signed [9:0] m78_2;
   assign m78_2 =10'b0;

   // m78_3 = W*in
   wire signed [9:0] m78_3;
   assign m78_3 ={ {5{neg78[5]}} , neg78[5:1] };

   // m78_4 = W*in
   wire signed [9:0] m78_4;
   assign m78_4 ={ {4{neg78[5]}} , neg78[5:0] };

   // m78_5 = W*in
   wire signed [9:0] m78_5;
   assign m78_5 =10'b0;

   // m78_6 = W*in
   wire signed [9:0] m78_6;
   assign m78_6 ={ {4{in78[5]}} , in78[5:0] };

   // m78_7 = W*in
   wire signed [9:0] m78_7;
   assign m78_7 ={ {5{in78[5]}} , in78[5:1] };

   // m78_8 = W*in
   wire signed [9:0] m78_8;
   assign m78_8 ={ {5{in78[5]}} , in78[5:1] };

   // m78_9 = W*in
   wire signed [9:0] m78_9;
   assign m78_9 ={ {5{neg78[5]}} , neg78[5:1] };

   // m78_10 = W*in
   wire signed [9:0] m78_10;
   assign m78_10 ={ {5{neg78[5]}} , neg78[5:1] };

   // m79_1 = W*in
   wire signed [9:0] m79_1;
   assign m79_1 ={ {4{in79[5]}} , in79[5:0] };

   // m79_2 = W*in
   wire signed [9:0] m79_2;
   assign m79_2 ={ {5{neg79[5]}} , neg79[5:1] };

   // m79_3 = W*in
   wire signed [9:0] m79_3;
   assign m79_3 ={ {4{in79[5]}} , in79[5:0] };

   // m79_4 = W*in
   wire signed [9:0] m79_4;
   assign m79_4 ={ {5{neg79[5]}} , neg79[5:1] };

   // m79_5 = W*in
   wire signed [9:0] m79_5;
   assign m79_5 ={ {5{neg79[5]}} , neg79[5:1] };

   // m79_6 = W*in
   wire signed [9:0] m79_6;
   assign m79_6 ={ {5{neg79[5]}} , neg79[5:1] };

   // m79_7 = W*in
   wire signed [9:0] m79_7;
   assign m79_7 ={ {4{in79[5]}} , in79[5:0] };

   // m79_8 = W*in
   wire signed [9:0] m79_8;
   assign m79_8 ={ {4{in79[5]}} , in79[5:0] };

   // m79_9 = W*in
   wire signed [9:0] m79_9;
   assign m79_9 ={ {4{neg79[5]}} , neg79[5:0] };

   // m79_10 = W*in
   wire signed [9:0] m79_10;
   assign m79_10 =10'b0;

   // m80_1 = W*in
   wire signed [9:0] m80_1;
   assign m80_1 =10'b0;

   // m80_2 = W*in
   wire signed [9:0] m80_2;
   assign m80_2 =10'b0;

   // m80_3 = W*in
   wire signed [9:0] m80_3;
   assign m80_3 ={ {4{in80[5]}} , in80[5:0] };

   // m80_4 = W*in
   wire signed [9:0] m80_4;
   assign m80_4 ={ {5{neg80[5]}} , neg80[5:1] };

   // m80_5 = W*in
   wire signed [9:0] m80_5;
   assign m80_5 ={ {5{in80[5]}} , in80[5:1] };

   // m80_6 = W*in
   wire signed [9:0] m80_6;
   assign m80_6 =10'b0;

   // m80_7 = W*in
   wire signed [9:0] m80_7;
   assign m80_7 ={ {5{neg80[5]}} , neg80[5:1] };

   // m80_8 = W*in
   wire signed [9:0] m80_8;
   assign m80_8 =10'b0;

   // m80_9 = W*in
   wire signed [9:0] m80_9;
   assign m80_9 ={ {4{in80[5]}} , in80[5:0] };

   // m80_10 = W*in
   wire signed [9:0] m80_10;
   assign m80_10 =10'b0;

   // m81_1 = W*in
   wire signed [9:0] m81_1;
   assign m81_1 =10'b0;

   // m81_2 = W*in
   wire signed [9:0] m81_2;
   assign m81_2 ={ {5{neg81[5]}} , neg81[5:1] };

   // m81_3 = W*in
   wire signed [9:0] m81_3;
   assign m81_3 ={ {4{in81[5]}} , in81[5:0] };

   // m81_4 = W*in
   wire signed [9:0] m81_4;
   assign m81_4 ={ {5{neg81[5]}} , neg81[5:1] };

   // m81_5 = W*in
   wire signed [9:0] m81_5;
   assign m81_5 ={ {4{in81[5]}} , in81[5:0] };

   // m81_6 = W*in
   wire signed [9:0] m81_6;
   assign m81_6 =10'b0;

   // m81_7 = W*in
   wire signed [9:0] m81_7;
   assign m81_7 ={ {4{in81[5]}} , in81[5:0] };

   // m81_8 = W*in
   wire signed [9:0] m81_8;
   assign m81_8 =10'b0;

   // m81_9 = W*in
   wire signed [9:0] m81_9;
   assign m81_9 ={ {5{neg81[5]}} , neg81[5:1] };

   // m81_10 = W*in
   wire signed [9:0] m81_10;
   assign m81_10 =10'b0;

   //Perceptron Adders
   always @(posedge clk) out1 <= m1_1+m2_1+m3_1+m4_1+m5_1+m6_1+m7_1+m8_1+m9_1+m10_1+m11_1+m12_1+m13_1+m14_1+m15_1+m16_1+m17_1+m18_1+m19_1+m20_1+m21_1+m22_1+m23_1+m24_1+m25_1+m26_1+m27_1+m28_1+m29_1+m30_1+m31_1+m32_1+m33_1+m34_1+m35_1+m36_1+m37_1+m38_1+m39_1+m40_1+m41_1+m42_1+m43_1+m44_1+m45_1+m46_1+m47_1+m48_1+m49_1+m50_1+m51_1+m52_1+m53_1+m54_1+m55_1+m56_1+m57_1+m58_1+m59_1+m60_1+m61_1+m62_1+m63_1+m64_1+m65_1+m66_1+m67_1+m68_1+m69_1+m70_1+m71_1+m72_1+m73_1+m74_1+m75_1+m76_1+m77_1+m78_1+m79_1+m80_1+m81_1+b1;
   always @(posedge clk) out2 <= m1_2+m2_2+m3_2+m4_2+m5_2+m6_2+m7_2+m8_2+m9_2+m10_2+m11_2+m12_2+m13_2+m14_2+m15_2+m16_2+m17_2+m18_2+m19_2+m20_2+m21_2+m22_2+m23_2+m24_2+m25_2+m26_2+m27_2+m28_2+m29_2+m30_2+m31_2+m32_2+m33_2+m34_2+m35_2+m36_2+m37_2+m38_2+m39_2+m40_2+m41_2+m42_2+m43_2+m44_2+m45_2+m46_2+m47_2+m48_2+m49_2+m50_2+m51_2+m52_2+m53_2+m54_2+m55_2+m56_2+m57_2+m58_2+m59_2+m60_2+m61_2+m62_2+m63_2+m64_2+m65_2+m66_2+m67_2+m68_2+m69_2+m70_2+m71_2+m72_2+m73_2+m74_2+m75_2+m76_2+m77_2+m78_2+m79_2+m80_2+m81_2+b2;
   always @(posedge clk) out3 <= m1_3+m2_3+m3_3+m4_3+m5_3+m6_3+m7_3+m8_3+m9_3+m10_3+m11_3+m12_3+m13_3+m14_3+m15_3+m16_3+m17_3+m18_3+m19_3+m20_3+m21_3+m22_3+m23_3+m24_3+m25_3+m26_3+m27_3+m28_3+m29_3+m30_3+m31_3+m32_3+m33_3+m34_3+m35_3+m36_3+m37_3+m38_3+m39_3+m40_3+m41_3+m42_3+m43_3+m44_3+m45_3+m46_3+m47_3+m48_3+m49_3+m50_3+m51_3+m52_3+m53_3+m54_3+m55_3+m56_3+m57_3+m58_3+m59_3+m60_3+m61_3+m62_3+m63_3+m64_3+m65_3+m66_3+m67_3+m68_3+m69_3+m70_3+m71_3+m72_3+m73_3+m74_3+m75_3+m76_3+m77_3+m78_3+m79_3+m80_3+m81_3+b3;
   always @(posedge clk) out4 <= m1_4+m2_4+m3_4+m4_4+m5_4+m6_4+m7_4+m8_4+m9_4+m10_4+m11_4+m12_4+m13_4+m14_4+m15_4+m16_4+m17_4+m18_4+m19_4+m20_4+m21_4+m22_4+m23_4+m24_4+m25_4+m26_4+m27_4+m28_4+m29_4+m30_4+m31_4+m32_4+m33_4+m34_4+m35_4+m36_4+m37_4+m38_4+m39_4+m40_4+m41_4+m42_4+m43_4+m44_4+m45_4+m46_4+m47_4+m48_4+m49_4+m50_4+m51_4+m52_4+m53_4+m54_4+m55_4+m56_4+m57_4+m58_4+m59_4+m60_4+m61_4+m62_4+m63_4+m64_4+m65_4+m66_4+m67_4+m68_4+m69_4+m70_4+m71_4+m72_4+m73_4+m74_4+m75_4+m76_4+m77_4+m78_4+m79_4+m80_4+m81_4+b4;
   always @(posedge clk) out5 <= m1_5+m2_5+m3_5+m4_5+m5_5+m6_5+m7_5+m8_5+m9_5+m10_5+m11_5+m12_5+m13_5+m14_5+m15_5+m16_5+m17_5+m18_5+m19_5+m20_5+m21_5+m22_5+m23_5+m24_5+m25_5+m26_5+m27_5+m28_5+m29_5+m30_5+m31_5+m32_5+m33_5+m34_5+m35_5+m36_5+m37_5+m38_5+m39_5+m40_5+m41_5+m42_5+m43_5+m44_5+m45_5+m46_5+m47_5+m48_5+m49_5+m50_5+m51_5+m52_5+m53_5+m54_5+m55_5+m56_5+m57_5+m58_5+m59_5+m60_5+m61_5+m62_5+m63_5+m64_5+m65_5+m66_5+m67_5+m68_5+m69_5+m70_5+m71_5+m72_5+m73_5+m74_5+m75_5+m76_5+m77_5+m78_5+m79_5+m80_5+m81_5+b5;
   always @(posedge clk) out6 <= m1_6+m2_6+m3_6+m4_6+m5_6+m6_6+m7_6+m8_6+m9_6+m10_6+m11_6+m12_6+m13_6+m14_6+m15_6+m16_6+m17_6+m18_6+m19_6+m20_6+m21_6+m22_6+m23_6+m24_6+m25_6+m26_6+m27_6+m28_6+m29_6+m30_6+m31_6+m32_6+m33_6+m34_6+m35_6+m36_6+m37_6+m38_6+m39_6+m40_6+m41_6+m42_6+m43_6+m44_6+m45_6+m46_6+m47_6+m48_6+m49_6+m50_6+m51_6+m52_6+m53_6+m54_6+m55_6+m56_6+m57_6+m58_6+m59_6+m60_6+m61_6+m62_6+m63_6+m64_6+m65_6+m66_6+m67_6+m68_6+m69_6+m70_6+m71_6+m72_6+m73_6+m74_6+m75_6+m76_6+m77_6+m78_6+m79_6+m80_6+m81_6+b6;
   always @(posedge clk) out7 <= m1_7+m2_7+m3_7+m4_7+m5_7+m6_7+m7_7+m8_7+m9_7+m10_7+m11_7+m12_7+m13_7+m14_7+m15_7+m16_7+m17_7+m18_7+m19_7+m20_7+m21_7+m22_7+m23_7+m24_7+m25_7+m26_7+m27_7+m28_7+m29_7+m30_7+m31_7+m32_7+m33_7+m34_7+m35_7+m36_7+m37_7+m38_7+m39_7+m40_7+m41_7+m42_7+m43_7+m44_7+m45_7+m46_7+m47_7+m48_7+m49_7+m50_7+m51_7+m52_7+m53_7+m54_7+m55_7+m56_7+m57_7+m58_7+m59_7+m60_7+m61_7+m62_7+m63_7+m64_7+m65_7+m66_7+m67_7+m68_7+m69_7+m70_7+m71_7+m72_7+m73_7+m74_7+m75_7+m76_7+m77_7+m78_7+m79_7+m80_7+m81_7+b7;
   always @(posedge clk) out8 <= m1_8+m2_8+m3_8+m4_8+m5_8+m6_8+m7_8+m8_8+m9_8+m10_8+m11_8+m12_8+m13_8+m14_8+m15_8+m16_8+m17_8+m18_8+m19_8+m20_8+m21_8+m22_8+m23_8+m24_8+m25_8+m26_8+m27_8+m28_8+m29_8+m30_8+m31_8+m32_8+m33_8+m34_8+m35_8+m36_8+m37_8+m38_8+m39_8+m40_8+m41_8+m42_8+m43_8+m44_8+m45_8+m46_8+m47_8+m48_8+m49_8+m50_8+m51_8+m52_8+m53_8+m54_8+m55_8+m56_8+m57_8+m58_8+m59_8+m60_8+m61_8+m62_8+m63_8+m64_8+m65_8+m66_8+m67_8+m68_8+m69_8+m70_8+m71_8+m72_8+m73_8+m74_8+m75_8+m76_8+m77_8+m78_8+m79_8+m80_8+m81_8+b8;
   always @(posedge clk) out9 <= m1_9+m2_9+m3_9+m4_9+m5_9+m6_9+m7_9+m8_9+m9_9+m10_9+m11_9+m12_9+m13_9+m14_9+m15_9+m16_9+m17_9+m18_9+m19_9+m20_9+m21_9+m22_9+m23_9+m24_9+m25_9+m26_9+m27_9+m28_9+m29_9+m30_9+m31_9+m32_9+m33_9+m34_9+m35_9+m36_9+m37_9+m38_9+m39_9+m40_9+m41_9+m42_9+m43_9+m44_9+m45_9+m46_9+m47_9+m48_9+m49_9+m50_9+m51_9+m52_9+m53_9+m54_9+m55_9+m56_9+m57_9+m58_9+m59_9+m60_9+m61_9+m62_9+m63_9+m64_9+m65_9+m66_9+m67_9+m68_9+m69_9+m70_9+m71_9+m72_9+m73_9+m74_9+m75_9+m76_9+m77_9+m78_9+m79_9+m80_9+m81_9+b9;
   always @(posedge clk) out10 <= m1_10+m2_10+m3_10+m4_10+m5_10+m6_10+m7_10+m8_10+m9_10+m10_10+m11_10+m12_10+m13_10+m14_10+m15_10+m16_10+m17_10+m18_10+m19_10+m20_10+m21_10+m22_10+m23_10+m24_10+m25_10+m26_10+m27_10+m28_10+m29_10+m30_10+m31_10+m32_10+m33_10+m34_10+m35_10+m36_10+m37_10+m38_10+m39_10+m40_10+m41_10+m42_10+m43_10+m44_10+m45_10+m46_10+m47_10+m48_10+m49_10+m50_10+m51_10+m52_10+m53_10+m54_10+m55_10+m56_10+m57_10+m58_10+m59_10+m60_10+m61_10+m62_10+m63_10+m64_10+m65_10+m66_10+m67_10+m68_10+m69_10+m70_10+m71_10+m72_10+m73_10+m74_10+m75_10+m76_10+m77_10+m78_10+m79_10+m80_10+m81_10+b10;
endmodule