module lpfn(n,clk,avgn);
   input [3:0] n;
   input clk;
   //avgn is fixed point (3,5)
   output [7:0] avgn;
   //tavgn is fixed point (3,11)
   //put initial n value here
   reg signed [13:0] tavg = {4'd3,10'b0};
   //other utility variable
   wire signed [8:0] diff;
   assign diff =  {n,4'b0}-tavg[13:6];
   //update lpf every clock cycle
   always @(posedge clk) tavg <= tavg + diff;
   assign avgn = tavg[13:6];
endmodule
