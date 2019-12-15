module alg_autocor(nrise,inc);
   input [3:0] nrise;
   output [7:0] inc;
   wire eq,less;
   assign eq = nrise==4'd3;
   assign less = nrise<=4'd3;
   assign inc = eq ? 8'h0 : ( less ? 8'h01 : 8'hFF);
endmodule
