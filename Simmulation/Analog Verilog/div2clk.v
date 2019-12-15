module div2clk(clk,nclk);
   input clk;
   output reg nclk=1'b0;
   always @(posedge clk) nclk=!nclk;
endmodule
