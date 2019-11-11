module unitbooth4#(parameter N)(in,ctr,ou);
  input signed [N-1:0] in;
  input [2:0] ctr;
  output signed [N-1:0] ou;
  
  //https://www.computer.org/csdl/trans/tc/2011/02/ttc2011020148.html
  //https://pdfs.semanticscholar.org/5644/4dd5f989d108e746dfd7a00f5472896eb015.pdf
  wire sgl, dbl, neg;
  assign sgl = ctr[0] ^ ctr[1];
  assign dbl = |{ &{~ctr[2],ctr[1:0]} , &{ctr[2],~ctr[1:0]} };
  assign neg = ctr[2];
  
  wire [N-1:0] bsgl, bdbl, bneg;
  assign bsgl = {N{sgl}};
  assign bdbl = {N{dbl}};
  assign bneg = {N{neg}};
  
  wire signed [N-1:0] val;
  assign val = (  ( (in&bsgl) | ((in<<1)&bdbl) )  ^  bneg  );
  assign ou = neg ? (val+1) : val;
endmodule