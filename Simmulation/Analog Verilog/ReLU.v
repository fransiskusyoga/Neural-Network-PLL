module ReLU(in,out);
   // 1 sign bit, 3 decimal, 12 fractional
   input signed [15:0] in;
   // 1 sign bit, 1 decimal, 6 fractional
   output [7:0] out;
   // if negative output = in/8 
   // if positive output = in
   assign out = in[15] ? {4'b1,in[12:9]} : {1'b0,in[12:6]}; 
endmodule
