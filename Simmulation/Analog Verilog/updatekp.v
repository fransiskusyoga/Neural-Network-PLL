module updatekp(inc,clk,kp);
   input [7:0] inc;
   input clk;
   //Specify initial Kp heres
   output reg [7:0] kp = 8'd12;
   wire detectmin,detectmax;
   always @(posedge clk)
      kp <= (detectmin || detectmax) ? kp : kp +inc;
   //Specify minimum Kp value here
   //if kp is minimum and inc is negative
   assign detectmin = (kp<=8'd3) && inc[7];
   //Specify maximum Kp value here
   //if kp is maximum and inc is positive
   assign detectmax = (kp>=8'd128) && !inc[7];
endmodule
