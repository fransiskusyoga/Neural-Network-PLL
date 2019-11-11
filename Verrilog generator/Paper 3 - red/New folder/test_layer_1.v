module test_layer_1(in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,in16,in17,in18,in19,in20,in21,in22,in23,in24,in25,in26,in27,in28,in29,in30,in31,in32,in33,in34,in35,in36,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13,out14,out15,out16,out17,out18,out19,out20);
   input signed [5:0] in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,in16,in17,in18,in19,in20,in21,in22,in23,in24,in25,in26,in27,in28,in29,in30,in31,in32,in33,in34,in35,in36;
   output signed [6:0] out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13,out14,out15,out16,out17,out18,out19,out20;
   wire signed [5:0] neg1,neg2,neg3,neg4,neg5,neg6,neg7,neg8,neg9,neg10,neg11,neg12,neg13,neg14,neg15,neg16,neg17,neg18,neg19,neg20,neg21,neg22,neg23,neg24,neg25,neg26,neg27,neg28,neg29,neg30,neg31,neg32,neg33,neg34,neg35,neg36;

   //Bias value
   wire signed [6:0] b1 = $signed(7'h1);
   wire signed [6:0] b2 = $signed(7'h0);
   wire signed [6:0] b3 = $signed(7'h1);
   wire signed [6:0] b4 = $signed(7'h1);
   wire signed [6:0] b5 = $signed(7'h1);
   wire signed [6:0] b6 = $signed(7'h0);
   wire signed [6:0] b7 = $signed(7'h0);
   wire signed [6:0] b8 = $signed(7'h1);
   wire signed [6:0] b9 = $signed(7'h1);
   wire signed [6:0] b10 = $signed(7'h1);
   wire signed [6:0] b11 = $signed(7'h0);
   wire signed [6:0] b12 = $signed(7'h1);
   wire signed [6:0] b13 = $signed(7'h0);
   wire signed [6:0] b14 = $signed(7'h1);
   wire signed [6:0] b15 = $signed(7'h1);
   wire signed [6:0] b16 = $signed(7'h1);
   wire signed [6:0] b17 = $signed(7'h1);
   wire signed [6:0] b18 = $signed(7'h1);
   wire signed [6:0] b19 = $signed(7'h1);
   wire signed [6:0] b20 = $signed(7'h1);

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

   // m1_1 = W*in
   wire signed [6:0] m1_1;
   assign m1_1 =7'b0;

   // m1_2 = W*in
   wire signed [6:0] m1_2;
   assign m1_2 =7'b0;

   // m1_3 = W*in
   wire signed [6:0] m1_3;
   wire signed [7:0] tm1_3;
   assign tm1_3[0:0] = neg1[0:0];
   assign tm1_3[7:1] = { {1{neg1[5]}} , neg1[5:0] } + { {2{neg1[5]}} , neg1[5:1] };
   assign m1_3 ={ {2{tm1_3[7]}} , tm1_3[7:3] };

   // m1_4 = W*in
   wire signed [6:0] m1_4;
   assign m1_4 =7'b0;

   // m1_5 = W*in
   wire signed [6:0] m1_5;
   assign m1_5 =7'b0;

   // m1_6 = W*in
   wire signed [6:0] m1_6;
   assign m1_6 ={ {2{in1[5]}} , in1[5:1] };

   // m1_7 = W*in
   wire signed [6:0] m1_7;
   assign m1_7 =7'b0;

   // m1_8 = W*in
   wire signed [6:0] m1_8;
   wire signed [7:0] tm1_8;
   assign tm1_8[0:0] = in1[0:0];
   assign tm1_8[7:1] = { {1{in1[5]}} , in1[5:0] } + { {2{in1[5]}} , in1[5:1] };
   assign m1_8 ={ {2{tm1_8[7]}} , tm1_8[7:3] };

   // m1_9 = W*in
   wire signed [6:0] m1_9;
   assign m1_9 ={ {2{in1[5]}} , in1[5:1] };

   // m1_10 = W*in
   wire signed [6:0] m1_10;
   assign m1_10 =7'b0;

   // m1_11 = W*in
   wire signed [6:0] m1_11;
   assign m1_11 ={ {3{in1[5]}} , in1[5:2] };

   // m1_12 = W*in
   wire signed [6:0] m1_12;
   assign m1_12 ={ {2{neg1[5]}} , neg1[5:1] };

   // m1_13 = W*in
   wire signed [6:0] m1_13;
   assign m1_13 =7'b0;

   // m1_14 = W*in
   wire signed [6:0] m1_14;
   assign m1_14 ={ {2{in1[5]}} , in1[5:1] };

   // m1_15 = W*in
   wire signed [6:0] m1_15;
   assign m1_15 =7'b0;

   // m1_16 = W*in
   wire signed [6:0] m1_16;
   assign m1_16 =7'b0;

   // m1_17 = W*in
   wire signed [6:0] m1_17;
   assign m1_17 =7'b0;

   // m1_18 = W*in
   wire signed [6:0] m1_18;
   assign m1_18 ={ {2{in1[5]}} , in1[5:1] };

   // m1_19 = W*in
   wire signed [6:0] m1_19;
   assign m1_19 =7'b0;

   // m1_20 = W*in
   wire signed [6:0] m1_20;
   assign m1_20 ={ {3{neg1[5]}} , neg1[5:2] };

   // m2_1 = W*in
   wire signed [6:0] m2_1;
   assign m2_1 =7'b0;

   // m2_2 = W*in
   wire signed [6:0] m2_2;
   assign m2_2 =7'b0;

   // m2_3 = W*in
   wire signed [6:0] m2_3;
   assign m2_3 ={ {2{in2[5]}} , in2[5:1] };

   // m2_4 = W*in
   wire signed [6:0] m2_4;
   assign m2_4 =7'b0;

   // m2_5 = W*in
   wire signed [6:0] m2_5;
   assign m2_5 =7'b0;

   // m2_6 = W*in
   wire signed [6:0] m2_6;
   wire signed [7:0] tm2_6;
   assign tm2_6[0:0] = in2[0:0];
   assign tm2_6[7:1] = { {1{in2[5]}} , in2[5:0] } + { {2{in2[5]}} , in2[5:1] };
   assign m2_6 ={ {1{tm2_6[7]}} , tm2_6[7:2] };

   // m2_7 = W*in
   wire signed [6:0] m2_7;
   assign m2_7 =7'b0;

   // m2_8 = W*in
   wire signed [6:0] m2_8;
   assign m2_8 ={ {3{neg2[5]}} , neg2[5:2] };

   // m2_9 = W*in
   wire signed [6:0] m2_9;
   assign m2_9 ={ {3{neg2[5]}} , neg2[5:2] };

   // m2_10 = W*in
   wire signed [6:0] m2_10;
   wire signed [7:0] tm2_10;
   assign tm2_10[0:0] = neg2[0:0];
   assign tm2_10[7:1] = { {1{neg2[5]}} , neg2[5:0] } + { {2{neg2[5]}} , neg2[5:1] };
   assign m2_10 ={ {2{tm2_10[7]}} , tm2_10[7:3] };

   // m2_11 = W*in
   wire signed [6:0] m2_11;
   assign m2_11 =7'b0;

   // m2_12 = W*in
   wire signed [6:0] m2_12;
   assign m2_12 =7'b0;

   // m2_13 = W*in
   wire signed [6:0] m2_13;
   assign m2_13 =7'b0;

   // m2_14 = W*in
   wire signed [6:0] m2_14;
   wire signed [7:0] tm2_14;
   assign tm2_14[0:0] = in2[0:0];
   assign tm2_14[7:1] = { {1{in2[5]}} , in2[5:0] } + { {2{in2[5]}} , in2[5:1] };
   assign m2_14 ={ {2{tm2_14[7]}} , tm2_14[7:3] };

   // m2_15 = W*in
   wire signed [6:0] m2_15;
   assign m2_15 =7'b0;

   // m2_16 = W*in
   wire signed [6:0] m2_16;
   wire signed [7:0] tm2_16;
   assign tm2_16[0:0] = in2[0:0];
   assign tm2_16[7:1] = { {1{in2[5]}} , in2[5:0] } + { {2{in2[5]}} , in2[5:1] };
   assign m2_16 ={ {2{tm2_16[7]}} , tm2_16[7:3] };

   // m2_17 = W*in
   wire signed [6:0] m2_17;
   wire signed [9:0] tm2_17;
   assign tm2_17[2:0] = neg2[2:0];
   assign tm2_17[9:3] = { {1{in2[5]}} , in2[5:0] } + { {4{neg2[5]}} , neg2[5:3] };
   assign m2_17 =tm2_17[9:3];

   // m2_18 = W*in
   wire signed [6:0] m2_18;
   assign m2_18 =7'b0;

   // m2_19 = W*in
   wire signed [6:0] m2_19;
   assign m2_19 =7'b0;

   // m2_20 = W*in
   wire signed [6:0] m2_20;
   assign m2_20 ={ {3{neg2[5]}} , neg2[5:2] };

   // m3_1 = W*in
   wire signed [6:0] m3_1;
   assign m3_1 ={ {2{neg3[5]}} , neg3[5:1] };

   // m3_2 = W*in
   wire signed [6:0] m3_2;
   wire signed [9:0] tm3_2;
   assign tm3_2[2:0] = neg3[2:0];
   assign tm3_2[9:3] = { {1{in3[5]}} , in3[5:0] } + { {4{neg3[5]}} , neg3[5:3] };
   assign m3_2 ={ {1{tm3_2[9]}} , tm3_2[9:4] };

   // m3_3 = W*in
   wire signed [6:0] m3_3;
   assign m3_3 =7'b0;

   // m3_4 = W*in
   wire signed [6:0] m3_4;
   assign m3_4 ={ {3{in3[5]}} , in3[5:2] };

   // m3_5 = W*in
   wire signed [6:0] m3_5;
   assign m3_5 =7'b0;

   // m3_6 = W*in
   wire signed [6:0] m3_6;
   assign m3_6 ={ {2{in3[5]}} , in3[5:1] };

   // m3_7 = W*in
   wire signed [6:0] m3_7;
   assign m3_7 ={ {3{neg3[5]}} , neg3[5:2] };

   // m3_8 = W*in
   wire signed [6:0] m3_8;
   assign m3_8 ={ {2{in3[5]}} , in3[5:1] };

   // m3_9 = W*in
   wire signed [6:0] m3_9;
   assign m3_9 =7'b0;

   // m3_10 = W*in
   wire signed [6:0] m3_10;
   wire signed [7:0] tm3_10;
   assign tm3_10[0:0] = neg3[0:0];
   assign tm3_10[7:1] = { {1{neg3[5]}} , neg3[5:0] } + { {2{neg3[5]}} , neg3[5:1] };
   assign m3_10 ={ {2{tm3_10[7]}} , tm3_10[7:3] };

   // m3_11 = W*in
   wire signed [6:0] m3_11;
   wire signed [7:0] tm3_11;
   assign tm3_11[0:0] = in3[0:0];
   assign tm3_11[7:1] = { {1{in3[5]}} , in3[5:0] } + { {2{in3[5]}} , in3[5:1] };
   assign m3_11 ={ {2{tm3_11[7]}} , tm3_11[7:3] };

   // m3_12 = W*in
   wire signed [6:0] m3_12;
   assign m3_12 ={ {2{neg3[5]}} , neg3[5:1] };

   // m3_13 = W*in
   wire signed [6:0] m3_13;
   assign m3_13 =7'b0;

   // m3_14 = W*in
   wire signed [6:0] m3_14;
   assign m3_14 ={ {2{in3[5]}} , in3[5:1] };

   // m3_15 = W*in
   wire signed [6:0] m3_15;
   assign m3_15 =7'b0;

   // m3_16 = W*in
   wire signed [6:0] m3_16;
   assign m3_16 ={ {3{in3[5]}} , in3[5:2] };

   // m3_17 = W*in
   wire signed [6:0] m3_17;
   assign m3_17 ={ {3{in3[5]}} , in3[5:2] };

   // m3_18 = W*in
   wire signed [6:0] m3_18;
   assign m3_18 =7'b0;

   // m3_19 = W*in
   wire signed [6:0] m3_19;
   wire signed [7:0] tm3_19;
   assign tm3_19[0:0] = in3[0:0];
   assign tm3_19[7:1] = { {1{in3[5]}} , in3[5:0] } + { {2{in3[5]}} , in3[5:1] };
   assign m3_19 ={ {3{tm3_19[7]}} , tm3_19[7:4] };

   // m3_20 = W*in
   wire signed [6:0] m3_20;
   assign m3_20 =7'b0;

   // m4_1 = W*in
   wire signed [6:0] m4_1;
   assign m4_1 ={ {2{neg4[5]}} , neg4[5:1] };

   // m4_2 = W*in
   wire signed [6:0] m4_2;
   assign m4_2 =7'b0;

   // m4_3 = W*in
   wire signed [6:0] m4_3;
   assign m4_3 ={ {3{in4[5]}} , in4[5:2] };

   // m4_4 = W*in
   wire signed [6:0] m4_4;
   assign m4_4 =7'b0;

   // m4_5 = W*in
   wire signed [6:0] m4_5;
   assign m4_5 =7'b0;

   // m4_6 = W*in
   wire signed [6:0] m4_6;
   assign m4_6 =7'b0;

   // m4_7 = W*in
   wire signed [6:0] m4_7;
   wire signed [8:0] tm4_7;
   assign tm4_7[1:0] = in4[1:0];
   assign tm4_7[8:2] = { {1{in4[5]}} , in4[5:0] } + { {3{in4[5]}} , in4[5:2] };
   assign m4_7 ={ {1{tm4_7[8]}} , tm4_7[8:3] };

   // m4_8 = W*in
   wire signed [6:0] m4_8;
   assign m4_8 =7'b0;

   // m4_9 = W*in
   wire signed [6:0] m4_9;
   assign m4_9 =7'b0;

   // m4_10 = W*in
   wire signed [6:0] m4_10;
   assign m4_10 ={ {2{neg4[5]}} , neg4[5:1] };

   // m4_11 = W*in
   wire signed [6:0] m4_11;
   assign m4_11 ={ {2{in4[5]}} , in4[5:1] };

   // m4_12 = W*in
   wire signed [6:0] m4_12;
   assign m4_12 =7'b0;

   // m4_13 = W*in
   wire signed [6:0] m4_13;
   assign m4_13 ={ {3{neg4[5]}} , neg4[5:2] };

   // m4_14 = W*in
   wire signed [6:0] m4_14;
   assign m4_14 =7'b0;

   // m4_15 = W*in
   wire signed [6:0] m4_15;
   assign m4_15 ={ {2{in4[5]}} , in4[5:1] };

   // m4_16 = W*in
   wire signed [6:0] m4_16;
   assign m4_16 ={ {2{in4[5]}} , in4[5:1] };

   // m4_17 = W*in
   wire signed [6:0] m4_17;
   wire signed [7:0] tm4_17;
   assign tm4_17[0:0] = in4[0:0];
   assign tm4_17[7:1] = { {1{in4[5]}} , in4[5:0] } + { {2{in4[5]}} , in4[5:1] };
   assign m4_17 ={ {1{tm4_17[7]}} , tm4_17[7:2] };

   // m4_18 = W*in
   wire signed [6:0] m4_18;
   assign m4_18 ={ {3{neg4[5]}} , neg4[5:2] };

   // m4_19 = W*in
   wire signed [6:0] m4_19;
   wire signed [8:0] tm4_19;
   assign tm4_19[1:0] = neg4[1:0];
   assign tm4_19[8:2] = { {1{neg4[5]}} , neg4[5:0] } + { {3{neg4[5]}} , neg4[5:2] };
   assign m4_19 ={ {1{tm4_19[8]}} , tm4_19[8:3] };

   // m4_20 = W*in
   wire signed [6:0] m4_20;
   assign m4_20 =7'b0;

   // m5_1 = W*in
   wire signed [6:0] m5_1;
   assign m5_1 =7'b0;

   // m5_2 = W*in
   wire signed [6:0] m5_2;
   assign m5_2 =7'b0;

   // m5_3 = W*in
   wire signed [6:0] m5_3;
   assign m5_3 =7'b0;

   // m5_4 = W*in
   wire signed [6:0] m5_4;
   assign m5_4 ={ {2{neg5[5]}} , neg5[5:1] };

   // m5_5 = W*in
   wire signed [6:0] m5_5;
   assign m5_5 =7'b0;

   // m5_6 = W*in
   wire signed [6:0] m5_6;
   wire signed [8:0] tm5_6;
   assign tm5_6[1:0] = in5[1:0];
   assign tm5_6[8:2] = { {1{in5[5]}} , in5[5:0] } + { {3{in5[5]}} , in5[5:2] };
   assign m5_6 ={ {1{tm5_6[8]}} , tm5_6[8:3] };

   // m5_7 = W*in
   wire signed [6:0] m5_7;
   assign m5_7 =7'b0;

   // m5_8 = W*in
   wire signed [6:0] m5_8;
   assign m5_8 =7'b0;

   // m5_9 = W*in
   wire signed [6:0] m5_9;
   assign m5_9 =7'b0;

   // m5_10 = W*in
   wire signed [6:0] m5_10;
   assign m5_10 =7'b0;

   // m5_11 = W*in
   wire signed [6:0] m5_11;
   assign m5_11 =7'b0;

   // m5_12 = W*in
   wire signed [6:0] m5_12;
   assign m5_12 =7'b0;

   // m5_13 = W*in
   wire signed [6:0] m5_13;
   assign m5_13 =7'b0;

   // m5_14 = W*in
   wire signed [6:0] m5_14;
   assign m5_14 ={ {2{in5[5]}} , in5[5:1] };

   // m5_15 = W*in
   wire signed [6:0] m5_15;
   assign m5_15 =7'b0;

   // m5_16 = W*in
   wire signed [6:0] m5_16;
   wire signed [7:0] tm5_16;
   assign tm5_16[0:0] = in5[0:0];
   assign tm5_16[7:1] = { {1{in5[5]}} , in5[5:0] } + { {2{in5[5]}} , in5[5:1] };
   assign m5_16 ={ {1{tm5_16[7]}} , tm5_16[7:2] };

   // m5_17 = W*in
   wire signed [6:0] m5_17;
   assign m5_17 ={ {2{in5[5]}} , in5[5:1] };

   // m5_18 = W*in
   wire signed [6:0] m5_18;
   assign m5_18 ={ {4{in5[5]}} , in5[5:3] };

   // m5_19 = W*in
   wire signed [6:0] m5_19;
   assign m5_19 =7'b0;

   // m5_20 = W*in
   wire signed [6:0] m5_20;
   wire signed [9:0] tm5_20;
   assign tm5_20[2:0] = in5[2:0];
   assign tm5_20[9:3] = { {1{neg5[5]}} , neg5[5:0] } + { {4{in5[5]}} , in5[5:3] };
   assign m5_20 =tm5_20[9:3];

   // m6_1 = W*in
   wire signed [6:0] m6_1;
   assign m6_1 =7'b0;

   // m6_2 = W*in
   wire signed [6:0] m6_2;
   assign m6_2 =7'b0;

   // m6_3 = W*in
   wire signed [6:0] m6_3;
   assign m6_3 =7'b0;

   // m6_4 = W*in
   wire signed [6:0] m6_4;
   assign m6_4 =7'b0;

   // m6_5 = W*in
   wire signed [6:0] m6_5;
   assign m6_5 =7'b0;

   // m6_6 = W*in
   wire signed [6:0] m6_6;
   assign m6_6 =7'b0;

   // m6_7 = W*in
   wire signed [6:0] m6_7;
   wire signed [8:0] tm6_7;
   assign tm6_7[1:0] = in6[1:0];
   assign tm6_7[8:2] = { {1{in6[5]}} , in6[5:0] } + { {3{in6[5]}} , in6[5:2] };
   assign m6_7 ={ {1{tm6_7[8]}} , tm6_7[8:3] };

   // m6_8 = W*in
   wire signed [6:0] m6_8;
   assign m6_8 =7'b0;

   // m6_9 = W*in
   wire signed [6:0] m6_9;
   assign m6_9 =7'b0;

   // m6_10 = W*in
   wire signed [6:0] m6_10;
   assign m6_10 =7'b0;

   // m6_11 = W*in
   wire signed [6:0] m6_11;
   assign m6_11 =7'b0;

   // m6_12 = W*in
   wire signed [6:0] m6_12;
   assign m6_12 =7'b0;

   // m6_13 = W*in
   wire signed [6:0] m6_13;
   assign m6_13 ={ {3{neg6[5]}} , neg6[5:2] };

   // m6_14 = W*in
   wire signed [6:0] m6_14;
   assign m6_14 =7'b0;

   // m6_15 = W*in
   wire signed [6:0] m6_15;
   assign m6_15 ={ {2{in6[5]}} , in6[5:1] };

   // m6_16 = W*in
   wire signed [6:0] m6_16;
   assign m6_16 =7'b0;

   // m6_17 = W*in
   wire signed [6:0] m6_17;
   assign m6_17 =7'b0;

   // m6_18 = W*in
   wire signed [6:0] m6_18;
   assign m6_18 ={ {2{in6[5]}} , in6[5:1] };

   // m6_19 = W*in
   wire signed [6:0] m6_19;
   assign m6_19 =7'b0;

   // m6_20 = W*in
   wire signed [6:0] m6_20;
   assign m6_20 =7'b0;

   // m7_1 = W*in
   wire signed [6:0] m7_1;
   assign m7_1 =7'b0;

   // m7_2 = W*in
   wire signed [6:0] m7_2;
   assign m7_2 =7'b0;

   // m7_3 = W*in
   wire signed [6:0] m7_3;
   assign m7_3 ={ {2{neg7[5]}} , neg7[5:1] };

   // m7_4 = W*in
   wire signed [6:0] m7_4;
   wire signed [7:0] tm7_4;
   assign tm7_4[0:0] = in7[0:0];
   assign tm7_4[7:1] = { {1{in7[5]}} , in7[5:0] } + { {2{in7[5]}} , in7[5:1] };
   assign m7_4 ={ {2{tm7_4[7]}} , tm7_4[7:3] };

   // m7_5 = W*in
   wire signed [6:0] m7_5;
   assign m7_5 =7'b0;

   // m7_6 = W*in
   wire signed [6:0] m7_6;
   assign m7_6 =7'b0;

   // m7_7 = W*in
   wire signed [6:0] m7_7;
   assign m7_7 =7'b0;

   // m7_8 = W*in
   wire signed [6:0] m7_8;
   assign m7_8 ={ {2{in7[5]}} , in7[5:1] };

   // m7_9 = W*in
   wire signed [6:0] m7_9;
   assign m7_9 =7'b0;

   // m7_10 = W*in
   wire signed [6:0] m7_10;
   assign m7_10 ={ {3{in7[5]}} , in7[5:2] };

   // m7_11 = W*in
   wire signed [6:0] m7_11;
   assign m7_11 =7'b0;

   // m7_12 = W*in
   wire signed [6:0] m7_12;
   assign m7_12 ={ {2{in7[5]}} , in7[5:1] };

   // m7_13 = W*in
   wire signed [6:0] m7_13;
   assign m7_13 =7'b0;

   // m7_14 = W*in
   wire signed [6:0] m7_14;
   assign m7_14 ={ {2{in7[5]}} , in7[5:1] };

   // m7_15 = W*in
   wire signed [6:0] m7_15;
   assign m7_15 ={ {2{neg7[5]}} , neg7[5:1] };

   // m7_16 = W*in
   wire signed [6:0] m7_16;
   assign m7_16 =7'b0;

   // m7_17 = W*in
   wire signed [6:0] m7_17;
   assign m7_17 =7'b0;

   // m7_18 = W*in
   wire signed [6:0] m7_18;
   assign m7_18 ={ {2{in7[5]}} , in7[5:1] };

   // m7_19 = W*in
   wire signed [6:0] m7_19;
   assign m7_19 =7'b0;

   // m7_20 = W*in
   wire signed [6:0] m7_20;
   assign m7_20 =7'b0;

   // m8_1 = W*in
   wire signed [6:0] m8_1;
   assign m8_1 =7'b0;

   // m8_2 = W*in
   wire signed [6:0] m8_2;
   assign m8_2 =7'b0;

   // m8_3 = W*in
   wire signed [6:0] m8_3;
   assign m8_3 =7'b0;

   // m8_4 = W*in
   wire signed [6:0] m8_4;
   assign m8_4 =7'b0;

   // m8_5 = W*in
   wire signed [6:0] m8_5;
   assign m8_5 =7'b0;

   // m8_6 = W*in
   wire signed [6:0] m8_6;
   wire signed [7:0] tm8_6;
   assign tm8_6[0:0] = in8[0:0];
   assign tm8_6[7:1] = { {1{in8[5]}} , in8[5:0] } + { {2{in8[5]}} , in8[5:1] };
   assign m8_6 ={ {1{tm8_6[7]}} , tm8_6[7:2] };

   // m8_7 = W*in
   wire signed [6:0] m8_7;
   assign m8_7 ={ {3{neg8[5]}} , neg8[5:2] };

   // m8_8 = W*in
   wire signed [6:0] m8_8;
   wire signed [7:0] tm8_8;
   assign tm8_8[0:0] = neg8[0:0];
   assign tm8_8[7:1] = { {1{neg8[5]}} , neg8[5:0] } + { {2{neg8[5]}} , neg8[5:1] };
   assign m8_8 ={ {2{tm8_8[7]}} , tm8_8[7:3] };

   // m8_9 = W*in
   wire signed [6:0] m8_9;
   wire signed [7:0] tm8_9;
   assign tm8_9[0:0] = neg8[0:0];
   assign tm8_9[7:1] = { {1{neg8[5]}} , neg8[5:0] } + { {2{neg8[5]}} , neg8[5:1] };
   assign m8_9 ={ {1{tm8_9[7]}} , tm8_9[7:2] };

   // m8_10 = W*in
   wire signed [6:0] m8_10;
   assign m8_10 ={ {2{in8[5]}} , in8[5:1] };

   // m8_11 = W*in
   wire signed [6:0] m8_11;
   wire signed [7:0] tm8_11;
   assign tm8_11[0:0] = neg8[0:0];
   assign tm8_11[7:1] = { {1{neg8[5]}} , neg8[5:0] } + { {2{neg8[5]}} , neg8[5:1] };
   assign m8_11 ={ {2{tm8_11[7]}} , tm8_11[7:3] };

   // m8_12 = W*in
   wire signed [6:0] m8_12;
   assign m8_12 =7'b0;

   // m8_13 = W*in
   wire signed [6:0] m8_13;
   assign m8_13 =7'b0;

   // m8_14 = W*in
   wire signed [6:0] m8_14;
   assign m8_14 =7'b0;

   // m8_15 = W*in
   wire signed [6:0] m8_15;
   assign m8_15 =7'b0;

   // m8_16 = W*in
   wire signed [6:0] m8_16;
   assign m8_16 =7'b0;

   // m8_17 = W*in
   wire signed [6:0] m8_17;
   assign m8_17 ={ {2{in8[5]}} , in8[5:1] };

   // m8_18 = W*in
   wire signed [6:0] m8_18;
   assign m8_18 =7'b0;

   // m8_19 = W*in
   wire signed [6:0] m8_19;
   assign m8_19 =7'b0;

   // m8_20 = W*in
   wire signed [6:0] m8_20;
   assign m8_20 ={ {2{neg8[5]}} , neg8[5:1] };

   // m9_1 = W*in
   wire signed [6:0] m9_1;
   assign m9_1 =7'b0;

   // m9_2 = W*in
   wire signed [6:0] m9_2;
   wire signed [8:0] tm9_2;
   assign tm9_2[1:0] = in9[1:0];
   assign tm9_2[8:2] = { {1{in9[5]}} , in9[5:0] } + { {3{in9[5]}} , in9[5:2] };
   assign m9_2 ={ {1{tm9_2[8]}} , tm9_2[8:3] };

   // m9_3 = W*in
   wire signed [6:0] m9_3;
   wire signed [9:0] tm9_3;
   assign tm9_3[2:0] = neg9[2:0];
   assign tm9_3[9:3] = { {1{in9[5]}} , in9[5:0] } + { {4{neg9[5]}} , neg9[5:3] };
   assign m9_3 ={ {1{tm9_3[9]}} , tm9_3[9:4] };

   // m9_4 = W*in
   wire signed [6:0] m9_4;
   assign m9_4 =7'b0;

   // m9_5 = W*in
   wire signed [6:0] m9_5;
   assign m9_5 =7'b0;

   // m9_6 = W*in
   wire signed [6:0] m9_6;
   assign m9_6 =7'b0;

   // m9_7 = W*in
   wire signed [6:0] m9_7;
   assign m9_7 =7'b0;

   // m9_8 = W*in
   wire signed [6:0] m9_8;
   assign m9_8 =7'b0;

   // m9_9 = W*in
   wire signed [6:0] m9_9;
   assign m9_9 =7'b0;

   // m9_10 = W*in
   wire signed [6:0] m9_10;
   assign m9_10 =7'b0;

   // m9_11 = W*in
   wire signed [6:0] m9_11;
   assign m9_11 =7'b0;

   // m9_12 = W*in
   wire signed [6:0] m9_12;
   assign m9_12 =7'b0;

   // m9_13 = W*in
   wire signed [6:0] m9_13;
   assign m9_13 ={ {3{in9[5]}} , in9[5:2] };

   // m9_14 = W*in
   wire signed [6:0] m9_14;
   wire signed [8:0] tm9_14;
   assign tm9_14[1:0] = in9[1:0];
   assign tm9_14[8:2] = { {1{in9[5]}} , in9[5:0] } + { {3{in9[5]}} , in9[5:2] };
   assign m9_14 ={ {1{tm9_14[8]}} , tm9_14[8:3] };

   // m9_15 = W*in
   wire signed [6:0] m9_15;
   assign m9_15 ={ {3{in9[5]}} , in9[5:2] };

   // m9_16 = W*in
   wire signed [6:0] m9_16;
   assign m9_16 ={ {2{in9[5]}} , in9[5:1] };

   // m9_17 = W*in
   wire signed [6:0] m9_17;
   assign m9_17 =7'b0;

   // m9_18 = W*in
   wire signed [6:0] m9_18;
   assign m9_18 ={ {3{neg9[5]}} , neg9[5:2] };

   // m9_19 = W*in
   wire signed [6:0] m9_19;
   wire signed [9:0] tm9_19;
   assign tm9_19[2:0] = neg9[2:0];
   assign tm9_19[9:3] = { {1{in9[5]}} , in9[5:0] } + { {4{neg9[5]}} , neg9[5:3] };
   assign m9_19 ={ {1{tm9_19[9]}} , tm9_19[9:4] };

   // m9_20 = W*in
   wire signed [6:0] m9_20;
   assign m9_20 =7'b0;

   // m10_1 = W*in
   wire signed [6:0] m10_1;
   wire signed [7:0] tm10_1;
   assign tm10_1[0:0] = in10[0:0];
   assign tm10_1[7:1] = { {1{in10[5]}} , in10[5:0] } + { {2{in10[5]}} , in10[5:1] };
   assign m10_1 ={ {2{tm10_1[7]}} , tm10_1[7:3] };

   // m10_2 = W*in
   wire signed [6:0] m10_2;
   assign m10_2 =7'b0;

   // m10_3 = W*in
   wire signed [6:0] m10_3;
   assign m10_3 =7'b0;

   // m10_4 = W*in
   wire signed [6:0] m10_4;
   assign m10_4 =7'b0;

   // m10_5 = W*in
   wire signed [6:0] m10_5;
   assign m10_5 =7'b0;

   // m10_6 = W*in
   wire signed [6:0] m10_6;
   assign m10_6 =7'b0;

   // m10_7 = W*in
   wire signed [6:0] m10_7;
   assign m10_7 =7'b0;

   // m10_8 = W*in
   wire signed [6:0] m10_8;
   assign m10_8 =7'b0;

   // m10_9 = W*in
   wire signed [6:0] m10_9;
   assign m10_9 ={ {3{in10[5]}} , in10[5:2] };

   // m10_10 = W*in
   wire signed [6:0] m10_10;
   assign m10_10 ={ {3{neg10[5]}} , neg10[5:2] };

   // m10_11 = W*in
   wire signed [6:0] m10_11;
   assign m10_11 ={ {3{in10[5]}} , in10[5:2] };

   // m10_12 = W*in
   wire signed [6:0] m10_12;
   assign m10_12 ={ {2{in10[5]}} , in10[5:1] };

   // m10_13 = W*in
   wire signed [6:0] m10_13;
   assign m10_13 =7'b0;

   // m10_14 = W*in
   wire signed [6:0] m10_14;
   wire signed [7:0] tm10_14;
   assign tm10_14[0:0] = neg10[0:0];
   assign tm10_14[7:1] = { {1{neg10[5]}} , neg10[5:0] } + { {2{neg10[5]}} , neg10[5:1] };
   assign m10_14 ={ {2{tm10_14[7]}} , tm10_14[7:3] };

   // m10_15 = W*in
   wire signed [6:0] m10_15;
   assign m10_15 =7'b0;

   // m10_16 = W*in
   wire signed [6:0] m10_16;
   assign m10_16 =7'b0;

   // m10_17 = W*in
   wire signed [6:0] m10_17;
   assign m10_17 =7'b0;

   // m10_18 = W*in
   wire signed [6:0] m10_18;
   assign m10_18 =7'b0;

   // m10_19 = W*in
   wire signed [6:0] m10_19;
   assign m10_19 =7'b0;

   // m10_20 = W*in
   wire signed [6:0] m10_20;
   wire signed [7:0] tm10_20;
   assign tm10_20[0:0] = in10[0:0];
   assign tm10_20[7:1] = { {1{in10[5]}} , in10[5:0] } + { {2{in10[5]}} , in10[5:1] };
   assign m10_20 ={ {1{tm10_20[7]}} , tm10_20[7:2] };

   // m11_1 = W*in
   wire signed [6:0] m11_1;
   assign m11_1 =7'b0;

   // m11_2 = W*in
   wire signed [6:0] m11_2;
   assign m11_2 ={ {2{neg11[5]}} , neg11[5:1] };

   // m11_3 = W*in
   wire signed [6:0] m11_3;
   assign m11_3 =7'b0;

   // m11_4 = W*in
   wire signed [6:0] m11_4;
   assign m11_4 =7'b0;

   // m11_5 = W*in
   wire signed [6:0] m11_5;
   assign m11_5 =7'b0;

   // m11_6 = W*in
   wire signed [6:0] m11_6;
   assign m11_6 ={ {2{in11[5]}} , in11[5:1] };

   // m11_7 = W*in
   wire signed [6:0] m11_7;
   assign m11_7 =7'b0;

   // m11_8 = W*in
   wire signed [6:0] m11_8;
   assign m11_8 =7'b0;

   // m11_9 = W*in
   wire signed [6:0] m11_9;
   wire signed [7:0] tm11_9;
   assign tm11_9[0:0] = in11[0:0];
   assign tm11_9[7:1] = { {1{in11[5]}} , in11[5:0] } + { {2{in11[5]}} , in11[5:1] };
   assign m11_9 ={ {2{tm11_9[7]}} , tm11_9[7:3] };

   // m11_10 = W*in
   wire signed [6:0] m11_10;
   assign m11_10 =7'b0;

   // m11_11 = W*in
   wire signed [6:0] m11_11;
   assign m11_11 ={ {2{in11[5]}} , in11[5:1] };

   // m11_12 = W*in
   wire signed [6:0] m11_12;
   wire signed [7:0] tm11_12;
   assign tm11_12[0:0] = in11[0:0];
   assign tm11_12[7:1] = { {1{in11[5]}} , in11[5:0] } + { {2{in11[5]}} , in11[5:1] };
   assign m11_12 ={ {1{tm11_12[7]}} , tm11_12[7:2] };

   // m11_13 = W*in
   wire signed [6:0] m11_13;
   assign m11_13 =7'b0;

   // m11_14 = W*in
   wire signed [6:0] m11_14;
   assign m11_14 =7'b0;

   // m11_15 = W*in
   wire signed [6:0] m11_15;
   assign m11_15 =7'b0;

   // m11_16 = W*in
   wire signed [6:0] m11_16;
   wire signed [7:0] tm11_16;
   assign tm11_16[0:0] = in11[0:0];
   assign tm11_16[7:1] = { {1{in11[5]}} , in11[5:0] } + { {2{in11[5]}} , in11[5:1] };
   assign m11_16 ={ {2{tm11_16[7]}} , tm11_16[7:3] };

   // m11_17 = W*in
   wire signed [6:0] m11_17;
   assign m11_17 ={ {3{in11[5]}} , in11[5:2] };

   // m11_18 = W*in
   wire signed [6:0] m11_18;
   assign m11_18 =7'b0;

   // m11_19 = W*in
   wire signed [6:0] m11_19;
   wire signed [7:0] tm11_19;
   assign tm11_19[0:0] = neg11[0:0];
   assign tm11_19[7:1] = { {1{neg11[5]}} , neg11[5:0] } + { {2{neg11[5]}} , neg11[5:1] };
   assign m11_19 ={ {2{tm11_19[7]}} , tm11_19[7:3] };

   // m11_20 = W*in
   wire signed [6:0] m11_20;
   assign m11_20 =7'b0;

   // m12_1 = W*in
   wire signed [6:0] m12_1;
   assign m12_1 ={ {3{in12[5]}} , in12[5:2] };

   // m12_2 = W*in
   wire signed [6:0] m12_2;
   wire signed [9:0] tm12_2;
   assign tm12_2[2:0] = neg12[2:0];
   assign tm12_2[9:3] = { {1{in12[5]}} , in12[5:0] } + { {4{neg12[5]}} , neg12[5:3] };
   assign m12_2 ={ {1{tm12_2[9]}} , tm12_2[9:4] };

   // m12_3 = W*in
   wire signed [6:0] m12_3;
   assign m12_3 ={ {3{neg12[5]}} , neg12[5:2] };

   // m12_4 = W*in
   wire signed [6:0] m12_4;
   assign m12_4 =7'b0;

   // m12_5 = W*in
   wire signed [6:0] m12_5;
   assign m12_5 ={ {3{neg12[5]}} , neg12[5:2] };

   // m12_6 = W*in
   wire signed [6:0] m12_6;
   assign m12_6 =7'b0;

   // m12_7 = W*in
   wire signed [6:0] m12_7;
   assign m12_7 ={ {2{in12[5]}} , in12[5:1] };

   // m12_8 = W*in
   wire signed [6:0] m12_8;
   assign m12_8 =7'b0;

   // m12_9 = W*in
   wire signed [6:0] m12_9;
   wire signed [7:0] tm12_9;
   assign tm12_9[0:0] = in12[0:0];
   assign tm12_9[7:1] = { {1{in12[5]}} , in12[5:0] } + { {2{in12[5]}} , in12[5:1] };
   assign m12_9 ={ {2{tm12_9[7]}} , tm12_9[7:3] };

   // m12_10 = W*in
   wire signed [6:0] m12_10;
   assign m12_10 ={ {3{in12[5]}} , in12[5:2] };

   // m12_11 = W*in
   wire signed [6:0] m12_11;
   assign m12_11 =7'b0;

   // m12_12 = W*in
   wire signed [6:0] m12_12;
   wire signed [7:0] tm12_12;
   assign tm12_12[0:0] = neg12[0:0];
   assign tm12_12[7:1] = { {1{neg12[5]}} , neg12[5:0] } + { {2{neg12[5]}} , neg12[5:1] };
   assign m12_12 ={ {2{tm12_12[7]}} , tm12_12[7:3] };

   // m12_13 = W*in
   wire signed [6:0] m12_13;
   assign m12_13 =7'b0;

   // m12_14 = W*in
   wire signed [6:0] m12_14;
   assign m12_14 =7'b0;

   // m12_15 = W*in
   wire signed [6:0] m12_15;
   assign m12_15 =7'b0;

   // m12_16 = W*in
   wire signed [6:0] m12_16;
   assign m12_16 =7'b0;

   // m12_17 = W*in
   wire signed [6:0] m12_17;
   wire signed [7:0] tm12_17;
   assign tm12_17[0:0] = in12[0:0];
   assign tm12_17[7:1] = { {1{in12[5]}} , in12[5:0] } + { {2{in12[5]}} , in12[5:1] };
   assign m12_17 ={ {2{tm12_17[7]}} , tm12_17[7:3] };

   // m12_18 = W*in
   wire signed [6:0] m12_18;
   assign m12_18 ={ {3{in12[5]}} , in12[5:2] };

   // m12_19 = W*in
   wire signed [6:0] m12_19;
   assign m12_19 ={ {3{in12[5]}} , in12[5:2] };

   // m12_20 = W*in
   wire signed [6:0] m12_20;
   assign m12_20 =7'b0;

   // m13_1 = W*in
   wire signed [6:0] m13_1;
   assign m13_1 ={ {2{neg13[5]}} , neg13[5:1] };

   // m13_2 = W*in
   wire signed [6:0] m13_2;
   assign m13_2 =7'b0;

   // m13_3 = W*in
   wire signed [6:0] m13_3;
   assign m13_3 =7'b0;

   // m13_4 = W*in
   wire signed [6:0] m13_4;
   assign m13_4 =7'b0;

   // m13_5 = W*in
   wire signed [6:0] m13_5;
   assign m13_5 =7'b0;

   // m13_6 = W*in
   wire signed [6:0] m13_6;
   assign m13_6 ={ {3{in13[5]}} , in13[5:2] };

   // m13_7 = W*in
   wire signed [6:0] m13_7;
   assign m13_7 =7'b0;

   // m13_8 = W*in
   wire signed [6:0] m13_8;
   assign m13_8 =7'b0;

   // m13_9 = W*in
   wire signed [6:0] m13_9;
   assign m13_9 =7'b0;

   // m13_10 = W*in
   wire signed [6:0] m13_10;
   assign m13_10 ={ {2{neg13[5]}} , neg13[5:1] };

   // m13_11 = W*in
   wire signed [6:0] m13_11;
   assign m13_11 =7'b0;

   // m13_12 = W*in
   wire signed [6:0] m13_12;
   assign m13_12 =7'b0;

   // m13_13 = W*in
   wire signed [6:0] m13_13;
   wire signed [8:0] tm13_13;
   assign tm13_13[1:0] = neg13[1:0];
   assign tm13_13[8:2] = { {1{neg13[5]}} , neg13[5:0] } + { {3{neg13[5]}} , neg13[5:2] };
   assign m13_13 ={ {1{tm13_13[8]}} , tm13_13[8:3] };

   // m13_14 = W*in
   wire signed [6:0] m13_14;
   assign m13_14 =7'b0;

   // m13_15 = W*in
   wire signed [6:0] m13_15;
   assign m13_15 =7'b0;

   // m13_16 = W*in
   wire signed [6:0] m13_16;
   assign m13_16 ={ {2{in13[5]}} , in13[5:1] };

   // m13_17 = W*in
   wire signed [6:0] m13_17;
   wire signed [8:0] tm13_17;
   assign tm13_17[1:0] = in13[1:0];
   assign tm13_17[8:2] = { {1{in13[5]}} , in13[5:0] } + { {3{in13[5]}} , in13[5:2] };
   assign m13_17 ={ {1{tm13_17[8]}} , tm13_17[8:3] };

   // m13_18 = W*in
   wire signed [6:0] m13_18;
   assign m13_18 =7'b0;

   // m13_19 = W*in
   wire signed [6:0] m13_19;
   assign m13_19 ={ {3{neg13[5]}} , neg13[5:2] };

   // m13_20 = W*in
   wire signed [6:0] m13_20;
   assign m13_20 =7'b0;

   // m14_1 = W*in
   wire signed [6:0] m14_1;
   assign m14_1 ={ {2{in14[5]}} , in14[5:1] };

   // m14_2 = W*in
   wire signed [6:0] m14_2;
   assign m14_2 ={ {3{neg14[5]}} , neg14[5:2] };

   // m14_3 = W*in
   wire signed [6:0] m14_3;
   wire signed [7:0] tm14_3;
   assign tm14_3[0:0] = neg14[0:0];
   assign tm14_3[7:1] = { {1{neg14[5]}} , neg14[5:0] } + { {2{neg14[5]}} , neg14[5:1] };
   assign m14_3 ={ {2{tm14_3[7]}} , tm14_3[7:3] };

   // m14_4 = W*in
   wire signed [6:0] m14_4;
   assign m14_4 =7'b0;

   // m14_5 = W*in
   wire signed [6:0] m14_5;
   assign m14_5 =7'b0;

   // m14_6 = W*in
   wire signed [6:0] m14_6;
   assign m14_6 ={ {3{in14[5]}} , in14[5:2] };

   // m14_7 = W*in
   wire signed [6:0] m14_7;
   assign m14_7 =7'b0;

   // m14_8 = W*in
   wire signed [6:0] m14_8;
   assign m14_8 ={ {2{neg14[5]}} , neg14[5:1] };

   // m14_9 = W*in
   wire signed [6:0] m14_9;
   assign m14_9 =7'b0;

   // m14_10 = W*in
   wire signed [6:0] m14_10;
   wire signed [7:0] tm14_10;
   assign tm14_10[0:0] = in14[0:0];
   assign tm14_10[7:1] = { {1{in14[5]}} , in14[5:0] } + { {2{in14[5]}} , in14[5:1] };
   assign m14_10 ={ {2{tm14_10[7]}} , tm14_10[7:3] };

   // m14_11 = W*in
   wire signed [6:0] m14_11;
   assign m14_11 ={ {2{neg14[5]}} , neg14[5:1] };

   // m14_12 = W*in
   wire signed [6:0] m14_12;
   assign m14_12 =7'b0;

   // m14_13 = W*in
   wire signed [6:0] m14_13;
   wire signed [7:0] tm14_13;
   assign tm14_13[0:0] = in14[0:0];
   assign tm14_13[7:1] = { {1{in14[5]}} , in14[5:0] } + { {2{in14[5]}} , in14[5:1] };
   assign m14_13 ={ {2{tm14_13[7]}} , tm14_13[7:3] };

   // m14_14 = W*in
   wire signed [6:0] m14_14;
   assign m14_14 ={ {2{neg14[5]}} , neg14[5:1] };

   // m14_15 = W*in
   wire signed [6:0] m14_15;
   wire signed [7:0] tm14_15;
   assign tm14_15[0:0] = in14[0:0];
   assign tm14_15[7:1] = { {1{in14[5]}} , in14[5:0] } + { {2{in14[5]}} , in14[5:1] };
   assign m14_15 ={ {2{tm14_15[7]}} , tm14_15[7:3] };

   // m14_16 = W*in
   wire signed [6:0] m14_16;
   assign m14_16 =7'b0;

   // m14_17 = W*in
   wire signed [6:0] m14_17;
   wire signed [7:0] tm14_17;
   assign tm14_17[0:0] = in14[0:0];
   assign tm14_17[7:1] = { {1{in14[5]}} , in14[5:0] } + { {2{in14[5]}} , in14[5:1] };
   assign m14_17 ={ {2{tm14_17[7]}} , tm14_17[7:3] };

   // m14_18 = W*in
   wire signed [6:0] m14_18;
   assign m14_18 =7'b0;

   // m14_19 = W*in
   wire signed [6:0] m14_19;
   assign m14_19 =7'b0;

   // m14_20 = W*in
   wire signed [6:0] m14_20;
   wire signed [8:0] tm14_20;
   assign tm14_20[1:0] = neg14[1:0];
   assign tm14_20[8:2] = { {1{neg14[5]}} , neg14[5:0] } + { {3{neg14[5]}} , neg14[5:2] };
   assign m14_20 ={ {1{tm14_20[8]}} , tm14_20[8:3] };

   // m15_1 = W*in
   wire signed [6:0] m15_1;
   assign m15_1 =7'b0;

   // m15_2 = W*in
   wire signed [6:0] m15_2;
   assign m15_2 =7'b0;

   // m15_3 = W*in
   wire signed [6:0] m15_3;
   wire signed [9:0] tm15_3;
   assign tm15_3[2:0] = neg15[2:0];
   assign tm15_3[9:3] = { {1{in15[5]}} , in15[5:0] } + { {4{neg15[5]}} , neg15[5:3] };
   assign m15_3 ={ {1{tm15_3[9]}} , tm15_3[9:4] };

   // m15_4 = W*in
   wire signed [6:0] m15_4;
   assign m15_4 ={ {2{in15[5]}} , in15[5:1] };

   // m15_5 = W*in
   wire signed [6:0] m15_5;
   assign m15_5 =7'b0;

   // m15_6 = W*in
   wire signed [6:0] m15_6;
   assign m15_6 =7'b0;

   // m15_7 = W*in
   wire signed [6:0] m15_7;
   assign m15_7 ={ {2{in15[5]}} , in15[5:1] };

   // m15_8 = W*in
   wire signed [6:0] m15_8;
   wire signed [7:0] tm15_8;
   assign tm15_8[0:0] = in15[0:0];
   assign tm15_8[7:1] = { {1{in15[5]}} , in15[5:0] } + { {2{in15[5]}} , in15[5:1] };
   assign m15_8 ={ {1{tm15_8[7]}} , tm15_8[7:2] };

   // m15_9 = W*in
   wire signed [6:0] m15_9;
   assign m15_9 =7'b0;

   // m15_10 = W*in
   wire signed [6:0] m15_10;
   assign m15_10 =7'b0;

   // m15_11 = W*in
   wire signed [6:0] m15_11;
   assign m15_11 ={ {2{in15[5]}} , in15[5:1] };

   // m15_12 = W*in
   wire signed [6:0] m15_12;
   assign m15_12 =7'b0;

   // m15_13 = W*in
   wire signed [6:0] m15_13;
   assign m15_13 =7'b0;

   // m15_14 = W*in
   wire signed [6:0] m15_14;
   assign m15_14 =7'b0;

   // m15_15 = W*in
   wire signed [6:0] m15_15;
   assign m15_15 =7'b0;

   // m15_16 = W*in
   wire signed [6:0] m15_16;
   assign m15_16 =7'b0;

   // m15_17 = W*in
   wire signed [6:0] m15_17;
   assign m15_17 =7'b0;

   // m15_18 = W*in
   wire signed [6:0] m15_18;
   assign m15_18 =7'b0;

   // m15_19 = W*in
   wire signed [6:0] m15_19;
   assign m15_19 =7'b0;

   // m15_20 = W*in
   wire signed [6:0] m15_20;
   wire signed [7:0] tm15_20;
   assign tm15_20[0:0] = in15[0:0];
   assign tm15_20[7:1] = { {1{in15[5]}} , in15[5:0] } + { {2{in15[5]}} , in15[5:1] };
   assign m15_20 ={ {2{tm15_20[7]}} , tm15_20[7:3] };

   // m16_1 = W*in
   wire signed [6:0] m16_1;
   assign m16_1 ={ {3{in16[5]}} , in16[5:2] };

   // m16_2 = W*in
   wire signed [6:0] m16_2;
   assign m16_2 =7'b0;

   // m16_3 = W*in
   wire signed [6:0] m16_3;
   assign m16_3 =7'b0;

   // m16_4 = W*in
   wire signed [6:0] m16_4;
   assign m16_4 ={ {4{neg16[5]}} , neg16[5:3] };

   // m16_5 = W*in
   wire signed [6:0] m16_5;
   assign m16_5 ={ {2{in16[5]}} , in16[5:1] };

   // m16_6 = W*in
   wire signed [6:0] m16_6;
   wire signed [7:0] tm16_6;
   assign tm16_6[0:0] = neg16[0:0];
   assign tm16_6[7:1] = { {1{neg16[5]}} , neg16[5:0] } + { {2{neg16[5]}} , neg16[5:1] };
   assign m16_6 ={ {2{tm16_6[7]}} , tm16_6[7:3] };

   // m16_7 = W*in
   wire signed [6:0] m16_7;
   assign m16_7 =7'b0;

   // m16_8 = W*in
   wire signed [6:0] m16_8;
   assign m16_8 =7'b0;

   // m16_9 = W*in
   wire signed [6:0] m16_9;
   assign m16_9 ={ {3{in16[5]}} , in16[5:2] };

   // m16_10 = W*in
   wire signed [6:0] m16_10;
   assign m16_10 =7'b0;

   // m16_11 = W*in
   wire signed [6:0] m16_11;
   assign m16_11 =7'b0;

   // m16_12 = W*in
   wire signed [6:0] m16_12;
   wire signed [7:0] tm16_12;
   assign tm16_12[0:0] = in16[0:0];
   assign tm16_12[7:1] = { {1{in16[5]}} , in16[5:0] } + { {2{in16[5]}} , in16[5:1] };
   assign m16_12 ={ {2{tm16_12[7]}} , tm16_12[7:3] };

   // m16_13 = W*in
   wire signed [6:0] m16_13;
   assign m16_13 =7'b0;

   // m16_14 = W*in
   wire signed [6:0] m16_14;
   assign m16_14 =7'b0;

   // m16_15 = W*in
   wire signed [6:0] m16_15;
   wire signed [7:0] tm16_15;
   assign tm16_15[0:0] = in16[0:0];
   assign tm16_15[7:1] = { {1{in16[5]}} , in16[5:0] } + { {2{in16[5]}} , in16[5:1] };
   assign m16_15 ={ {2{tm16_15[7]}} , tm16_15[7:3] };

   // m16_16 = W*in
   wire signed [6:0] m16_16;
   assign m16_16 ={ {3{in16[5]}} , in16[5:2] };

   // m16_17 = W*in
   wire signed [6:0] m16_17;
   assign m16_17 =7'b0;

   // m16_18 = W*in
   wire signed [6:0] m16_18;
   wire signed [9:0] tm16_18;
   assign tm16_18[2:0] = neg16[2:0];
   assign tm16_18[9:3] = { {1{in16[5]}} , in16[5:0] } + { {4{neg16[5]}} , neg16[5:3] };
   assign m16_18 ={ {1{tm16_18[9]}} , tm16_18[9:4] };

   // m16_19 = W*in
   wire signed [6:0] m16_19;
   assign m16_19 =7'b0;

   // m16_20 = W*in
   wire signed [6:0] m16_20;
   assign m16_20 =7'b0;

   // m17_1 = W*in
   wire signed [6:0] m17_1;
   assign m17_1 ={ {3{neg17[5]}} , neg17[5:2] };

   // m17_2 = W*in
   wire signed [6:0] m17_2;
   assign m17_2 =7'b0;

   // m17_3 = W*in
   wire signed [6:0] m17_3;
   assign m17_3 =7'b0;

   // m17_4 = W*in
   wire signed [6:0] m17_4;
   assign m17_4 ={ {2{in17[5]}} , in17[5:1] };

   // m17_5 = W*in
   wire signed [6:0] m17_5;
   assign m17_5 =7'b0;

   // m17_6 = W*in
   wire signed [6:0] m17_6;
   assign m17_6 =7'b0;

   // m17_7 = W*in
   wire signed [6:0] m17_7;
   assign m17_7 =7'b0;

   // m17_8 = W*in
   wire signed [6:0] m17_8;
   assign m17_8 ={ {2{in17[5]}} , in17[5:1] };

   // m17_9 = W*in
   wire signed [6:0] m17_9;
   assign m17_9 ={ {3{in17[5]}} , in17[5:2] };

   // m17_10 = W*in
   wire signed [6:0] m17_10;
   assign m17_10 =7'b0;

   // m17_11 = W*in
   wire signed [6:0] m17_11;
   assign m17_11 ={ {2{in17[5]}} , in17[5:1] };

   // m17_12 = W*in
   wire signed [6:0] m17_12;
   assign m17_12 =7'b0;

   // m17_13 = W*in
   wire signed [6:0] m17_13;
   assign m17_13 ={ {2{neg17[5]}} , neg17[5:1] };

   // m17_14 = W*in
   wire signed [6:0] m17_14;
   assign m17_14 =7'b0;

   // m17_15 = W*in
   wire signed [6:0] m17_15;
   assign m17_15 =7'b0;

   // m17_16 = W*in
   wire signed [6:0] m17_16;
   assign m17_16 =7'b0;

   // m17_17 = W*in
   wire signed [6:0] m17_17;
   assign m17_17 =7'b0;

   // m17_18 = W*in
   wire signed [6:0] m17_18;
   assign m17_18 =7'b0;

   // m17_19 = W*in
   wire signed [6:0] m17_19;
   assign m17_19 ={ {3{neg17[5]}} , neg17[5:2] };

   // m17_20 = W*in
   wire signed [6:0] m17_20;
   assign m17_20 ={ {3{in17[5]}} , in17[5:2] };

   // m18_1 = W*in
   wire signed [6:0] m18_1;
   assign m18_1 =7'b0;

   // m18_2 = W*in
   wire signed [6:0] m18_2;
   wire signed [9:0] tm18_2;
   assign tm18_2[2:0] = in18[2:0];
   assign tm18_2[9:3] = { {1{in18[5]}} , in18[5:0] } + { {4{in18[5]}} , in18[5:3] };
   assign m18_2 =tm18_2[9:3];

   // m18_3 = W*in
   wire signed [6:0] m18_3;
   assign m18_3 =7'b0;

   // m18_4 = W*in
   wire signed [6:0] m18_4;
   assign m18_4 ={ {3{in18[5]}} , in18[5:2] };

   // m18_5 = W*in
   wire signed [6:0] m18_5;
   assign m18_5 =7'b0;

   // m18_6 = W*in
   wire signed [6:0] m18_6;
   assign m18_6 =7'b0;

   // m18_7 = W*in
   wire signed [6:0] m18_7;
   assign m18_7 =7'b0;

   // m18_8 = W*in
   wire signed [6:0] m18_8;
   assign m18_8 =7'b0;

   // m18_9 = W*in
   wire signed [6:0] m18_9;
   assign m18_9 =7'b0;

   // m18_10 = W*in
   wire signed [6:0] m18_10;
   assign m18_10 =7'b0;

   // m18_11 = W*in
   wire signed [6:0] m18_11;
   assign m18_11 =7'b0;

   // m18_12 = W*in
   wire signed [6:0] m18_12;
   assign m18_12 ={ {3{neg18[5]}} , neg18[5:2] };

   // m18_13 = W*in
   wire signed [6:0] m18_13;
   assign m18_13 =7'b0;

   // m18_14 = W*in
   wire signed [6:0] m18_14;
   assign m18_14 =7'b0;

   // m18_15 = W*in
   wire signed [6:0] m18_15;
   assign m18_15 ={ {3{in18[5]}} , in18[5:2] };

   // m18_16 = W*in
   wire signed [6:0] m18_16;
   assign m18_16 =7'b0;

   // m18_17 = W*in
   wire signed [6:0] m18_17;
   assign m18_17 ={ {3{in18[5]}} , in18[5:2] };

   // m18_18 = W*in
   wire signed [6:0] m18_18;
   wire signed [9:0] tm18_18;
   assign tm18_18[2:0] = in18[2:0];
   assign tm18_18[9:3] = { {1{neg18[5]}} , neg18[5:0] } + { {4{in18[5]}} , in18[5:3] };
   assign m18_18 ={ {1{tm18_18[9]}} , tm18_18[9:4] };

   // m18_19 = W*in
   wire signed [6:0] m18_19;
   wire signed [7:0] tm18_19;
   assign tm18_19[0:0] = in18[0:0];
   assign tm18_19[7:1] = { {1{in18[5]}} , in18[5:0] } + { {2{in18[5]}} , in18[5:1] };
   assign m18_19 ={ {2{tm18_19[7]}} , tm18_19[7:3] };

   // m18_20 = W*in
   wire signed [6:0] m18_20;
   assign m18_20 =7'b0;

   // m19_1 = W*in
   wire signed [6:0] m19_1;
   assign m19_1 =7'b0;

   // m19_2 = W*in
   wire signed [6:0] m19_2;
   wire signed [9:0] tm19_2;
   assign tm19_2[2:0] = neg19[2:0];
   assign tm19_2[9:3] = { {1{in19[5]}} , in19[5:0] } + { {4{neg19[5]}} , neg19[5:3] };
   assign m19_2 ={ {1{tm19_2[9]}} , tm19_2[9:4] };

   // m19_3 = W*in
   wire signed [6:0] m19_3;
   assign m19_3 =7'b0;

   // m19_4 = W*in
   wire signed [6:0] m19_4;
   assign m19_4 =7'b0;

   // m19_5 = W*in
   wire signed [6:0] m19_5;
   assign m19_5 =7'b0;

   // m19_6 = W*in
   wire signed [6:0] m19_6;
   assign m19_6 =7'b0;

   // m19_7 = W*in
   wire signed [6:0] m19_7;
   wire signed [7:0] tm19_7;
   assign tm19_7[0:0] = in19[0:0];
   assign tm19_7[7:1] = { {1{in19[5]}} , in19[5:0] } + { {2{in19[5]}} , in19[5:1] };
   assign m19_7 ={ {1{tm19_7[7]}} , tm19_7[7:2] };

   // m19_8 = W*in
   wire signed [6:0] m19_8;
   assign m19_8 =7'b0;

   // m19_9 = W*in
   wire signed [6:0] m19_9;
   assign m19_9 ={ {2{neg19[5]}} , neg19[5:1] };

   // m19_10 = W*in
   wire signed [6:0] m19_10;
   assign m19_10 ={ {2{in19[5]}} , in19[5:1] };

   // m19_11 = W*in
   wire signed [6:0] m19_11;
   assign m19_11 =7'b0;

   // m19_12 = W*in
   wire signed [6:0] m19_12;
   assign m19_12 =7'b0;

   // m19_13 = W*in
   wire signed [6:0] m19_13;
   assign m19_13 ={ {3{in19[5]}} , in19[5:2] };

   // m19_14 = W*in
   wire signed [6:0] m19_14;
   assign m19_14 =7'b0;

   // m19_15 = W*in
   wire signed [6:0] m19_15;
   assign m19_15 =7'b0;

   // m19_16 = W*in
   wire signed [6:0] m19_16;
   assign m19_16 =7'b0;

   // m19_17 = W*in
   wire signed [6:0] m19_17;
   assign m19_17 =7'b0;

   // m19_18 = W*in
   wire signed [6:0] m19_18;
   wire signed [7:0] tm19_18;
   assign tm19_18[0:0] = neg19[0:0];
   assign tm19_18[7:1] = { {1{neg19[5]}} , neg19[5:0] } + { {2{neg19[5]}} , neg19[5:1] };
   assign m19_18 ={ {2{tm19_18[7]}} , tm19_18[7:3] };

   // m19_19 = W*in
   wire signed [6:0] m19_19;
   assign m19_19 =7'b0;

   // m19_20 = W*in
   wire signed [6:0] m19_20;
   assign m19_20 =7'b0;

   // m20_1 = W*in
   wire signed [6:0] m20_1;
   assign m20_1 =7'b0;

   // m20_2 = W*in
   wire signed [6:0] m20_2;
   wire signed [8:0] tm20_2;
   assign tm20_2[1:0] = in20[1:0];
   assign tm20_2[8:2] = { {1{in20[5]}} , in20[5:0] } + { {3{in20[5]}} , in20[5:2] };
   assign m20_2 ={ {1{tm20_2[8]}} , tm20_2[8:3] };

   // m20_3 = W*in
   wire signed [6:0] m20_3;
   assign m20_3 =7'b0;

   // m20_4 = W*in
   wire signed [6:0] m20_4;
   assign m20_4 ={ {3{in20[5]}} , in20[5:2] };

   // m20_5 = W*in
   wire signed [6:0] m20_5;
   assign m20_5 =7'b0;

   // m20_6 = W*in
   wire signed [6:0] m20_6;
   assign m20_6 =7'b0;

   // m20_7 = W*in
   wire signed [6:0] m20_7;
   assign m20_7 =7'b0;

   // m20_8 = W*in
   wire signed [6:0] m20_8;
   assign m20_8 ={ {3{neg20[5]}} , neg20[5:2] };

   // m20_9 = W*in
   wire signed [6:0] m20_9;
   assign m20_9 =7'b0;

   // m20_10 = W*in
   wire signed [6:0] m20_10;
   assign m20_10 ={ {3{in20[5]}} , in20[5:2] };

   // m20_11 = W*in
   wire signed [6:0] m20_11;
   assign m20_11 ={ {3{neg20[5]}} , neg20[5:2] };

   // m20_12 = W*in
   wire signed [6:0] m20_12;
   assign m20_12 =7'b0;

   // m20_13 = W*in
   wire signed [6:0] m20_13;
   assign m20_13 ={ {3{in20[5]}} , in20[5:2] };

   // m20_14 = W*in
   wire signed [6:0] m20_14;
   assign m20_14 =7'b0;

   // m20_15 = W*in
   wire signed [6:0] m20_15;
   assign m20_15 =7'b0;

   // m20_16 = W*in
   wire signed [6:0] m20_16;
   assign m20_16 =7'b0;

   // m20_17 = W*in
   wire signed [6:0] m20_17;
   assign m20_17 =7'b0;

   // m20_18 = W*in
   wire signed [6:0] m20_18;
   assign m20_18 =7'b0;

   // m20_19 = W*in
   wire signed [6:0] m20_19;
   assign m20_19 ={ {3{in20[5]}} , in20[5:2] };

   // m20_20 = W*in
   wire signed [6:0] m20_20;
   assign m20_20 =7'b0;

   // m21_1 = W*in
   wire signed [6:0] m21_1;
   assign m21_1 =7'b0;

   // m21_2 = W*in
   wire signed [6:0] m21_2;
   assign m21_2 =7'b0;

   // m21_3 = W*in
   wire signed [6:0] m21_3;
   assign m21_3 =7'b0;

   // m21_4 = W*in
   wire signed [6:0] m21_4;
   wire signed [7:0] tm21_4;
   assign tm21_4[0:0] = in21[0:0];
   assign tm21_4[7:1] = { {1{in21[5]}} , in21[5:0] } + { {2{in21[5]}} , in21[5:1] };
   assign m21_4 ={ {1{tm21_4[7]}} , tm21_4[7:2] };

   // m21_5 = W*in
   wire signed [6:0] m21_5;
   assign m21_5 =7'b0;

   // m21_6 = W*in
   wire signed [6:0] m21_6;
   assign m21_6 =7'b0;

   // m21_7 = W*in
   wire signed [6:0] m21_7;
   assign m21_7 =7'b0;

   // m21_8 = W*in
   wire signed [6:0] m21_8;
   wire signed [8:0] tm21_8;
   assign tm21_8[1:0] = in21[1:0];
   assign tm21_8[8:2] = { {1{in21[5]}} , in21[5:0] } + { {3{in21[5]}} , in21[5:2] };
   assign m21_8 ={ {1{tm21_8[8]}} , tm21_8[8:3] };

   // m21_9 = W*in
   wire signed [6:0] m21_9;
   assign m21_9 ={ {2{in21[5]}} , in21[5:1] };

   // m21_10 = W*in
   wire signed [6:0] m21_10;
   assign m21_10 =7'b0;

   // m21_11 = W*in
   wire signed [6:0] m21_11;
   assign m21_11 ={ {2{in21[5]}} , in21[5:1] };

   // m21_12 = W*in
   wire signed [6:0] m21_12;
   assign m21_12 =7'b0;

   // m21_13 = W*in
   wire signed [6:0] m21_13;
   assign m21_13 ={ {2{in21[5]}} , in21[5:1] };

   // m21_14 = W*in
   wire signed [6:0] m21_14;
   assign m21_14 =7'b0;

   // m21_15 = W*in
   wire signed [6:0] m21_15;
   assign m21_15 =7'b0;

   // m21_16 = W*in
   wire signed [6:0] m21_16;
   wire signed [7:0] tm21_16;
   assign tm21_16[0:0] = neg21[0:0];
   assign tm21_16[7:1] = { {1{neg21[5]}} , neg21[5:0] } + { {2{neg21[5]}} , neg21[5:1] };
   assign m21_16 ={ {2{tm21_16[7]}} , tm21_16[7:3] };

   // m21_17 = W*in
   wire signed [6:0] m21_17;
   assign m21_17 =7'b0;

   // m21_18 = W*in
   wire signed [6:0] m21_18;
   wire signed [8:0] tm21_18;
   assign tm21_18[1:0] = in21[1:0];
   assign tm21_18[8:2] = { {1{in21[5]}} , in21[5:0] } + { {3{in21[5]}} , in21[5:2] };
   assign m21_18 ={ {2{tm21_18[8]}} , tm21_18[8:4] };

   // m21_19 = W*in
   wire signed [6:0] m21_19;
   assign m21_19 =7'b0;

   // m21_20 = W*in
   wire signed [6:0] m21_20;
   assign m21_20 ={ {2{in21[5]}} , in21[5:1] };

   // m22_1 = W*in
   wire signed [6:0] m22_1;
   assign m22_1 =7'b0;

   // m22_2 = W*in
   wire signed [6:0] m22_2;
   assign m22_2 =7'b0;

   // m22_3 = W*in
   wire signed [6:0] m22_3;
   assign m22_3 =7'b0;

   // m22_4 = W*in
   wire signed [6:0] m22_4;
   assign m22_4 =7'b0;

   // m22_5 = W*in
   wire signed [6:0] m22_5;
   assign m22_5 =7'b0;

   // m22_6 = W*in
   wire signed [6:0] m22_6;
   assign m22_6 =7'b0;

   // m22_7 = W*in
   wire signed [6:0] m22_7;
   wire signed [9:0] tm22_7;
   assign tm22_7[2:0] = neg22[2:0];
   assign tm22_7[9:3] = { {1{in22[5]}} , in22[5:0] } + { {4{neg22[5]}} , neg22[5:3] };
   assign m22_7 =tm22_7[9:3];

   // m22_8 = W*in
   wire signed [6:0] m22_8;
   assign m22_8 =7'b0;

   // m22_9 = W*in
   wire signed [6:0] m22_9;
   assign m22_9 =7'b0;

   // m22_10 = W*in
   wire signed [6:0] m22_10;
   assign m22_10 =7'b0;

   // m22_11 = W*in
   wire signed [6:0] m22_11;
   assign m22_11 =7'b0;

   // m22_12 = W*in
   wire signed [6:0] m22_12;
   assign m22_12 ={ {2{neg22[5]}} , neg22[5:1] };

   // m22_13 = W*in
   wire signed [6:0] m22_13;
   assign m22_13 =7'b0;

   // m22_14 = W*in
   wire signed [6:0] m22_14;
   assign m22_14 =7'b0;

   // m22_15 = W*in
   wire signed [6:0] m22_15;
   assign m22_15 ={ {2{in22[5]}} , in22[5:1] };

   // m22_16 = W*in
   wire signed [6:0] m22_16;
   assign m22_16 ={ {3{neg22[5]}} , neg22[5:2] };

   // m22_17 = W*in
   wire signed [6:0] m22_17;
   assign m22_17 =7'b0;

   // m22_18 = W*in
   wire signed [6:0] m22_18;
   wire signed [9:0] tm22_18;
   assign tm22_18[2:0] = in22[2:0];
   assign tm22_18[9:3] = { {1{in22[5]}} , in22[5:0] } + { {4{in22[5]}} , in22[5:3] };
   assign m22_18 ={ {1{tm22_18[9]}} , tm22_18[9:4] };

   // m22_19 = W*in
   wire signed [6:0] m22_19;
   assign m22_19 =7'b0;

   // m22_20 = W*in
   wire signed [6:0] m22_20;
   assign m22_20 =7'b0;

   // m23_1 = W*in
   wire signed [6:0] m23_1;
   assign m23_1 =7'b0;

   // m23_2 = W*in
   wire signed [6:0] m23_2;
   assign m23_2 =7'b0;

   // m23_3 = W*in
   wire signed [6:0] m23_3;
   assign m23_3 =7'b0;

   // m23_4 = W*in
   wire signed [6:0] m23_4;
   assign m23_4 ={ {3{in23[5]}} , in23[5:2] };

   // m23_5 = W*in
   wire signed [6:0] m23_5;
   assign m23_5 ={ {3{neg23[5]}} , neg23[5:2] };

   // m23_6 = W*in
   wire signed [6:0] m23_6;
   assign m23_6 =7'b0;

   // m23_7 = W*in
   wire signed [6:0] m23_7;
   assign m23_7 =7'b0;

   // m23_8 = W*in
   wire signed [6:0] m23_8;
   assign m23_8 =7'b0;

   // m23_9 = W*in
   wire signed [6:0] m23_9;
   assign m23_9 ={ {3{neg23[5]}} , neg23[5:2] };

   // m23_10 = W*in
   wire signed [6:0] m23_10;
   assign m23_10 ={ {3{in23[5]}} , in23[5:2] };

   // m23_11 = W*in
   wire signed [6:0] m23_11;
   assign m23_11 =7'b0;

   // m23_12 = W*in
   wire signed [6:0] m23_12;
   assign m23_12 =7'b0;

   // m23_13 = W*in
   wire signed [6:0] m23_13;
   assign m23_13 ={ {3{in23[5]}} , in23[5:2] };

   // m23_14 = W*in
   wire signed [6:0] m23_14;
   assign m23_14 =7'b0;

   // m23_15 = W*in
   wire signed [6:0] m23_15;
   assign m23_15 =7'b0;

   // m23_16 = W*in
   wire signed [6:0] m23_16;
   wire signed [7:0] tm23_16;
   assign tm23_16[0:0] = neg23[0:0];
   assign tm23_16[7:1] = { {1{neg23[5]}} , neg23[5:0] } + { {2{neg23[5]}} , neg23[5:1] };
   assign m23_16 ={ {2{tm23_16[7]}} , tm23_16[7:3] };

   // m23_17 = W*in
   wire signed [6:0] m23_17;
   assign m23_17 =7'b0;

   // m23_18 = W*in
   wire signed [6:0] m23_18;
   assign m23_18 =7'b0;

   // m23_19 = W*in
   wire signed [6:0] m23_19;
   assign m23_19 =7'b0;

   // m23_20 = W*in
   wire signed [6:0] m23_20;
   assign m23_20 ={ {2{neg23[5]}} , neg23[5:1] };

   // m24_1 = W*in
   wire signed [6:0] m24_1;
   assign m24_1 =7'b0;

   // m24_2 = W*in
   wire signed [6:0] m24_2;
   wire signed [9:0] tm24_2;
   assign tm24_2[2:0] = in24[2:0];
   assign tm24_2[9:3] = { {1{neg24[5]}} , neg24[5:0] } + { {4{in24[5]}} , in24[5:3] };
   assign m24_2 ={ {1{tm24_2[9]}} , tm24_2[9:4] };

   // m24_3 = W*in
   wire signed [6:0] m24_3;
   assign m24_3 ={ {2{neg24[5]}} , neg24[5:1] };

   // m24_4 = W*in
   wire signed [6:0] m24_4;
   assign m24_4 =7'b0;

   // m24_5 = W*in
   wire signed [6:0] m24_5;
   assign m24_5 ={ {2{neg24[5]}} , neg24[5:1] };

   // m24_6 = W*in
   wire signed [6:0] m24_6;
   assign m24_6 =7'b0;

   // m24_7 = W*in
   wire signed [6:0] m24_7;
   assign m24_7 =7'b0;

   // m24_8 = W*in
   wire signed [6:0] m24_8;
   wire signed [7:0] tm24_8;
   assign tm24_8[0:0] = in24[0:0];
   assign tm24_8[7:1] = { {1{in24[5]}} , in24[5:0] } + { {2{in24[5]}} , in24[5:1] };
   assign m24_8 ={ {2{tm24_8[7]}} , tm24_8[7:3] };

   // m24_9 = W*in
   wire signed [6:0] m24_9;
   assign m24_9 ={ {2{in24[5]}} , in24[5:1] };

   // m24_10 = W*in
   wire signed [6:0] m24_10;
   assign m24_10 =7'b0;

   // m24_11 = W*in
   wire signed [6:0] m24_11;
   assign m24_11 =7'b0;

   // m24_12 = W*in
   wire signed [6:0] m24_12;
   assign m24_12 =7'b0;

   // m24_13 = W*in
   wire signed [6:0] m24_13;
   assign m24_13 =7'b0;

   // m24_14 = W*in
   wire signed [6:0] m24_14;
   assign m24_14 =7'b0;

   // m24_15 = W*in
   wire signed [6:0] m24_15;
   assign m24_15 =7'b0;

   // m24_16 = W*in
   wire signed [6:0] m24_16;
   assign m24_16 =7'b0;

   // m24_17 = W*in
   wire signed [6:0] m24_17;
   assign m24_17 =7'b0;

   // m24_18 = W*in
   wire signed [6:0] m24_18;
   assign m24_18 ={ {2{in24[5]}} , in24[5:1] };

   // m24_19 = W*in
   wire signed [6:0] m24_19;
   assign m24_19 =7'b0;

   // m24_20 = W*in
   wire signed [6:0] m24_20;
   assign m24_20 =7'b0;

   // m25_1 = W*in
   wire signed [6:0] m25_1;
   assign m25_1 =7'b0;

   // m25_2 = W*in
   wire signed [6:0] m25_2;
   assign m25_2 ={ {3{in25[5]}} , in25[5:2] };

   // m25_3 = W*in
   wire signed [6:0] m25_3;
   assign m25_3 =7'b0;

   // m25_4 = W*in
   wire signed [6:0] m25_4;
   assign m25_4 =7'b0;

   // m25_5 = W*in
   wire signed [6:0] m25_5;
   assign m25_5 =7'b0;

   // m25_6 = W*in
   wire signed [6:0] m25_6;
   assign m25_6 ={ {2{neg25[5]}} , neg25[5:1] };

   // m25_7 = W*in
   wire signed [6:0] m25_7;
   assign m25_7 =7'b0;

   // m25_8 = W*in
   wire signed [6:0] m25_8;
   assign m25_8 =7'b0;

   // m25_9 = W*in
   wire signed [6:0] m25_9;
   assign m25_9 ={ {3{in25[5]}} , in25[5:2] };

   // m25_10 = W*in
   wire signed [6:0] m25_10;
   assign m25_10 =7'b0;

   // m25_11 = W*in
   wire signed [6:0] m25_11;
   assign m25_11 ={ {2{in25[5]}} , in25[5:1] };

   // m25_12 = W*in
   wire signed [6:0] m25_12;
   assign m25_12 =7'b0;

   // m25_13 = W*in
   wire signed [6:0] m25_13;
   wire signed [7:0] tm25_13;
   assign tm25_13[0:0] = in25[0:0];
   assign tm25_13[7:1] = { {1{in25[5]}} , in25[5:0] } + { {2{in25[5]}} , in25[5:1] };
   assign m25_13 ={ {2{tm25_13[7]}} , tm25_13[7:3] };

   // m25_14 = W*in
   wire signed [6:0] m25_14;
   assign m25_14 ={ {3{neg25[5]}} , neg25[5:2] };

   // m25_15 = W*in
   wire signed [6:0] m25_15;
   assign m25_15 =7'b0;

   // m25_16 = W*in
   wire signed [6:0] m25_16;
   assign m25_16 =7'b0;

   // m25_17 = W*in
   wire signed [6:0] m25_17;
   assign m25_17 =7'b0;

   // m25_18 = W*in
   wire signed [6:0] m25_18;
   assign m25_18 =7'b0;

   // m25_19 = W*in
   wire signed [6:0] m25_19;
   assign m25_19 ={ {2{in25[5]}} , in25[5:1] };

   // m25_20 = W*in
   wire signed [6:0] m25_20;
   wire signed [9:0] tm25_20;
   assign tm25_20[2:0] = in25[2:0];
   assign tm25_20[9:3] = { {1{in25[5]}} , in25[5:0] } + { {4{in25[5]}} , in25[5:3] };
   assign m25_20 ={ {1{tm25_20[9]}} , tm25_20[9:4] };

   // m26_1 = W*in
   wire signed [6:0] m26_1;
   assign m26_1 =7'b0;

   // m26_2 = W*in
   wire signed [6:0] m26_2;
   assign m26_2 =7'b0;

   // m26_3 = W*in
   wire signed [6:0] m26_3;
   assign m26_3 =7'b0;

   // m26_4 = W*in
   wire signed [6:0] m26_4;
   assign m26_4 =7'b0;

   // m26_5 = W*in
   wire signed [6:0] m26_5;
   wire signed [8:0] tm26_5;
   assign tm26_5[1:0] = in26[1:0];
   assign tm26_5[8:2] = { {1{in26[5]}} , in26[5:0] } + { {3{in26[5]}} , in26[5:2] };
   assign m26_5 ={ {1{tm26_5[8]}} , tm26_5[8:3] };

   // m26_6 = W*in
   wire signed [6:0] m26_6;
   assign m26_6 =7'b0;

   // m26_7 = W*in
   wire signed [6:0] m26_7;
   assign m26_7 ={ {3{in26[5]}} , in26[5:2] };

   // m26_8 = W*in
   wire signed [6:0] m26_8;
   assign m26_8 ={ {3{in26[5]}} , in26[5:2] };

   // m26_9 = W*in
   wire signed [6:0] m26_9;
   assign m26_9 =7'b0;

   // m26_10 = W*in
   wire signed [6:0] m26_10;
   wire signed [7:0] tm26_10;
   assign tm26_10[0:0] = in26[0:0];
   assign tm26_10[7:1] = { {1{in26[5]}} , in26[5:0] } + { {2{in26[5]}} , in26[5:1] };
   assign m26_10 ={ {1{tm26_10[7]}} , tm26_10[7:2] };

   // m26_11 = W*in
   wire signed [6:0] m26_11;
   assign m26_11 =7'b0;

   // m26_12 = W*in
   wire signed [6:0] m26_12;
   assign m26_12 =7'b0;

   // m26_13 = W*in
   wire signed [6:0] m26_13;
   assign m26_13 =7'b0;

   // m26_14 = W*in
   wire signed [6:0] m26_14;
   assign m26_14 ={ {1{in26[5]}} , in26[5:0] };

   // m26_15 = W*in
   wire signed [6:0] m26_15;
   assign m26_15 =7'b0;

   // m26_16 = W*in
   wire signed [6:0] m26_16;
   assign m26_16 ={ {3{in26[5]}} , in26[5:2] };

   // m26_17 = W*in
   wire signed [6:0] m26_17;
   assign m26_17 =7'b0;

   // m26_18 = W*in
   wire signed [6:0] m26_18;
   assign m26_18 ={ {2{in26[5]}} , in26[5:1] };

   // m26_19 = W*in
   wire signed [6:0] m26_19;
   assign m26_19 =7'b0;

   // m26_20 = W*in
   wire signed [6:0] m26_20;
   assign m26_20 =7'b0;

   // m27_1 = W*in
   wire signed [6:0] m27_1;
   assign m27_1 =7'b0;

   // m27_2 = W*in
   wire signed [6:0] m27_2;
   wire signed [9:0] tm27_2;
   assign tm27_2[2:0] = neg27[2:0];
   assign tm27_2[9:3] = { {1{in27[5]}} , in27[5:0] } + { {4{neg27[5]}} , neg27[5:3] };
   assign m27_2 ={ {1{tm27_2[9]}} , tm27_2[9:4] };

   // m27_3 = W*in
   wire signed [6:0] m27_3;
   assign m27_3 =7'b0;

   // m27_4 = W*in
   wire signed [6:0] m27_4;
   assign m27_4 =7'b0;

   // m27_5 = W*in
   wire signed [6:0] m27_5;
   assign m27_5 =7'b0;

   // m27_6 = W*in
   wire signed [6:0] m27_6;
   assign m27_6 =7'b0;

   // m27_7 = W*in
   wire signed [6:0] m27_7;
   assign m27_7 ={ {2{in27[5]}} , in27[5:1] };

   // m27_8 = W*in
   wire signed [6:0] m27_8;
   assign m27_8 ={ {3{in27[5]}} , in27[5:2] };

   // m27_9 = W*in
   wire signed [6:0] m27_9;
   assign m27_9 =7'b0;

   // m27_10 = W*in
   wire signed [6:0] m27_10;
   wire signed [7:0] tm27_10;
   assign tm27_10[0:0] = neg27[0:0];
   assign tm27_10[7:1] = { {1{neg27[5]}} , neg27[5:0] } + { {2{neg27[5]}} , neg27[5:1] };
   assign m27_10 ={ {2{tm27_10[7]}} , tm27_10[7:3] };

   // m27_11 = W*in
   wire signed [6:0] m27_11;
   wire signed [7:0] tm27_11;
   assign tm27_11[0:0] = in27[0:0];
   assign tm27_11[7:1] = { {1{in27[5]}} , in27[5:0] } + { {2{in27[5]}} , in27[5:1] };
   assign m27_11 ={ {2{tm27_11[7]}} , tm27_11[7:3] };

   // m27_12 = W*in
   wire signed [6:0] m27_12;
   assign m27_12 ={ {2{neg27[5]}} , neg27[5:1] };

   // m27_13 = W*in
   wire signed [6:0] m27_13;
   assign m27_13 ={ {2{in27[5]}} , in27[5:1] };

   // m27_14 = W*in
   wire signed [6:0] m27_14;
   assign m27_14 =7'b0;

   // m27_15 = W*in
   wire signed [6:0] m27_15;
   assign m27_15 ={ {3{in27[5]}} , in27[5:2] };

   // m27_16 = W*in
   wire signed [6:0] m27_16;
   assign m27_16 =7'b0;

   // m27_17 = W*in
   wire signed [6:0] m27_17;
   assign m27_17 =7'b0;

   // m27_18 = W*in
   wire signed [6:0] m27_18;
   assign m27_18 =7'b0;

   // m27_19 = W*in
   wire signed [6:0] m27_19;
   wire signed [9:0] tm27_19;
   assign tm27_19[2:0] = neg27[2:0];
   assign tm27_19[9:3] = { {1{in27[5]}} , in27[5:0] } + { {4{neg27[5]}} , neg27[5:3] };
   assign m27_19 ={ {1{tm27_19[9]}} , tm27_19[9:4] };

   // m27_20 = W*in
   wire signed [6:0] m27_20;
   assign m27_20 =7'b0;

   // m28_1 = W*in
   wire signed [6:0] m28_1;
   assign m28_1 =7'b0;

   // m28_2 = W*in
   wire signed [6:0] m28_2;
   assign m28_2 =7'b0;

   // m28_3 = W*in
   wire signed [6:0] m28_3;
   assign m28_3 =7'b0;

   // m28_4 = W*in
   wire signed [6:0] m28_4;
   assign m28_4 ={ {2{neg28[5]}} , neg28[5:1] };

   // m28_5 = W*in
   wire signed [6:0] m28_5;
   assign m28_5 ={ {3{in28[5]}} , in28[5:2] };

   // m28_6 = W*in
   wire signed [6:0] m28_6;
   assign m28_6 =7'b0;

   // m28_7 = W*in
   wire signed [6:0] m28_7;
   assign m28_7 =7'b0;

   // m28_8 = W*in
   wire signed [6:0] m28_8;
   assign m28_8 =7'b0;

   // m28_9 = W*in
   wire signed [6:0] m28_9;
   assign m28_9 ={ {2{in28[5]}} , in28[5:1] };

   // m28_10 = W*in
   wire signed [6:0] m28_10;
   wire signed [7:0] tm28_10;
   assign tm28_10[0:0] = neg28[0:0];
   assign tm28_10[7:1] = { {1{neg28[5]}} , neg28[5:0] } + { {2{neg28[5]}} , neg28[5:1] };
   assign m28_10 ={ {2{tm28_10[7]}} , tm28_10[7:3] };

   // m28_11 = W*in
   wire signed [6:0] m28_11;
   assign m28_11 =7'b0;

   // m28_12 = W*in
   wire signed [6:0] m28_12;
   assign m28_12 =7'b0;

   // m28_13 = W*in
   wire signed [6:0] m28_13;
   assign m28_13 ={ {3{in28[5]}} , in28[5:2] };

   // m28_14 = W*in
   wire signed [6:0] m28_14;
   assign m28_14 =7'b0;

   // m28_15 = W*in
   wire signed [6:0] m28_15;
   assign m28_15 =7'b0;

   // m28_16 = W*in
   wire signed [6:0] m28_16;
   assign m28_16 =7'b0;

   // m28_17 = W*in
   wire signed [6:0] m28_17;
   assign m28_17 =7'b0;

   // m28_18 = W*in
   wire signed [6:0] m28_18;
   assign m28_18 =7'b0;

   // m28_19 = W*in
   wire signed [6:0] m28_19;
   assign m28_19 =7'b0;

   // m28_20 = W*in
   wire signed [6:0] m28_20;
   assign m28_20 =7'b0;

   // m29_1 = W*in
   wire signed [6:0] m29_1;
   assign m29_1 =7'b0;

   // m29_2 = W*in
   wire signed [6:0] m29_2;
   assign m29_2 ={ {2{in29[5]}} , in29[5:1] };

   // m29_3 = W*in
   wire signed [6:0] m29_3;
   wire signed [8:0] tm29_3;
   assign tm29_3[1:0] = in29[1:0];
   assign tm29_3[8:2] = { {1{in29[5]}} , in29[5:0] } + { {3{in29[5]}} , in29[5:2] };
   assign m29_3 ={ {1{tm29_3[8]}} , tm29_3[8:3] };

   // m29_4 = W*in
   wire signed [6:0] m29_4;
   assign m29_4 =7'b0;

   // m29_5 = W*in
   wire signed [6:0] m29_5;
   assign m29_5 =7'b0;

   // m29_6 = W*in
   wire signed [6:0] m29_6;
   assign m29_6 =7'b0;

   // m29_7 = W*in
   wire signed [6:0] m29_7;
   assign m29_7 ={ {3{neg29[5]}} , neg29[5:2] };

   // m29_8 = W*in
   wire signed [6:0] m29_8;
   assign m29_8 =7'b0;

   // m29_9 = W*in
   wire signed [6:0] m29_9;
   assign m29_9 =7'b0;

   // m29_10 = W*in
   wire signed [6:0] m29_10;
   assign m29_10 ={ {3{neg29[5]}} , neg29[5:2] };

   // m29_11 = W*in
   wire signed [6:0] m29_11;
   assign m29_11 =7'b0;

   // m29_12 = W*in
   wire signed [6:0] m29_12;
   assign m29_12 =7'b0;

   // m29_13 = W*in
   wire signed [6:0] m29_13;
   assign m29_13 =7'b0;

   // m29_14 = W*in
   wire signed [6:0] m29_14;
   assign m29_14 =7'b0;

   // m29_15 = W*in
   wire signed [6:0] m29_15;
   assign m29_15 =7'b0;

   // m29_16 = W*in
   wire signed [6:0] m29_16;
   assign m29_16 ={ {2{in29[5]}} , in29[5:1] };

   // m29_17 = W*in
   wire signed [6:0] m29_17;
   assign m29_17 ={ {3{in29[5]}} , in29[5:2] };

   // m29_18 = W*in
   wire signed [6:0] m29_18;
   assign m29_18 =7'b0;

   // m29_19 = W*in
   wire signed [6:0] m29_19;
   assign m29_19 =7'b0;

   // m29_20 = W*in
   wire signed [6:0] m29_20;
   assign m29_20 =7'b0;

   // m30_1 = W*in
   wire signed [6:0] m30_1;
   assign m30_1 =7'b0;

   // m30_2 = W*in
   wire signed [6:0] m30_2;
   assign m30_2 =7'b0;

   // m30_3 = W*in
   wire signed [6:0] m30_3;
   assign m30_3 =7'b0;

   // m30_4 = W*in
   wire signed [6:0] m30_4;
   assign m30_4 =7'b0;

   // m30_5 = W*in
   wire signed [6:0] m30_5;
   assign m30_5 =7'b0;

   // m30_6 = W*in
   wire signed [6:0] m30_6;
   assign m30_6 ={ {3{in30[5]}} , in30[5:2] };

   // m30_7 = W*in
   wire signed [6:0] m30_7;
   assign m30_7 =7'b0;

   // m30_8 = W*in
   wire signed [6:0] m30_8;
   assign m30_8 =7'b0;

   // m30_9 = W*in
   wire signed [6:0] m30_9;
   wire signed [8:0] tm30_9;
   assign tm30_9[1:0] = in30[1:0];
   assign tm30_9[8:2] = { {1{in30[5]}} , in30[5:0] } + { {3{in30[5]}} , in30[5:2] };
   assign m30_9 ={ {1{tm30_9[8]}} , tm30_9[8:3] };

   // m30_10 = W*in
   wire signed [6:0] m30_10;
   wire signed [8:0] tm30_10;
   assign tm30_10[1:0] = neg30[1:0];
   assign tm30_10[8:2] = { {1{neg30[5]}} , neg30[5:0] } + { {3{neg30[5]}} , neg30[5:2] };
   assign m30_10 ={ {1{tm30_10[8]}} , tm30_10[8:3] };

   // m30_11 = W*in
   wire signed [6:0] m30_11;
   assign m30_11 =7'b0;

   // m30_12 = W*in
   wire signed [6:0] m30_12;
   assign m30_12 =7'b0;

   // m30_13 = W*in
   wire signed [6:0] m30_13;
   assign m30_13 =7'b0;

   // m30_14 = W*in
   wire signed [6:0] m30_14;
   assign m30_14 =7'b0;

   // m30_15 = W*in
   wire signed [6:0] m30_15;
   assign m30_15 =7'b0;

   // m30_16 = W*in
   wire signed [6:0] m30_16;
   assign m30_16 =7'b0;

   // m30_17 = W*in
   wire signed [6:0] m30_17;
   assign m30_17 ={ {2{in30[5]}} , in30[5:1] };

   // m30_18 = W*in
   wire signed [6:0] m30_18;
   assign m30_18 =7'b0;

   // m30_19 = W*in
   wire signed [6:0] m30_19;
   assign m30_19 =7'b0;

   // m30_20 = W*in
   wire signed [6:0] m30_20;
   assign m30_20 ={ {3{neg30[5]}} , neg30[5:2] };

   // m31_1 = W*in
   wire signed [6:0] m31_1;
   wire signed [7:0] tm31_1;
   assign tm31_1[0:0] = in31[0:0];
   assign tm31_1[7:1] = { {1{in31[5]}} , in31[5:0] } + { {2{in31[5]}} , in31[5:1] };
   assign m31_1 ={ {2{tm31_1[7]}} , tm31_1[7:3] };

   // m31_2 = W*in
   wire signed [6:0] m31_2;
   assign m31_2 ={ {3{in31[5]}} , in31[5:2] };

   // m31_3 = W*in
   wire signed [6:0] m31_3;
   wire signed [8:0] tm31_3;
   assign tm31_3[1:0] = neg31[1:0];
   assign tm31_3[8:2] = { {1{neg31[5]}} , neg31[5:0] } + { {3{neg31[5]}} , neg31[5:2] };
   assign m31_3 ={ {1{tm31_3[8]}} , tm31_3[8:3] };

   // m31_4 = W*in
   wire signed [6:0] m31_4;
   assign m31_4 ={ {3{in31[5]}} , in31[5:2] };

   // m31_5 = W*in
   wire signed [6:0] m31_5;
   assign m31_5 =7'b0;

   // m31_6 = W*in
   wire signed [6:0] m31_6;
   wire signed [7:0] tm31_6;
   assign tm31_6[0:0] = in31[0:0];
   assign tm31_6[7:1] = { {1{in31[5]}} , in31[5:0] } + { {2{in31[5]}} , in31[5:1] };
   assign m31_6 ={ {2{tm31_6[7]}} , tm31_6[7:3] };

   // m31_7 = W*in
   wire signed [6:0] m31_7;
   assign m31_7 ={ {2{neg31[5]}} , neg31[5:1] };

   // m31_8 = W*in
   wire signed [6:0] m31_8;
   assign m31_8 =7'b0;

   // m31_9 = W*in
   wire signed [6:0] m31_9;
   assign m31_9 =7'b0;

   // m31_10 = W*in
   wire signed [6:0] m31_10;
   assign m31_10 =7'b0;

   // m31_11 = W*in
   wire signed [6:0] m31_11;
   assign m31_11 ={ {3{neg31[5]}} , neg31[5:2] };

   // m31_12 = W*in
   wire signed [6:0] m31_12;
   wire signed [7:0] tm31_12;
   assign tm31_12[0:0] = in31[0:0];
   assign tm31_12[7:1] = { {1{in31[5]}} , in31[5:0] } + { {2{in31[5]}} , in31[5:1] };
   assign m31_12 ={ {2{tm31_12[7]}} , tm31_12[7:3] };

   // m31_13 = W*in
   wire signed [6:0] m31_13;
   assign m31_13 ={ {2{in31[5]}} , in31[5:1] };

   // m31_14 = W*in
   wire signed [6:0] m31_14;
   assign m31_14 ={ {2{neg31[5]}} , neg31[5:1] };

   // m31_15 = W*in
   wire signed [6:0] m31_15;
   wire signed [7:0] tm31_15;
   assign tm31_15[0:0] = in31[0:0];
   assign tm31_15[7:1] = { {1{in31[5]}} , in31[5:0] } + { {2{in31[5]}} , in31[5:1] };
   assign m31_15 ={ {2{tm31_15[7]}} , tm31_15[7:3] };

   // m31_16 = W*in
   wire signed [6:0] m31_16;
   assign m31_16 =7'b0;

   // m31_17 = W*in
   wire signed [6:0] m31_17;
   assign m31_17 =7'b0;

   // m31_18 = W*in
   wire signed [6:0] m31_18;
   wire signed [7:0] tm31_18;
   assign tm31_18[0:0] = neg31[0:0];
   assign tm31_18[7:1] = { {1{neg31[5]}} , neg31[5:0] } + { {2{neg31[5]}} , neg31[5:1] };
   assign m31_18 ={ {2{tm31_18[7]}} , tm31_18[7:3] };

   // m31_19 = W*in
   wire signed [6:0] m31_19;
   assign m31_19 =7'b0;

   // m31_20 = W*in
   wire signed [6:0] m31_20;
   assign m31_20 =7'b0;

   // m32_1 = W*in
   wire signed [6:0] m32_1;
   assign m32_1 =7'b0;

   // m32_2 = W*in
   wire signed [6:0] m32_2;
   assign m32_2 ={ {2{in32[5]}} , in32[5:1] };

   // m32_3 = W*in
   wire signed [6:0] m32_3;
   assign m32_3 =7'b0;

   // m32_4 = W*in
   wire signed [6:0] m32_4;
   assign m32_4 ={ {2{in32[5]}} , in32[5:1] };

   // m32_5 = W*in
   wire signed [6:0] m32_5;
   assign m32_5 =7'b0;

   // m32_6 = W*in
   wire signed [6:0] m32_6;
   assign m32_6 =7'b0;

   // m32_7 = W*in
   wire signed [6:0] m32_7;
   wire signed [8:0] tm32_7;
   assign tm32_7[1:0] = in32[1:0];
   assign tm32_7[8:2] = { {1{in32[5]}} , in32[5:0] } + { {3{in32[5]}} , in32[5:2] };
   assign m32_7 ={ {1{tm32_7[8]}} , tm32_7[8:3] };

   // m32_8 = W*in
   wire signed [6:0] m32_8;
   assign m32_8 =7'b0;

   // m32_9 = W*in
   wire signed [6:0] m32_9;
   assign m32_9 ={ {3{neg32[5]}} , neg32[5:2] };

   // m32_10 = W*in
   wire signed [6:0] m32_10;
   assign m32_10 ={ {2{in32[5]}} , in32[5:1] };

   // m32_11 = W*in
   wire signed [6:0] m32_11;
   assign m32_11 =7'b0;

   // m32_12 = W*in
   wire signed [6:0] m32_12;
   assign m32_12 =7'b0;

   // m32_13 = W*in
   wire signed [6:0] m32_13;
   assign m32_13 ={ {3{in32[5]}} , in32[5:2] };

   // m32_14 = W*in
   wire signed [6:0] m32_14;
   assign m32_14 =7'b0;

   // m32_15 = W*in
   wire signed [6:0] m32_15;
   assign m32_15 ={ {4{in32[5]}} , in32[5:3] };

   // m32_16 = W*in
   wire signed [6:0] m32_16;
   assign m32_16 =7'b0;

   // m32_17 = W*in
   wire signed [6:0] m32_17;
   assign m32_17 =7'b0;

   // m32_18 = W*in
   wire signed [6:0] m32_18;
   wire signed [9:0] tm32_18;
   assign tm32_18[2:0] = in32[2:0];
   assign tm32_18[9:3] = { {1{neg32[5]}} , neg32[5:0] } + { {4{in32[5]}} , in32[5:3] };
   assign m32_18 ={ {1{tm32_18[9]}} , tm32_18[9:4] };

   // m32_19 = W*in
   wire signed [6:0] m32_19;
   wire signed [8:0] tm32_19;
   assign tm32_19[1:0] = in32[1:0];
   assign tm32_19[8:2] = { {1{in32[5]}} , in32[5:0] } + { {3{in32[5]}} , in32[5:2] };
   assign m32_19 ={ {2{tm32_19[8]}} , tm32_19[8:4] };

   // m32_20 = W*in
   wire signed [6:0] m32_20;
   assign m32_20 =7'b0;

   // m33_1 = W*in
   wire signed [6:0] m33_1;
   assign m33_1 =7'b0;

   // m33_2 = W*in
   wire signed [6:0] m33_2;
   assign m33_2 =7'b0;

   // m33_3 = W*in
   wire signed [6:0] m33_3;
   assign m33_3 ={ {3{neg33[5]}} , neg33[5:2] };

   // m33_4 = W*in
   wire signed [6:0] m33_4;
   assign m33_4 =7'b0;

   // m33_5 = W*in
   wire signed [6:0] m33_5;
   assign m33_5 ={ {2{in33[5]}} , in33[5:1] };

   // m33_6 = W*in
   wire signed [6:0] m33_6;
   wire signed [7:0] tm33_6;
   assign tm33_6[0:0] = neg33[0:0];
   assign tm33_6[7:1] = { {1{neg33[5]}} , neg33[5:0] } + { {2{neg33[5]}} , neg33[5:1] };
   assign m33_6 ={ {2{tm33_6[7]}} , tm33_6[7:3] };

   // m33_7 = W*in
   wire signed [6:0] m33_7;
   assign m33_7 =7'b0;

   // m33_8 = W*in
   wire signed [6:0] m33_8;
   assign m33_8 =7'b0;

   // m33_9 = W*in
   wire signed [6:0] m33_9;
   wire signed [7:0] tm33_9;
   assign tm33_9[0:0] = neg33[0:0];
   assign tm33_9[7:1] = { {1{neg33[5]}} , neg33[5:0] } + { {2{neg33[5]}} , neg33[5:1] };
   assign m33_9 ={ {2{tm33_9[7]}} , tm33_9[7:3] };

   // m33_10 = W*in
   wire signed [6:0] m33_10;
   wire signed [8:0] tm33_10;
   assign tm33_10[1:0] = in33[1:0];
   assign tm33_10[8:2] = { {1{in33[5]}} , in33[5:0] } + { {3{in33[5]}} , in33[5:2] };
   assign m33_10 ={ {1{tm33_10[8]}} , tm33_10[8:3] };

   // m33_11 = W*in
   wire signed [6:0] m33_11;
   assign m33_11 =7'b0;

   // m33_12 = W*in
   wire signed [6:0] m33_12;
   assign m33_12 =7'b0;

   // m33_13 = W*in
   wire signed [6:0] m33_13;
   assign m33_13 ={ {3{neg33[5]}} , neg33[5:2] };

   // m33_14 = W*in
   wire signed [6:0] m33_14;
   wire signed [8:0] tm33_14;
   assign tm33_14[1:0] = in33[1:0];
   assign tm33_14[8:2] = { {1{in33[5]}} , in33[5:0] } + { {3{in33[5]}} , in33[5:2] };
   assign m33_14 ={ {1{tm33_14[8]}} , tm33_14[8:3] };

   // m33_15 = W*in
   wire signed [6:0] m33_15;
   assign m33_15 =7'b0;

   // m33_16 = W*in
   wire signed [6:0] m33_16;
   assign m33_16 =7'b0;

   // m33_17 = W*in
   wire signed [6:0] m33_17;
   wire signed [7:0] tm33_17;
   assign tm33_17[0:0] = neg33[0:0];
   assign tm33_17[7:1] = { {1{neg33[5]}} , neg33[5:0] } + { {2{neg33[5]}} , neg33[5:1] };
   assign m33_17 ={ {2{tm33_17[7]}} , tm33_17[7:3] };

   // m33_18 = W*in
   wire signed [6:0] m33_18;
   wire signed [7:0] tm33_18;
   assign tm33_18[0:0] = in33[0:0];
   assign tm33_18[7:1] = { {1{in33[5]}} , in33[5:0] } + { {2{in33[5]}} , in33[5:1] };
   assign m33_18 ={ {2{tm33_18[7]}} , tm33_18[7:3] };

   // m33_19 = W*in
   wire signed [6:0] m33_19;
   assign m33_19 =7'b0;

   // m33_20 = W*in
   wire signed [6:0] m33_20;
   assign m33_20 =7'b0;

   // m34_1 = W*in
   wire signed [6:0] m34_1;
   assign m34_1 =7'b0;

   // m34_2 = W*in
   wire signed [6:0] m34_2;
   assign m34_2 =7'b0;

   // m34_3 = W*in
   wire signed [6:0] m34_3;
   assign m34_3 =7'b0;

   // m34_4 = W*in
   wire signed [6:0] m34_4;
   assign m34_4 =7'b0;

   // m34_5 = W*in
   wire signed [6:0] m34_5;
   wire signed [9:0] tm34_5;
   assign tm34_5[2:0] = neg34[2:0];
   assign tm34_5[9:3] = { {1{in34[5]}} , in34[5:0] } + { {4{neg34[5]}} , neg34[5:3] };
   assign m34_5 =tm34_5[9:3];

   // m34_6 = W*in
   wire signed [6:0] m34_6;
   assign m34_6 ={ {3{in34[5]}} , in34[5:2] };

   // m34_7 = W*in
   wire signed [6:0] m34_7;
   assign m34_7 ={ {2{in34[5]}} , in34[5:1] };

   // m34_8 = W*in
   wire signed [6:0] m34_8;
   assign m34_8 ={ {2{neg34[5]}} , neg34[5:1] };

   // m34_9 = W*in
   wire signed [6:0] m34_9;
   assign m34_9 =7'b0;

   // m34_10 = W*in
   wire signed [6:0] m34_10;
   assign m34_10 =7'b0;

   // m34_11 = W*in
   wire signed [6:0] m34_11;
   assign m34_11 =7'b0;

   // m34_12 = W*in
   wire signed [6:0] m34_12;
   assign m34_12 =7'b0;

   // m34_13 = W*in
   wire signed [6:0] m34_13;
   wire signed [7:0] tm34_13;
   assign tm34_13[0:0] = in34[0:0];
   assign tm34_13[7:1] = { {1{in34[5]}} , in34[5:0] } + { {2{in34[5]}} , in34[5:1] };
   assign m34_13 ={ {2{tm34_13[7]}} , tm34_13[7:3] };

   // m34_14 = W*in
   wire signed [6:0] m34_14;
   assign m34_14 =7'b0;

   // m34_15 = W*in
   wire signed [6:0] m34_15;
   assign m34_15 =7'b0;

   // m34_16 = W*in
   wire signed [6:0] m34_16;
   wire signed [7:0] tm34_16;
   assign tm34_16[0:0] = neg34[0:0];
   assign tm34_16[7:1] = { {1{neg34[5]}} , neg34[5:0] } + { {2{neg34[5]}} , neg34[5:1] };
   assign m34_16 ={ {2{tm34_16[7]}} , tm34_16[7:3] };

   // m34_17 = W*in
   wire signed [6:0] m34_17;
   wire signed [9:0] tm34_17;
   assign tm34_17[2:0] = neg34[2:0];
   assign tm34_17[9:3] = { {1{neg34[5]}} , neg34[5:0] } + { {4{neg34[5]}} , neg34[5:3] };
   assign m34_17 ={ {1{tm34_17[9]}} , tm34_17[9:4] };

   // m34_18 = W*in
   wire signed [6:0] m34_18;
   assign m34_18 =7'b0;

   // m34_19 = W*in
   wire signed [6:0] m34_19;
   wire signed [8:0] tm34_19;
   assign tm34_19[1:0] = neg34[1:0];
   assign tm34_19[8:2] = { {1{neg34[5]}} , neg34[5:0] } + { {3{neg34[5]}} , neg34[5:2] };
   assign m34_19 ={ {1{tm34_19[8]}} , tm34_19[8:3] };

   // m34_20 = W*in
   wire signed [6:0] m34_20;
   assign m34_20 ={ {2{neg34[5]}} , neg34[5:1] };

   // m35_1 = W*in
   wire signed [6:0] m35_1;
   assign m35_1 ={ {2{in35[5]}} , in35[5:1] };

   // m35_2 = W*in
   wire signed [6:0] m35_2;
   wire signed [7:0] tm35_2;
   assign tm35_2[0:0] = neg35[0:0];
   assign tm35_2[7:1] = { {1{neg35[5]}} , neg35[5:0] } + { {2{neg35[5]}} , neg35[5:1] };
   assign m35_2 ={ {2{tm35_2[7]}} , tm35_2[7:3] };

   // m35_3 = W*in
   wire signed [6:0] m35_3;
   assign m35_3 =7'b0;

   // m35_4 = W*in
   wire signed [6:0] m35_4;
   assign m35_4 =7'b0;

   // m35_5 = W*in
   wire signed [6:0] m35_5;
   assign m35_5 =7'b0;

   // m35_6 = W*in
   wire signed [6:0] m35_6;
   assign m35_6 =7'b0;

   // m35_7 = W*in
   wire signed [6:0] m35_7;
   assign m35_7 ={ {3{neg35[5]}} , neg35[5:2] };

   // m35_8 = W*in
   wire signed [6:0] m35_8;
   assign m35_8 =7'b0;

   // m35_9 = W*in
   wire signed [6:0] m35_9;
   wire signed [7:0] tm35_9;
   assign tm35_9[0:0] = in35[0:0];
   assign tm35_9[7:1] = { {1{in35[5]}} , in35[5:0] } + { {2{in35[5]}} , in35[5:1] };
   assign m35_9 ={ {1{tm35_9[7]}} , tm35_9[7:2] };

   // m35_10 = W*in
   wire signed [6:0] m35_10;
   assign m35_10 =7'b0;

   // m35_11 = W*in
   wire signed [6:0] m35_11;
   assign m35_11 =7'b0;

   // m35_12 = W*in
   wire signed [6:0] m35_12;
   assign m35_12 =7'b0;

   // m35_13 = W*in
   wire signed [6:0] m35_13;
   assign m35_13 ={ {1{in35[5]}} , in35[5:0] };

   // m35_14 = W*in
   wire signed [6:0] m35_14;
   assign m35_14 =7'b0;

   // m35_15 = W*in
   wire signed [6:0] m35_15;
   assign m35_15 ={ {2{neg35[5]}} , neg35[5:1] };

   // m35_16 = W*in
   wire signed [6:0] m35_16;
   assign m35_16 ={ {3{neg35[5]}} , neg35[5:2] };

   // m35_17 = W*in
   wire signed [6:0] m35_17;
   assign m35_17 =7'b0;

   // m35_18 = W*in
   wire signed [6:0] m35_18;
   assign m35_18 =7'b0;

   // m35_19 = W*in
   wire signed [6:0] m35_19;
   wire signed [7:0] tm35_19;
   assign tm35_19[0:0] = in35[0:0];
   assign tm35_19[7:1] = { {1{in35[5]}} , in35[5:0] } + { {2{in35[5]}} , in35[5:1] };
   assign m35_19 ={ {2{tm35_19[7]}} , tm35_19[7:3] };

   // m35_20 = W*in
   wire signed [6:0] m35_20;
   wire signed [8:0] tm35_20;
   assign tm35_20[1:0] = in35[1:0];
   assign tm35_20[8:2] = { {1{in35[5]}} , in35[5:0] } + { {3{in35[5]}} , in35[5:2] };
   assign m35_20 ={ {2{tm35_20[8]}} , tm35_20[8:4] };

   // m36_1 = W*in
   wire signed [6:0] m36_1;
   assign m36_1 =7'b0;

   // m36_2 = W*in
   wire signed [6:0] m36_2;
   assign m36_2 =7'b0;

   // m36_3 = W*in
   wire signed [6:0] m36_3;
   assign m36_3 ={ {3{in36[5]}} , in36[5:2] };

   // m36_4 = W*in
   wire signed [6:0] m36_4;
   assign m36_4 ={ {3{in36[5]}} , in36[5:2] };

   // m36_5 = W*in
   wire signed [6:0] m36_5;
   assign m36_5 =7'b0;

   // m36_6 = W*in
   wire signed [6:0] m36_6;
   wire signed [7:0] tm36_6;
   assign tm36_6[0:0] = in36[0:0];
   assign tm36_6[7:1] = { {1{in36[5]}} , in36[5:0] } + { {2{in36[5]}} , in36[5:1] };
   assign m36_6 ={ {2{tm36_6[7]}} , tm36_6[7:3] };

   // m36_7 = W*in
   wire signed [6:0] m36_7;
   assign m36_7 =7'b0;

   // m36_8 = W*in
   wire signed [6:0] m36_8;
   assign m36_8 =7'b0;

   // m36_9 = W*in
   wire signed [6:0] m36_9;
   wire signed [7:0] tm36_9;
   assign tm36_9[0:0] = neg36[0:0];
   assign tm36_9[7:1] = { {1{neg36[5]}} , neg36[5:0] } + { {2{neg36[5]}} , neg36[5:1] };
   assign m36_9 ={ {2{tm36_9[7]}} , tm36_9[7:3] };

   // m36_10 = W*in
   wire signed [6:0] m36_10;
   assign m36_10 ={ {2{in36[5]}} , in36[5:1] };

   // m36_11 = W*in
   wire signed [6:0] m36_11;
   assign m36_11 ={ {3{neg36[5]}} , neg36[5:2] };

   // m36_12 = W*in
   wire signed [6:0] m36_12;
   wire signed [9:0] tm36_12;
   assign tm36_12[2:0] = neg36[2:0];
   assign tm36_12[9:3] = { {1{in36[5]}} , in36[5:0] } + { {4{neg36[5]}} , neg36[5:3] };
   assign m36_12 =tm36_12[9:3];

   // m36_13 = W*in
   wire signed [6:0] m36_13;
   assign m36_13 =7'b0;

   // m36_14 = W*in
   wire signed [6:0] m36_14;
   assign m36_14 =7'b0;

   // m36_15 = W*in
   wire signed [6:0] m36_15;
   assign m36_15 ={ {2{neg36[5]}} , neg36[5:1] };

   // m36_16 = W*in
   wire signed [6:0] m36_16;
   assign m36_16 =7'b0;

   // m36_17 = W*in
   wire signed [6:0] m36_17;
   assign m36_17 =7'b0;

   // m36_18 = W*in
   wire signed [6:0] m36_18;
   assign m36_18 =7'b0;

   // m36_19 = W*in
   wire signed [6:0] m36_19;
   assign m36_19 =7'b0;

   // m36_20 = W*in
   wire signed [6:0] m36_20;
   assign m36_20 ={ {2{neg36[5]}} , neg36[5:1] };

   //Perceptron Adders
   assign out1 = m1_1+m2_1+m3_1+m4_1+m5_1+m6_1+m7_1+m8_1+m9_1+m10_1+m11_1+m12_1+m13_1+m14_1+m15_1+m16_1+m17_1+m18_1+m19_1+m20_1+m21_1+m22_1+m23_1+m24_1+m25_1+m26_1+m27_1+m28_1+m29_1+m30_1+m31_1+m32_1+m33_1+m34_1+m35_1+m36_1+b1;
   assign out2 = m1_2+m2_2+m3_2+m4_2+m5_2+m6_2+m7_2+m8_2+m9_2+m10_2+m11_2+m12_2+m13_2+m14_2+m15_2+m16_2+m17_2+m18_2+m19_2+m20_2+m21_2+m22_2+m23_2+m24_2+m25_2+m26_2+m27_2+m28_2+m29_2+m30_2+m31_2+m32_2+m33_2+m34_2+m35_2+m36_2+b2;
   assign out3 = m1_3+m2_3+m3_3+m4_3+m5_3+m6_3+m7_3+m8_3+m9_3+m10_3+m11_3+m12_3+m13_3+m14_3+m15_3+m16_3+m17_3+m18_3+m19_3+m20_3+m21_3+m22_3+m23_3+m24_3+m25_3+m26_3+m27_3+m28_3+m29_3+m30_3+m31_3+m32_3+m33_3+m34_3+m35_3+m36_3+b3;
   assign out4 = m1_4+m2_4+m3_4+m4_4+m5_4+m6_4+m7_4+m8_4+m9_4+m10_4+m11_4+m12_4+m13_4+m14_4+m15_4+m16_4+m17_4+m18_4+m19_4+m20_4+m21_4+m22_4+m23_4+m24_4+m25_4+m26_4+m27_4+m28_4+m29_4+m30_4+m31_4+m32_4+m33_4+m34_4+m35_4+m36_4+b4;
   assign out5 = m1_5+m2_5+m3_5+m4_5+m5_5+m6_5+m7_5+m8_5+m9_5+m10_5+m11_5+m12_5+m13_5+m14_5+m15_5+m16_5+m17_5+m18_5+m19_5+m20_5+m21_5+m22_5+m23_5+m24_5+m25_5+m26_5+m27_5+m28_5+m29_5+m30_5+m31_5+m32_5+m33_5+m34_5+m35_5+m36_5+b5;
   assign out6 = m1_6+m2_6+m3_6+m4_6+m5_6+m6_6+m7_6+m8_6+m9_6+m10_6+m11_6+m12_6+m13_6+m14_6+m15_6+m16_6+m17_6+m18_6+m19_6+m20_6+m21_6+m22_6+m23_6+m24_6+m25_6+m26_6+m27_6+m28_6+m29_6+m30_6+m31_6+m32_6+m33_6+m34_6+m35_6+m36_6+b6;
   assign out7 = m1_7+m2_7+m3_7+m4_7+m5_7+m6_7+m7_7+m8_7+m9_7+m10_7+m11_7+m12_7+m13_7+m14_7+m15_7+m16_7+m17_7+m18_7+m19_7+m20_7+m21_7+m22_7+m23_7+m24_7+m25_7+m26_7+m27_7+m28_7+m29_7+m30_7+m31_7+m32_7+m33_7+m34_7+m35_7+m36_7+b7;
   assign out8 = m1_8+m2_8+m3_8+m4_8+m5_8+m6_8+m7_8+m8_8+m9_8+m10_8+m11_8+m12_8+m13_8+m14_8+m15_8+m16_8+m17_8+m18_8+m19_8+m20_8+m21_8+m22_8+m23_8+m24_8+m25_8+m26_8+m27_8+m28_8+m29_8+m30_8+m31_8+m32_8+m33_8+m34_8+m35_8+m36_8+b8;
   assign out9 = m1_9+m2_9+m3_9+m4_9+m5_9+m6_9+m7_9+m8_9+m9_9+m10_9+m11_9+m12_9+m13_9+m14_9+m15_9+m16_9+m17_9+m18_9+m19_9+m20_9+m21_9+m22_9+m23_9+m24_9+m25_9+m26_9+m27_9+m28_9+m29_9+m30_9+m31_9+m32_9+m33_9+m34_9+m35_9+m36_9+b9;
   assign out10 = m1_10+m2_10+m3_10+m4_10+m5_10+m6_10+m7_10+m8_10+m9_10+m10_10+m11_10+m12_10+m13_10+m14_10+m15_10+m16_10+m17_10+m18_10+m19_10+m20_10+m21_10+m22_10+m23_10+m24_10+m25_10+m26_10+m27_10+m28_10+m29_10+m30_10+m31_10+m32_10+m33_10+m34_10+m35_10+m36_10+b10;
   assign out11 = m1_11+m2_11+m3_11+m4_11+m5_11+m6_11+m7_11+m8_11+m9_11+m10_11+m11_11+m12_11+m13_11+m14_11+m15_11+m16_11+m17_11+m18_11+m19_11+m20_11+m21_11+m22_11+m23_11+m24_11+m25_11+m26_11+m27_11+m28_11+m29_11+m30_11+m31_11+m32_11+m33_11+m34_11+m35_11+m36_11+b11;
   assign out12 = m1_12+m2_12+m3_12+m4_12+m5_12+m6_12+m7_12+m8_12+m9_12+m10_12+m11_12+m12_12+m13_12+m14_12+m15_12+m16_12+m17_12+m18_12+m19_12+m20_12+m21_12+m22_12+m23_12+m24_12+m25_12+m26_12+m27_12+m28_12+m29_12+m30_12+m31_12+m32_12+m33_12+m34_12+m35_12+m36_12+b12;
   assign out13 = m1_13+m2_13+m3_13+m4_13+m5_13+m6_13+m7_13+m8_13+m9_13+m10_13+m11_13+m12_13+m13_13+m14_13+m15_13+m16_13+m17_13+m18_13+m19_13+m20_13+m21_13+m22_13+m23_13+m24_13+m25_13+m26_13+m27_13+m28_13+m29_13+m30_13+m31_13+m32_13+m33_13+m34_13+m35_13+m36_13+b13;
   assign out14 = m1_14+m2_14+m3_14+m4_14+m5_14+m6_14+m7_14+m8_14+m9_14+m10_14+m11_14+m12_14+m13_14+m14_14+m15_14+m16_14+m17_14+m18_14+m19_14+m20_14+m21_14+m22_14+m23_14+m24_14+m25_14+m26_14+m27_14+m28_14+m29_14+m30_14+m31_14+m32_14+m33_14+m34_14+m35_14+m36_14+b14;
   assign out15 = m1_15+m2_15+m3_15+m4_15+m5_15+m6_15+m7_15+m8_15+m9_15+m10_15+m11_15+m12_15+m13_15+m14_15+m15_15+m16_15+m17_15+m18_15+m19_15+m20_15+m21_15+m22_15+m23_15+m24_15+m25_15+m26_15+m27_15+m28_15+m29_15+m30_15+m31_15+m32_15+m33_15+m34_15+m35_15+m36_15+b15;
   assign out16 = m1_16+m2_16+m3_16+m4_16+m5_16+m6_16+m7_16+m8_16+m9_16+m10_16+m11_16+m12_16+m13_16+m14_16+m15_16+m16_16+m17_16+m18_16+m19_16+m20_16+m21_16+m22_16+m23_16+m24_16+m25_16+m26_16+m27_16+m28_16+m29_16+m30_16+m31_16+m32_16+m33_16+m34_16+m35_16+m36_16+b16;
   assign out17 = m1_17+m2_17+m3_17+m4_17+m5_17+m6_17+m7_17+m8_17+m9_17+m10_17+m11_17+m12_17+m13_17+m14_17+m15_17+m16_17+m17_17+m18_17+m19_17+m20_17+m21_17+m22_17+m23_17+m24_17+m25_17+m26_17+m27_17+m28_17+m29_17+m30_17+m31_17+m32_17+m33_17+m34_17+m35_17+m36_17+b17;
   assign out18 = m1_18+m2_18+m3_18+m4_18+m5_18+m6_18+m7_18+m8_18+m9_18+m10_18+m11_18+m12_18+m13_18+m14_18+m15_18+m16_18+m17_18+m18_18+m19_18+m20_18+m21_18+m22_18+m23_18+m24_18+m25_18+m26_18+m27_18+m28_18+m29_18+m30_18+m31_18+m32_18+m33_18+m34_18+m35_18+m36_18+b18;
   assign out19 = m1_19+m2_19+m3_19+m4_19+m5_19+m6_19+m7_19+m8_19+m9_19+m10_19+m11_19+m12_19+m13_19+m14_19+m15_19+m16_19+m17_19+m18_19+m19_19+m20_19+m21_19+m22_19+m23_19+m24_19+m25_19+m26_19+m27_19+m28_19+m29_19+m30_19+m31_19+m32_19+m33_19+m34_19+m35_19+m36_19+b19;
   assign out20 = m1_20+m2_20+m3_20+m4_20+m5_20+m6_20+m7_20+m8_20+m9_20+m10_20+m11_20+m12_20+m13_20+m14_20+m15_20+m16_20+m17_20+m18_20+m19_20+m20_20+m21_20+m22_20+m23_20+m24_20+m25_20+m26_20+m27_20+m28_20+m29_20+m30_20+m31_20+m32_20+m33_20+m34_20+m35_20+m36_20+b20;
endmodule