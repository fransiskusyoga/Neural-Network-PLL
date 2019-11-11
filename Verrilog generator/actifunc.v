module actifunc#(parameter N=16)(x,y);
   input [N-1:0] x;
   output [N-1:0] y;
   assign y = x[N-1] ? {N{1'b0}} : x;
endmodule