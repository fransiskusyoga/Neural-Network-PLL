module alg_autocor(nrise,inc);
   input [2:0] nrise;
   output [7:0] inc;
   wire eq4,less4;
   assign eq4 = nrise==3'd4;
   assign less4 = nrise<3'd4;
   assign inc = eq4 ? 8'h0 : ( less4 ? 8'h01 : 8'hFF);
endmodule
