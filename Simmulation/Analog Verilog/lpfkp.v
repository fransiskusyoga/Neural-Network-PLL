module lpfkp(kp,clk,avgkp);
   input [7:0] kp;
   input clk;
   output [7:0] avgkp;
   //tavgn is fixed point (8,6)
   //put initial kp value here
   reg signed [13:0] tavg = {8'd12,6'b0};
   //other utility variable
   wire signed [7:0] diff;
   assign diff =  kp-tavg[13:6];
   always @(posedge clk) tavg = tavg + diff;
   //assign output
   assign avgkp = tavg[13:6];
endmodule
