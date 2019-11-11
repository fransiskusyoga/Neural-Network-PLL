module negate #(parameter N=16)(in,out);
  input [N-1:0] in;
  output [N-1:0] out;
  assign out = ~in + 1;
endmodule