`include "div2clk.v"
   input clk;
   output nclk;
   wire clk2;
   div2clk d1to2(clk,clk2);
   div2clk d2to4(clk2,nclk);
endmodule