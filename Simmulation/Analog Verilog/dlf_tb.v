`include "dlf.v"
module dlf_tb();
   reg in,clk;
   wire [15:0] out;
   reg [7:0] kp;
   dlf DLF(clk,in,kp,out);
   initial begin
      in = 1'b0; clk=1'b0; kp=7'd16;
      #300 in = 1'b1;
      #600 in = 1'b0;
      #600 in = 1'b1;
   end
   always #50 clk= !clk;
endmodule
