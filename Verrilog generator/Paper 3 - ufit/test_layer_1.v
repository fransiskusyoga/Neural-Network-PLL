module test_layer_1(in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13,out14,out15);
   input signed [9:0] in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12;
   output signed [10:0] out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13,out14,out15;
   wire signed [9:0] neg1,neg2,neg3,neg4,neg5,neg6,neg7,neg8,neg9,neg10,neg11,neg12;

   //Bias value
   wire signed [10:0] b1 = $signed(11'h16);
   wire signed [10:0] b2 = $signed(11'h2);
   wire signed [10:0] b3 = $signed(11'h37);
   wire signed [10:0] b4 = $signed(11'h18);
   wire signed [10:0] b5 = $signed(11'hF);
   wire signed [10:0] b6 = $signed(11'hD);
   wire signed [10:0] b7 = $signed(11'hB);
   wire signed [10:0] b8 = $signed(11'h8);
   wire signed [10:0] b9 = $signed(11'h1A);
   wire signed [10:0] b10 = $signed(11'h26);
   wire signed [10:0] b11 = $signed(11'h11);
   wire signed [10:0] b12 = $signed(11'h9);
   wire signed [10:0] b13 = $signed(11'h27);
   wire signed [10:0] b14 = $signed(11'h29);
   wire signed [10:0] b15 = $signed(11'h33);

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

   // m1_1 = W*in
   wire signed [10:0] m1_1;
   assign m1_1 =11'b0;

   // m1_2 = W*in
   wire signed [10:0] m1_2;
   wire signed [12:0] tm1_2;
   assign tm1_2[1:0] = in1[1:0];
   assign tm1_2[12:2] = { {1{in1[9]}} , in1[9:0] } + { {3{in1[9]}} , in1[9:2] };
   assign m1_2 =tm1_2[12:2];

   // m1_3 = W*in
   wire signed [10:0] m1_3;
   assign m1_3 ={ {1{neg1[9]}} , neg1[9:0] };

   // m1_4 = W*in
   wire signed [10:0] m1_4;
   wire signed [11:0] tm1_4;
   assign tm1_4[0:0] = in1[0:0];
   assign tm1_4[11:1] = { {1{in1[9]}} , in1[9:0] } + { {2{in1[9]}} , in1[9:1] };
   assign m1_4 ={ {1{tm1_4[11]}} , tm1_4[11:2] };

   // m1_5 = W*in
   wire signed [10:0] m1_5;
   assign m1_5 =11'b0;

   // m1_6 = W*in
   wire signed [10:0] m1_6;
   assign m1_6 ={ {2{in1[9]}} , in1[9:1] };

   // m1_7 = W*in
   wire signed [10:0] m1_7;
   assign m1_7 =11'b0;

   // m1_8 = W*in
   wire signed [10:0] m1_8;
   assign m1_8 ={ {1{in1[9]}} , in1[9:0] };

   // m1_9 = W*in
   wire signed [10:0] m1_9;
   wire signed [12:0] tm1_9;
   assign tm1_9[1:0] = in1[1:0];
   assign tm1_9[12:2] = { {1{in1[9]}} , in1[9:0] } + { {3{in1[9]}} , in1[9:2] };
   assign m1_9 ={ {1{tm1_9[12]}} , tm1_9[12:3] };

   // m1_10 = W*in
   wire signed [10:0] m1_10;
   assign m1_10 =11'b0;

   // m1_11 = W*in
   wire signed [10:0] m1_11;
   wire signed [13:0] tm1_11;
   assign tm1_11[2:0] = in1[2:0];
   assign tm1_11[13:3] = { {1{in1[9]}} , in1[9:0] } + { {4{in1[9]}} , in1[9:3] };
   assign m1_11 =tm1_11[13:3];

   // m1_12 = W*in
   wire signed [10:0] m1_12;
   assign m1_12 =11'b0;

   // m1_13 = W*in
   wire signed [10:0] m1_13;
   wire signed [13:0] tm1_13;
   assign tm1_13[2:0] = in1[2:0];
   assign tm1_13[13:3] = { {1{in1[9]}} , in1[9:0] } + { {4{in1[9]}} , in1[9:3] };
   assign m1_13 =tm1_13[12:2];

   // m1_14 = W*in
   wire signed [10:0] m1_14;
   assign m1_14 ={ {2{in1[9]}} , in1[9:1] };

   // m1_15 = W*in
   wire signed [10:0] m1_15;
   wire signed [11:0] tm1_15;
   assign tm1_15[0:0] = neg1[0:0];
   assign tm1_15[11:1] = { {1{neg1[9]}} , neg1[9:0] } + { {2{neg1[9]}} , neg1[9:1] };
   assign m1_15 =tm1_15[11:1];

   // m2_1 = W*in
   wire signed [10:0] m2_1;
   assign m2_1 =11'b0;

   // m2_2 = W*in
   wire signed [10:0] m2_2;
   assign m2_2 =11'b0;

   // m2_3 = W*in
   wire signed [10:0] m2_3;
   assign m2_3 ={ {1{in2[9]}} , in2[9:0] };

   // m2_4 = W*in
   wire signed [10:0] m2_4;
   assign m2_4 =11'b0;

   // m2_5 = W*in
   wire signed [10:0] m2_5;
   assign m2_5 =11'b0;

   // m2_6 = W*in
   wire signed [10:0] m2_6;
   wire signed [13:0] tm2_6;
   assign tm2_6[2:0] = neg2[2:0];
   assign tm2_6[13:3] = { {1{in2[9]}} , in2[9:0] } + { {4{neg2[9]}} , neg2[9:3] };
   assign m2_6 =tm2_6[12:2];

   // m2_7 = W*in
   wire signed [10:0] m2_7;
   assign m2_7 =11'b0;

   // m2_8 = W*in
   wire signed [10:0] m2_8;
   assign m2_8 =11'b0;

   // m2_9 = W*in
   wire signed [10:0] m2_9;
   assign m2_9 =11'b0;

   // m2_10 = W*in
   wire signed [10:0] m2_10;
   assign m2_10 =11'b0;

   // m2_11 = W*in
   wire signed [10:0] m2_11;
   assign m2_11 =11'b0;

   // m2_12 = W*in
   wire signed [10:0] m2_12;
   assign m2_12 ={ {1{in2[9]}} , in2[9:0] };

   // m2_13 = W*in
   wire signed [10:0] m2_13;
   assign m2_13 =11'b0;

   // m2_14 = W*in
   wire signed [10:0] m2_14;
   wire signed [12:0] tm2_14;
   assign tm2_14[1:0] = in2[1:0];
   assign tm2_14[12:2] = { {1{in2[9]}} , in2[9:0] } + { {3{in2[9]}} , in2[9:2] };
   assign m2_14 ={ {1{tm2_14[12]}} , tm2_14[12:3] };

   // m2_15 = W*in
   wire signed [10:0] m2_15;
   assign m2_15 =11'b0;

   // m3_1 = W*in
   wire signed [10:0] m3_1;
   wire signed [11:0] tm3_1;
   assign tm3_1[0:0] = in3[0:0];
   assign tm3_1[11:1] = { {1{in3[9]}} , in3[9:0] } + { {2{in3[9]}} , in3[9:1] };
   assign m3_1 ={ {1{tm3_1[11]}} , tm3_1[11:2] };

   // m3_2 = W*in
   wire signed [10:0] m3_2;
   assign m3_2 ={ {2{neg3[9]}} , neg3[9:1] };

   // m3_3 = W*in
   wire signed [10:0] m3_3;
   assign m3_3 ={ {1{in3[9]}} , in3[9:0] };

   // m3_4 = W*in
   wire signed [10:0] m3_4;
   wire signed [11:0] tm3_4;
   assign tm3_4[0:0] = neg3[0:0];
   assign tm3_4[11:1] = { {1{neg3[9]}} , neg3[9:0] } + { {2{neg3[9]}} , neg3[9:1] };
   assign m3_4 ={ {1{tm3_4[11]}} , tm3_4[11:2] };

   // m3_5 = W*in
   wire signed [10:0] m3_5;
   assign m3_5 =11'b0;

   // m3_6 = W*in
   wire signed [10:0] m3_6;
   wire signed [12:0] tm3_6;
   assign tm3_6[1:0] = in3[1:0];
   assign tm3_6[12:2] = { {1{in3[9]}} , in3[9:0] } + { {3{in3[9]}} , in3[9:2] };
   assign m3_6 ={ {1{tm3_6[12]}} , tm3_6[12:3] };

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
   wire signed [11:0] tm3_10;
   assign tm3_10[0:0] = neg3[0:0];
   assign tm3_10[11:1] = { {1{neg3[9]}} , neg3[9:0] } + { {2{neg3[9]}} , neg3[9:1] };
   assign m3_10 ={ {1{tm3_10[11]}} , tm3_10[11:2] };

   // m3_11 = W*in
   wire signed [10:0] m3_11;
   assign m3_11 =11'b0;

   // m3_12 = W*in
   wire signed [10:0] m3_12;
   assign m3_12 ={ {2{in3[9]}} , in3[9:1] };

   // m3_13 = W*in
   wire signed [10:0] m3_13;
   assign m3_13 =11'b0;

   // m3_14 = W*in
   wire signed [10:0] m3_14;
   wire signed [11:0] tm3_14;
   assign tm3_14[0:0] = neg3[0:0];
   assign tm3_14[11:1] = { {1{neg3[9]}} , neg3[9:0] } + { {2{neg3[9]}} , neg3[9:1] };
   assign m3_14 ={ {1{tm3_14[11]}} , tm3_14[11:2] };

   // m3_15 = W*in
   wire signed [10:0] m3_15;
   wire signed [12:0] tm3_15;
   assign tm3_15[1:0] = neg3[1:0];
   assign tm3_15[12:2] = { {1{neg3[9]}} , neg3[9:0] } + { {3{neg3[9]}} , neg3[9:2] };
   assign m3_15 =tm3_15[12:2];

   // m4_1 = W*in
   wire signed [10:0] m4_1;
   assign m4_1 ={ {2{in4[9]}} , in4[9:1] };

   // m4_2 = W*in
   wire signed [10:0] m4_2;
   assign m4_2 =11'b0;

   // m4_3 = W*in
   wire signed [10:0] m4_3;
   assign m4_3 ={ {1{neg4[9]}} , neg4[9:0] };

   // m4_4 = W*in
   wire signed [10:0] m4_4;
   assign m4_4 =11'b0;

   // m4_5 = W*in
   wire signed [10:0] m4_5;
   wire signed [12:0] tm4_5;
   assign tm4_5[1:0] = in4[1:0];
   assign tm4_5[12:2] = { {1{in4[9]}} , in4[9:0] } + { {3{in4[9]}} , in4[9:2] };
   assign m4_5 ={ {1{tm4_5[12]}} , tm4_5[12:3] };

   // m4_6 = W*in
   wire signed [10:0] m4_6;
   assign m4_6 =11'b0;

   // m4_7 = W*in
   wire signed [10:0] m4_7;
   wire signed [11:0] tm4_7;
   assign tm4_7[0:0] = in4[0:0];
   assign tm4_7[11:1] = { {1{in4[9]}} , in4[9:0] } + { {2{in4[9]}} , in4[9:1] };
   assign m4_7 ={ {1{tm4_7[11]}} , tm4_7[11:2] };

   // m4_8 = W*in
   wire signed [10:0] m4_8;
   wire signed [11:0] tm4_8;
   assign tm4_8[0:0] = neg4[0:0];
   assign tm4_8[11:1] = { {1{neg4[9]}} , neg4[9:0] } + { {2{neg4[9]}} , neg4[9:1] };
   assign m4_8 ={ {1{tm4_8[11]}} , tm4_8[11:2] };

   // m4_9 = W*in
   wire signed [10:0] m4_9;
   assign m4_9 =11'b0;

   // m4_10 = W*in
   wire signed [10:0] m4_10;
   assign m4_10 ={ {1{in4[9]}} , in4[9:0] };

   // m4_11 = W*in
   wire signed [10:0] m4_11;
   assign m4_11 =11'b0;

   // m4_12 = W*in
   wire signed [10:0] m4_12;
   assign m4_12 ={ {1{neg4[9]}} , neg4[9:0] };

   // m4_13 = W*in
   wire signed [10:0] m4_13;
   assign m4_13 =11'b0;

   // m4_14 = W*in
   wire signed [10:0] m4_14;
   assign m4_14 =11'b0;

   // m4_15 = W*in
   wire signed [10:0] m4_15;
   assign m4_15 =11'b0;

   // m5_1 = W*in
   wire signed [10:0] m5_1;
   assign m5_1 ={ in5[9:0] , {1{1'b0}} };

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
   assign m5_5 ={ {1{in5[9]}} , in5[9:0] };

   // m5_6 = W*in
   wire signed [10:0] m5_6;
   assign m5_6 ={ {1{neg5[9]}} , neg5[9:0] };

   // m5_7 = W*in
   wire signed [10:0] m5_7;
   assign m5_7 ={ {1{in5[9]}} , in5[9:0] };

   // m5_8 = W*in
   wire signed [10:0] m5_8;
   assign m5_8 =11'b0;

   // m5_9 = W*in
   wire signed [10:0] m5_9;
   assign m5_9 =11'b0;

   // m5_10 = W*in
   wire signed [10:0] m5_10;
   assign m5_10 =11'b0;

   // m5_11 = W*in
   wire signed [10:0] m5_11;
   wire signed [11:0] tm5_11;
   assign tm5_11[0:0] = in5[0:0];
   assign tm5_11[11:1] = { {1{in5[9]}} , in5[9:0] } + { {2{in5[9]}} , in5[9:1] };
   assign m5_11 =tm5_11[11:1];

   // m5_12 = W*in
   wire signed [10:0] m5_12;
   assign m5_12 =11'b0;

   // m5_13 = W*in
   wire signed [10:0] m5_13;
   assign m5_13 =11'b0;

   // m5_14 = W*in
   wire signed [10:0] m5_14;
   assign m5_14 =11'b0;

   // m5_15 = W*in
   wire signed [10:0] m5_15;
   assign m5_15 =11'b0;

   // m6_1 = W*in
   wire signed [10:0] m6_1;
   assign m6_1 =11'b0;

   // m6_2 = W*in
   wire signed [10:0] m6_2;
   assign m6_2 =11'b0;

   // m6_3 = W*in
   wire signed [10:0] m6_3;
   assign m6_3 =11'b0;

   // m6_4 = W*in
   wire signed [10:0] m6_4;
   wire signed [11:0] tm6_4;
   assign tm6_4[0:0] = in6[0:0];
   assign tm6_4[11:1] = { {1{in6[9]}} , in6[9:0] } + { {2{in6[9]}} , in6[9:1] };
   assign m6_4 ={ {1{tm6_4[11]}} , tm6_4[11:2] };

   // m6_5 = W*in
   wire signed [10:0] m6_5;
   assign m6_5 =11'b0;

   // m6_6 = W*in
   wire signed [10:0] m6_6;
   wire signed [12:0] tm6_6;
   assign tm6_6[1:0] = in6[1:0];
   assign tm6_6[12:2] = { {1{in6[9]}} , in6[9:0] } + { {3{in6[9]}} , in6[9:2] };
   assign m6_6 =tm6_6[12:2];

   // m6_7 = W*in
   wire signed [10:0] m6_7;
   assign m6_7 =11'b0;

   // m6_8 = W*in
   wire signed [10:0] m6_8;
   assign m6_8 =11'b0;

   // m6_9 = W*in
   wire signed [10:0] m6_9;
   wire signed [13:0] tm6_9;
   assign tm6_9[2:0] = in6[2:0];
   assign tm6_9[13:3] = { {1{in6[9]}} , in6[9:0] } + { {4{in6[9]}} , in6[9:3] };
   assign m6_9 =tm6_9[13:3];

   // m6_10 = W*in
   wire signed [10:0] m6_10;
   wire signed [12:0] tm6_10;
   assign tm6_10[1:0] = neg6[1:0];
   assign tm6_10[12:2] = { {1{neg6[9]}} , neg6[9:0] } + { {3{neg6[9]}} , neg6[9:2] };
   assign m6_10 ={ {1{tm6_10[12]}} , tm6_10[12:3] };

   // m6_11 = W*in
   wire signed [10:0] m6_11;
   assign m6_11 =11'b0;

   // m6_12 = W*in
   wire signed [10:0] m6_12;
   assign m6_12 ={ {1{in6[9]}} , in6[9:0] };

   // m6_13 = W*in
   wire signed [10:0] m6_13;
   assign m6_13 =11'b0;

   // m6_14 = W*in
   wire signed [10:0] m6_14;
   assign m6_14 ={ {1{neg6[9]}} , neg6[9:0] };

   // m6_15 = W*in
   wire signed [10:0] m6_15;
   wire signed [12:0] tm6_15;
   assign tm6_15[1:0] = in6[1:0];
   assign tm6_15[12:2] = { {1{in6[9]}} , in6[9:0] } + { {3{in6[9]}} , in6[9:2] };
   assign m6_15 ={ {1{tm6_15[12]}} , tm6_15[12:3] };

   // m7_1 = W*in
   wire signed [10:0] m7_1;
   assign m7_1 =11'b0;

   // m7_2 = W*in
   wire signed [10:0] m7_2;
   wire signed [11:0] tm7_2;
   assign tm7_2[0:0] = in7[0:0];
   assign tm7_2[11:1] = { {1{in7[9]}} , in7[9:0] } + { {2{in7[9]}} , in7[9:1] };
   assign m7_2 =tm7_2[11:1];

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
   wire signed [11:0] tm7_8;
   assign tm7_8[0:0] = in7[0:0];
   assign tm7_8[11:1] = { {1{in7[9]}} , in7[9:0] } + { {2{in7[9]}} , in7[9:1] };
   assign m7_8 =tm7_8[11:1];

   // m7_9 = W*in
   wire signed [10:0] m7_9;
   assign m7_9 =11'b0;

   // m7_10 = W*in
   wire signed [10:0] m7_10;
   wire signed [13:0] tm7_10;
   assign tm7_10[2:0] = neg7[2:0];
   assign tm7_10[13:3] = { {1{in7[9]}} , in7[9:0] } + { {4{neg7[9]}} , neg7[9:3] };
   assign m7_10 =tm7_10[13:3];

   // m7_11 = W*in
   wire signed [10:0] m7_11;
   wire signed [12:0] tm7_11;
   assign tm7_11[1:0] = in7[1:0];
   assign tm7_11[12:2] = { {1{in7[9]}} , in7[9:0] } + { {3{in7[9]}} , in7[9:2] };
   assign m7_11 =tm7_11[12:2];

   // m7_12 = W*in
   wire signed [10:0] m7_12;
   assign m7_12 =11'b0;

   // m7_13 = W*in
   wire signed [10:0] m7_13;
   assign m7_13 =11'b0;

   // m7_14 = W*in
   wire signed [10:0] m7_14;
   assign m7_14 =11'b0;

   // m7_15 = W*in
   wire signed [10:0] m7_15;
   assign m7_15 =11'b0;

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
   wire signed [11:0] tm8_4;
   assign tm8_4[0:0] = in8[0:0];
   assign tm8_4[11:1] = { {1{in8[9]}} , in8[9:0] } + { {2{in8[9]}} , in8[9:1] };
   assign m8_4 =tm8_4[11:1];

   // m8_5 = W*in
   wire signed [10:0] m8_5;
   assign m8_5 =11'b0;

   // m8_6 = W*in
   wire signed [10:0] m8_6;
   assign m8_6 =11'b0;

   // m8_7 = W*in
   wire signed [10:0] m8_7;
   assign m8_7 ={ {1{in8[9]}} , in8[9:0] };

   // m8_8 = W*in
   wire signed [10:0] m8_8;
   assign m8_8 =11'b0;

   // m8_9 = W*in
   wire signed [10:0] m8_9;
   wire signed [11:0] tm8_9;
   assign tm8_9[0:0] = in8[0:0];
   assign tm8_9[11:1] = { {1{in8[9]}} , in8[9:0] } + { {2{in8[9]}} , in8[9:1] };
   assign m8_9 =tm8_9[11:1];

   // m8_10 = W*in
   wire signed [10:0] m8_10;
   assign m8_10 =11'b0;

   // m8_11 = W*in
   wire signed [10:0] m8_11;
   assign m8_11 =11'b0;

   // m8_12 = W*in
   wire signed [10:0] m8_12;
   assign m8_12 =11'b0;

   // m8_13 = W*in
   wire signed [10:0] m8_13;
   wire signed [11:0] tm8_13;
   assign tm8_13[0:0] = in8[0:0];
   assign tm8_13[11:1] = { {1{in8[9]}} , in8[9:0] } + { {2{in8[9]}} , in8[9:1] };
   assign m8_13 ={ {1{tm8_13[11]}} , tm8_13[11:2] };

   // m8_14 = W*in
   wire signed [10:0] m8_14;
   assign m8_14 =11'b0;

   // m8_15 = W*in
   wire signed [10:0] m8_15;
   wire signed [13:0] tm8_15;
   assign tm8_15[2:0] = neg8[2:0];
   assign tm8_15[13:3] = { {1{in8[9]}} , in8[9:0] } + { {4{neg8[9]}} , neg8[9:3] };
   assign m8_15 =tm8_15[13:3];

   // m9_1 = W*in
   wire signed [10:0] m9_1;
   assign m9_1 =11'b0;

   // m9_2 = W*in
   wire signed [10:0] m9_2;
   assign m9_2 =11'b0;

   // m9_3 = W*in
   wire signed [10:0] m9_3;
   assign m9_3 ={ {1{neg9[9]}} , neg9[9:0] };

   // m9_4 = W*in
   wire signed [10:0] m9_4;
   assign m9_4 =11'b0;

   // m9_5 = W*in
   wire signed [10:0] m9_5;
   assign m9_5 ={ {2{neg9[9]}} , neg9[9:1] };

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
   assign m9_9 ={ {1{neg9[9]}} , neg9[9:0] };

   // m9_10 = W*in
   wire signed [10:0] m9_10;
   assign m9_10 =11'b0;

   // m9_11 = W*in
   wire signed [10:0] m9_11;
   wire signed [13:0] tm9_11;
   assign tm9_11[2:0] = in9[2:0];
   assign tm9_11[13:3] = { {1{in9[9]}} , in9[9:0] } + { {4{in9[9]}} , in9[9:3] };
   assign m9_11 =tm9_11[13:3];

   // m9_12 = W*in
   wire signed [10:0] m9_12;
   assign m9_12 ={ {2{neg9[9]}} , neg9[9:1] };

   // m9_13 = W*in
   wire signed [10:0] m9_13;
   assign m9_13 ={ {1{in9[9]}} , in9[9:0] };

   // m9_14 = W*in
   wire signed [10:0] m9_14;
   assign m9_14 =11'b0;

   // m9_15 = W*in
   wire signed [10:0] m9_15;
   assign m9_15 ={ {2{neg9[9]}} , neg9[9:1] };

   // m10_1 = W*in
   wire signed [10:0] m10_1;
   wire signed [11:0] tm10_1;
   assign tm10_1[0:0] = neg10[0:0];
   assign tm10_1[11:1] = { {1{neg10[9]}} , neg10[9:0] } + { {2{neg10[9]}} , neg10[9:1] };
   assign m10_1 ={ {1{tm10_1[11]}} , tm10_1[11:2] };

   // m10_2 = W*in
   wire signed [10:0] m10_2;
   assign m10_2 =11'b0;

   // m10_3 = W*in
   wire signed [10:0] m10_3;
   assign m10_3 ={ {1{in10[9]}} , in10[9:0] };

   // m10_4 = W*in
   wire signed [10:0] m10_4;
   assign m10_4 =11'b0;

   // m10_5 = W*in
   wire signed [10:0] m10_5;
   wire signed [11:0] tm10_5;
   assign tm10_5[0:0] = in10[0:0];
   assign tm10_5[11:1] = { {1{in10[9]}} , in10[9:0] } + { {2{in10[9]}} , in10[9:1] };
   assign m10_5 =tm10_5[11:1];

   // m10_6 = W*in
   wire signed [10:0] m10_6;
   wire signed [13:0] tm10_6;
   assign tm10_6[2:0] = in10[2:0];
   assign tm10_6[13:3] = { {1{neg10[9]}} , neg10[9:0] } + { {4{in10[9]}} , in10[9:3] };
   assign m10_6 =tm10_6[13:3];

   // m10_7 = W*in
   wire signed [10:0] m10_7;
   assign m10_7 =11'b0;

   // m10_8 = W*in
   wire signed [10:0] m10_8;
   assign m10_8 ={ {1{in10[9]}} , in10[9:0] };

   // m10_9 = W*in
   wire signed [10:0] m10_9;
   wire signed [12:0] tm10_9;
   assign tm10_9[1:0] = in10[1:0];
   assign tm10_9[12:2] = { {1{in10[9]}} , in10[9:0] } + { {3{in10[9]}} , in10[9:2] };
   assign m10_9 =tm10_9[12:2];

   // m10_10 = W*in
   wire signed [10:0] m10_10;
   assign m10_10 ={ {1{neg10[9]}} , neg10[9:0] };

   // m10_11 = W*in
   wire signed [10:0] m10_11;
   wire signed [11:0] tm10_11;
   assign tm10_11[0:0] = in10[0:0];
   assign tm10_11[11:1] = { {1{in10[9]}} , in10[9:0] } + { {2{in10[9]}} , in10[9:1] };
   assign m10_11 ={ {1{tm10_11[11]}} , tm10_11[11:2] };

   // m10_12 = W*in
   wire signed [10:0] m10_12;
   assign m10_12 =11'b0;

   // m10_13 = W*in
   wire signed [10:0] m10_13;
   assign m10_13 =11'b0;

   // m10_14 = W*in
   wire signed [10:0] m10_14;
   assign m10_14 =11'b0;

   // m10_15 = W*in
   wire signed [10:0] m10_15;
   assign m10_15 =11'b0;

   // m11_1 = W*in
   wire signed [10:0] m11_1;
   wire signed [12:0] tm11_1;
   assign tm11_1[1:0] = in11[1:0];
   assign tm11_1[12:2] = { {1{in11[9]}} , in11[9:0] } + { {3{in11[9]}} , in11[9:2] };
   assign m11_1 ={ {1{tm11_1[12]}} , tm11_1[12:3] };

   // m11_2 = W*in
   wire signed [10:0] m11_2;
   assign m11_2 =11'b0;

   // m11_3 = W*in
   wire signed [10:0] m11_3;
   assign m11_3 =11'b0;

   // m11_4 = W*in
   wire signed [10:0] m11_4;
   wire signed [12:0] tm11_4;
   assign tm11_4[1:0] = in11[1:0];
   assign tm11_4[12:2] = { {1{in11[9]}} , in11[9:0] } + { {3{in11[9]}} , in11[9:2] };
   assign m11_4 ={ {1{tm11_4[12]}} , tm11_4[12:3] };

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
   assign m11_8 =11'b0;

   // m11_9 = W*in
   wire signed [10:0] m11_9;
   wire signed [11:0] tm11_9;
   assign tm11_9[0:0] = neg11[0:0];
   assign tm11_9[11:1] = { {1{neg11[9]}} , neg11[9:0] } + { {2{neg11[9]}} , neg11[9:1] };
   assign m11_9 ={ {1{tm11_9[11]}} , tm11_9[11:2] };

   // m11_10 = W*in
   wire signed [10:0] m11_10;
   assign m11_10 =11'b0;

   // m11_11 = W*in
   wire signed [10:0] m11_11;
   assign m11_11 =11'b0;

   // m11_12 = W*in
   wire signed [10:0] m11_12;
   assign m11_12 =11'b0;

   // m11_13 = W*in
   wire signed [10:0] m11_13;
   assign m11_13 =11'b0;

   // m11_14 = W*in
   wire signed [10:0] m11_14;
   assign m11_14 =11'b0;

   // m11_15 = W*in
   wire signed [10:0] m11_15;
   assign m11_15 =11'b0;

   // m12_1 = W*in
   wire signed [10:0] m12_1;
   assign m12_1 =11'b0;

   // m12_2 = W*in
   wire signed [10:0] m12_2;
   assign m12_2 ={ {2{neg12[9]}} , neg12[9:1] };

   // m12_3 = W*in
   wire signed [10:0] m12_3;
   wire signed [12:0] tm12_3;
   assign tm12_3[1:0] = in12[1:0];
   assign tm12_3[12:2] = { {1{in12[9]}} , in12[9:0] } + { {3{in12[9]}} , in12[9:2] };
   assign m12_3 =tm12_3[12:2];

   // m12_4 = W*in
   wire signed [10:0] m12_4;
   assign m12_4 =11'b0;

   // m12_5 = W*in
   wire signed [10:0] m12_5;
   assign m12_5 =11'b0;

   // m12_6 = W*in
   wire signed [10:0] m12_6;
   wire signed [11:0] tm12_6;
   assign tm12_6[0:0] = in12[0:0];
   assign tm12_6[11:1] = { {1{in12[9]}} , in12[9:0] } + { {2{in12[9]}} , in12[9:1] };
   assign m12_6 =tm12_6[11:1];

   // m12_7 = W*in
   wire signed [10:0] m12_7;
   assign m12_7 =11'b0;

   // m12_8 = W*in
   wire signed [10:0] m12_8;
   wire signed [13:0] tm12_8;
   assign tm12_8[2:0] = neg12[2:0];
   assign tm12_8[13:3] = { {1{in12[9]}} , in12[9:0] } + { {4{neg12[9]}} , neg12[9:3] };
   assign m12_8 =tm12_8[13:3];

   // m12_9 = W*in
   wire signed [10:0] m12_9;
   assign m12_9 =11'b0;

   // m12_10 = W*in
   wire signed [10:0] m12_10;
   assign m12_10 =11'b0;

   // m12_11 = W*in
   wire signed [10:0] m12_11;
   assign m12_11 ={ {1{neg12[9]}} , neg12[9:0] };

   // m12_12 = W*in
   wire signed [10:0] m12_12;
   assign m12_12 =11'b0;

   // m12_13 = W*in
   wire signed [10:0] m12_13;
   assign m12_13 =11'b0;

   // m12_14 = W*in
   wire signed [10:0] m12_14;
   wire signed [12:0] tm12_14;
   assign tm12_14[1:0] = neg12[1:0];
   assign tm12_14[12:2] = { {1{neg12[9]}} , neg12[9:0] } + { {3{neg12[9]}} , neg12[9:2] };
   assign m12_14 =tm12_14[12:2];

   // m12_15 = W*in
   wire signed [10:0] m12_15;
   assign m12_15 ={ {1{neg12[9]}} , neg12[9:0] };

   //Perceptron Adders
   assign out1 = m1_1+m2_1+m3_1+m4_1+m5_1+m6_1+m7_1+m8_1+m9_1+m10_1+m11_1+m12_1+b1;
   assign out2 = m1_2+m2_2+m3_2+m4_2+m5_2+m6_2+m7_2+m8_2+m9_2+m10_2+m11_2+m12_2+b2;
   assign out3 = m1_3+m2_3+m3_3+m4_3+m5_3+m6_3+m7_3+m8_3+m9_3+m10_3+m11_3+m12_3+b3;
   assign out4 = m1_4+m2_4+m3_4+m4_4+m5_4+m6_4+m7_4+m8_4+m9_4+m10_4+m11_4+m12_4+b4;
   assign out5 = m1_5+m2_5+m3_5+m4_5+m5_5+m6_5+m7_5+m8_5+m9_5+m10_5+m11_5+m12_5+b5;
   assign out6 = m1_6+m2_6+m3_6+m4_6+m5_6+m6_6+m7_6+m8_6+m9_6+m10_6+m11_6+m12_6+b6;
   assign out7 = m1_7+m2_7+m3_7+m4_7+m5_7+m6_7+m7_7+m8_7+m9_7+m10_7+m11_7+m12_7+b7;
   assign out8 = m1_8+m2_8+m3_8+m4_8+m5_8+m6_8+m7_8+m8_8+m9_8+m10_8+m11_8+m12_8+b8;
   assign out9 = m1_9+m2_9+m3_9+m4_9+m5_9+m6_9+m7_9+m8_9+m9_9+m10_9+m11_9+m12_9+b9;
   assign out10 = m1_10+m2_10+m3_10+m4_10+m5_10+m6_10+m7_10+m8_10+m9_10+m10_10+m11_10+m12_10+b10;
   assign out11 = m1_11+m2_11+m3_11+m4_11+m5_11+m6_11+m7_11+m8_11+m9_11+m10_11+m11_11+m12_11+b11;
   assign out12 = m1_12+m2_12+m3_12+m4_12+m5_12+m6_12+m7_12+m8_12+m9_12+m10_12+m11_12+m12_12+b12;
   assign out13 = m1_13+m2_13+m3_13+m4_13+m5_13+m6_13+m7_13+m8_13+m9_13+m10_13+m11_13+m12_13+b13;
   assign out14 = m1_14+m2_14+m3_14+m4_14+m5_14+m6_14+m7_14+m8_14+m9_14+m10_14+m11_14+m12_14+b14;
   assign out15 = m1_15+m2_15+m3_15+m4_15+m5_15+m6_15+m7_15+m8_15+m9_15+m10_15+m11_15+m12_15+b15;
endmodule