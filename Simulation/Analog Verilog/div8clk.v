`include "div2clk.v"
module div8clk(clk,nclk);
   input clk;
   output nclk;
   wire clk2,clk4;
   div2clk d1to2(clk,clk2);
   div2clk d2to4(clk2,clk4);
   div2clk d4to8(clk4,nclk);
endmodule