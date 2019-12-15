`include "upcount4hit.v"
module upcount4hit_tb();
   reg clk = 1'b0;
   wire [3:0] out;
   wire hit;
   upcount4hit up4h(clk,out,hit);
   always #50 clk=!clk; 
endmodule
