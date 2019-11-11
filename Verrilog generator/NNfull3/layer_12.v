`include "actifunc.v"
module layer_12(in1,out1,out2,out3);
   input signed [8:0] in1;
   output signed [16:0] out1,out2,out3;
   wire signed [17:0] m1_1,m1_2,m1_3;
   wire signed [9:0] w1_1 = $signed(10'h2FD);
   wire signed [9:0] w1_2 = $signed(10'h3FB);
   wire signed [9:0] w1_3 = $signed(10'h364);
   wire signed [16:0] b1 = $signed(17'h8D);
   wire signed [16:0] b2 = $signed(17'h10);
   wire signed [16:0] b3 = $signed(17'hEC);
   assign m1_1 = in1*w1_1;
   assign m1_2 = in1*w1_2;
   assign m1_3 = in1*w1_3;
   assign out1 = { {1{m1_1[17]}} , m1_1[17:2] }+b1;
   assign out2 = { {1{m1_2[17]}} , m1_2[17:2] }+b2;
   assign out3 = { {1{m1_3[17]}} , m1_3[17:2] }+b3;
endmodule