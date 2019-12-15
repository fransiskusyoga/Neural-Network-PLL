module b2t(in,out);
   input [6:0] in;
   output [127:0] out;
   assign out[0] = 1'b1;
   assign out[1] = in[0];
   assign out[3:2] = {2{in[1]}};
   assign out[7:4] = {4{in[2]}};
   assign out[15:8] = {8{in[3]}};
   assign out[31:16] = {16{in[4]}};
   assign out[63:32] = {32{in[5]}};
   assign out[127:64] = {64{in[6]}};
endmodule