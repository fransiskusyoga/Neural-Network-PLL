`include "dsm.v"
module dsm_tb();
   reg [9:0] in;
   reg clk;
   wire out;
   dsm dsm1(in,clk,out);
   initial begin
      clk = 1'b0; in = 10'd700;
   end
   always #50 clk=!clk;
endmodule
