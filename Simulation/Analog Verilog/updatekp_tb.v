`include "updatekp.v"
module updatekp_tb();
   reg [7:0] inc;
   reg clk;
   wire [7:0] kp;
   updatekp upKp(inc,clk,kp);
   initial begin
      clk = 1'b0; inc = 8'b0;
      #300 inc = 8'h01;
      #300 inc = 8'hFF;
      #1500 inc = 8'h01;
   end
   always #50 clk=!clk;
endmodule
