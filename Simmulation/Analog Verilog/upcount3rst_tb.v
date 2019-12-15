`include "upcount3rst.v"
module upcount3rst_tb();
   reg clk,rst;
   wire [2:0] out;
   upcount3rst up3r(clk,rst,out);
   initial begin
      clk = 1'b0; rst=1'b0;
      #300 rst = 1'b1;
      #300 rst = 1'b0;
   end
   always #50 clk = !clk;
endmodule
