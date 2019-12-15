`include "lpfkp.v"
module lpfkp_tb();
   reg [7:0] kp;
   reg clk;
   wire [7:0] avgkp;
   lpfkp lpfkp(kp,clk,avgkp);
   initial begin
      clk=1'b0; kp= 8'd100;
      #10000 kp = 8'd5;
   end
   always #50 clk=!clk;
endmodule
