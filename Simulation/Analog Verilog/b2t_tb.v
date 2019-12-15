`include "b2t.v"
module b2t_tb();
   reg [6:0] in;
   wire [127:0] out;
   b2t BtoT(in,out);
   initial begin
      in=7'h01;
      #50 in=7'h03;
      #50 in=7'h10;
      #50 in=7'h40;
   end
endmodule
