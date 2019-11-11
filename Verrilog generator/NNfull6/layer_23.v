`include "actifunc.v"
module layer_23(in1,in2,in3,in4,in5,in6,in7,out1);
   input signed [8:0] in1,in2,in3,in4,in5,in6,in7;
   output signed [7:0] out1;
   wire signed [17:0] m1_1;
   wire signed [17:0] m2_1;
   wire signed [17:0] m3_1;
   wire signed [17:0] m4_1;
   wire signed [17:0] m5_1;
   wire signed [17:0] m6_1;
   wire signed [9:0] w1_1 = $signed(10'h15);
   wire signed [9:0] w2_1 = $signed(10'h3B5);
   wire signed [9:0] w3_1 = $signed(10'hB);
   wire signed [9:0] w4_1 = $signed(10'hD);
   wire signed [9:0] w5_1 = $signed(10'h17);
   wire signed [9:0] w6_1 = $signed(10'h18);
   wire signed [7:0] b1 = $signed(8'h44);
   assign m1_1 = in1*w1_1;
   assign m2_1 = in2*w2_1;
   assign m3_1 = in3*w3_1;
   assign m4_1 = in4*w4_1;
   assign m5_1 = in5*w5_1;
   assign m6_1 = in6*w6_1;
   assign out1 = m1_1[16:9]+
                  m2_1[16:9]+
                  m3_1[16:9]+
                  m4_1[16:9]+
                  m5_1[16:9]+
                  m6_1[16:9]+b1-in7;
endmodule