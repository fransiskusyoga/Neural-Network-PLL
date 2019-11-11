`include "actifunc.v"
module layer_23(in1,in2,in3,in4,out1);
   input signed [8:0] in1,in2,in3,in4;
   output signed [7:0] out1;
   wire signed [17:0] m1_1;
   wire signed [17:0] m2_1;
   wire signed [17:0] m3_1;
   wire signed [9:0] w1_1 = $signed(10'h3BC);
   wire signed [9:0] w2_1 = $signed(10'h8B);
   wire signed [9:0] w3_1 = $signed(10'h12);
   wire signed [7:0] b1 = $signed(8'h45);
   assign m1_1 = in1*w1_1;
   assign m2_1 = in2*w2_1;
   assign m3_1 = in3*w3_1;
   assign out1 = m1_1[16:9]+
                  m2_1[16:9]+
                  m3_1[16:9]+b1-in4;
endmodule