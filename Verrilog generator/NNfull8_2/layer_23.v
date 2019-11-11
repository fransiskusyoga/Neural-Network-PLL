`include "actifunc.v"
module layer_23(in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,out1);
   input signed [8:0] in1,in2,in3,in4,in5,in6,in7,in8,in9,in10;
   output signed [7:0] out1;
   wire signed [17:0] m1_1;
   wire signed [17:0] m2_1;
   wire signed [17:0] m3_1;
   wire signed [17:0] m4_1;
   wire signed [17:0] m5_1;
   wire signed [17:0] m6_1;
   wire signed [17:0] m7_1;
   wire signed [17:0] m8_1;
   wire signed [17:0] m9_1;
   wire signed [17:0] m10_1;
   wire signed [9:0] w1_1 = $signed(10'hDB);
   wire signed [9:0] w2_1 = $signed(10'h3E5);
   wire signed [9:0] w3_1 = $signed(10'h34A);
   wire signed [9:0] w4_1 = $signed(10'hC1);
   wire signed [9:0] w5_1 = $signed(10'h17);
   wire signed [9:0] w6_1 = $signed(10'hC);
   wire signed [9:0] w7_1 = $signed(10'h142);
   wire signed [9:0] w8_1 = $signed(10'h387);
   wire signed [9:0] w9_1 = $signed(10'h2B4);
   wire signed [9:0] w10_1 = $signed(10'h38A);
   wire signed [7:0] b1 = $signed(8'hA);
   assign m1_1 = in1*w1_1;
   assign m2_1 = in2*w2_1;
   assign m3_1 = in3*w3_1;
   assign m4_1 = in4*w4_1;
   assign m5_1 = in5*w5_1;
   assign m6_1 = in6*w6_1;
   assign m7_1 = in7*w7_1;
   assign m8_1 = in8*w8_1;
   assign m9_1 = in9*w9_1;
   assign m10_1 = in10*w10_1;
   /*wire signed [7:0] acc_r, acc_kp;
   assign acc_r = m1_1[17:10]+m2_1[17:10]+m3_1[17:10]+m4_1[17:10]+m5_1[17:10]+m6_1[17:10]+m7_1[17:10]+m8_1[17:10];
   assign acc_kp = m9_1[17:10]+m10_1[17:10];
   assign out1 = acc_r+acc_kp+b1;*/
   assign out1 = m1_1[17:10]+
                  m2_1[17:10]+
                  m3_1[17:10]+
                  m4_1[17:10]+
                  m5_1[17:10]+
                  m6_1[17:10]+
                  m7_1[17:10]+
                  m8_1[17:10]+
                  m9_1[17:10]+
                  m10_1[17:10]+b1;
endmodule