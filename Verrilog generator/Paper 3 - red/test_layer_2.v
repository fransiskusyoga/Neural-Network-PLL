module test_layer_2(in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,in16,in17,in18,in19,in20,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10);
   input signed [9:0] in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,in16,in17,in18,in19,in20;
   output signed [10:0] out1,out2,out3,out4,out5,out6,out7,out8,out9,out10;
   wire signed [9:0] neg1,neg2,neg3,neg4,neg5,neg6,neg7,neg8,neg9,neg10,neg11,neg12,neg13,neg14,neg15,neg16,neg17,neg18,neg19,neg20;

   //Bias value
   wire signed [10:0] b1 = $signed(11'h4);
   wire signed [10:0] b2 = $signed(11'h1);
   wire signed [10:0] b3 = $signed(11'hF);
   wire signed [10:0] b4 = $signed(11'h7F9);
   wire signed [10:0] b5 = $signed(11'h7FE);
   wire signed [10:0] b6 = $signed(11'h0);
   wire signed [10:0] b7 = $signed(11'h0);
   wire signed [10:0] b8 = $signed(11'h7FC);
   wire signed [10:0] b9 = $signed(11'h7FE);
   wire signed [10:0] b10 = $signed(11'h7FA);

   //Negation modules
   negate #(10) N1(in1,neg1);
   negate #(10) N2(in2,neg2);
   negate #(10) N3(in3,neg3);
   negate #(10) N4(in4,neg4);
   negate #(10) N5(in5,neg5);
   negate #(10) N6(in6,neg6);
   negate #(10) N7(in7,neg7);
   negate #(10) N8(in8,neg8);
   negate #(10) N9(in9,neg9);
   negate #(10) N10(in10,neg10);
   negate #(10) N11(in11,neg11);
   negate #(10) N12(in12,neg12);
   negate #(10) N13(in13,neg13);
   negate #(10) N14(in14,neg14);
   negate #(10) N15(in15,neg15);
   negate #(10) N16(in16,neg16);
   negate #(10) N17(in17,neg17);
   negate #(10) N18(in18,neg18);
   negate #(10) N19(in19,neg19);
   negate #(10) N20(in20,neg20);

   // m1_1 = W*in
   wire signed [10:0] m1_1;
   assign m1_1 =11'b0;

   // m1_2 = W*in
   wire signed [10:0] m1_2;
   assign m1_2 =11'b0;

   // m1_3 = W*in
   wire signed [10:0] m1_3;
   assign m1_3 =11'b0;

   // m1_4 = W*in
   wire signed [10:0] m1_4;
   assign m1_4 ={ {1{neg1[9]}} , neg1[9:0] };

   // m1_5 = W*in
   wire signed [10:0] m1_5;
   assign m1_5 =11'b0;

   // m1_6 = W*in
   wire signed [10:0] m1_6;
   assign m1_6 =11'b0;

   // m1_7 = W*in
   wire signed [10:0] m1_7;
   assign m1_7 =11'b0;

   // m1_8 = W*in
   wire signed [10:0] m1_8;
   assign m1_8 ={ {1{neg1[9]}} , neg1[9:0] };

   // m1_9 = W*in
   wire signed [10:0] m1_9;
   assign m1_9 =11'b0;

   // m1_10 = W*in
   wire signed [10:0] m1_10;
   assign m1_10 =11'b0;

   // m2_1 = W*in
   wire signed [10:0] m2_1;
   assign m2_1 =11'b0;

   // m2_2 = W*in
   wire signed [10:0] m2_2;
   assign m2_2 =11'b0;

   // m2_3 = W*in
   wire signed [10:0] m2_3;
   assign m2_3 =11'b0;

   // m2_4 = W*in
   wire signed [10:0] m2_4;
   assign m2_4 =11'b0;

   // m2_5 = W*in
   wire signed [10:0] m2_5;
   assign m2_5 ={ {1{in2[9]}} , in2[9:0] };

   // m2_6 = W*in
   wire signed [10:0] m2_6;
   assign m2_6 ={ {2{neg2[9]}} , neg2[9:1] };

   // m2_7 = W*in
   wire signed [10:0] m2_7;
   assign m2_7 ={ {1{neg2[9]}} , neg2[9:0] };

   // m2_8 = W*in
   wire signed [10:0] m2_8;
   assign m2_8 ={ {1{in2[9]}} , in2[9:0] };

   // m2_9 = W*in
   wire signed [10:0] m2_9;
   assign m2_9 ={ {1{in2[9]}} , in2[9:0] };

   // m2_10 = W*in
   wire signed [10:0] m2_10;
   assign m2_10 ={ {1{in2[9]}} , in2[9:0] };

   // m3_1 = W*in
   wire signed [10:0] m3_1;
   assign m3_1 =11'b0;

   // m3_2 = W*in
   wire signed [10:0] m3_2;
   assign m3_2 =11'b0;

   // m3_3 = W*in
   wire signed [10:0] m3_3;
   assign m3_3 ={ {1{in3[9]}} , in3[9:0] };

   // m3_4 = W*in
   wire signed [10:0] m3_4;
   assign m3_4 ={ {1{in3[9]}} , in3[9:0] };

   // m3_5 = W*in
   wire signed [10:0] m3_5;
   wire signed [11:0] tm3_5;
   assign tm3_5[0:0] = neg3[0:0];
   assign tm3_5[11:1] = { {1{neg3[9]}} , neg3[9:0] } + { {2{neg3[9]}} , neg3[9:1] };
   assign m3_5 ={ {1{tm3_5[11]}} , tm3_5[11:2] };

   // m3_6 = W*in
   wire signed [10:0] m3_6;
   assign m3_6 =11'b0;

   // m3_7 = W*in
   wire signed [10:0] m3_7;
   assign m3_7 =11'b0;

   // m3_8 = W*in
   wire signed [10:0] m3_8;
   assign m3_8 =11'b0;

   // m3_9 = W*in
   wire signed [10:0] m3_9;
   assign m3_9 =11'b0;

   // m3_10 = W*in
   wire signed [10:0] m3_10;
   assign m3_10 =11'b0;

   // m4_1 = W*in
   wire signed [10:0] m4_1;
   assign m4_1 =11'b0;

   // m4_2 = W*in
   wire signed [10:0] m4_2;
   assign m4_2 ={ {1{neg4[9]}} , neg4[9:0] };

   // m4_3 = W*in
   wire signed [10:0] m4_3;
   assign m4_3 =11'b0;

   // m4_4 = W*in
   wire signed [10:0] m4_4;
   assign m4_4 =11'b0;

   // m4_5 = W*in
   wire signed [10:0] m4_5;
   assign m4_5 ={ {1{in4[9]}} , in4[9:0] };

   // m4_6 = W*in
   wire signed [10:0] m4_6;
   assign m4_6 =11'b0;

   // m4_7 = W*in
   wire signed [10:0] m4_7;
   assign m4_7 =11'b0;

   // m4_8 = W*in
   wire signed [10:0] m4_8;
   assign m4_8 =11'b0;

   // m4_9 = W*in
   wire signed [10:0] m4_9;
   assign m4_9 ={ {1{neg4[9]}} , neg4[9:0] };

   // m4_10 = W*in
   wire signed [10:0] m4_10;
   assign m4_10 =11'b0;

   // m5_1 = W*in
   wire signed [10:0] m5_1;
   assign m5_1 ={ {1{in5[9]}} , in5[9:0] };

   // m5_2 = W*in
   wire signed [10:0] m5_2;
   assign m5_2 =11'b0;

   // m5_3 = W*in
   wire signed [10:0] m5_3;
   assign m5_3 =11'b0;

   // m5_4 = W*in
   wire signed [10:0] m5_4;
   assign m5_4 =11'b0;

   // m5_5 = W*in
   wire signed [10:0] m5_5;
   assign m5_5 =11'b0;

   // m5_6 = W*in
   wire signed [10:0] m5_6;
   assign m5_6 =11'b0;

   // m5_7 = W*in
   wire signed [10:0] m5_7;
   assign m5_7 ={ {1{in5[9]}} , in5[9:0] };

   // m5_8 = W*in
   wire signed [10:0] m5_8;
   assign m5_8 =11'b0;

   // m5_9 = W*in
   wire signed [10:0] m5_9;
   assign m5_9 ={ {2{in5[9]}} , in5[9:1] };

   // m5_10 = W*in
   wire signed [10:0] m5_10;
   assign m5_10 =11'b0;

   // m6_1 = W*in
   wire signed [10:0] m6_1;
   assign m6_1 =11'b0;

   // m6_2 = W*in
   wire signed [10:0] m6_2;
   assign m6_2 =11'b0;

   // m6_3 = W*in
   wire signed [10:0] m6_3;
   assign m6_3 ={ {2{in6[9]}} , in6[9:1] };

   // m6_4 = W*in
   wire signed [10:0] m6_4;
   assign m6_4 =11'b0;

   // m6_5 = W*in
   wire signed [10:0] m6_5;
   assign m6_5 =11'b0;

   // m6_6 = W*in
   wire signed [10:0] m6_6;
   assign m6_6 =11'b0;

   // m6_7 = W*in
   wire signed [10:0] m6_7;
   assign m6_7 =11'b0;

   // m6_8 = W*in
   wire signed [10:0] m6_8;
   assign m6_8 =11'b0;

   // m6_9 = W*in
   wire signed [10:0] m6_9;
   assign m6_9 ={ {1{neg6[9]}} , neg6[9:0] };

   // m6_10 = W*in
   wire signed [10:0] m6_10;
   assign m6_10 =11'b0;

   // m7_1 = W*in
   wire signed [10:0] m7_1;
   assign m7_1 =11'b0;

   // m7_2 = W*in
   wire signed [10:0] m7_2;
   assign m7_2 ={ {1{in7[9]}} , in7[9:0] };

   // m7_3 = W*in
   wire signed [10:0] m7_3;
   assign m7_3 =11'b0;

   // m7_4 = W*in
   wire signed [10:0] m7_4;
   assign m7_4 =11'b0;

   // m7_5 = W*in
   wire signed [10:0] m7_5;
   assign m7_5 =11'b0;

   // m7_6 = W*in
   wire signed [10:0] m7_6;
   assign m7_6 =11'b0;

   // m7_7 = W*in
   wire signed [10:0] m7_7;
   assign m7_7 =11'b0;

   // m7_8 = W*in
   wire signed [10:0] m7_8;
   assign m7_8 =11'b0;

   // m7_9 = W*in
   wire signed [10:0] m7_9;
   assign m7_9 =11'b0;

   // m7_10 = W*in
   wire signed [10:0] m7_10;
   wire signed [12:0] tm7_10;
   assign tm7_10[1:0] = in7[1:0];
   assign tm7_10[12:2] = { {1{in7[9]}} , in7[9:0] } + { {3{in7[9]}} , in7[9:2] };
   assign m7_10 =tm7_10[12:2];

   // m8_1 = W*in
   wire signed [10:0] m8_1;
   assign m8_1 =11'b0;

   // m8_2 = W*in
   wire signed [10:0] m8_2;
   assign m8_2 =11'b0;

   // m8_3 = W*in
   wire signed [10:0] m8_3;
   assign m8_3 =11'b0;

   // m8_4 = W*in
   wire signed [10:0] m8_4;
   assign m8_4 ={ {1{in8[9]}} , in8[9:0] };

   // m8_5 = W*in
   wire signed [10:0] m8_5;
   assign m8_5 =11'b0;

   // m8_6 = W*in
   wire signed [10:0] m8_6;
   assign m8_6 ={ {1{in8[9]}} , in8[9:0] };

   // m8_7 = W*in
   wire signed [10:0] m8_7;
   assign m8_7 ={ {1{neg8[9]}} , neg8[9:0] };

   // m8_8 = W*in
   wire signed [10:0] m8_8;
   assign m8_8 ={ {1{in8[9]}} , in8[9:0] };

   // m8_9 = W*in
   wire signed [10:0] m8_9;
   wire signed [11:0] tm8_9;
   assign tm8_9[0:0] = neg8[0:0];
   assign tm8_9[11:1] = { {1{neg8[9]}} , neg8[9:0] } + { {2{neg8[9]}} , neg8[9:1] };
   assign m8_9 ={ {1{tm8_9[11]}} , tm8_9[11:2] };

   // m8_10 = W*in
   wire signed [10:0] m8_10;
   assign m8_10 =11'b0;

   // m9_1 = W*in
   wire signed [10:0] m9_1;
   assign m9_1 ={ {1{neg9[9]}} , neg9[9:0] };

   // m9_2 = W*in
   wire signed [10:0] m9_2;
   assign m9_2 =11'b0;

   // m9_3 = W*in
   wire signed [10:0] m9_3;
   wire signed [11:0] tm9_3;
   assign tm9_3[0:0] = neg9[0:0];
   assign tm9_3[11:1] = { {1{neg9[9]}} , neg9[9:0] } + { {2{neg9[9]}} , neg9[9:1] };
   assign m9_3 =tm9_3[11:1];

   // m9_4 = W*in
   wire signed [10:0] m9_4;
   assign m9_4 =11'b0;

   // m9_5 = W*in
   wire signed [10:0] m9_5;
   assign m9_5 =11'b0;

   // m9_6 = W*in
   wire signed [10:0] m9_6;
   assign m9_6 =11'b0;

   // m9_7 = W*in
   wire signed [10:0] m9_7;
   assign m9_7 =11'b0;

   // m9_8 = W*in
   wire signed [10:0] m9_8;
   assign m9_8 =11'b0;

   // m9_9 = W*in
   wire signed [10:0] m9_9;
   assign m9_9 =11'b0;

   // m9_10 = W*in
   wire signed [10:0] m9_10;
   assign m9_10 ={ {1{neg9[9]}} , neg9[9:0] };

   // m10_1 = W*in
   wire signed [10:0] m10_1;
   assign m10_1 ={ {1{in10[9]}} , in10[9:0] };

   // m10_2 = W*in
   wire signed [10:0] m10_2;
   assign m10_2 =11'b0;

   // m10_3 = W*in
   wire signed [10:0] m10_3;
   assign m10_3 =11'b0;

   // m10_4 = W*in
   wire signed [10:0] m10_4;
   assign m10_4 =11'b0;

   // m10_5 = W*in
   wire signed [10:0] m10_5;
   assign m10_5 ={ in10[9:0] , {1{1'b0}} };

   // m10_6 = W*in
   wire signed [10:0] m10_6;
   assign m10_6 =11'b0;

   // m10_7 = W*in
   wire signed [10:0] m10_7;
   assign m10_7 =11'b0;

   // m10_8 = W*in
   wire signed [10:0] m10_8;
   assign m10_8 =11'b0;

   // m10_9 = W*in
   wire signed [10:0] m10_9;
   assign m10_9 =11'b0;

   // m10_10 = W*in
   wire signed [10:0] m10_10;
   assign m10_10 ={ {1{in10[9]}} , in10[9:0] };

   // m11_1 = W*in
   wire signed [10:0] m11_1;
   assign m11_1 =11'b0;

   // m11_2 = W*in
   wire signed [10:0] m11_2;
   assign m11_2 =11'b0;

   // m11_3 = W*in
   wire signed [10:0] m11_3;
   assign m11_3 =11'b0;

   // m11_4 = W*in
   wire signed [10:0] m11_4;
   assign m11_4 ={ {1{in11[9]}} , in11[9:0] };

   // m11_5 = W*in
   wire signed [10:0] m11_5;
   assign m11_5 =11'b0;

   // m11_6 = W*in
   wire signed [10:0] m11_6;
   assign m11_6 =11'b0;

   // m11_7 = W*in
   wire signed [10:0] m11_7;
   assign m11_7 =11'b0;

   // m11_8 = W*in
   wire signed [10:0] m11_8;
   assign m11_8 ={ {1{in11[9]}} , in11[9:0] };

   // m11_9 = W*in
   wire signed [10:0] m11_9;
   assign m11_9 =11'b0;

   // m11_10 = W*in
   wire signed [10:0] m11_10;
   assign m11_10 ={ {1{in11[9]}} , in11[9:0] };

   // m12_1 = W*in
   wire signed [10:0] m12_1;
   assign m12_1 =11'b0;

   // m12_2 = W*in
   wire signed [10:0] m12_2;
   assign m12_2 ={ {1{neg12[9]}} , neg12[9:0] };

   // m12_3 = W*in
   wire signed [10:0] m12_3;
   assign m12_3 =11'b0;

   // m12_4 = W*in
   wire signed [10:0] m12_4;
   assign m12_4 =11'b0;

   // m12_5 = W*in
   wire signed [10:0] m12_5;
   assign m12_5 ={ {2{neg12[9]}} , neg12[9:1] };

   // m12_6 = W*in
   wire signed [10:0] m12_6;
   assign m12_6 =11'b0;

   // m12_7 = W*in
   wire signed [10:0] m12_7;
   assign m12_7 ={ {2{in12[9]}} , in12[9:1] };

   // m12_8 = W*in
   wire signed [10:0] m12_8;
   assign m12_8 ={ {1{neg12[9]}} , neg12[9:0] };

   // m12_9 = W*in
   wire signed [10:0] m12_9;
   assign m12_9 =11'b0;

   // m12_10 = W*in
   wire signed [10:0] m12_10;
   assign m12_10 ={ {1{neg12[9]}} , neg12[9:0] };

   // m13_1 = W*in
   wire signed [10:0] m13_1;
   wire signed [11:0] tm13_1;
   assign tm13_1[0:0] = neg13[0:0];
   assign tm13_1[11:1] = { {1{neg13[9]}} , neg13[9:0] } + { {2{neg13[9]}} , neg13[9:1] };
   assign m13_1 ={ {1{tm13_1[11]}} , tm13_1[11:2] };

   // m13_2 = W*in
   wire signed [10:0] m13_2;
   assign m13_2 =11'b0;

   // m13_3 = W*in
   wire signed [10:0] m13_3;
   assign m13_3 =11'b0;

   // m13_4 = W*in
   wire signed [10:0] m13_4;
   assign m13_4 ={ {1{neg13[9]}} , neg13[9:0] };

   // m13_5 = W*in
   wire signed [10:0] m13_5;
   assign m13_5 =11'b0;

   // m13_6 = W*in
   wire signed [10:0] m13_6;
   assign m13_6 =11'b0;

   // m13_7 = W*in
   wire signed [10:0] m13_7;
   assign m13_7 ={ {1{in13[9]}} , in13[9:0] };

   // m13_8 = W*in
   wire signed [10:0] m13_8;
   assign m13_8 ={ {1{neg13[9]}} , neg13[9:0] };

   // m13_9 = W*in
   wire signed [10:0] m13_9;
   assign m13_9 =11'b0;

   // m13_10 = W*in
   wire signed [10:0] m13_10;
   assign m13_10 =11'b0;

   // m14_1 = W*in
   wire signed [10:0] m14_1;
   assign m14_1 ={ {1{in14[9]}} , in14[9:0] };

   // m14_2 = W*in
   wire signed [10:0] m14_2;
   assign m14_2 =11'b0;

   // m14_3 = W*in
   wire signed [10:0] m14_3;
   assign m14_3 =11'b0;

   // m14_4 = W*in
   wire signed [10:0] m14_4;
   assign m14_4 ={ {1{neg14[9]}} , neg14[9:0] };

   // m14_5 = W*in
   wire signed [10:0] m14_5;
   wire signed [11:0] tm14_5;
   assign tm14_5[0:0] = neg14[0:0];
   assign tm14_5[11:1] = { {1{neg14[9]}} , neg14[9:0] } + { {2{neg14[9]}} , neg14[9:1] };
   assign m14_5 ={ {1{tm14_5[11]}} , tm14_5[11:2] };

   // m14_6 = W*in
   wire signed [10:0] m14_6;
   assign m14_6 =11'b0;

   // m14_7 = W*in
   wire signed [10:0] m14_7;
   assign m14_7 =11'b0;

   // m14_8 = W*in
   wire signed [10:0] m14_8;
   assign m14_8 ={ {1{in14[9]}} , in14[9:0] };

   // m14_9 = W*in
   wire signed [10:0] m14_9;
   assign m14_9 =11'b0;

   // m14_10 = W*in
   wire signed [10:0] m14_10;
   assign m14_10 ={ {1{in14[9]}} , in14[9:0] };

   // m15_1 = W*in
   wire signed [10:0] m15_1;
   assign m15_1 =11'b0;

   // m15_2 = W*in
   wire signed [10:0] m15_2;
   assign m15_2 ={ {1{in15[9]}} , in15[9:0] };

   // m15_3 = W*in
   wire signed [10:0] m15_3;
   assign m15_3 =11'b0;

   // m15_4 = W*in
   wire signed [10:0] m15_4;
   assign m15_4 =11'b0;

   // m15_5 = W*in
   wire signed [10:0] m15_5;
   assign m15_5 =11'b0;

   // m15_6 = W*in
   wire signed [10:0] m15_6;
   assign m15_6 =11'b0;

   // m15_7 = W*in
   wire signed [10:0] m15_7;
   assign m15_7 =11'b0;

   // m15_8 = W*in
   wire signed [10:0] m15_8;
   assign m15_8 =11'b0;

   // m15_9 = W*in
   wire signed [10:0] m15_9;
   assign m15_9 ={ {1{in15[9]}} , in15[9:0] };

   // m15_10 = W*in
   wire signed [10:0] m15_10;
   assign m15_10 =11'b0;

   // m16_1 = W*in
   wire signed [10:0] m16_1;
   assign m16_1 =11'b0;

   // m16_2 = W*in
   wire signed [10:0] m16_2;
   assign m16_2 =11'b0;

   // m16_3 = W*in
   wire signed [10:0] m16_3;
   assign m16_3 ={ {1{in16[9]}} , in16[9:0] };

   // m16_4 = W*in
   wire signed [10:0] m16_4;
   assign m16_4 =11'b0;

   // m16_5 = W*in
   wire signed [10:0] m16_5;
   assign m16_5 =11'b0;

   // m16_6 = W*in
   wire signed [10:0] m16_6;
   assign m16_6 ={ {1{neg16[9]}} , neg16[9:0] };

   // m16_7 = W*in
   wire signed [10:0] m16_7;
   assign m16_7 =11'b0;

   // m16_8 = W*in
   wire signed [10:0] m16_8;
   assign m16_8 =11'b0;

   // m16_9 = W*in
   wire signed [10:0] m16_9;
   assign m16_9 ={ {1{in16[9]}} , in16[9:0] };

   // m16_10 = W*in
   wire signed [10:0] m16_10;
   assign m16_10 =11'b0;

   // m17_1 = W*in
   wire signed [10:0] m17_1;
   wire signed [11:0] tm17_1;
   assign tm17_1[0:0] = neg17[0:0];
   assign tm17_1[11:1] = { {1{neg17[9]}} , neg17[9:0] } + { {2{neg17[9]}} , neg17[9:1] };
   assign m17_1 ={ {1{tm17_1[11]}} , tm17_1[11:2] };

   // m17_2 = W*in
   wire signed [10:0] m17_2;
   assign m17_2 =11'b0;

   // m17_3 = W*in
   wire signed [10:0] m17_3;
   assign m17_3 =11'b0;

   // m17_4 = W*in
   wire signed [10:0] m17_4;
   assign m17_4 =11'b0;

   // m17_5 = W*in
   wire signed [10:0] m17_5;
   assign m17_5 =11'b0;

   // m17_6 = W*in
   wire signed [10:0] m17_6;
   wire signed [11:0] tm17_6;
   assign tm17_6[0:0] = neg17[0:0];
   assign tm17_6[11:1] = { {1{neg17[9]}} , neg17[9:0] } + { {2{neg17[9]}} , neg17[9:1] };
   assign m17_6 ={ {1{tm17_6[11]}} , tm17_6[11:2] };

   // m17_7 = W*in
   wire signed [10:0] m17_7;
   assign m17_7 ={ {1{neg17[9]}} , neg17[9:0] };

   // m17_8 = W*in
   wire signed [10:0] m17_8;
   assign m17_8 =11'b0;

   // m17_9 = W*in
   wire signed [10:0] m17_9;
   assign m17_9 =11'b0;

   // m17_10 = W*in
   wire signed [10:0] m17_10;
   assign m17_10 ={ {1{neg17[9]}} , neg17[9:0] };

   // m18_1 = W*in
   wire signed [10:0] m18_1;
   assign m18_1 ={ {1{in18[9]}} , in18[9:0] };

   // m18_2 = W*in
   wire signed [10:0] m18_2;
   assign m18_2 ={ {1{in18[9]}} , in18[9:0] };

   // m18_3 = W*in
   wire signed [10:0] m18_3;
   assign m18_3 =11'b0;

   // m18_4 = W*in
   wire signed [10:0] m18_4;
   assign m18_4 =11'b0;

   // m18_5 = W*in
   wire signed [10:0] m18_5;
   assign m18_5 =11'b0;

   // m18_6 = W*in
   wire signed [10:0] m18_6;
   assign m18_6 ={ {1{in18[9]}} , in18[9:0] };

   // m18_7 = W*in
   wire signed [10:0] m18_7;
   assign m18_7 =11'b0;

   // m18_8 = W*in
   wire signed [10:0] m18_8;
   assign m18_8 =11'b0;

   // m18_9 = W*in
   wire signed [10:0] m18_9;
   assign m18_9 =11'b0;

   // m18_10 = W*in
   wire signed [10:0] m18_10;
   assign m18_10 =11'b0;

   // m19_1 = W*in
   wire signed [10:0] m19_1;
   assign m19_1 =11'b0;

   // m19_2 = W*in
   wire signed [10:0] m19_2;
   assign m19_2 =11'b0;

   // m19_3 = W*in
   wire signed [10:0] m19_3;
   assign m19_3 ={ {1{neg19[9]}} , neg19[9:0] };

   // m19_4 = W*in
   wire signed [10:0] m19_4;
   assign m19_4 =11'b0;

   // m19_5 = W*in
   wire signed [10:0] m19_5;
   assign m19_5 =11'b0;

   // m19_6 = W*in
   wire signed [10:0] m19_6;
   assign m19_6 =11'b0;

   // m19_7 = W*in
   wire signed [10:0] m19_7;
   assign m19_7 ={ {1{neg19[9]}} , neg19[9:0] };

   // m19_8 = W*in
   wire signed [10:0] m19_8;
   assign m19_8 =11'b0;

   // m19_9 = W*in
   wire signed [10:0] m19_9;
   assign m19_9 =11'b0;

   // m19_10 = W*in
   wire signed [10:0] m19_10;
   assign m19_10 =11'b0;

   // m20_1 = W*in
   wire signed [10:0] m20_1;
   assign m20_1 =11'b0;

   // m20_2 = W*in
   wire signed [10:0] m20_2;
   assign m20_2 =11'b0;

   // m20_3 = W*in
   wire signed [10:0] m20_3;
   wire signed [11:0] tm20_3;
   assign tm20_3[0:0] = neg20[0:0];
   assign tm20_3[11:1] = { {1{neg20[9]}} , neg20[9:0] } + { {2{neg20[9]}} , neg20[9:1] };
   assign m20_3 ={ {1{tm20_3[11]}} , tm20_3[11:2] };

   // m20_4 = W*in
   wire signed [10:0] m20_4;
   assign m20_4 ={ {1{in20[9]}} , in20[9:0] };

   // m20_5 = W*in
   wire signed [10:0] m20_5;
   assign m20_5 ={ {1{neg20[9]}} , neg20[9:0] };

   // m20_6 = W*in
   wire signed [10:0] m20_6;
   wire signed [11:0] tm20_6;
   assign tm20_6[0:0] = in20[0:0];
   assign tm20_6[11:1] = { {1{in20[9]}} , in20[9:0] } + { {2{in20[9]}} , in20[9:1] };
   assign m20_6 =tm20_6[11:1];

   // m20_7 = W*in
   wire signed [10:0] m20_7;
   assign m20_7 =11'b0;

   // m20_8 = W*in
   wire signed [10:0] m20_8;
   assign m20_8 ={ {1{neg20[9]}} , neg20[9:0] };

   // m20_9 = W*in
   wire signed [10:0] m20_9;
   assign m20_9 ={ {1{in20[9]}} , in20[9:0] };

   // m20_10 = W*in
   wire signed [10:0] m20_10;
   assign m20_10 ={ {1{in20[9]}} , in20[9:0] };

   //Perceptron Adders
   assign out1 = m1_1+m2_1+m3_1+m4_1+m5_1+m6_1+m7_1+m8_1+m9_1+m10_1+m11_1+m12_1+m13_1+m14_1+m15_1+m16_1+m17_1+m18_1+m19_1+m20_1+b1;
   assign out2 = m1_2+m2_2+m3_2+m4_2+m5_2+m6_2+m7_2+m8_2+m9_2+m10_2+m11_2+m12_2+m13_2+m14_2+m15_2+m16_2+m17_2+m18_2+m19_2+m20_2+b2;
   assign out3 = m1_3+m2_3+m3_3+m4_3+m5_3+m6_3+m7_3+m8_3+m9_3+m10_3+m11_3+m12_3+m13_3+m14_3+m15_3+m16_3+m17_3+m18_3+m19_3+m20_3+b3;
   assign out4 = m1_4+m2_4+m3_4+m4_4+m5_4+m6_4+m7_4+m8_4+m9_4+m10_4+m11_4+m12_4+m13_4+m14_4+m15_4+m16_4+m17_4+m18_4+m19_4+m20_4+b4;
   assign out5 = m1_5+m2_5+m3_5+m4_5+m5_5+m6_5+m7_5+m8_5+m9_5+m10_5+m11_5+m12_5+m13_5+m14_5+m15_5+m16_5+m17_5+m18_5+m19_5+m20_5+b5;
   assign out6 = m1_6+m2_6+m3_6+m4_6+m5_6+m6_6+m7_6+m8_6+m9_6+m10_6+m11_6+m12_6+m13_6+m14_6+m15_6+m16_6+m17_6+m18_6+m19_6+m20_6+b6;
   assign out7 = m1_7+m2_7+m3_7+m4_7+m5_7+m6_7+m7_7+m8_7+m9_7+m10_7+m11_7+m12_7+m13_7+m14_7+m15_7+m16_7+m17_7+m18_7+m19_7+m20_7+b7;
   assign out8 = m1_8+m2_8+m3_8+m4_8+m5_8+m6_8+m7_8+m8_8+m9_8+m10_8+m11_8+m12_8+m13_8+m14_8+m15_8+m16_8+m17_8+m18_8+m19_8+m20_8+b8;
   assign out9 = m1_9+m2_9+m3_9+m4_9+m5_9+m6_9+m7_9+m8_9+m9_9+m10_9+m11_9+m12_9+m13_9+m14_9+m15_9+m16_9+m17_9+m18_9+m19_9+m20_9+b9;
   assign out10 = m1_10+m2_10+m3_10+m4_10+m5_10+m6_10+m7_10+m8_10+m9_10+m10_10+m11_10+m12_10+m13_10+m14_10+m15_10+m16_10+m17_10+m18_10+m19_10+m20_10+b10;
endmodule