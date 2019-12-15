`include "div8clk.v"
module div8clk_tb();
   reg in=1'b0;
   wire out;
   div8clk d8_1(in,out);
   always #50 in = !in;
endmodule
