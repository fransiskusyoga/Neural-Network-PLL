`include "lpfn.v"
module lpfn_tb();
   reg [3:0] n;
   reg clk;
   wire [7:0] avgn;
   lpfn lpfN(n,clk,avgn);
   initial begin
      clk=1'b0; n= 4'd5;
      #10000 n = 4'd1;
   end
   always #50 clk=!clk;
endmodule
