module test_layer_2(in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10);
   input signed [6:0] in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15;
   output signed [7:0] out1,out2,out3,out4,out5,out6,out7,out8,out9,out10;
   wire signed [6:0] neg1,neg2,neg3,neg4,neg5,neg6,neg7,neg8,neg9,neg10,neg11,neg12,neg13,neg14,neg15;

   //Bias value
   wire signed [7:0] b1 = $signed(8'h0);
   wire signed [7:0] b2 = $signed(8'h1);
   wire signed [7:0] b3 = $signed(8'h3);
   wire signed [7:0] b4 = $signed(8'h0);
   wire signed [7:0] b5 = $signed(8'h0);
   wire signed [7:0] b6 = $signed(8'h0);
   wire signed [7:0] b7 = $signed(8'h0);
   wire signed [7:0] b8 = $signed(8'hFE);
   wire signed [7:0] b9 = $signed(8'hFE);
   wire signed [7:0] b10 = $signed(8'h1);

   //Negation modules
   negate #(7) N1(in1,neg1);
   negate #(7) N2(in2,neg2);
   negate #(7) N3(in3,neg3);
   negate #(7) N4(in4,neg4);
   negate #(7) N5(in5,neg5);
   negate #(7) N6(in6,neg6);
   negate #(7) N7(in7,neg7);
   negate #(7) N8(in8,neg8);
   negate #(7) N9(in9,neg9);
   negate #(7) N10(in10,neg10);
   negate #(7) N11(in11,neg11);
   negate #(7) N12(in12,neg12);
   negate #(7) N13(in13,neg13);
   negate #(7) N14(in14,neg14);
   negate #(7) N15(in15,neg15);

   // m1_1 = W*in
   wire signed [7:0] m1_1;
   assign m1_1 =8'b0;

   // m1_2 = W*in
   wire signed [7:0] m1_2;
   assign m1_2 =8'b0;

   // m1_3 = W*in
   wire signed [7:0] m1_3;
   assign m1_3 =8'b0;

   // m1_4 = W*in
   wire signed [7:0] m1_4;
   assign m1_4 =8'b0;

   // m1_5 = W*in
   wire signed [7:0] m1_5;
   assign m1_5 =8'b0;

   // m1_6 = W*in
   wire signed [7:0] m1_6;
   assign m1_6 =8'b0;

   // m1_7 = W*in
   wire signed [7:0] m1_7;
   assign m1_7 =8'b0;

   // m1_8 = W*in
   wire signed [7:0] m1_8;
   wire signed [10:0] tm1_8;
   assign tm1_8[2:0] = neg1[2:0];
   assign tm1_8[10:3] = { {1{neg1[6]}} , neg1[6:0] } + { {4{neg1[6]}} , neg1[6:3] };
   assign m1_8 =tm1_8[10:3];

   // m1_9 = W*in
   wire signed [7:0] m1_9;
   assign m1_9 =8'b0;

   // m1_10 = W*in
   wire signed [7:0] m1_10;
   assign m1_10 ={ {1{neg1[6]}} , neg1[6:0] };

   // m2_1 = W*in
   wire signed [7:0] m2_1;
   assign m2_1 ={ {1{neg2[6]}} , neg2[6:0] };

   // m2_2 = W*in
   wire signed [7:0] m2_2;
   assign m2_2 =8'b0;

   // m2_3 = W*in
   wire signed [7:0] m2_3;
   assign m2_3 =8'b0;

   // m2_4 = W*in
   wire signed [7:0] m2_4;
   assign m2_4 =8'b0;

   // m2_5 = W*in
   wire signed [7:0] m2_5;
   assign m2_5 ={ {1{in2[6]}} , in2[6:0] };

   // m2_6 = W*in
   wire signed [7:0] m2_6;
   wire signed [8:0] tm2_6;
   assign tm2_6[0:0] = neg2[0:0];
   assign tm2_6[8:1] = { {1{neg2[6]}} , neg2[6:0] } + { {2{neg2[6]}} , neg2[6:1] };
   assign m2_6 =tm2_6[8:1];

   // m2_7 = W*in
   wire signed [7:0] m2_7;
   assign m2_7 =8'b0;

   // m2_8 = W*in
   wire signed [7:0] m2_8;
   assign m2_8 =8'b0;

   // m2_9 = W*in
   wire signed [7:0] m2_9;
   assign m2_9 =8'b0;

   // m2_10 = W*in
   wire signed [7:0] m2_10;
   assign m2_10 =8'b0;

   // m3_1 = W*in
   wire signed [7:0] m3_1;
   assign m3_1 =8'b0;

   // m3_2 = W*in
   wire signed [7:0] m3_2;
   assign m3_2 ={ {1{neg3[6]}} , neg3[6:0] };

   // m3_3 = W*in
   wire signed [7:0] m3_3;
   wire signed [8:0] tm3_3;
   assign tm3_3[0:0] = in3[0:0];
   assign tm3_3[8:1] = { {1{in3[6]}} , in3[6:0] } + { {2{in3[6]}} , in3[6:1] };
   assign m3_3 ={ {1{tm3_3[8]}} , tm3_3[8:2] };

   // m3_4 = W*in
   wire signed [7:0] m3_4;
   assign m3_4 =8'b0;

   // m3_5 = W*in
   wire signed [7:0] m3_5;
   assign m3_5 ={ {1{neg3[6]}} , neg3[6:0] };

   // m3_6 = W*in
   wire signed [7:0] m3_6;
   assign m3_6 =8'b0;

   // m3_7 = W*in
   wire signed [7:0] m3_7;
   assign m3_7 ={ {1{neg3[6]}} , neg3[6:0] };

   // m3_8 = W*in
   wire signed [7:0] m3_8;
   assign m3_8 =8'b0;

   // m3_9 = W*in
   wire signed [7:0] m3_9;
   assign m3_9 =8'b0;

   // m3_10 = W*in
   wire signed [7:0] m3_10;
   assign m3_10 =8'b0;

   // m4_1 = W*in
   wire signed [7:0] m4_1;
   assign m4_1 =8'b0;

   // m4_2 = W*in
   wire signed [7:0] m4_2;
   assign m4_2 ={ {1{neg4[6]}} , neg4[6:0] };

   // m4_3 = W*in
   wire signed [7:0] m4_3;
   assign m4_3 =8'b0;

   // m4_4 = W*in
   wire signed [7:0] m4_4;
   assign m4_4 =8'b0;

   // m4_5 = W*in
   wire signed [7:0] m4_5;
   wire signed [9:0] tm4_5;
   assign tm4_5[1:0] = in4[1:0];
   assign tm4_5[9:2] = { {1{in4[6]}} , in4[6:0] } + { {3{in4[6]}} , in4[6:2] };
   assign m4_5 =tm4_5[9:2];

   // m4_6 = W*in
   wire signed [7:0] m4_6;
   assign m4_6 ={ {1{in4[6]}} , in4[6:0] };

   // m4_7 = W*in
   wire signed [7:0] m4_7;
   assign m4_7 =8'b0;

   // m4_8 = W*in
   wire signed [7:0] m4_8;
   assign m4_8 =8'b0;

   // m4_9 = W*in
   wire signed [7:0] m4_9;
   wire signed [9:0] tm4_9;
   assign tm4_9[1:0] = neg4[1:0];
   assign tm4_9[9:2] = { {1{neg4[6]}} , neg4[6:0] } + { {3{neg4[6]}} , neg4[6:2] };
   assign m4_9 =tm4_9[9:2];

   // m4_10 = W*in
   wire signed [7:0] m4_10;
   assign m4_10 =8'b0;

   // m5_1 = W*in
   wire signed [7:0] m5_1;
   wire signed [10:0] tm5_1;
   assign tm5_1[2:0] = neg5[2:0];
   assign tm5_1[10:3] = { {1{in5[6]}} , in5[6:0] } + { {4{neg5[6]}} , neg5[6:3] };
   assign m5_1 =tm5_1[9:2];

   // m5_2 = W*in
   wire signed [7:0] m5_2;
   wire signed [8:0] tm5_2;
   assign tm5_2[0:0] = neg5[0:0];
   assign tm5_2[8:1] = { {1{neg5[6]}} , neg5[6:0] } + { {2{neg5[6]}} , neg5[6:1] };
   assign m5_2 ={ {1{tm5_2[8]}} , tm5_2[8:2] };

   // m5_3 = W*in
   wire signed [7:0] m5_3;
   assign m5_3 =8'b0;

   // m5_4 = W*in
   wire signed [7:0] m5_4;
   assign m5_4 =8'b0;

   // m5_5 = W*in
   wire signed [7:0] m5_5;
   assign m5_5 =8'b0;

   // m5_6 = W*in
   wire signed [7:0] m5_6;
   assign m5_6 =8'b0;

   // m5_7 = W*in
   wire signed [7:0] m5_7;
   wire signed [8:0] tm5_7;
   assign tm5_7[0:0] = in5[0:0];
   assign tm5_7[8:1] = { {1{in5[6]}} , in5[6:0] } + { {2{in5[6]}} , in5[6:1] };
   assign m5_7 =tm5_7[8:1];

   // m5_8 = W*in
   wire signed [7:0] m5_8;
   assign m5_8 =8'b0;

   // m5_9 = W*in
   wire signed [7:0] m5_9;
   assign m5_9 =8'b0;

   // m5_10 = W*in
   wire signed [7:0] m5_10;
   assign m5_10 =8'b0;

   // m6_1 = W*in
   wire signed [7:0] m6_1;
   wire signed [8:0] tm6_1;
   assign tm6_1[0:0] = neg6[0:0];
   assign tm6_1[8:1] = { {1{neg6[6]}} , neg6[6:0] } + { {2{neg6[6]}} , neg6[6:1] };
   assign m6_1 ={ {1{tm6_1[8]}} , tm6_1[8:2] };

   // m6_2 = W*in
   wire signed [7:0] m6_2;
   assign m6_2 =8'b0;

   // m6_3 = W*in
   wire signed [7:0] m6_3;
   assign m6_3 =8'b0;

   // m6_4 = W*in
   wire signed [7:0] m6_4;
   assign m6_4 =8'b0;

   // m6_5 = W*in
   wire signed [7:0] m6_5;
   assign m6_5 =8'b0;

   // m6_6 = W*in
   wire signed [7:0] m6_6;
   assign m6_6 ={ {1{neg6[6]}} , neg6[6:0] };

   // m6_7 = W*in
   wire signed [7:0] m6_7;
   assign m6_7 =8'b0;

   // m6_8 = W*in
   wire signed [7:0] m6_8;
   assign m6_8 =8'b0;

   // m6_9 = W*in
   wire signed [7:0] m6_9;
   assign m6_9 =8'b0;

   // m6_10 = W*in
   wire signed [7:0] m6_10;
   wire signed [8:0] tm6_10;
   assign tm6_10[0:0] = neg6[0:0];
   assign tm6_10[8:1] = { {1{neg6[6]}} , neg6[6:0] } + { {2{neg6[6]}} , neg6[6:1] };
   assign m6_10 =tm6_10[8:1];

   // m7_1 = W*in
   wire signed [7:0] m7_1;
   wire signed [9:0] tm7_1;
   assign tm7_1[1:0] = neg7[1:0];
   assign tm7_1[9:2] = { {1{neg7[6]}} , neg7[6:0] } + { {3{neg7[6]}} , neg7[6:2] };
   assign m7_1 ={ {1{tm7_1[9]}} , tm7_1[9:3] };

   // m7_2 = W*in
   wire signed [7:0] m7_2;
   assign m7_2 =8'b0;

   // m7_3 = W*in
   wire signed [7:0] m7_3;
   wire signed [10:0] tm7_3;
   assign tm7_3[2:0] = in7[2:0];
   assign tm7_3[10:3] = { {1{neg7[6]}} , neg7[6:0] } + { {4{in7[6]}} , in7[6:3] };
   assign m7_3 =tm7_3[9:2];

   // m7_4 = W*in
   wire signed [7:0] m7_4;
   assign m7_4 =8'b0;

   // m7_5 = W*in
   wire signed [7:0] m7_5;
   assign m7_5 =8'b0;

   // m7_6 = W*in
   wire signed [7:0] m7_6;
   assign m7_6 =8'b0;

   // m7_7 = W*in
   wire signed [7:0] m7_7;
   assign m7_7 =8'b0;

   // m7_8 = W*in
   wire signed [7:0] m7_8;
   assign m7_8 =8'b0;

   // m7_9 = W*in
   wire signed [7:0] m7_9;
   assign m7_9 =8'b0;

   // m7_10 = W*in
   wire signed [7:0] m7_10;
   assign m7_10 =8'b0;

   // m8_1 = W*in
   wire signed [7:0] m8_1;
   wire signed [10:0] tm8_1;
   assign tm8_1[2:0] = neg8[2:0];
   assign tm8_1[10:3] = { {1{in8[6]}} , in8[6:0] } + { {4{neg8[6]}} , neg8[6:3] };
   assign m8_1 =tm8_1[9:2];

   // m8_2 = W*in
   wire signed [7:0] m8_2;
   assign m8_2 =8'b0;

   // m8_3 = W*in
   wire signed [7:0] m8_3;
   assign m8_3 =8'b0;

   // m8_4 = W*in
   wire signed [7:0] m8_4;
   assign m8_4 =8'b0;

   // m8_5 = W*in
   wire signed [7:0] m8_5;
   wire signed [8:0] tm8_5;
   assign tm8_5[0:0] = in8[0:0];
   assign tm8_5[8:1] = { {1{in8[6]}} , in8[6:0] } + { {2{in8[6]}} , in8[6:1] };
   assign m8_5 =tm8_5[8:1];

   // m8_6 = W*in
   wire signed [7:0] m8_6;
   assign m8_6 =8'b0;

   // m8_7 = W*in
   wire signed [7:0] m8_7;
   assign m8_7 =8'b0;

   // m8_8 = W*in
   wire signed [7:0] m8_8;
   assign m8_8 =8'b0;

   // m8_9 = W*in
   wire signed [7:0] m8_9;
   assign m8_9 =8'b0;

   // m8_10 = W*in
   wire signed [7:0] m8_10;
   wire signed [10:0] tm8_10;
   assign tm8_10[2:0] = neg8[2:0];
   assign tm8_10[10:3] = { {1{in8[6]}} , in8[6:0] } + { {4{neg8[6]}} , neg8[6:3] };
   assign m8_10 =tm8_10[9:2];

   // m9_1 = W*in
   wire signed [7:0] m9_1;
   assign m9_1 =8'b0;

   // m9_2 = W*in
   wire signed [7:0] m9_2;
   assign m9_2 ={ {1{neg9[6]}} , neg9[6:0] };

   // m9_3 = W*in
   wire signed [7:0] m9_3;
   assign m9_3 =8'b0;

   // m9_4 = W*in
   wire signed [7:0] m9_4;
   wire signed [9:0] tm9_4;
   assign tm9_4[1:0] = in9[1:0];
   assign tm9_4[9:2] = { {1{in9[6]}} , in9[6:0] } + { {3{in9[6]}} , in9[6:2] };
   assign m9_4 =tm9_4[9:2];

   // m9_5 = W*in
   wire signed [7:0] m9_5;
   wire signed [10:0] tm9_5;
   assign tm9_5[2:0] = neg9[2:0];
   assign tm9_5[10:3] = { {1{neg9[6]}} , neg9[6:0] } + { {4{neg9[6]}} , neg9[6:3] };
   assign m9_5 =tm9_5[10:3];

   // m9_6 = W*in
   wire signed [7:0] m9_6;
   assign m9_6 =8'b0;

   // m9_7 = W*in
   wire signed [7:0] m9_7;
   assign m9_7 =8'b0;

   // m9_8 = W*in
   wire signed [7:0] m9_8;
   wire signed [10:0] tm9_8;
   assign tm9_8[2:0] = neg9[2:0];
   assign tm9_8[10:3] = { {1{in9[6]}} , in9[6:0] } + { {4{neg9[6]}} , neg9[6:3] };
   assign m9_8 =tm9_8[9:2];

   // m9_9 = W*in
   wire signed [7:0] m9_9;
   assign m9_9 =8'b0;

   // m9_10 = W*in
   wire signed [7:0] m9_10;
   assign m9_10 ={ {1{in9[6]}} , in9[6:0] };

   // m10_1 = W*in
   wire signed [7:0] m10_1;
   assign m10_1 =8'b0;

   // m10_2 = W*in
   wire signed [7:0] m10_2;
   assign m10_2 =8'b0;

   // m10_3 = W*in
   wire signed [7:0] m10_3;
   assign m10_3 =8'b0;

   // m10_4 = W*in
   wire signed [7:0] m10_4;
   assign m10_4 =8'b0;

   // m10_5 = W*in
   wire signed [7:0] m10_5;
   assign m10_5 =8'b0;

   // m10_6 = W*in
   wire signed [7:0] m10_6;
   wire signed [10:0] tm10_6;
   assign tm10_6[2:0] = neg10[2:0];
   assign tm10_6[10:3] = { {1{in10[6]}} , in10[6:0] } + { {4{neg10[6]}} , neg10[6:3] };
   assign m10_6 =tm10_6[10:3];

   // m10_7 = W*in
   wire signed [7:0] m10_7;
   assign m10_7 ={ {1{in10[6]}} , in10[6:0] };

   // m10_8 = W*in
   wire signed [7:0] m10_8;
   assign m10_8 =8'b0;

   // m10_9 = W*in
   wire signed [7:0] m10_9;
   wire signed [10:0] tm10_9;
   assign tm10_9[2:0] = neg10[2:0];
   assign tm10_9[10:3] = { {1{in10[6]}} , in10[6:0] } + { {4{neg10[6]}} , neg10[6:3] };
   assign m10_9 =tm10_9[10:3];

   // m10_10 = W*in
   wire signed [7:0] m10_10;
   assign m10_10 =8'b0;

   // m11_1 = W*in
   wire signed [7:0] m11_1;
   assign m11_1 =8'b0;

   // m11_2 = W*in
   wire signed [7:0] m11_2;
   wire signed [9:0] tm11_2;
   assign tm11_2[1:0] = in11[1:0];
   assign tm11_2[9:2] = { {1{in11[6]}} , in11[6:0] } + { {3{in11[6]}} , in11[6:2] };
   assign m11_2 =tm11_2[9:2];

   // m11_3 = W*in
   wire signed [7:0] m11_3;
   assign m11_3 =8'b0;

   // m11_4 = W*in
   wire signed [7:0] m11_4;
   assign m11_4 =8'b0;

   // m11_5 = W*in
   wire signed [7:0] m11_5;
   assign m11_5 =8'b0;

   // m11_6 = W*in
   wire signed [7:0] m11_6;
   assign m11_6 =8'b0;

   // m11_7 = W*in
   wire signed [7:0] m11_7;
   assign m11_7 =8'b0;

   // m11_8 = W*in
   wire signed [7:0] m11_8;
   assign m11_8 =8'b0;

   // m11_9 = W*in
   wire signed [7:0] m11_9;
   assign m11_9 ={ {1{in11[6]}} , in11[6:0] };

   // m11_10 = W*in
   wire signed [7:0] m11_10;
   assign m11_10 =8'b0;

   // m12_1 = W*in
   wire signed [7:0] m12_1;
   assign m12_1 =8'b0;

   // m12_2 = W*in
   wire signed [7:0] m12_2;
   assign m12_2 =8'b0;

   // m12_3 = W*in
   wire signed [7:0] m12_3;
   assign m12_3 =8'b0;

   // m12_4 = W*in
   wire signed [7:0] m12_4;
   assign m12_4 =8'b0;

   // m12_5 = W*in
   wire signed [7:0] m12_5;
   assign m12_5 =8'b0;

   // m12_6 = W*in
   wire signed [7:0] m12_6;
   wire signed [9:0] tm12_6;
   assign tm12_6[1:0] = neg12[1:0];
   assign tm12_6[9:2] = { {1{neg12[6]}} , neg12[6:0] } + { {3{neg12[6]}} , neg12[6:2] };
   assign m12_6 =tm12_6[9:2];

   // m12_7 = W*in
   wire signed [7:0] m12_7;
   assign m12_7 =8'b0;

   // m12_8 = W*in
   wire signed [7:0] m12_8;
   assign m12_8 =8'b0;

   // m12_9 = W*in
   wire signed [7:0] m12_9;
   assign m12_9 =8'b0;

   // m12_10 = W*in
   wire signed [7:0] m12_10;
   assign m12_10 =8'b0;

   // m13_1 = W*in
   wire signed [7:0] m13_1;
   assign m13_1 =8'b0;

   // m13_2 = W*in
   wire signed [7:0] m13_2;
   wire signed [10:0] tm13_2;
   assign tm13_2[2:0] = in13[2:0];
   assign tm13_2[10:3] = { {1{in13[6]}} , in13[6:0] } + { {4{in13[6]}} , in13[6:3] };
   assign m13_2 =tm13_2[10:3];

   // m13_3 = W*in
   wire signed [7:0] m13_3;
   assign m13_3 =8'b0;

   // m13_4 = W*in
   wire signed [7:0] m13_4;
   wire signed [10:0] tm13_4;
   assign tm13_4[2:0] = neg13[2:0];
   assign tm13_4[10:3] = { {1{neg13[6]}} , neg13[6:0] } + { {4{neg13[6]}} , neg13[6:3] };
   assign m13_4 =tm13_4[10:3];

   // m13_5 = W*in
   wire signed [7:0] m13_5;
   assign m13_5 =8'b0;

   // m13_6 = W*in
   wire signed [7:0] m13_6;
   assign m13_6 =8'b0;

   // m13_7 = W*in
   wire signed [7:0] m13_7;
   assign m13_7 =8'b0;

   // m13_8 = W*in
   wire signed [7:0] m13_8;
   wire signed [9:0] tm13_8;
   assign tm13_8[1:0] = in13[1:0];
   assign tm13_8[9:2] = { {1{in13[6]}} , in13[6:0] } + { {3{in13[6]}} , in13[6:2] };
   assign m13_8 =tm13_8[9:2];

   // m13_9 = W*in
   wire signed [7:0] m13_9;
   assign m13_9 =8'b0;

   // m13_10 = W*in
   wire signed [7:0] m13_10;
   assign m13_10 =8'b0;

   // m14_1 = W*in
   wire signed [7:0] m14_1;
   assign m14_1 ={ {1{neg14[6]}} , neg14[6:0] };

   // m14_2 = W*in
   wire signed [7:0] m14_2;
   assign m14_2 =8'b0;

   // m14_3 = W*in
   wire signed [7:0] m14_3;
   assign m14_3 =8'b0;

   // m14_4 = W*in
   wire signed [7:0] m14_4;
   assign m14_4 =8'b0;

   // m14_5 = W*in
   wire signed [7:0] m14_5;
   assign m14_5 =8'b0;

   // m14_6 = W*in
   wire signed [7:0] m14_6;
   assign m14_6 =8'b0;

   // m14_7 = W*in
   wire signed [7:0] m14_7;
   assign m14_7 ={ {1{neg14[6]}} , neg14[6:0] };

   // m14_8 = W*in
   wire signed [7:0] m14_8;
   assign m14_8 =8'b0;

   // m14_9 = W*in
   wire signed [7:0] m14_9;
   assign m14_9 =8'b0;

   // m14_10 = W*in
   wire signed [7:0] m14_10;
   wire signed [8:0] tm14_10;
   assign tm14_10[0:0] = in14[0:0];
   assign tm14_10[8:1] = { {1{in14[6]}} , in14[6:0] } + { {2{in14[6]}} , in14[6:1] };
   assign m14_10 =tm14_10[8:1];

   // m15_1 = W*in
   wire signed [7:0] m15_1;
   assign m15_1 =8'b0;

   // m15_2 = W*in
   wire signed [7:0] m15_2;
   assign m15_2 =8'b0;

   // m15_3 = W*in
   wire signed [7:0] m15_3;
   assign m15_3 =8'b0;

   // m15_4 = W*in
   wire signed [7:0] m15_4;
   wire signed [9:0] tm15_4;
   assign tm15_4[1:0] = in15[1:0];
   assign tm15_4[9:2] = { {1{in15[6]}} , in15[6:0] } + { {3{in15[6]}} , in15[6:2] };
   assign m15_4 =tm15_4[9:2];

   // m15_5 = W*in
   wire signed [7:0] m15_5;
   assign m15_5 =8'b0;

   // m15_6 = W*in
   wire signed [7:0] m15_6;
   wire signed [11:0] tm15_6;
   assign tm15_6[3:0] = neg15[3:0];
   assign tm15_6[11:4] = { {1{in15[6]}} , in15[6:0] } + { {5{neg15[6]}} , neg15[6:4] };
   assign m15_6 =tm15_6[10:3];

   // m15_7 = W*in
   wire signed [7:0] m15_7;
   assign m15_7 =8'b0;

   // m15_8 = W*in
   wire signed [7:0] m15_8;
   wire signed [8:0] tm15_8;
   assign tm15_8[0:0] = neg15[0:0];
   assign tm15_8[8:1] = { {1{neg15[6]}} , neg15[6:0] } + { {2{neg15[6]}} , neg15[6:1] };
   assign m15_8 =tm15_8[8:1];

   // m15_9 = W*in
   wire signed [7:0] m15_9;
   wire signed [10:0] tm15_9;
   assign tm15_9[2:0] = neg15[2:0];
   assign tm15_9[10:3] = { {1{in15[6]}} , in15[6:0] } + { {4{neg15[6]}} , neg15[6:3] };
   assign m15_9 =tm15_9[9:2];

   // m15_10 = W*in
   wire signed [7:0] m15_10;
   assign m15_10 =8'b0;

   //Perceptron Adders
   assign out1 = m1_1+m2_1+m3_1+m4_1+m5_1+m6_1+m7_1+m8_1+m9_1+m10_1+m11_1+m12_1+m13_1+m14_1+m15_1+b1;
   assign out2 = m1_2+m2_2+m3_2+m4_2+m5_2+m6_2+m7_2+m8_2+m9_2+m10_2+m11_2+m12_2+m13_2+m14_2+m15_2+b2;
   assign out3 = m1_3+m2_3+m3_3+m4_3+m5_3+m6_3+m7_3+m8_3+m9_3+m10_3+m11_3+m12_3+m13_3+m14_3+m15_3+b3;
   assign out4 = m1_4+m2_4+m3_4+m4_4+m5_4+m6_4+m7_4+m8_4+m9_4+m10_4+m11_4+m12_4+m13_4+m14_4+m15_4+b4;
   assign out5 = m1_5+m2_5+m3_5+m4_5+m5_5+m6_5+m7_5+m8_5+m9_5+m10_5+m11_5+m12_5+m13_5+m14_5+m15_5+b5;
   assign out6 = m1_6+m2_6+m3_6+m4_6+m5_6+m6_6+m7_6+m8_6+m9_6+m10_6+m11_6+m12_6+m13_6+m14_6+m15_6+b6;
   assign out7 = m1_7+m2_7+m3_7+m4_7+m5_7+m6_7+m7_7+m8_7+m9_7+m10_7+m11_7+m12_7+m13_7+m14_7+m15_7+b7;
   assign out8 = m1_8+m2_8+m3_8+m4_8+m5_8+m6_8+m7_8+m8_8+m9_8+m10_8+m11_8+m12_8+m13_8+m14_8+m15_8+b8;
   assign out9 = m1_9+m2_9+m3_9+m4_9+m5_9+m6_9+m7_9+m8_9+m9_9+m10_9+m11_9+m12_9+m13_9+m14_9+m15_9+b9;
   assign out10 = m1_10+m2_10+m3_10+m4_10+m5_10+m6_10+m7_10+m8_10+m9_10+m10_10+m11_10+m12_10+m13_10+m14_10+m15_10+b10;
endmodule